import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        iconColor: const Color(0xFFB952E1),
      ),
      SavingPlanItem(
        icon: Icons.bar_chart_rounded,
        title: 'Investment',
        progress: '\$200k',
        iconColor: const Color(0xFFEC5282),
      ),
      SavingPlanItem(
        icon: Icons.home_work_outlined,
        title: 'New Home',
        progress: '\$400k',
        iconColor: const Color(0xFFF39A3E),
      ),
    ]);
  }

  void _loadTransactionData() {
    transactionItems.assignAll([
      TransactionItem(
        logoAsset: 'assets/images/amazon_logo.png',
        title: 'Amazon',
        time: '09:48',
        amount: '-102.00',
        category: 'Shopping',
      ),
      TransactionItem(
        logoAsset: 'education_logo',
        title: 'Education',
        time: '08:12',
        amount: '-124.00',
        category: 'Service',
      ),
    ]);
  }
}
