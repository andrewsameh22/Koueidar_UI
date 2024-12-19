import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants.dart';
import '../../../core/styles/text_styles.dart';
import '../../home_screen/cubit/home_cubit.dart';

class SliderWidget extends StatelessWidget {
  final HomeCubit cubit;

  const SliderWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 8.0,
                activeTrackColor: primaryColor,
                inactiveTrackColor: Colors.grey,
                thumbColor: primaryColor,
                overlayColor: primaryColor.withOpacity(0.2),
                valueIndicatorColor: primaryColor,
              ),
              child: RangeSlider(
                values: cubit.currentRateRangeValues,
                min: 0,
                max: 6000,
                // Maximum value to be replaced with the actual highest product price
                labels: RangeLabels(
                  cubit.currentRateRangeValues.start.round().toString(),
                  cubit.currentRateRangeValues.end.round().toString(),
                ),

                onChanged: (RangeValues values) {
                  cubit.currentRateRangeValues = values;
                  cubit.setState();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      '${cubit.currentRateRangeValues.start.round()} Egp',
                      style: MyTextStyles.textStyle14Bold.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      '${cubit.currentRateRangeValues.end.round()} Egp',
                      style: MyTextStyles.textStyle14Bold.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
