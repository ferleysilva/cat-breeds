class FilterParamsGetCats {
  final int page;
  final int limit;
  final String? textSearch;
  final bool withImage;

  const FilterParamsGetCats({
    required this.page,
    required this.limit,
    this.textSearch,
    required this.withImage,
  });
}
