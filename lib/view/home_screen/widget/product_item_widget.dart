import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:koueidar_ui/models/product_model.dart';

import '../../../core/constants.dart';
import '../../../core/styles/text_styles.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel? product;

  const ProductItemWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(product?.mainImage ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Gap(15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product?.name ?? '',
                style: MyTextStyles.textStyle14Bold,
              ),
              Gap(5),
              Text(
                product?.categoryName ?? '',
                style: MyTextStyles.textStyle12Medium.copyWith(
                  color: Colors.grey,
                ),
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      '${product?.price!} Egp',
                      style: MyTextStyles.textStyle16Bold.copyWith(
                        color: primaryColor,
                      ),
                    ),
                  ),
                  if (product?.outOfStock ?? false)
                    Text(
                      'غير متوفر',
                      style: MyTextStyles.textStyle14Bold.copyWith(
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
