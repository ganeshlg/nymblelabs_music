import '../constants.dart';

class SignUpRepository {
  Future<Map> signUp(String email, String password) async {
    var dbData = await Constants.loginCredentialsBox?.get(email);

    if (dbData != null) {
      return {"ERRORCODE": "01", "ERRORMSG": "Email already registered"};
    }

    try {
      await Constants.loginCredentialsBox?.put(email, {"password": password});
      return {"ERRORCODE": "00", "ERRORMSG": ""};
    } catch (e) {
      return {"ERRORCODE": "02", "ERRORMSG": "Email registration failed"};
    }
  }
}
