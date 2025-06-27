import 'package:auto_route/auto_route.dart';
import 'package:registerapp/core/routes/app_routes.gr.dart';
// import 'package:registerapp/core/routes/app_routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, path: '/book', page: BookRoute.page),
        //AutoRoute(path: '/bookform', page: BookFormRoute.page),
      ];
}
