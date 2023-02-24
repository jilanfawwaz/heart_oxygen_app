part of 'news_cubit.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<NewsModel> newsModel;

  NewsSuccess(this.newsModel);

  @override
  // TODO: implement props
  List<Object> get props => [newsModel];
}

class NewsFailed extends NewsState {
  final String error;

  NewsFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
