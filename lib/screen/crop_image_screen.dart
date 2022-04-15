import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:minecraft_pixel_art/provider/my_provider.dart';
import 'package:minecraft_pixel_art/utils/image_utils.dart';
import 'package:provider/provider.dart';
import 'package:image/image.dart' as img;
class CropImageScreen extends StatefulWidget {
  const CropImageScreen({Key? key}) : super(key: key);
  static const routerName = '/cropImage';

  @override
  State<CropImageScreen> createState() => _CropImageScreenState();
}

class _CropImageScreenState extends State<CropImageScreen> {
  final GlobalKey<ExtendedImageEditorState> editorKey =GlobalKey<ExtendedImageEditorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minecraft Pixel Art"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // handle the press
              editorKey.currentState?.getCropRect();
              var data = editorKey.currentState?.rawImageData;
              context.read<MyProvider>().setCurrentImage(image)
            },
          ),
        ],
      ),
      body: Selector<MyProvider,File?>(
        selector: (_, provider) => provider.currentImageFile,
        builder: (_,currentImageFile,__){
          // return FutureBuilder<Uint8List?>(
          //     future: ImageUtils().imgImageToUiImage(currentImage),
          //     builder: (context, snapshot){
          //
          // });
          return currentImageFile == null ? SizedBox() : ExtendedImage.file(
            currentImageFile,
            fit: BoxFit.contain,
            mode: ExtendedImageMode.editor,
            extendedImageEditorKey: editorKey,
            initEditorConfigHandler: (state) {
              return EditorConfig(
                  maxScale: 8.0,
                  cropRectPadding: EdgeInsets.all(20.0),
                  hitTestSize: 20.0,
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.grey,
        height: kBottomNavigationBarHeight,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.flip),
                    tooltip: 'Flip the image',
                    onPressed: () {
                      editorKey.currentState?.flip();
                    },
                  ),
                  Text('Flip')
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.rotate_left),
                    tooltip: 'Rotate image to left',
                    onPressed: () {
                      editorKey.currentState?.rotate(right: false);
                    },
                  ),
                  Text('Rotate Left')
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.rotate_right),
                    tooltip: 'Rotate image to right',
                    onPressed: () {
                      editorKey.currentState?.rotate(right: true);
                    },
                  ),
                  Text('Rotate Right')
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.restore),
                    tooltip: 'Reset image to default',
                    onPressed: () {
                      editorKey.currentState?.reset();
                    },
                  ),
                  Text('Reset')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
