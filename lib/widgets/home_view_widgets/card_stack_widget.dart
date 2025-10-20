import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_spacings.dart';
import 'package:mock_app/app/app_text_styles.dart';

class CardStackWidget extends StatelessWidget {
  const CardStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Positioned(
            left: 50.w,
            top: 0,
            child: _buildCreditCard(
              background: _buildBokehEffect(),
              color: AppColors.itemColors.withValues(alpha: 0.7),
              child: _buildCardDetails(isBackCard: true),
            ),
          ),
          Positioned(
            left: 25.w,
            top: 15.h,
            child: _buildCreditCard(
              background: _buildBokehEffect(),
              color: AppColors.purple,
              child: _buildCardDetails(isBackCard: true),
            ),
          ),
          Positioned(
            left: 0,
            top: 30.h,
            child: _buildCreditCard(
              background: _buildBokehEffect(),
              color: AppColors.frontCardColor,
              child: _buildCardDetails(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBokehEffect() {
    return Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            bottom: -40.h,
            right: 50.w,
            child: CircleAvatar(
              radius: 35.r,
              backgroundColor: AppColors.white.withOpacity(0.05),
            ),
          ),
          Positioned(
            bottom: -10.h,
            right: -20.w,
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: AppColors.white.withOpacity(0.08),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCard(
      {required Color color,
      required Widget child,
      Widget background = const SizedBox.shrink()}) {
    return Container(
      width: 280.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: AppSpacing.cardPadding,
      child: child,
    );
  }

  Widget _buildCardDetails({bool isBackCard = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.apps_rounded,
                color: AppColors.white.withValues(alpha: isBackCard ? 0 : 1),
                size: 30),
            const Icon(Icons.wifi, color: AppColors.white, size: 30),
          ],
        ),
        if (!isBackCard)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dhaka Bank Ltd", style: AppTextStyles.heading2),
              AppSpacing.gapH10, // A small gap here is fine
              Text("Card number", style: AppTextStyles.subtleText2),
              Gap(5.h),
              Text(
                "**** **** **** 0959",
                style: AppTextStyles.bodyText1.copyWith(letterSpacing: 1.5),
              ),
            ],
          ),
        if (isBackCard) const SizedBox.shrink(),
      ],
    );
  }
}
