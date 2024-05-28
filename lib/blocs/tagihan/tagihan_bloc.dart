import 'package:bank_sha/models/tagihan_model.dart';
import 'package:bank_sha/services/tagihan_service.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tagihan_event.dart';
part 'tagihan_state.dart';

class TagihanBloc extends Bloc<TagihanEvent, TagihanState> {
  TagihanBloc() : super(TagihanInitial()) {
    on<TagihanGet>((event, emit) async {
      try {
        emit(TagihanLoading());

        final tagihans = await TagihanService().getTagihans();

        emit(TagihanSuccess(tagihans));
      } catch (e) {
        print(e);
        emit(TagihanFailed(e.toString()));
      }
    });
  }
}
