import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/constants.dart';
import '../../../core/styles/text_styles.dart';
import '../cubit/home_cubit.dart';

class HomeScreenHeaderWidget extends StatelessWidget {
  const HomeScreenHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(appPadding),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "توصيل إالي",
                          style: MyTextStyles.textStyle12Medium.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 18,
                            ),
                            Text(
                              'المنزل، التجمع الخامس',
                              style: MyTextStyles.textStyle14Bold,
                            ),
                            const Gap(5),
                            RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 18,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
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
