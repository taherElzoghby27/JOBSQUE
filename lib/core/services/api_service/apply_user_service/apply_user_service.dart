// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/src/response.dart';
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';
import 'package:jobsque/core/services/api_service/post_api_service.dart';

class ApplyUserService {
  final PostApiService postApiService;
  ApplyUserService({required this.postApiService});
  //apply user to api
  Future<Response> applyUser({required ApplyUser applyUser}) async {
    Response response = await postApiService.post(
      path: '${ApiConsts.url}${ApiConsts.applyEndPoint}',
      body: applyUser.toJson(),
    );
    return response;
  }
}
