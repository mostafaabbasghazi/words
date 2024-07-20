part of 'wirte_cubit.dart';

@immutable
sealed class WirteState {}

final class WirteInitial extends WirteState {}
final class WirteLoading extends WirteState {}
final class WirteSuccess extends WirteState {}
final class WirteFailed extends WirteState {
  final String msg;
  WirteFailed({required this.msg});
}

