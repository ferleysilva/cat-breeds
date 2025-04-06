import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'package:catbreeds/modules/cats/domain/entities/filter_params_get_cats.dart';
import 'package:catbreeds/modules/cats/domain/repositories/cat_repository.dart';

class GetCatListUsecase {
  final CatRepository _catRepository;

  GetCatListUsecase(this._catRepository);

  Future<List<Cat>> call(FilterParamsGetCats filters) async {
    return await _catRepository.getCatList(filters);
  }
}
