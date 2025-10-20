import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_spacings.dart';
import 'package:mock_app/app/app_text_styles.dart';
import 'package:mock_app/controllers/statistics_controller.dart';

class PaymentsSection extends GetView<StatisticsController> {
  const PaymentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Payments', style: AppTextStyles.heading2),
            Text('See more',
                style:
                    AppTextStyles.bodyText2.copyWith(color: AppColors.purple)),
          ],
        ),
        AppSpacing.gapH20,
        Obx(
          () => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.paymentItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) {
              final item = controller.paymentItems[index];
              return _buildPaymentCard(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentCard(PaymentData item) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.itemColors,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: item.color,
                child: Text(item.icon,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              AppSpacing.gapW15,
              Text(item.title, style: AppTextStyles.bodyText1),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.amount, style: AppTextStyles.heading2),
              Gap(5.h),
              Text(item.date, style: AppTextStyles.subtleText2),
            ],
          ),
        ],
      ),
    );
  }
}
