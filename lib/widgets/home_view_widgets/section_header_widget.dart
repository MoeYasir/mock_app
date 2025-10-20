import 'package:flutter/material.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String actionText;
  const SectionHeader(
      {super.key, required this.title, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.heading2),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF20202C)),
              borderRadius: BorderRadius.circular(18)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(Icons.add, size: 20, color: AppColors.white),
                Text(' $actionText', style: AppTextStyles.bodyText2),
              ],
            ),
          ),
        )
      ],
    );
  }
}
