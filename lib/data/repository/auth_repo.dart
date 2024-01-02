import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:food_delivery/utils/constans.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});
  Future<Response> registertion(SignUpBody sinupBody) async {
    return await apiClient.postData(
        Appconstants.registrationUrl, sinupBody.tojson());
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        Appconstants.loginUrl, {'email': email, 'password': password});
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(Appconstants.token);
  }

  Future<String> getUserToken() async {
    return await sharedPreferences.getString(Appconstants.token) ?? 'none';
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(Appconstants.token, token);
  }

  Future<void> saveUserNameAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(Appconstants.phone, number);
      await sharedPreferences.setString(Appconstants.password, password);
    } catch (e) {}
  }

  bool clearSharedData() {
    sharedPreferences.remove(Appconstants.token);
    sharedPreferences.remove(Appconstants.password);
    sharedPreferences.remove(Appconstants.phone);
    apiClient.token = '';
    apiClient.updateHeader('');

    return true;
  }
}
