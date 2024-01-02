import 'package:food_delivery/data/repository/user_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/user_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Usercontroller extends GetxController implements GetxService {
  final UserRepo userRepo;

  Usercontroller({required this.userRepo});
  bool isloading = false;
  late UserModel userModel;
  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserinfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      userModel = UserModel.fromjson(response.body);
      isloading = true;
      responseModel = ResponseModel(true, 'successfully');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }
}
