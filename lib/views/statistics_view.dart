import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mock_app/controllers/statistics_controller.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/widgets/home_view_widgets/bottom_nav_bar_widget.dart';
import 'package:mock_app/widgets/statistics_view_widgets/chart_section.dart';
import 'package:mock_app/widgets/statistics_view_widgets/income_spending_toggle.dart';
import 'package:mock_app/widgets/statistics_view_widgets/payment_section.dart';
import 'package:mock_app/widgets/statistics_view_widgets/statistics_app_bar.dart'; // The reusable nav bar

class StatisticsScreen extends GetView<StatisticsController> {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StatisticsController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const StatisticsAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const IncomeSpendingToggle(),
                  Gap(20.h),
                  const ChartSection(),
                  Gap(30.h),
                  const PaymentsSection(),
                  Gap(100.h),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(
              () => BottomNavBar(
                selectedIndex: controller.selectedNavIndex.value,
                onIndexChanged: (index) => controller.changeNavIndex(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
