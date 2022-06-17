import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tik_tok_flutter/constants.dart';
import 'package:tik_tok_flutter/views/screens/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: ((context) => ConfirmScreen(
                videoFile: File(video.path),
                videoPath: video.path,
              ))));
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.gallery, context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      Padding(
                          padding: EdgeInsets.all(8.0), child: Text("Gallery"))
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    pickVideo(ImageSource.camera, context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      Padding(
                          padding: EdgeInsets.all(8.0), child: Text("Camera"))
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.cancel),
                      Padding(
                          padding: EdgeInsets.all(8.0), child: Text("Cancel"))
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (() {
            showOptionsDialog(context);
          }),
          child: Container(
            height: 50,
            width: 190,
            decoration: BoxDecoration(
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
