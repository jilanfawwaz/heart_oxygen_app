part of 'newsspo_cubit.dart';



abstract class NewsSpoState extends Equatable {
  const NewsSpoState();

  @override
  List<Object> get props => [];
}

class NewsSpoInitial extends NewsSpoState {}

class NewsSpoLoading extends NewsSpoState {}

class NewsSpoSuccess extends NewsSpoState {
  final List<NewsSPOModel> newsSpoModel;

  NewsSpoSuccess(this.newsSpoModel);

  @override
  // TODO: implement props
  List<Object> get props => [newsSpoModel];
}

class NewsSpoFailed extends NewsSpoState {
  final String error;

  NewsSpoFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}

