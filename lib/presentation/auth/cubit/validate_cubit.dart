import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:ecommerce_clot/presentation/auth/cubit/validate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValidateCubit extends Cubit<ValidateState> {
  ValidateCubit() : super(const ValidateState());

  final nameRegEx = RegExp(
      r'^[a-zA-ZàáạảãâầấậẩẫăằắặẳẵèéẹẻẽêềếệểễìíịỉĩòóọỏõôồốộổỗơờớợởỡùúụủũưừứựửữỳýỵỷỹđĐ\s]+$');

  final emailRegEx = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  final passwordRegEx = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$');

  void validateFirstName(String? firstName) {
    if (firstName!.isEmpty) {
      emit(state.copyWith(messageFirstName: AppStrings.firstNameEmpty));
    } else if (firstName.length > 20) {
      emit(state.copyWith(messageFirstName: AppStrings.firstNameTooLong));
    } else if (!nameRegEx.hasMatch(firstName)) {
      emit(state.copyWith(messageFirstName: AppStrings.firstNameInvalid));
    } else {
      emit(state.copyWith(messageFirstName: null));
    }
  }

  void validateLastName(String? lastName) {
    if (lastName!.isEmpty) {
      emit(state.copyWith(messageLastName: AppStrings.lastNameEmpty));
    } else if (lastName.length > 20) {
      emit(state.copyWith(messageLastName: AppStrings.lastNameTooLong));
    } else if (!nameRegEx.hasMatch(lastName)) {
      emit(state.copyWith(messageLastName: AppStrings.lastNameInvalid));
    } else {
      emit(state.copyWith(messageLastName: null));
    }
  }

  void validateEmail(String? emailAddress) {
    if (emailAddress!.isEmpty) {
      emit(state.copyWith(messageEmail: AppStrings.emailEmpty));
    } else if (!emailRegEx.hasMatch(emailAddress)) {
      emit(state.copyWith(messageEmail: AppStrings.emailInvalid));
    } else {
      emit(state.copyWith(messageEmail: null));
    }
  }

  void validatePassword(String? password) {
    if (password!.isEmpty) {
      emit(state.copyWith(messagePassword: AppStrings.passwordEmpty));
    } else if (password.length < 3) {
      emit(state.copyWith(messagePassword: AppStrings.passwordTooShort));
    } else if (!passwordRegEx.hasMatch(password)) {
      emit(state.copyWith(messagePassword: AppStrings.passwordWeak));
    } else {
      emit(state.copyWith(messagePassword: null));
    }
  }
}
