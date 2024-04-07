import 'package:flutter/cupertino.dart';
import 'package:nymblelabs_music/constants.dart';

class LoginRepository {
  Future<Map> login(String email, String password) async {
    var dbData = await Constants.loginCredentialsBox?.get(email);

    if (dbData == null) {
      return {"ERRORCODE": "01", "ERRORMSG": "Username not registered"};
    }

    var dbPassword = dbData["password"];

    if (password == dbPassword) {
      return {"ERRORCODE": "00", "ERRORMSG": ""};
    } else {
      return {"ERRORCODE": "02", "ERRORMSG": "Incorrect password"};
    }
  }
}
