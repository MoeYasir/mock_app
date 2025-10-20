import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_text_styles.dart';
import 'package:mock_app/app/routes.dart';

class BalanceSectionWidget extends StatelessWidget {
  const BalanceSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("\$79,456.88", style: AppTextStyles.heading1),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: AppColors.purple,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.statistics);
              },
              child: const Icon(Icons.add, color: AppColors.white, size: 30)),
        ),
      ],
    );
  }
}
