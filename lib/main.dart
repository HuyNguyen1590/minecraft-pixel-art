import 'dart:io';

import 'package:dart_minecraft/dart_minecraft.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_pixel_art/provider/my_provider.dart';
import 'package:minecraft_pixel_art/screen/crop_image_screen.dart';
import 'package:minecraft_pixel_art/screen/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(1080, 1920),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context) => MaterialApp(
          title: 'Minecraft Pixel Art',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(), // standard dark theme
          themeMode: ThemeMode.system, // device controls theme
          initialRoute: HomeScreen.routerName,
          routes: {
            HomeScreen.routerName: (ctx) =>  const HomeScreen(),
            CropImageScreen.routerName: (ctx) =>  const CropImageScreen(),
          },
        ),
      ),
    );
  }
  ThemeData _themeDataLightMode(){
    return ThemeData(
      primaryColor: const Color(0xFF009688),
      primaryColorLight: const Color(0xFF52C7B8),
      primaryColorDark: const Color(0xFF00675B),
    );
  }
  ThemeData _themeDataDarkMode(){
    return ThemeData.dark();
  }
}