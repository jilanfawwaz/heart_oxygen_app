import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:heart_oxygen_alarm/model/newsmodel.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  void fetchNewsModel() async {
    try {
      emit(NewsLoading());

      List<NewsModel> newsModel = await NewsData().fetchDestination();

      emit(NewsSuccess(newsModel));
      ;
    } catch (e) {
      emit(NewsFailed(e.toString()));
    }
  }
}
