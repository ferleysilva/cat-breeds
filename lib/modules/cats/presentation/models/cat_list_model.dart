import 'package:catbreeds/modules/cats/domain/entities/cat.dart';

class CatListModel {
  final List<Cat> catList;
  final bool isLoading;
  final bool hasMoreItems;
  final String textSearch;
  final bool withImage;

  CatListModel({
    this.catList = const [],
    this.isLoading = false,
    this.hasMoreItems = true,
    this.textSearch = '',
    this.withImage = true,
  });

  CatListModel copyWith({
    List<Cat>? catList,
    bool? isLoading,
    bool? hasMoreItems,
    String? textSearch,
    bool? withImage,
  }) {
    return CatListModel(
      catList: catList ?? this.catList,
      isLoading: isLoading ?? this.isLoading,
      hasMoreItems: hasMoreItems ?? this.hasMoreItems,
      textSearch: textSearch ?? this.textSearch,
      withImage: withImage ?? this.withImage,
    );
  }
}
