class PaginationModel {
  int? totalResults;
  int? totalPages;
  int? perPage;
  int? currentPage;

  PaginationModel(
      {this.totalResults, this.totalPages, this.perPage, this.currentPage});

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      totalResults: json['total'],
      totalPages: json['total_pages'],
      perPage: json['products_per_page'],
      currentPage: json['current_page'],
    );
  }
}
