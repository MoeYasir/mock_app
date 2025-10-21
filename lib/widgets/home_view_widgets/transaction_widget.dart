import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/app/app_spacings.dart';
import 'package:mock_app/app/app_text_styles.dart';
import 'package:mock_app/controllers/home_controller.dart';

class TransactionHeader extends StatelessWidget {
  const TransactionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Transaction History", style: AppTextStyles.heading2),
        Text('See more',
            style: AppTextStyles.bodyText2.copyWith(color: AppColors.purple)),
      ],
    );
  }
}

class TransactionList extends GetView<HomeController> {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.transactionItems.length,
        itemBuilder: (BuildContext context, int index) {
          final item = controller.transactionItems[index];
          return Padding(
            padding: AppSpacing.listItemPadding,
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              tileColor: AppColors.itemColors,

              // --- START: THE FINAL, GUARANTEED FIX ---
              leading: SizedBox(
                // Explicitly define the size of the leading area
                width: 40,
                height: 40,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: item.logoAsset.contains('assets/')
                      ? ClipOval(
                          child: Image.asset(
                            item.logoAsset,
                            width: 24,
                            height: 24,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.school,
                          color: Colors.black,
                          size: 24,
                        ),
                ),
              ),
              // --- END: FIX ---

              title: Text(item.title, style: AppTextStyles.bodyText1Bold),
              subtitle: Text(item.time, style: AppTextStyles.subtleText2),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(item.amount, style: AppTextStyles.bodyText1Bold),
                  Text(item.category, style: AppTextStyles.subtleText2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
