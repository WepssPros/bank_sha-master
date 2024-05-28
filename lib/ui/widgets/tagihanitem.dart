import 'package:bank_sha/models/tagihan_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TagihanItemDepan extends StatelessWidget {
  final TagihanModel tagihan;

  const TagihanItemDepan({
    Key? key,
    required this.tagihan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tanggal Tagihan',
                    style: blackTextStyle.copyWith(
                      fontSize: 10, // Ukuran font kecil
                      color: greyColor, // Warna abu-abu untuk tanggal kecil
                    ),
                  ),
                  Text(
                    tagihan.dueDate,
                    style: blackTextStyle.copyWith(
                      fontSize: 12, // Ukuran font tanggal
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Pamsimas Kamu',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: tagihan.statusPembayaran == 'sudah dibayar'
                      ? Colors.green
                      : Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  tagihan.statusPembayaran,
                  style: blackTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'No Pam', // Menampilkan nomor pam
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              const Spacer(),
              Text(
                'Tagihan Pam', // Menampilkan pemili pam
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                tagihan.noPam!.no_pam.toString(), // Menampilkan nomor pam
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              const Spacer(),
              Text(
                NumberFormat.currency(
                        locale: 'id_ID', symbol: 'Rp', decimalDigits: 0)
                    .format(tagihan.harga),
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              value: 100,
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
