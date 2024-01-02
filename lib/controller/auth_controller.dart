import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/models/response_model.dart';
import 'package:food_delivery/models/signup_body_model.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController implements GetxService {
  final AuthRepo authRepo;

  Authcontroller({required this.authRepo});
  bool isloading = false;

  Future<ResponseModel> registretion(SignUpBody signUpBody) async {
    isloading = true;
    update();
    Response response = await authRepo.registertion(signUpBody);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    isloading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
    authRepo.getUserToken();
    isloading = true;
    update();
    Response response = await authRepo.login(email, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    isloading = false;
    update();
    return responseModel;
  }

  void saveUserNameAndPassword(String number, String password) {
    authRepo.saveUserNameAndPassword(number, password);
  }

  bool userLoggedIn() {
    return authRepo.userLoggedIn();
  }

  bool clearSharedData() {
    return authRepo.clearSharedData();
  }
}
