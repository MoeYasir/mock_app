import 'package:get/get.dart';
import 'package:mock_app/controllers/statistics_controller.dart';

class StatisticsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatisticsController());
  }
}
