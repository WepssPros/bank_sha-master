part of 'pembayaran_form_bloc.dart';

abstract class PembayaranFormState extends Equatable {
  const PembayaranFormState();

  @override
  List<Object> get props => [];
}

class PembayaranFormInitial extends PembayaranFormState {}

class PembayaranFormLoading extends PembayaranFormState {}

class PembayaranFormFailed extends PembayaranFormState {
  final String e;
  const PembayaranFormFailed(this.e);

  @override
  List<Object> get props => [e];
}

class PembayaranFormSuccess extends PembayaranFormState {}
