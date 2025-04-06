import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'package:catbreeds/modules/cats/domain/entities/filter_params_get_cats.dart';

abstract class CatRepository {
  Future<List<Cat>> getCatList(FilterParamsGetCats filters);
}
