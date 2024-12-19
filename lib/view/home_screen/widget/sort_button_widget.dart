import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:koueidar_ui/core/constants.dart';
import 'package:koueidar_ui/reusable_widgets/reusable_radio_bottom_sheet_child.dart';

import '../../../core/assets_data/assets_data.dart';
import '../../../core/enums/enums.dart';
import '../../../core/styles/text_styles.dart';
import '../../../reusable_widgets/default_bottom_sheet.dart';
import '../cubit/home_cubit.dart';

class SortButtonWidget extends StatelessWidget {
  const SortButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return GestureDetector(
          onTap: () {
            showDefaultBottomSheet(
              height: 700.h,
              context: context,
              text: 'ترتيب المنتجات',
              buttonOnTap: () {
                Navigator.of(context).pop();
              },
              child: GenericRadioBottomSheet<SortCriteria>(
                items: SortCriteria.values,
                selectedItemController: cubit.productsSortController,
                itemTitleBuilder: (sort) => sort.value,
                onChanged: (value) {
                  print(value);
                  cubit.productsSortController = value;

                  cubit.setState();
                  Navigator.pop(context);
                  cubit.getHomeProducts();
                },
              ),
            );
          },
          child: Row(
            children: [
              Text(
                cubit.productsSortController.value,
                style: MyTextStyles.textStyle14Bold.copyWith(
                  color: primaryColor,
                ),
              ),
              const Gap(5),
              GestureDetector(
                // onTap: () {
                //   if (cubit.productsSortArrangementController ==
                //       SortArrangements.ASC) {
                //     cubit.productsSortArrangementController =
                //         SortArrangements.DESC;
                //   } else {
                //     cubit.productsSortArrangementController =
                //         SortArrangements.ASC;
                //   }
                //   cubit.setState();
                //   cubit.getHomeProducts();
                // },
                child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        left: 14.0,
                        right: 12.0,
                        bottom: 12.0,
                      ),
                      child: RotatedBox(
                          quarterTurns:
                              cubit.productsSortArrangementController ==
                                      SortArrangements.ASC
                                  ? 0
                                  : 2,
                          child: SvgPicture.asset(AssetsData.sortSvg)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
