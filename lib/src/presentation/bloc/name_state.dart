part of 'name_bloc.dart';

sealed class NameState extends Equatable {
  const NameState();
  @override
  List<Object> get props => [];
}

class NameInitial extends NameState {
  const NameInitial();
}

class NameLoading extends NameState {}

class NameLoaded extends NameState {
  final Name name;
  const NameLoaded({required this.name});
}

class GenericError extends NameState {
  final String error;

  const GenericError({required this.error});
}
