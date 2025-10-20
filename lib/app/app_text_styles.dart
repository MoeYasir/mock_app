import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import 'package:mock_app/app/app_colors.dart';

class AppTextStyles {
  static final TextStyle heading1 = GoogleFonts.inter(
    fontSize: 36.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final TextStyle heading2 = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final TextStyle heading3 = GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final TextStyle bodyText1 = GoogleFonts.inter(
    fontSize: 16.sp,
    color: AppColors.white,
  );

  static final TextStyle bodyText1Bold = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static final TextStyle bodyText2 = GoogleFonts.inter(
    fontSize: 14.sp,
    color: AppColors.white,
  );

  static final TextStyle subtleText1 = GoogleFonts.inter(
    fontSize: 16.sp,
    color: AppColors.subtleTextColor,
  );

  static final TextStyle subtleText2 = GoogleFonts.inter(
    fontSize: 12.sp,
    color: AppColors.subtleTextColor,
  );

  static final TextStyle chartAxisLabel = GoogleFonts.inter(
    color: AppColors.subtleTextColor,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
  );
}
