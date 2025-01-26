import 'package:auto_route/auto_route.dart';
import 'package:mywc/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

 @override
 List<AutoRoute> get routes => [
   /// routes go here
   AutoRoute(page: SplashRoute.page,initial: true),
 ];
}