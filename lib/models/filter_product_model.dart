class FilterProductModel {
  String? category;
  num? priceFrom;
  num? priceTo;
  String? sortArrangement;
  String? sortCriteria;

  FilterProductModel({
    this.category,
    this.priceFrom,
    this.priceTo,
    this.sortCriteria,
    this.sortArrangement,
  });

  Map<String, dynamic> toMap() {
    return {
      if (category != null) 'category': category,
      if (sortCriteria != null) ...{
        'sort[criteria]': sortCriteria,
        'sort[arrangement]': sortArrangement,
      },
      if (priceFrom != null && priceTo != null) ...{
        'price_range[0]': priceFrom,
        "price_range[1]": priceTo,
      },
    };
  }
}
