import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koueidar_ui/core/enums/enums.dart';

import '../../../reusable_widgets/custom_chip_widget.dart';
import '../cubit/home_cubit.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 32.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: SweetsTypes.values
                  .map((cat) =>
                  GestureDetector(
                    onTap: () {
                      cubit.selectedCategory = cat;
                      cubit.setState();
                      cubit.getHomeProducts();
                    },
                    child: CustomChipWidget(
                        text: cat.value,
                        isSelected: cat == cubit.selectedCategory),
                  ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
