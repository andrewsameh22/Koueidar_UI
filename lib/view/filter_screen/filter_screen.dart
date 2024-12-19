import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:koueidar_ui/core/constants.dart';
import 'package:koueidar_ui/reusable_widgets/default_app_bar.dart';
import 'package:koueidar_ui/reusable_widgets/default_button.dart';
import 'package:koueidar_ui/view/filter_screen/widget/slider_widget.dart';
import 'package:koueidar_ui/view/home_screen/cubit/home_cubit.dart';

import '../../core/styles/text_styles.dart';

class FilterScreen extends StatelessWidget {
  final HomeCubit cubit;

  const FilterScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
              context: context, centerTitle: true, title: 'فلترة المنتجات'),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: appPadding),
                    child: Column(
                      children: [
                        const Gap(20),
                        SliderWidget(cubit: cubit),
                        const Gap(20),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(appPadding),
                child: Row(
                  children: [
                    Flexible(
                        flex: 3,
                        child: DefaultButton(
                          text: 'اعرض النتائج',
                          onTap: () {
                            GoRouter.of(context).pop();
                            cubit.filterActivated = true;
                            cubit.setState();
                            cubit.getHomeProducts();
                          },
                        )),
                    const Gap(10),
                    Flexible(
                        flex: 1,
                        child: DefaultButton(
                          text: 'اعادة تعيين',
                          textStyle: MyTextStyles.textStyle14Bold.copyWith(
                            color: Colors.white,
                          ),
                          onTap: () {
                            cubit.resetFilter();
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
