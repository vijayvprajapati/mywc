// //This class contain all routes for navigation in app

// import 'package:flutter/material.dart';
// import 'package:mywc/locator/locator.dart';
// import 'package:mywc/view/login/login.dart';
// import 'package:mywc/view/signup/signup.dart';
// import 'package:go_router/go_router.dart';

// import '../view/splash/splash.dart';

// //go router for web
// class AppRouter {
//   static String splash = 'splash';
//   static String signIn = 'signIn';
//   static String signup = 'signUp';

//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

//   // GoRouter configuration
//   GoRouter get getRoutes {
//     return GoRouter(
//       debugLogDiagnostics: true,
//       navigatorKey: navigatorKey,
//       routes: [
//         GoRoute(
//           name: splash,
//           // Optional, add name to your routes. Allows you navigate by name instead of path
//           path: '/',
//           //navigate path url
//           builder: (context, state) => const SplashScreen(), //screen
//         ),
//         GoRoute(
//             name: signIn,
//             path: '/signIn',
//             builder: (context, state) {
//               //  final data = state.extra;
//               return SignInScreen(
//                   //data: data.toString(),
//                   );
//             }),
//         GoRoute(
//           name: signup,
//           path: '/signUp',
//           builder: (context, state) => const SignUpScreen(),
//         ),
//       ],
//     );
//   }
// }

// final router = locator<AppRouter>().navigatorKey.currentState!.context;
