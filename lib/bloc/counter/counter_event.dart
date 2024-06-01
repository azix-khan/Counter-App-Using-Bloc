import 'package:equatable/equatable.dart';

// abstract class uses as base class and its object cannot initilized
abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}
