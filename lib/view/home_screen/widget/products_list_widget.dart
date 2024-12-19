import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:koueidar_ui/view/home_screen/cubit/home_cubit.dart';

import '../../../core/constants.dart';
import 'product_item_widget.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: appPadding),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const Gap(10),
            itemCount: cubit.productsModel?.products?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductItemWidget(
                product: cubit.productsModel?.products?[index],
              );
            },
          ),
        );
      },
    );
  }
}
