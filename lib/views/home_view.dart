import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/controllers/home_controller.dart';

import 'package:mock_app/widgets/home_view_widgets/balance_section_widget.dart';
import 'package:mock_app/widgets/home_view_widgets/bottom_nav_bar_widget.dart';
import 'package:mock_app/widgets/home_view_widgets/card_stack_widget.dart';
import 'package:mock_app/widgets/home_view_widgets/header_widget.dart';
import 'package:mock_app/widgets/home_view_widgets/saving_plan_list_widget.dart';
import 'package:mock_app/widgets/home_view_widgets/section_header_widget.dart';
import 'package:mock_app/widgets/home_view_widgets/transaction_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20.h),
                    const HeaderWidget(),
                    Gap(30.h),
                    Text("Your Balance",
                        style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 16.sp)),
                    Gap(10.h),
                    const BalanceSectionWidget(),
                    Gap(30.h),
                    const SectionHeader(
                        title: "My Wallet", actionText: "New Card"),
                    Gap(10.h),
                    const CardStackWidget(),
                    const SectionHeader(
                        title: "Saving Plan", actionText: "Add New"),
                    const SavingPlanList(),
                    Gap(20.h),
                    const TransactionHeader(),
                    const TransactionList(),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
