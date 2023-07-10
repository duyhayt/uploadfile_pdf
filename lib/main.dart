import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uploadfile_flutter/upload_pdf_page.dart';

import 'bindings/init_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: InitBinding(),
        home: const Scaffold(
            body: UploadFileScreen()
        ));
  }
}
