import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

class PdfController extends GetxController {
  DocumentView openViewPdf(pathFile) {
    return DocumentView(
      onCreated: (DocumentViewController controller) async {
        PdftronFlutter.initialize("");
        Config config = Config();
        config.readOnly = true; //Config chính để chỉ cho phép hiển thị file pdf
        config.hideBottomToolbar = true; //Config chính để ẩn thanh tool dưới
        config.hideTopAppNavBar = true; //Config chính để ẩn thanh tool trên
        config.pageIndicatorEnabled = false; //Config chính để ẩn thanh hiển thị trang hiện tại/tổng số trang
        await controller.openDocument(
          pathFile,
          config: config,
        );

        ///Tránh việc resize appbar
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      },
    );
  }
}
