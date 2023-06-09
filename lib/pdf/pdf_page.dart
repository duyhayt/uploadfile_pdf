import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uploadfile_flutter/pdf/pdf_controller.dart';

class DocumentViewer extends StatelessWidget {
  const DocumentViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PdfController controller = Get.put(PdfController());
    final pathFile = Get.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Upload file PDF'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                print("OnPress");
              },
              icon: const Icon(Icons.list))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: controller.openViewPdf(pathFile),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
