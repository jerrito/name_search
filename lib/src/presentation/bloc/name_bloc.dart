import 'package:equatable/equatable.dart';
import 'package:trial_project/src/domain/entities/name.dart';
import 'package:trial_project/src/domain/usecases/get_name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'name_state.dart';
part 'name_event.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  final GetName getName;
  NameBloc({required this.getName}) : super(const NameInitial()) {
    on<GetNameEvent>((event, emit) async {
      emit(NameLoading());
      final response = await getName.call(event.param);

      emit(response.fold((error) => GenericError(error: error),
          (response) => NameLoaded(name: response)));
    });
  }
  
}
