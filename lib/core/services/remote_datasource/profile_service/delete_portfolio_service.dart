import 'package:jobsque/core/consts/api.dart';

import '../../../consts/api_service.dart';

class DeletePortfolioService {
  ApiService apiService;

  DeletePortfolioService({required this.apiService});

  //delete Portfolio method
  Future<Map<String, dynamic>> deletePortfolio({
    required int idPortfolio,
  }) async {
    Map<String, dynamic> response = await apiService.put(
      path: "${ApiConsts.getPortfolioEndPoint}/$idPortfolio",
    );
    return response;
  }
}
