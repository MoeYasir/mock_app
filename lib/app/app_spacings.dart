import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppSpacing {
  static const EdgeInsets pageMargin = EdgeInsets.all(20);
  static const EdgeInsets cardPadding = EdgeInsets.all(10);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    vertical: 5,
    horizontal: 20,
  );
  static const EdgeInsets formFieldPadding = EdgeInsets.all(20);
  static const EdgeInsets appBarActionsPadding = EdgeInsets.only(right: 10);
  static double fullWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static Gap formFieldSpacing = Gap(20.h);
  static Gap formButtonSpacing = Gap(40.h);
  static Gap titleFormSpacing = Gap(60.h);
  static Gap defaultSpacingHeight = Gap(20.h);
  static Gap spacing10H = Gap(10.h);
  static double defaultScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width - 40;
  static const SizedBox defaultSpacingH = SizedBox(width: 10);
  static const SizedBox defaultSpacingV = SizedBox(height: 20);
  static double defaultScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - 40;
}
