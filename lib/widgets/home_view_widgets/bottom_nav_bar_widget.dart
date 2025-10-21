import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/routes.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(110.w, 0, 110.w, 10.h),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1F1F2E),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavIcon(icon: Icons.home_outlined, index: 0),
            _buildNavIcon(icon: Icons.crop_free, index: 1),
            _buildNavIcon(icon: Icons.apps_rounded, index: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon({required IconData icon, required int index}) {
    final isSelected = index == selectedIndex;

    void handleNavigation() {
      if (isSelected) return;

      switch (index) {
        case 0:
          Get.offAllNamed(Routes.home);
          break;
        case 1:
          Get.offAllNamed(Routes.statistics);
          break;
        case 2:
          Get.snackbar("Navigation", "Page not implemented yet.");
          break;
      }
    }

    return GestureDetector(
      onTap: handleNavigation,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.purple : const Color(0xFF2C2C3A),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white.withValues(alpha: 0.9),
          size: 28.0,
        ),
      ),
    );
  }
}
