import 'package:get/get.dart';
import 'package:uploadfile_flutter/pdf/pdf_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PdfController());
  }
}
