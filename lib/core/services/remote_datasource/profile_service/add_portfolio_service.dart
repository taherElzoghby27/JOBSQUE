import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/models/portfolio.dart';

import '../../../consts/api_service.dart';

class AddPortfolioService {
  ApiService apiService;

  AddPortfolioService({required this.apiService});

  //add portfolio to api
  Future<Map<String, dynamic>> addPortfolio(
      {required PortfolioCv portfolioCv}) async {
    FormData formData = FormData.fromMap({
      'cv_file': await MultipartFile.fromFile(portfolioCv.cvFile!.path,
          filename: portfolioCv.cvFile!.path.split('/').last),
      'image': await MultipartFile.fromFile(portfolioCv.image!.path,
          filename: portfolioCv.image!.path.split('/').last),
    });

    var response = await apiService.post(
      path: '${ApiConsts.getPortfolioEndPoint}',
      body: formData,
    );
    return response;
  }
}
