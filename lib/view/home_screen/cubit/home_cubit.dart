import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koueidar_ui/core/enums/enums.dart';
import 'package:koueidar_ui/models/filter_product_model.dart';

import '../../../models/product_model.dart';
import '../../../repositories/home_repository/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit({required this.repo}) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  void setState() {
    emit(RefreshHomeCubit());
  }

  var scrollController = ScrollController();

  void startScrollingListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent * 0.6 &&
          productsModel != null) {
        getHomeProducts(
          isFirstTime: false,
        );
      }
    });
  }

  SweetsTypes selectedCategory = SweetsTypes.all;
  SortCriteria productsSortController = SortCriteria.latest;
  SortArrangements productsSortArrangementController = SortArrangements.ASC;

  ///////////////////// Get Home Products //////////////////
  ProductsModel? productsModel;
  bool gettingMoreProducts = false;
  int page = 1;
  int perPage = 10;

  Future<void> getHomeProducts({
    bool isFirstTime = true,
  }) async {
    if (gettingMoreProducts) return;

    if (isFirstTime) {
      productsModel = null;
      page = 1;
    }

    if (!isFirstTime && page > productsModel!.pagination!.totalPages!) {
      return;
    }
    gettingMoreProducts = true;
    emit(GetHomeProductsLoadingState());
    var result = await repo.fetchHomeProducts(
      page: page,
      perPage: perPage,
      model: FilterProductModel(
        category:
            selectedCategory == SweetsTypes.all ? null : selectedCategory.key,
        priceFrom:
            filterActivated ? currentRateRangeValues.start.round() : null,
        priceTo: filterActivated ? currentRateRangeValues.end.round() : null,
        sortCriteria: productsSortController.key,
        sortArrangement: productsSortController.arrangement.name,
      ),
    );
    result.fold((failure) {
      gettingMoreProducts = false;
      emit(GetHomeProductsFailureState(message: failure.message));
    }, (data) {
      if (isFirstTime) {
        productsModel = data;
      } else {
        productsModel?.products?.addAll(data.products!);
      }
      page++;
      gettingMoreProducts = false;
      emit(GetHomeProductsSuccessState());
    });
  }

  //////////////////////////Filter Screen///////////////////////
  bool filterActivated = false;

  RangeValues currentRateRangeValues = const RangeValues(0, 1000);

  void resetFilter() {
    currentRateRangeValues = const RangeValues(0, 1000);
    setState();
  }

  void cancelFilter() {
    filterActivated = false;
    setState();
    getHomeProducts();
  }
}
