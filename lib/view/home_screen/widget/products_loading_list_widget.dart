import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants.dart';
import '../../../reusable_widgets/default_shimmer.dart';

class ProductsLoadingListWidget extends StatelessWidget {
  const ProductsLoadingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPadding),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const Gap(10),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Shimmer for product image
              DefaultShimmer(
                height: 100,
                width: 100,
                radius: 8, // Rounded corners for image
              ),
              const Gap(15),
              // Shimmer for text details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer for product name
                    DefaultShimmer(
                      height: 16,
                      width: 180,
                      radius: 4,
                    ),
                    const Gap(5),
                    // Shimmer for category name
                    DefaultShimmer(
                      height: 14,
                      width: 120,
                      radius: 4,
                    ),
                    const Gap(5),
                    // Shimmer for product price
                    DefaultShimmer(
                      height: 18,
                      width: 80,
                      radius: 4,
                    ),
                    const Gap(7),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
