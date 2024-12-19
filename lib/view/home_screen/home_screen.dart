import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:koueidar_ui/core/styles/text_styles.dart';
import 'package:koueidar_ui/view/home_screen/widget/categories_widget.dart';
import 'package:koueidar_ui/view/home_screen/widget/filter_button_widget.dart';
import 'package:koueidar_ui/view/home_screen/widget/home_screen_header_widget.dart';
import 'package:koueidar_ui/view/home_screen/widget/products_list_widget.dart';
import 'package:koueidar_ui/view/home_screen/widget/products_loading_list_widget.dart';
import 'package:koueidar_ui/view/home_screen/widget/section_widget.dart';
import 'package:koueidar_ui/view/home_screen/widget/sort_button_widget.dart';

import '../../core/constants.dart';
import '../../core/services/services_locator.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>()
        ..getHomeProducts()
        ..startScrollingListener(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);

          return SafeArea(
            child: Scaffold(
              body: RefreshIndicator(
                color: primaryColor,
                backgroundColor: Colors.white,
                onRefresh: () async {
                  await Future.wait([
                    cubit.getHomeProducts(),
                  ]);
                },
                child: SingleChildScrollView(
                  controller: cubit.scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      const HomeScreenHeaderWidget(),
                      Divider(),
                      SectionWidget(),
                      const CategoriesWidget(),
                      const Gap(20),
                      if (cubit.productsModel != null) ProductsListWidget(),
                      if (state is GetHomeProductsLoadingState)
                        ProductsLoadingListWidget()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
