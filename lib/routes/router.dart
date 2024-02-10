import 'package:pros_app/resources/pages/payment_page/payment_page.dart';
import 'package:pros_app/routes/guards/auth_route_guard.dart';

import '/resources/pages/auth_page.dart';

import '/resources/pages/account_page.dart';
import '/resources/pages/home_page.dart';

import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
| Learn more https://nylo.dev/docs/5.x/router
|--------------------------------------------------------------------------
*/

appRouter() => nyRoutes((router) {
      router.route(
        AuthPage.path,
        (context) => AuthPage(),

      );
      router.route(HomePage.path, (context) => HomePage(),
          transition: PageTransitionType.fade,
          routeGuards: [
            AuthRouteGuard(),
          ]);
      router.route(
        PaymentPage.path,
        (context) => PaymentPage(),
        transition: PageTransitionType.fade,
      );
      router.route(AccountPage.path, (context) => AccountPage(),
          transition: PageTransitionType.fade,
          routeGuards: [
            AuthRouteGuard(),
          ]);
      router.route(
        PaymentPage.path,
        (context) => PaymentPage(),
        transition: PageTransitionType.fade,
        initialRoute: true,
        authPage: true,
      );
    });
