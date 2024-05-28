import 'package:bank_sha/models/pembayaran_form_model.dart';
import 'package:bank_sha/services/tagihan_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pembayaran_form_event.dart';
part 'pembayaran_form_state.dart';

class PembayaranFormBloc
    extends Bloc<PembayaranFormEvent, PembayaranFormState> {
  PembayaranFormBloc() : super(PembayaranFormInitial()) {
    on<PembayaranFormEvent>((event, emit) async {
      if (event is PembayaranFormPost) {
        try {
          emit(PembayaranFormLoading());

          await TagihanService().pembayarans(event.data);

          emit(PembayaranFormSuccess());
        } catch (e) {
          print(e);

          emit(PembayaranFormFailed(e.toString()));
        }
      }
    });
  }
}
