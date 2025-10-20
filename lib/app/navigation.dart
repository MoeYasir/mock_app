import 'package:get/get.dart';
import 'package:mock_app/app/routes.dart';
import 'package:mock_app/bindings/home_controller_binding.dart';
import 'package:mock_app/views/home_view.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(
        name: Routes.home,
        page: () => const HomeScreen(),
        binding: HomeControllerBinding()),
  ];
}
