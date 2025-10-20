import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mock_app/app/app_colors.dart';
import 'package:mock_app/controllers/statistics_controller.dart';

class ChartSection extends GetView<StatisticsController> {
  const ChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.itemColors,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildTotalEarnings(),
          Gap(20.h),
          _buildDateFilter(),
          Gap(30.h),
          _buildBarChart(),
        ],
      ),
    );
  }

  Widget _buildTotalEarnings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Earnings',
                style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 16.sp)),
            Gap(5.h),
            Text('\$45,453.32',
                style: TextStyle(
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF3D3D4E),
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.trending_up_outlined,
                color: AppColors.purple, size: 24),
          ),
        ),
      ],
    );
  }

  Widget _buildDateFilter() {
    return Obx(
      () => Row(
        children: [
          Expanded(child: _buildDateButton('D', 0)),
          Gap(8.w),
          Expanded(child: _buildDateButton('W', 1)),
          Gap(8.w),
          Expanded(child: _buildDateButton('M', 2)),
          Gap(8.w),
          Expanded(child: _buildDateButton('Y', 3)),
        ],
      ),
    );
  }

  Widget _buildDateButton(String text, int index) {
    final isSelected = index == controller.selectedDateFilter.value;
    return GestureDetector(
      onTap: () => controller.changeDateFilter(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.purple : const Color(0xFF3D3D4E),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
            child: Text(text,
                style: TextStyle(fontSize: 16.sp, color: Colors.white))),
      ),
    );
  }

  Widget _buildBarChart() {
    final chartTextStyle = TextStyle(
      color: Colors.white70,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
    );

    return SizedBox(
      height: 200.h,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 30,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => const FlLine(
              color: Color(0xFF3D3D4E),
              strokeWidth: 1,
              dashArray: [5, 5],
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 35,
                getTitlesWidget: (value, meta) {
                  String text;
                  if (value == 0)
                    text = '\$0K';
                  else if (value == 10)
                    text = '\$10K';
                  else if (value == 20)
                    text = '\$20K';
                  else if (value == 30)
                    text = '\$30K';
                  else
                    return const SizedBox.shrink();
                  return Text(text, style: chartTextStyle);
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final titles = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(titles[value.toInt()], style: chartTextStyle),
                  );
                },
              ),
            ),
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(
            controller.barChartData.length,
            (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: controller.barChartData[index],
                  color:
                      index == 2 ? AppColors.purple : const Color(0xFF3D3D4E),
                  width: 18.w,
                  borderRadius: BorderRadius.circular(5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
