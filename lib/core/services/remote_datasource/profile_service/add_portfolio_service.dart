import 'package:dio/dio.dart';
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/models/user_profile_model/portfolio.dart';

import '../../../consts/api_service.dart';

class AddPortfolioService {
  ApiService apiService;

  AddPortfolioService({required this.apiService});

  //add portfolio to api
  Future<Map<String, dynamic>> addPortfolio({
    required PortfolioModel portfolioCv,
  }) async {
    String url = '${ApiConsts.getPortfolioEndPoint}';
    FormData data = await portfolioCv.toMap();

    Map<String, dynamic> response = await apiService.post(
      path: url,
      body: data,
    );
    return response;
  }
}
