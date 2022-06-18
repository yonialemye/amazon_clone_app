import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context, String snackMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(snackMessage)),
  );
}

Future<List<File>> pickImages() async {
  List<File> images = [];

  try {
    FilePickerResult? selectedFiles = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (selectedFiles != null && selectedFiles.files.isNotEmpty) {
      for (int i = 0; i < selectedFiles.files.length; i++) {
        images.add(File(selectedFiles.files[i].path!));
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  return images;
}
