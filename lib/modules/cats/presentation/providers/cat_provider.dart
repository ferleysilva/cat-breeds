import 'package:catbreeds/modules/cats/data/repositories/implement_cat_reposotory.dart';
import 'package:catbreeds/modules/cats/domain/entities/filter_params_get_cats.dart';
import 'package:catbreeds/modules/cats/domain/usecases/get_cat_list_usecase.dart';
import 'package:catbreeds/modules/cats/presentation/models/cat_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatListStateNotifier extends StateNotifier<CatListModel> {
  final GetCatListUsecase getCatListUsecase;
  late int page = 0;
  final int limit = 10;

  CatListStateNotifier(this.getCatListUsecase) : super(CatListModel()) {
    initialize();
  }

  Future<void> initialize() async {
    FilterParamsGetCats filters = FilterParamsGetCats(
      page: page,
      limit: limit,
      textSearch: state.textSearch,
      withImage: state.withImage,
    );
    await getCatList(filters);
  }

  Future<void> loadNextPage() async {
    if (state.hasMoreItems) {
      page++;
      FilterParamsGetCats filters = FilterParamsGetCats(
        page: page,
        limit: limit,
        textSearch: state.textSearch,
        withImage: state.withImage,
      );
      await getCatList(filters);
    }
  }

  Future<void> refreshGroupList() async {
    page = 0;
    state = state.copyWith(catList: [], hasMoreItems: true);
    FilterParamsGetCats filters = FilterParamsGetCats(
      page: page,
      limit: limit,
      textSearch: state.textSearch,
      withImage: state.withImage,
    );
    await getCatList(filters);
  }

  Future<void> searchCatByBreed(String text) async {
    page = 0;
    state = state.copyWith(catList: [], hasMoreItems: true, textSearch: text);
    FilterParamsGetCats filters = FilterParamsGetCats(
      page: page,
      limit: limit,
      textSearch: text,
      withImage: state.withImage,
    );
    await getCatList(filters);
  }

  Future<void> getCatList(FilterParamsGetCats filters) async {
    state = state.copyWith(isLoading: true);

    try {
      final catList = await getCatListUsecase.call(filters);

      if (catList.length == limit) {
        state = state.copyWith(hasMoreItems: true);
      } else {
        state = state.copyWith(hasMoreItems: false);
      }

      state = state.copyWith(catList: [...state.catList, ...catList], isLoading: false);
    } catch (e) {
      print('Error fetching cat list: $e');
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}

final catListProvider = StateNotifierProvider<CatListStateNotifier, CatListModel>((ref) {
  final ImplementCatRepository catRepository = ImplementCatRepository();
  final GetCatListUsecase getCatListUsecase = GetCatListUsecase(catRepository);

  return CatListStateNotifier(getCatListUsecase);
});
