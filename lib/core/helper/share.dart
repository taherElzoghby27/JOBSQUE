import 'package:share_plus/share_plus.dart';

share({required String text, required String subject}) {
  Share.share(text, subject: subject);
}
