part of 'name_bloc.dart';

sealed class NameEvent extends Equatable {
  const NameEvent();
  @override
  List<Object> get props => [];
}

final class GetNameEvent extends NameEvent {
  final Map<String, dynamic> param;

const  GetNameEvent({required this.param});
}
