import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentData {
  final String icon;
  final String title;
  final String amount;
  final String date;
  final Color color;

  PaymentData({
    required this.icon,
    required this.title,
    required this.amount,
    required this.date,
    required this.color,
  });
}

class StatisticsController extends GetxController {
  final selectedDateFilter = 2.obs;
  final selectedIncomeFilter = 0.obs;
  final selectedNavIndex = 1.obs;

  final RxList<PaymentData> paymentItems = <PaymentData>[].obs;

  final List<double> barChartData = [12, 8, 28, 19, 22, 16];

  @override
  void onInit() {
    super.onInit();
    _loadPaymentData();
  }

  void _loadPaymentData() {
    paymentItems.assignAll([
      PaymentData(
          icon: 'Bē',
          title: 'Behance',
          amount: '\$4,567.23',
          date: 'March 2025',
          color: const Color(0xFF0057FF)),
      PaymentData(
          icon: 'Up',
          title: 'Upwork',
          amount: '\$2,245.55',
          date: 'March 2025',
          color: const Color(0xFF13A800)),
      PaymentData(
          icon: 'Gh',
          title: 'Github',
          amount: '\$1,890.70',
          date: 'March 2025',
          color: const Color(0xFF6E40C9)),
      PaymentData(
          icon: 'Db',
          title: 'Dribbble',
          amount: '\$3,120.99',
          date: 'March 2025',
          color: const Color(0xFFEA4C89)),
    ]);
  }

  void changeDateFilter(int index) {
    selectedDateFilter.value = index;
  }

  void changeIncomeFilter(int index) {
    selectedIncomeFilter.value = index;
  }

  void changeNavIndex(int index) {
    selectedNavIndex.value = index;
  }
}
