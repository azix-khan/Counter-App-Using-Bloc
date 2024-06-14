import 'package:bloc/bloc.dart';
import 'package:counter_app_using_bloc/bloc/Visibility/visibility_event.dart';
import 'package:counter_app_using_bloc/bloc/Visibility/visibility_state.dart';

class VisibilityBloc extends Bloc<VisibilityEvent, VisibilityState> {
  VisibilityBloc() : super(VisibilityState(show: true)) {
    on<VisibilityShowEvent>(
      (event, emit) => emit(VisibilityState(show: true)),
    );
    on<VisibilityHideEvent>(
      (event, emit) => emit(VisibilityState(show: false)),
    );
  }
}
