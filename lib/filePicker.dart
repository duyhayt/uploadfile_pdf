import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

class DocumentViewer extends StatelessWidget {
  const DocumentViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pathFile = Get.arguments;
    // If using later Flutter versions.
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Upload file PDF'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.list))
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: DocumentView(
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
            },
          ),
        ));
  }
}
