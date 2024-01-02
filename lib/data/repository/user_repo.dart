import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/utils/constans.dart';
import 'package:get/get.dart';

class UserRepo {
  final ApiClient apiClient;

  UserRepo({required this.apiClient});
 Future<Response> getUserinfo()async {
   return await apiClient.getData(Appconstants.userInfo);
   
  }
}
