import 'package:get/get.dart';

class DashboardController extends GetxController {
  var isTimerCompleted = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Future.delayed(Duration(seconds: 10), () {
      isTimerCompleted.value = true;
    });
  }
}
