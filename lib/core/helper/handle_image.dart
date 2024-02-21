import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsque/core/consts/strings.dart';

import '../widgets/small_loading_widget.dart';

class HandleImageWidget extends StatelessWidget {
  const HandleImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    String type = checkPhotoType(image);
    switch (type) {
      case 'jpg' || 'png':
        return Image.asset(image);
      case 'svg':
        return SvgPicture.asset(image);
      case 'network':
        return CachedNetworkImage(
          imageUrl: image,
          progressIndicatorBuilder:
              (context, String data, DownloadProgress pr) =>
                  const LoadingWidget(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      default:
        return const Icon(Icons.error);
    }
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
