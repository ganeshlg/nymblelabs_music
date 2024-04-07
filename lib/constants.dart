import 'package:hive/hive.dart';

class Constants{
  static const double mobileWidth = 500;

  static const String loginScreen = "login_screen";
  static const String homeScreen = "home_screen";
  static const String detailsScreen = "details_screen";
  static const String splashScreen = "splash_screen";

  static CollectionBox? loginCredentialsBox;
  static CollectionBox? songsBox;
  static CollectionBox? favoritesBox;

}