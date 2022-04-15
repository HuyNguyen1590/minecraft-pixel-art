import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minecraft_pixel_art/screen/crop_image_screen.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routerName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? imageF;
  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    var provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minecraft Pixel Art"),
        actions: [
          IconButton(
            icon: const Icon(Icons.widgets),
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      drawer: _myDrawer(),
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 1.sw,
                  height: 600.h,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'ADS'
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  child: Container(
                    width: 1.sw,
                    height: 120.h,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'load from gallery'.toUpperCase(),
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.sp
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    // Pick an image
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    if(image == null){
                      return;
                    }
                    provider.setCurrentImageFile(File(image.path));
                    Navigator.pushNamed(context, CropImageScreen.routerName);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  child: Container(
                    width: 1.sw,
                    height: 120.h,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'Capture an image'.toUpperCase(),
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp
                        ),
                      ),
                    ),
                  ),
                  onTap: () async {
                    // Capture a photo
                    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                    if(photo == null){
                      return;
                    }
                    provider.setCurrentImageFile(File(photo.path));
                    Navigator.pushNamed(context, CropImageScreen.routerName);
                    },
                ),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  child: Container(
                    width: 1.sw,
                    height: 120.h,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        'load from gallery'.toUpperCase(),
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Last Pixel Art',
                  style: GoogleFonts.roboto(
                    fontSize: 35.sp,
                  ),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.w),
                  ),
                  elevation: 10,
                  margin: const EdgeInsets.all(10),
                  child: Container(
                    child: imageF == null ? Image.asset('assets/5a43e5d0824854e067b91d3406470437.jpg', fit: BoxFit.fitWidth,) : Image.file(imageF!, fit: BoxFit.fitWidth,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  Drawer _myDrawer() {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              height: 0.3.sh,
              child: Center(child: FlutterLogo(size: 0.2.sh,)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      SizedBox(width: 8,),
                      Text("Home"),
                    ],
                  ),
                ),
                onTap: (){

                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      SizedBox(width: 8,),
                      Text("Home"),
                    ],
                  ),
                ),
                onTap: (){

                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      SizedBox(width: 8,),
                      Text("Home"),
                    ],
                  ),
                ),
                onTap: (){

                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      SizedBox(width: 8,),
                      Text("Home"),
                    ],
                  ),
                ),
                onTap: (){

                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      SizedBox(width: 8,),
                      Text("Home"),
                    ],
                  ),
                ),
                onTap: (){

                },
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: InkWell(
                child: Container(
                  height: 120.h,
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white))
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.home),
                      SizedBox(width: 8,),
                      Text("Home"),
                    ],
                  ),
                ),
                onTap: (){

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
