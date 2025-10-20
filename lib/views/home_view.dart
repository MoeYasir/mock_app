import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_text_styles.dart';
import 'package:mock_app/controllers/home_controller.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  Widget _buildBokehEffect() {
    return Positioned.fill(
      child: Stack(
        children: [
          Positioned(
            bottom: -40.h,
            right: 50.w,
            child: CircleAvatar(
              radius: 35.r,
              backgroundColor: Colors.white.withOpacity(0.05),
            ),
          ),
          Positioned(
            bottom: -10.h,
            right: -20.w,
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.white.withOpacity(0.08),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCard({
    required Color color,
    required Widget child,
    Widget background = const SizedBox.shrink(),
  }) {
    return Container(
      width: 280.w,
      height: 160.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            background, // Bokeh effect goes here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDetails({bool isFrontCard = false}) {
    if (!isFrontCard) {
      return Align(
        alignment: Alignment.topRight,
        child: Icon(Icons.wifi, color: Colors.white.withOpacity(0.7), size: 30),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.apps_rounded, color: Colors.white, size: 30),
            Icon(Icons.wifi, color: Colors.white, size: 30),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dhaka Bank Ltd",
              style: AppTextStyles.contentText
                  .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Gap(15.h),
            Text(
              "Card number",
              style: AppTextStyles.smallText
                  .copyWith(color: Colors.white.withOpacity(0.7)),
            ),
            Gap(5.h),
            Text(
              "**** **** **** 0959",
              style: AppTextStyles.contentText
                  .copyWith(fontSize: 16.sp, letterSpacing: 1.5),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCardStack() {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          Positioned(
            left: 50.w,
            top: 0,
            child: _buildCreditCard(
              color: AppColors.itemColors.withOpacity(0.7),
              background: _buildBokehEffect(),
              child: _buildCardDetails(),
            ),
          ),
          Positioned(
            left: 25.w,
            top: 15.h,
            child: _buildCreditCard(
              color: AppColors.purple,
              background: _buildBokehEffect(),
              child: _buildCardDetails(),
            ),
          ),
          Positioned(
            left: 0,
            top: 30.h,
            child: _buildCreditCard(
              color: const Color(0xFF2D2D3A),
              child: _buildCardDetails(isFrontCard: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon({required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C3A),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white.withOpacity(0.9),
        size: 28.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 110.w, vertical: 10.0.h),
          child: Container(
            width: 300.w,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F2E),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavIcon(icon: Icons.home_outlined),
                _buildNavIcon(icon: Icons.crop_free),
                _buildNavIcon(icon: Icons.apps_rounded),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(backgroundColor: Colors.blue),
                        Gap(10.w),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Good morning",
                                style: TextStyle(color: AppColors.white)),
                            Text("Sajbur Rahman",
                                style: TextStyle(color: AppColors.white)),
                          ],
                        ),
                      ],
                    ),
                    badges.Badge(
                      badgeStyle: badges.BadgeStyle(
                          shape: badges.BadgeShape.square,
                          borderRadius: BorderRadius.circular(5)),
                      badgeContent: const Text("2",
                          style:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15),
                          backgroundColor: const Color(0xFF14162B),
                        ),
                        child: const Icon(Icons.notifications_outlined,
                            color: AppColors.white, size: 30),
                      ),
                    )
                  ],
                ),
                Gap(20.h),
                Text("Your Balance", style: AppTextStyles.contentText),
                Gap(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ 79,456.88", style: AppTextStyles.heading),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(15),
                        backgroundColor: AppColors.purple,
                      ),
                      child: const Icon(Icons.add,
                          color: AppColors.white, size: 30),
                    ),
                  ],
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Wallet", style: AppTextStyles.contentText),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF20202C)),
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.add,
                                size: 20, color: Colors.white),
                            Text(' New Card', style: AppTextStyles.contentText),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Gap(20.h),
                _buildCardStack(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Saving Plan", style: AppTextStyles.contentText),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF20202C)),
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(Icons.add,
                                size: 20, color: Colors.white),
                            Text(' Add New', style: AppTextStyles.contentText),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Gap(10.h),
                SizedBox(
                  height: 120.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: AppColors.itemColors,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.laptop_mac,
                                    color: AppColors.white),
                                const Spacer(),
                                Text("Buy Macbook",
                                    style: AppTextStyles.contentText),
                                Gap(5.h),
                                Text("\$80k /\$100k",
                                    style: AppTextStyles.contentText),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Gap(10.h),
                Text("Transaction History", style: AppTextStyles.contentText),
                Gap(10.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Defers scrolling to parent
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        tileColor: AppColors.itemColors,
                        leading: const CircleAvatar(),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Amazon",
                              style: AppTextStyles.contentText
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text("09:48", style: AppTextStyles.smallText),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("-102.00", style: AppTextStyles.contentText),
                            Text("Shopping", style: AppTextStyles.smallText),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
