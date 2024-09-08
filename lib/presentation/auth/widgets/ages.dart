import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clot/common/widgets/title_text/basic_text_title.dart';
import 'package:ecommerce_clot/core/constants/app_sizes.dart';
import 'package:ecommerce_clot/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce_clot/presentation/auth/bloc/ages_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator());
          }

          if (state is AgesLoadSuccess) {
            return _ages(state.ages);
          }

          if (state is AgesLoadFailure) {
            return Container(
              alignment: Alignment.center,
              child: BasicTextTitle(
                text: state.message,
                fontSize: AppSizes.fontSizeSm,
                fontWeight: FontWeight.w400,
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _ages(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            context
                .read<AgeSelectionCubit>()
                .selectAge(ages[index].data()['value']);
          },
          child: BasicTextTitle(
            text: ages[index].data()['value'],
            fontSize: AppSizes.fontSizeSm,
            fontWeight: FontWeight.w400,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: ages.length,
    );
  }
}
