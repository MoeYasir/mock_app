import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart'; // Ensure you have this file with the icon colors

class SavingPlanItem {
  final IconData icon;
  final String title;
  final String progress;
  final Color iconColor;

  SavingPlanItem({
    required this.icon,
    required this.title,
    required this.progress,
    required this.iconColor,
  });
}

class TransactionItem {
  final String logoAsset;
  final String title;
  final String time;
  final String amount;
  final String category;

  TransactionItem({
    required this.logoAsset,
    required this.title,
    required this.time,
    required this.amount,
    required this.category,
  });
}

class HomeController extends GetxController {
  final selectedNavIndex = 0.obs;

  final RxList<SavingPlanItem> savingPlanItems = <SavingPlanItem>[].obs;
  final RxList<TransactionItem> transactionItems = <TransactionItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSavingPlanData();
    _loadTransactionData();
  }

  void _loadSavingPlanData() {
    savingPlanItems.assignAll([
      SavingPlanItem(
        icon: Icons.laptop_mac,
        title: 'Buy Macbook',
        progress: '\$80k / \$100k',
        iconColor: AppColors.savingPlanIcon1,
      ),
      SavingPlanItem(
        icon: Icons.bar_chart_rounded,
        title: 'Investment',
        progress: '\$200k',
        iconColor: AppColors.savingPlanIcon2,
      ),
      SavingPlanItem(
        icon: Icons.home_work_outlined,
        title: 'New Home',
        progress: '\$400k',
        iconColor: AppColors.savingPlanIcon3,
      ),
    ]);
  }

  void _loadTransactionData() {
    transactionItems.assignAll([
      TransactionItem(
        // --- THIS IS THE DEFINITIVE FIX ---
        // The path now correctly points to your file in the `assets` folder.
        logoAsset: 'assets/amazon.jpg',
        title: 'Amazon',
        time: '09:48',
        amount: '-102.00',
        category: 'Shopping',
      ),
      TransactionItem(
        // This will correctly trigger the fallback Icon in your widget
        logoAsset: 'education_logo',
        title: 'Education',
        time: '08:12',
        amount: '-124.00',
        category: 'Service',
      ),
    ]);
  }
}
