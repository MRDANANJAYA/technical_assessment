

import 'package:technical_assessment/Service/ApiService/science_api_service.dart';
import 'package:technical_assessment/Service/Models/science_model.dart';

class ScienceViewModel{


Future<ScienceModel> getScienceData(String category) async {
  ScienceModel scienceModel = ScienceModel();
  ScienceApiService scienceApiService = ScienceApiService();
  final response = await scienceApiService.getCustomerDetails(category);
  try{
    scienceModel = ScienceModel.fromJson(response.data);
  }catch(e){
    rethrow;
  }

  return scienceModel;
}

}


