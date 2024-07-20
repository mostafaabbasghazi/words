part of 'read_cubit.dart';

@immutable
sealed class ReadState {}

final class ReadInitial extends ReadState {}
final class ReadLoading extends ReadState {}
final class ReadSuccess extends ReadState {
  final List<WordModel>words;

   ReadSuccess({required this.words});
}
final class ReadFailed extends ReadState {
  final String msg;
  ReadFailed({required this.msg});
}
