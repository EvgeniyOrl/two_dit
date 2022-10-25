import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/colors.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  final gsReference =
  FirebaseStorage.instance.refFromURL('gs://test-56cb4.appspot.com/text.txt');


  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: InkWell(
            onTap: () {
              downloadFile(gsReference);
            },
            child: Text("Imprint", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, decoration: TextDecoration.underline, color: AppColors.textColor2),))
    );
  }

  Future downloadFile(Reference rev) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = "${appDocDir.path}/${rev.name}";
    final file = File(filePath);
    print(appDocDir);

    final downloadTask = await rev.writeToFile(file);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Downloaded ${rev.name}")),
    );
  }
}


