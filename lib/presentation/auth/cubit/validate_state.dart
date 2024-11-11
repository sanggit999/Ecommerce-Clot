// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'validate_state.g.dart';

@CopyWith()
class ValidateState extends Equatable {
  const ValidateState({
    this.messageEmail,
    this.messageFirstName,
    this.messageLastName,
    this.messagePassword,
  });
  final String? messageEmail;
  final String? messageFirstName;
  final String? messageLastName;
  final String? messagePassword;

  @override
  List<Object?> get props =>
      [messageEmail, messageFirstName, messageLastName, messagePassword];
}
