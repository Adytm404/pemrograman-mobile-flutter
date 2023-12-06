import 'package:get/get.dart';
import 'package:second_process/app/presentations/controllers/account_controller.dart';
import 'package:second_process/app/presentations/controllers/client_controller.dart';
import 'package:second_process/app/presentations/controllers/database_controller.dart';
import 'package:second_process/app/presentations/controllers/realtime_controller.dart';
import 'package:second_process/app/presentations/controllers/storage_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => ClientController());
    Get.lazyPut(() => DatabaseController());
    Get.lazyPut(() => RealtimeController());
    Get.lazyPut(() => StorageController());
  }
}
