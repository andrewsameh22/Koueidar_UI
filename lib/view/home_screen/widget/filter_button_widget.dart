import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:koueidar_ui/core/constants.dart';

import '../../../core/app_router/routes.dart';
import '../../../core/styles/text_styles.dart';
import '../cubit/home_cubit.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Row(
          children: [
            if (cubit.filterActivated)
              GestureDetector(
                onTap: () {
                  cubit.cancelFilter();
                },
                child: Text(
                  'الغاء الفلترة',
                  style: MyTextStyles.textStyle14Bold.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
            const Gap(5),
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                GoRouter.of(context).push(AppRouter.filterScreen, extra: cubit);
              },
            ),
          ],
        );
      },
    );
  }
}
