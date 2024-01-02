import 'package:food_delivery/utils/constans.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  late Map<String, String> mainHeader; //_
  ApiClient({required this.appBaseUrl , required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = sharedPreferences.getString(Appconstants.token)!;
    mainHeader = {
      'content-type': 'application/json; charset=UTF-8',
      'Authorization': 'bearer $token'
    };
  }
  Future<Response> getData(String uri, {Map<String, String>? header}) async {
    try {
      Response response = await get(uri, headers: header ?? mainHeader);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  void updateHeader(String token) {
    mainHeader = {
      'content-type': 'application/json; charset=UTF-8',
      'Authorization': 'bearer $token'
    };
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response response = await post(uri, body, headers: mainHeader);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
