import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:koueidar_ui/view/home_screen/widget/sort_button_widget.dart';

import '../../../core/constants.dart';
import '../../../core/styles/text_styles.dart';
import '../cubit/home_cubit.dart';
import 'filter_button_widget.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'حلويات',
                  style: MyTextStyles.textStyle22Bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SortButtonWidget(),
                  const Gap(5),
                  FilterButtonWidget(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
