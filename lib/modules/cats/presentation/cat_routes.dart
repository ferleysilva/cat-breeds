import 'package:catbreeds/modules/cats/domain/entities/cat.dart';
import 'package:catbreeds/modules/cats/presentation/screens/cat_detail_screen.dart';
import 'package:catbreeds/modules/cats/presentation/screens/cat_list_screen.dart';
import 'package:go_router/go_router.dart';

final List<GoRoute> catRoutes = [
  GoRoute(
    path: '/cats',
    builder: (context, state) => const CatListScreen(),
  ),
  GoRoute(
    path: '/cat-detail',
    builder: (context, state) {
      final cat = state.extra as Cat;
      return CatDetailScreen(cat: cat);
    },
  ),
];
