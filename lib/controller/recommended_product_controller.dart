import 'package:food_delivery/data/repository/recommended_product_repo.dart';
import 'package:food_delivery/models/prducts_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});
  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;
  bool _isloading = false;
  bool get isloaging => _isloading;
  Future<void> getRecommendedductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      
      _isloading = true;
      update();
    }
  }
}
