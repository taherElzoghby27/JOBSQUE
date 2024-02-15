import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/consts/strings.dart';

import '../widgets/small_loading_widget.dart';

//handle image
Widget handleImage(String image, double? height) {
  String type = checkPhotoType(image);
  switch (type) {
    case 'jpg' || 'png':
      return Image.asset(image, height: height);
    case 'svg':
      return SvgPicture.asset(image, height: height);
    case 'network':
      return CachedNetworkImage(
        height: height,
        imageUrl: image,
        placeholder: (context, url) => LoadingWidget(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    default:
      return Icon(Icons.error);
  }
}

//check photo type
String checkPhotoType(String image) =>
    image.endsWith(StringsEn.jpg) && !image.startsWith(StringsEn.https)
        ? StringsEn.jpg
        : image.endsWith(StringsEn.png) && !image.startsWith(StringsEn.https)
            ? StringsEn.png
            : image.endsWith(StringsEn.svg)
                ? StringsEn.svg
                : StringsEn.network;
