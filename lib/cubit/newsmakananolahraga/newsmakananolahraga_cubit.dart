import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/newsmakananolahraga.dart';

part 'newsmakananolahraga_state.dart';

class NewsMakananOlahragaCubit extends Cubit<NewsMakananOlahragaState> {
  NewsMakananOlahragaCubit() : super(NewsMakananOlahragaInitial());

  void fetchNewsModel() async {
    try {
      emit(NewsMakananOlahragaLoading());

      List<NewsMakananOlahragaModel> newsMakananOlahragaModel = await NewsMakananOlahragaData().fetchDestination();

      emit(NewsMakananOlahragaSuccess(newsMakananOlahragaModel));
      ;
    } catch (e) {
      emit(NewsMakananOlahragaFailed(e.toString()));
    }
  }
}
