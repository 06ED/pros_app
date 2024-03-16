import 'package:pros_app/routes/guards/auth_route_guard.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '/resources/pages/pages.dart';

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
      router.route(
        HomePage.path,
        (context) => HomePage(),
        transition: PageTransitionType.fade,
        routeGuards: [
          AuthRouteGuard(),
        ],
      );
      router.route(
        AccountPage.path,
        (context) => AccountPage(),
        transition: PageTransitionType.fade,
        routeGuards: [
          AuthRouteGuard(),
        ],
      );
      router.route(
        PaymentPage.path,
        (context) => PaymentPage(),
        transition: PageTransitionType.fade,
        routeGuards: [
          AuthRouteGuard(),
        ],
      );
      router.route(
        AppealPage.path,
        (context) => AppealPage(),
        transition: PageTransitionType.fade,
        routeGuards: [
          AuthRouteGuard(),
        ],
      );
      router.route(
        SuccessOrderPage.path,
        (context) => SuccessOrderPage(),
        transition: PageTransitionType.fade,
      );
      router.route(
        OrderPage.path,
        (context) => OrderPage(),
        transition: PageTransitionType.fade,
      );
      router.route(
        IntroductionPage.path,
        (context) => IntroductionPage(),
        initialRoute: true,
        authPage: true,
      );
    });
