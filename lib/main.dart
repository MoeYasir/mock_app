import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/navigation.dart';
import 'package:mock_app/app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: false,
      child: GetMaterialApp(
        initialRoute: Routes.home,
        getPages: Navigation.routes,
        debugShowCheckedModeBanner: false,
        title: 'Mock App',
        theme: ThemeData(
            fontFamily: GoogleFonts.inter().fontFamily,
            scaffoldBackgroundColor: AppColors.backgroundColor),
      ),
    );
  }
}
