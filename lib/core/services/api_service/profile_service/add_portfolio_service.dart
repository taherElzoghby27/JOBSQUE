import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jobsque/core/consts/api.dart';
import 'package:jobsque/core/consts/strings.dart';
import 'package:jobsque/core/helper/cache_helper.dart';
import 'package:jobsque/features/profile/presentation/view/portfolio/data/models/portfolio.dart';

class AddPortfolioService {
  //add portfolio to api
  Future<http.Response> addPortfolio({required PortfolioCv portfolioCv}) async {
    //get token
    String token = CacheHelper.getData(key: StringsEn.token);
    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse('${ApiConsts.getPortfolioEndPoint}'),
    );
    //put cv_file and image into list
    List<File> cvs = [portfolioCv.cvFile!, portfolioCv.image!];
    request.headers['Accept'] = 'application/json';
    request.headers['Authorization'] = 'Bearer $token';
    // Add the files to the request
    for (int i = 0; i < cvs.length; i++) {
      http.ByteStream pdfStream = http.ByteStream(cvs[i].openRead());
      int pdfLength = await cvs[i].length();
      http.MultipartFile pdfMultipartFile = http.MultipartFile(
        i == 0 ? 'cv_file' : 'image', // Use a unique key for each file
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
