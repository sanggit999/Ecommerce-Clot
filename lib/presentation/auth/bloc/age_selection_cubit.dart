import 'package:ecommerce_clot/core/constants/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super(AppStrings.ageRange);

  String selectedAge = '';

  void selectAge(String age) {
    selectedAge = age;
    emit(selectedAge);
  }
}
