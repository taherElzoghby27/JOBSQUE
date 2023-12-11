import 'package:flutter/cupertino.dart';
import 'package:jobsque/core/helper/custom_snack.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUr(BuildContext context, {required String url}) async {
  if (url.startsWith('+20') || url.startsWith('010')) {
    if (!await launchUrl(
      Uri.parse('tel:$url'),
      mode: LaunchMode.externalApplication,
    )) {
      showSnack(context, message: 'Can not launch to this phone number');
    }
  } else if (url.contains('@')) {
    if (!await launchUrl(
      Uri.parse('mailto:$url'),
      mode: LaunchMode.externalApplication,
    )) {
      showSnack(context, message: 'Can not launch to this mail');
    }
  } else {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      showSnack(context, message: 'Can not launch to this url');
    }
  }
}
