import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mock_app/app/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(100.w, 0, 100.w, 10.h),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: AppColors.bottomNavBarColor,
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
    return GestureDetector(
      onTap: () => onIndexChanged(index),
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
