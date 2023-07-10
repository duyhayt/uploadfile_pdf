import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pdf/view_document.dart';
import 'dart:io';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  _UploadFileScreenState createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  //Chọn file từ thiết bị
  File? _pickedFile;
  var fileName = ''.obs;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      fileName.value = result.names.toString();
      print("Result:........... ${fileName.value}");
      setState(() {
        _pickedFile = File(result.files.single.path!);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload file'),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(fileName.value),
            const SizedBox(
              height: 30,
            ),
            Center(
                child: OutlinedButton(
                    onPressed: () {
                      Get.to(const DocumentViewer(), arguments: _pickedFile!.path);
                    },
                    child: const Text('Xem tài liệu'))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        tooltip: 'Pick a PDF file',
        child: const Icon(Icons.file_upload),
      ),
    );
  }
}
