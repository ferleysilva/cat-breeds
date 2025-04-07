import 'package:catbreeds/modules/cats/data/adapters/cat_adapter.dart';
import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'package:catbreeds/modules/cats/domain/entities/filter_params_get_cats.dart';
import 'package:catbreeds/modules/cats/domain/repositories/cat_repository.dart';
import 'package:catbreeds/services/http_client_service.dart';

class ImplementCatRepository implements CatRepository {
  final HttpClientService httpClientService = HttpClientService();

  @override
  Future<List<Cat>> getCatList(FilterParamsGetCats filters) async {
    String url = '';

    if (filters.textSearch!.isNotEmpty) {
      url += '/breeds/search?q=${filters.textSearch}&';
    } else {
      url += '/breeds?';
    }

    url += 'has_breeds=${filters.withImage ? 1 : 0}';
    url += '&page=${filters.page}&limit=${filters.limit}';

    final response = await httpClientService.getList(url);
    if (response.statusCode != 200) {
      throw Exception('Failed to load cats');
    }
    return CatAdapter.fromApiListModelToEntityModelList(response.body);
  }
}
