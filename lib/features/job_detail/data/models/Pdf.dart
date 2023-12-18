import 'package:flutter/services.dart';

class Pdf {
  String? name;
  Uint8List? bytes;
  double? size;
  String? extension;
  String? path;

  Pdf({
    this.name,
    this.bytes,
    this.size,
    this.extension,
    this.path,
  });
}
