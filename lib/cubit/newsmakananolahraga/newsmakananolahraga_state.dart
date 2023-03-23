part of 'newsmakananolahraga_cubit.dart';



abstract class NewsMakananOlahragaState extends Equatable {
  const NewsMakananOlahragaState();

  @override
  List<Object> get props => [];
}

class NewsMakananOlahragaInitial extends NewsMakananOlahragaState {}

class NewsMakananOlahragaLoading extends NewsMakananOlahragaState {}

class NewsMakananOlahragaSuccess extends NewsMakananOlahragaState {
  final List<NewsMakananOlahragaModel> newsMakananOlahragaModel;

  NewsMakananOlahragaSuccess(this.newsMakananOlahragaModel);

  @override
  // TODO: implement props
  List<Object> get props => [newsMakananOlahragaModel];
}

class NewsMakananOlahragaFailed extends NewsMakananOlahragaState {
  final String error;

  NewsMakananOlahragaFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
