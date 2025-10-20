import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_spacings.dart';
import 'package:mock_app/app/app_text_styles.dart';
import 'package:mock_app/controllers/home_controller.dart';

class SavingPlanList extends GetView<HomeController> {
  const SavingPlanList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.savingPlanItems.length,
          itemBuilder: (BuildContext context, int index) {
            final item = controller.savingPlanItems[index];
            return Container(
              width: 150.w,
              margin: const EdgeInsets.only(right: 16.0, top: 16.0),
              decoration: BoxDecoration(
                  color: AppColors.itemColors,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 25.h,
                        width: 3.w,
                        decoration: BoxDecoration(
                          color: item.iconColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      AppSpacing.gapW8,
                      Icon(item.icon, color: item.iconColor, size: 30),
                    ],
                  ),
                  const Spacer(),
                  Text(item.title, style: AppTextStyles.bodyText1),
                  Gap(5.h),
                  Text(item.progress, style: AppTextStyles.bodyText1Bold),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
