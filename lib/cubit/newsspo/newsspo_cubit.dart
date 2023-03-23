import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heart_oxygen_alarm/model/newsspo.dart';

import '../../model/newsspo.dart';

part 'newsspo_state.dart';

class NewsSpoCubit extends Cubit<NewsSpoState> {
  NewsSpoCubit() : super(NewsSpoInitial());

  void fetchNewsModel() async {
    try {
      emit(NewsSpoLoading());

      List<NewsSPOModel> newsSpoModel = await NewsSPOData().fetchDestination();

      emit(NewsSpoSuccess(newsSpoModel));
      ;
    } catch (e) {
      emit(NewsSpoFailed(e.toString()));
    }
  }
}
