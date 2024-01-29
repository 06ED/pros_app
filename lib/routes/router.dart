import 'package:flutter_app/resources/pages/auth_page.dart';

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
  router.route(AuthPage.path, (context) => AuthPage(), authPage: true);
  router.route(HomePage.path, (context) => HomePage(), initialRoute: true, transition: PageTransitionType.fade);
  router.route(AccountPage.path, (context) => AccountPage(), transition: PageTransitionType.fade);
});
