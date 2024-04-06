import 'package:flutter/material.dart';
import 'package:nymblelabs_music/app/details_page/details_page.dart';
import 'package:nymblelabs_music/app/home_page/home_page.dart';
import 'package:nymblelabs_music/app/login_page/login_page.dart';
import '../constants.dart';

class Navigation {
  static navigate(
      {required String route, required BuildContext context, String? index}) {
    switch (route) {
      case Constants.loginScreen:
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return LoginPage();
        }));
        break;
      case Constants.homeScreen:
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return HomePage();
        })
        );
        break;
      case Constants.detailsScreen:
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            reverseTransitionDuration: const Duration(milliseconds: 1200),
            transitionDuration: const Duration(milliseconds: 1200),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return DetailsPage(index: index!);
            },
          ),
        );
        break;
    }
  }
}
