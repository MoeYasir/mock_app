import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_text_styles.dart';
import 'package:mock_app/controllers/statistics_controller.dart';

class IncomeSpendingToggle extends GetView<StatisticsController> {
  const IncomeSpendingToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.itemColors,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Obx(
        () => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildButton('Income', 0),
            _buildButton('Spending', 1),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, int index) {
    final isSelected = index == controller.selectedIncomeFilter.value;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeIncomeFilter(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.purple : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: isSelected
                ? AppTextStyles.bodyText1Bold
                : AppTextStyles.bodyText1,
          ),
        ),
      ),
    );
  }
}
