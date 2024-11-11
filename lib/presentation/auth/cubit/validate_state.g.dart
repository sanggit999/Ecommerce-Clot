// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ValidateStateCWProxy {
  ValidateState messageEmail(String? messageEmail);

  ValidateState messageFirstName(String? messageFirstName);

  ValidateState messageLastName(String? messageLastName);

  ValidateState messagePassword(String? messagePassword);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidateState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidateState(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidateState call({
    String? messageEmail,
    String? messageFirstName,
    String? messageLastName,
    String? messagePassword,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfValidateState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfValidateState.copyWith.fieldName(...)`
class _$ValidateStateCWProxyImpl implements _$ValidateStateCWProxy {
  const _$ValidateStateCWProxyImpl(this._value);

  final ValidateState _value;

  @override
  ValidateState messageEmail(String? messageEmail) =>
      this(messageEmail: messageEmail);

  @override
  ValidateState messageFirstName(String? messageFirstName) =>
      this(messageFirstName: messageFirstName);

  @override
  ValidateState messageLastName(String? messageLastName) =>
      this(messageLastName: messageLastName);

  @override
  ValidateState messagePassword(String? messagePassword) =>
      this(messagePassword: messagePassword);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidateState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidateState(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidateState call({
    Object? messageEmail = const $CopyWithPlaceholder(),
    Object? messageFirstName = const $CopyWithPlaceholder(),
    Object? messageLastName = const $CopyWithPlaceholder(),
    Object? messagePassword = const $CopyWithPlaceholder(),
  }) {
    return ValidateState(
      messageEmail: messageEmail == const $CopyWithPlaceholder()
          ? _value.messageEmail
          // ignore: cast_nullable_to_non_nullable
          : messageEmail as String?,
      messageFirstName: messageFirstName == const $CopyWithPlaceholder()
          ? _value.messageFirstName
          // ignore: cast_nullable_to_non_nullable
          : messageFirstName as String?,
      messageLastName: messageLastName == const $CopyWithPlaceholder()
          ? _value.messageLastName
          // ignore: cast_nullable_to_non_nullable
          : messageLastName as String?,
      messagePassword: messagePassword == const $CopyWithPlaceholder()
          ? _value.messagePassword
          // ignore: cast_nullable_to_non_nullable
          : messagePassword as String?,
    );
  }
}

extension $ValidateStateCopyWith on ValidateState {
  /// Returns a callable class that can be used as follows: `instanceOfValidateState.copyWith(...)` or like so:`instanceOfValidateState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ValidateStateCWProxy get copyWith => _$ValidateStateCWProxyImpl(this);
}
