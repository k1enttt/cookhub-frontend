import 'package:cookhub_frontend/app/modules/home/screens/home_screen.dart';
import 'package:cookhub_frontend/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeScreen())
  ];
}
