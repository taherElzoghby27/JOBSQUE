import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/core/models/apply_user_model/apply_user_model.dart';

class ApplyUserService {
  //apply user to api
  Future<http.Response> applyUser({required ApplyUser applyUser}) async {
    //get token
    String token = CacheHelper.getData(key: StringsEn.token);
    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiConsts.applyEndPoint}'),
    );
    //put cv and other file into list
    List<File> cvs = [applyUser.cv!, applyUser.otherFiles!];
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';
    request.fields['name'] = applyUser.name!;
    request.fields['email'] = applyUser.email!;
    request.fields['mobile'] = applyUser.phone!;
    request.fields['work_type'] = applyUser.typeOfWork!;
    request.fields['jobs_id'] = applyUser.jobId!;
    request.fields['user_id'] = applyUser.userId!;
    // Add the files to the request
    for (int i = 0; i < cvs.length; i++) {
      http.ByteStream pdfStream = http.ByteStream(cvs[i].openRead());
      int pdfLength = await cvs[i].length();
      http.MultipartFile pdfMultipartFile = http.MultipartFile(
        i == 0 ? 'cv_file' : 'other_file', // Use a unique key for each file
        pdfStream,
        pdfLength,
        filename: cvs[i].path.split('/').last,
      );
      // Add the files to the request
      request.files.add(pdfMultipartFile);
    }
    http.Response response =
        await http.Response.fromStream(await request.send());
    return response;
  }
}
