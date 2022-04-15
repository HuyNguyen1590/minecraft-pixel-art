import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;
class ImageUtils {
  Future<ui.Image> imgImageToUiImage(img.Image input) async {
    Completer<ui.Image> completer = Completer();
    ui.instantiateImageCodec(Uint8List.fromList(img.encodePng(input))).then((value) {
      value.getNextFrame().then((value1) => completer.complete(value1.image));
    });
    return completer.future;
  }
}