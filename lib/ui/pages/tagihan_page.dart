import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/pembayaran_form/pembayaran_form_bloc.dart';
import 'package:bank_sha/blocs/tagihan/tagihan_bloc.dart';
import 'package:bank_sha/models/pembayaran_form_model.dart';
import 'package:bank_sha/models/tagihan_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/pembayaran_succes.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/tagihan_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TagihanPage extends StatefulWidget {
  const TagihanPage({Key? key}) : super(key: key);

  @override
  State<TagihanPage> createState() => _TagihanPageState();
}

class _TagihanPageState extends State<TagihanPage> {
  TagihanModel? selectedTagihan;

  @override
  void initState() {
    super.initState();
  }

  void _confirmAndPay(BuildContext context) {
    if (selectedTagihan != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Konfirmasi Pembayaran'),
          content: Text(
            'Anda akan melakukan pembayaran untuk tagihan Pam ${selectedTagihan!.noPam.no_pam}. Lanjutkan?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                final authState = context.read<AuthBloc>().state;
                String userPin = '';
                if (authState is AuthSuccess) {
                  userPin = authState.data.pin!;
                }

                context.read<PembayaranFormBloc>().add(
                      PembayaranFormPost(
                        PembayaranFormModel(
                          tagihan_pam_id: selectedTagihan!.id.toString(),
                        ),
                      ),
                    );

                Navigator.of(context).pop(); // Tutup dialog konfirmasi
              },
              child: const Text('Ya'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Pilih Tagihan'),
          content: const Text('Silakan pilih tagihan yang ingin dibayar.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagihan'),
      ),
      body: BlocConsumer<PembayaranFormBloc, PembayaranFormState>(
        listener: (context, state) {
          if (state is PembayaranFormSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PembayaranSuccessPage(),
              ),
            );
          } else if (state is PembayaranFormFailed) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Pembayaran Gagal'),
                content: Text(state.e), // state.e berisi pesan kesalahan
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Tutup dialog
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          final bool isSelected;
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tagihan Pam Kamu',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: whiteColor,
                      ),
                      child: BlocProvider(
                        create: (context) => TagihanBloc()..add(TagihanGet()),
                        child: BlocBuilder<TagihanBloc, TagihanState>(
                          builder: (context, state) {
                            if (state is TagihanSuccess) {
                              return Column(
                                children: state.tagihans.map((tagihan) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedTagihan = tagihan;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      child: TagihanItem(
                                        tagihan: tagihan,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomFilledButton(
                title: 'Bayar Air',
                onPressed: () => _confirmAndPay(context),
              ),
              const SizedBox(height: 57),
            ],
          );
        },
      ),
    );
  }
}
