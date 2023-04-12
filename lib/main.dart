import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'package:uploadfile_flutter/filePicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(debugShowCheckedModeBanner: false, home: Scaffold(body: FilePickerScreen()));
  }
}


class FilePickerScreen extends StatefulWidget {


  const FilePickerScreen({super.key});

  @override
  _FilePickerScreenState createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {

  //Chọn file từ thiết bị
  File? _pickedFile;
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
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
      appBar: AppBar(title: const Text('Upload file'),
      centerTitle: true,),
      body: Center(
          child: TextButton(
              onPressed: () {
                Get.to(const DocumentViewer(), arguments: _pickedFile!.path);
              },
              child: const Text('Press'))),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickFile,
        tooltip: 'Pick a PDF file',
        child: const Icon(Icons.file_upload),
      ),
    );
  }
}
