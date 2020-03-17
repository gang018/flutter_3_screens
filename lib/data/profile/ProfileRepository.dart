import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Profile.dart';

class ProfileRepository {

  Future<bool> isSignedIn() {
    return SharedPreferences.getInstance().then((settings) {
      return settings.getKeys().isNotEmpty;
    });
  }

  Future<bool> signIn(String email, String password) async {

    var body = {
      'login': email,
      'password': password,
      'firebase_token': 'asdfsd fasdf dfsd dsf'
    };

    var result = await post("http://188.225.9.129/api/users/login", body: body);
    if (result.statusCode == 200) {
      var jsonResult = jsonDecode(result.body);
      var token = jsonResult['data']['token'];
      print("token = " + token);

      var user = jsonResult['data']['user'];
      var profile = Profile(user['name'], user['email']);
      return _saveProfile(profile);
    } else {
      return Future.value(false);
    }
  }

  Future<bool> _saveProfile(Profile profile) {
    return SharedPreferences.getInstance().then((settings) {
      settings.setString('name', profile.name);
      settings.setString('email', profile.email);
      return Future.value(true);
    });
  }

  Future<bool> signUp() {
    return Future.value(true);
  }

  Future<Profile> getProfile() {
    return SharedPreferences.getInstance().then((settings) {
      return Future.value(Profile(
        settings.get('name'),
        settings.get('email')
      ));
    });
  }

  Future<bool> signOut() {
    return SharedPreferences.getInstance().then((settings) {
      settings.clear();
      return true;
    });
  }
}