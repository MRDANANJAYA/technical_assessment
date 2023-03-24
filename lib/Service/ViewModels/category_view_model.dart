

import 'package:technical_assessment/Service/ApiService/category_api_service.dart';
import 'package:technical_assessment/Service/Models/science_model.dart';

class CategoryViewModel{


Future<CategoryModel> getScienceData(String category) async {
  CategoryModel scienceModel = CategoryModel();
  CategoryApiService scienceApiService = CategoryApiService();
  final response = await scienceApiService.getCustomerDetails(category);
  try{
    scienceModel = CategoryModel.fromJson(response.data);
  }catch(e){
    rethrow;
  }

  return scienceModel;
}

}


