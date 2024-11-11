import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgesDisplayState {}

final class AgesLoading extends AgesDisplayState {}

final class AgesLoadSuccess extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  AgesLoadSuccess({required this.ages});
}

final class AgesLoadFailure extends AgesDisplayState {
  final String message;

  AgesLoadFailure({required this.message});
}
