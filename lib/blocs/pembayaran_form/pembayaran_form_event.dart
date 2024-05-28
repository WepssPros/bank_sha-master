part of 'pembayaran_form_bloc.dart';

abstract class PembayaranFormEvent extends Equatable {
  const PembayaranFormEvent();

  @override
  List<Object> get props => [];
}

class PembayaranFormPost extends PembayaranFormEvent {
  final PembayaranFormModel data;
  const PembayaranFormPost(this.data);

  @override
  List<Object> get props => [data];
}
