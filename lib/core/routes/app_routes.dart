// import 'package:auto_route/auto_route.dart';
// import 'package:registerapp/core/routes/app_routes.gr.dart';

// @AutoRouterConfig(replaceInRouteName: 'Page,Route')
// class AppRouter extends RootStackRouter {
//   @override
//   List<AutoRoute> get routes => [
//     AutoRoute(initial: true, path: '/splash', page: SplashRoute.page),

//     AutoRoute(path: '/login', page: LoginRouteWrapper.page),
//       AutoRoute(path: '/get', page: UserProfileRoute.page),
//   ];
// }




import 'package:auto_route/auto_route.dart';
import 'package:registerapp/core/routes/app_routes.gr.dart';
import 'package:registerapp/features/get_delete/presentation/pages/get_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, path: '/splash', page: SplashRoute.page),
        AutoRoute(path: '/login', page: LoginRouteWrapper.page),
        // AutoRoute(path: '/get', page: UserProfileWrapper.page), 
    

      ];
}

