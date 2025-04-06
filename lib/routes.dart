import 'package:catbreeds/modules/cats/presentation/cat_routes.dart';
import 'package:catbreeds/modules/splashscreen/splash_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter routes() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    ...catRoutes,
  ]);
}
