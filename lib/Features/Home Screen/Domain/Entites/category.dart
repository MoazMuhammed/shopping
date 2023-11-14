class Categories {
  final int id;
  final String categoryName;
  final String categoryImage;

  Categories(
      {required this.id, required this.categoryName, required this.categoryImage});

  @override
  List<Object> get props => [id, categoryName, categoryImage];
}