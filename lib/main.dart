import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shoping_getx/Cart/Cart_page/Cart_page.dart';

import 'Home page/Home_page/Home_page.dart';

void main() {
  return runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
        name: HomePage.routeName,
        page: () => HomePage(),
      ),
      GetPage(
        name: CartPage.routeName,
        page: () => CartPage(),
      ),
    ],
    initialRoute: HomePage.routeName,
  ));
}
