import 'package:flutter/material.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_text_styles.dart';

class StatisticsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StatisticsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.itemColors,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      title: Text('Statistics', style: AppTextStyles.heading2),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          decoration: const BoxDecoration(
            color: AppColors.itemColors,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert, color: Colors.white, size: 24),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
