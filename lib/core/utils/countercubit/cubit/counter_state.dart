part of 'counter_cubit.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

final class Counteradd extends CounterState {}

final class CounteRemove extends CounterState {}
