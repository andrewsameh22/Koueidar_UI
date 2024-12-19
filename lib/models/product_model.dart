import 'package:koueidar_ui/models/pagination_model.dart';

class ProductModel {
  String? id;
  String? name;
  String? categoryName;
  String? categorySlug;
  String? price;
  String? mainImage;
  String? type;
  bool? outOfStock;

  ProductModel({
    this.id,
    this.name,
    this.categoryName,
    this.categorySlug,
    this.price,
    this.mainImage,
    this.type,
    this.outOfStock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      name: json['ar_name'],
      categoryName: json['category_name_ar'],
      categorySlug: json['category_slug'],
      price: json['price'],
      mainImage: json['main_img']['src'],
      type: json['type'],
      outOfStock:
          json['availability'] != null && json['availability'] == 'outofstock',
    );
  }
}

class ProductsModel {
  PaginationModel? pagination;
  final List<ProductModel>? products;

  ProductsModel({
    this.pagination,
    this.products,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['products'] as List<dynamic>;
    List<ProductModel> products =
        dataList.map((product) => ProductModel.fromJson(product)).toList();

    return ProductsModel(
      pagination: PaginationModel.fromJson(json['pagination']),
      products: products,
    );
  }
}
