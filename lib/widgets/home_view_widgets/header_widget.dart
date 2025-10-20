import 'package:flutter/material.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_spacings.dart';
import 'package:mock_app/app/app_text_styles.dart';
import 'package:badges/badges.dart' as badges;

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            AppSpacing.gapW15,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Good morning", style: AppTextStyles.subtleText1),
                Text("Sajbur Rahman", style: AppTextStyles.heading3),
              ],
            ),
          ],
        ),
        badges.Badge(
          badgeStyle: badges.BadgeStyle(
              badgeColor: AppColors.purple,
              shape: badges.BadgeShape.square,
              borderRadius: BorderRadius.circular(5)),
          position: badges.BadgePosition.topEnd(top: -5, end: -5),
          badgeContent: Text("2", style: AppTextStyles.bodyText2),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: AppColors.itemColors,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.notifications_none_rounded,
                color: AppColors.white, size: 28),
          ),
        )
      ],
    );
  }
}
