import 'package:get/get.dart';

class Utils {
  static double getScreenHeightByPercentage(double percentage) =>
      Get.height * (percentage / 100);

  static double getScreenWidthByPercentage(double percentage) =>
      Get.height * (percentage / 100);
}
