import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
class MyProvider extends ChangeNotifier{
  Uint8List? currentBytes;
  img.Image? currentImage;
  File? currentImageFile;

  void setCurrentBytes(Uint8List? bytes){
    currentBytes = bytes;
    notifyListeners();
  }

  void setCurrentImageFile(File? file){
    currentImageFile = file;
    notifyListeners();
  }
  void setCurrentImage(img.Image? image){
    currentImage = image;
    notifyListeners();
  }
}