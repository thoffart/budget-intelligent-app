import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ImagePickerTflite extends StatefulWidget {
  const ImagePickerTflite({
    Key key,
    @required this.updateName,
  }) : super(key: key);

  final void Function(String) updateName;

  @override
  _ImagePickerTfliteState createState() => _ImagePickerTfliteState();
}

class _ImagePickerTfliteState extends State<ImagePickerTflite> {
  File imageURI;
  String result;
  String path;
  final ImagePicker picker = ImagePicker();


  Future getImageFromCamera() async {
    var image = await picker.getImage(source: ImageSource.camera);
    var imageFile = File(image.path);
    setState(() {
      imageURI = imageFile;
      path = imageFile.path;
    });
    await classifyImage();
  }

  Future classifyImage() async {
    await Tflite.loadModel(
      model: 'assets/ssd_mobilenet.tflite',
      labels: 'assets/ssd_mobilenet.txt'
    );
    var output = await Tflite.detectObjectOnImage(path: path);
    setState(() {
      result = output.toString();
    });
    widget.updateName(output.first['detectedClass']);
  }

  Future getImageFromGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    var imageFile = File(image.path);
    setState(() {
      imageURI = imageFile;
      path = imageFile.path;
    });
    await classifyImage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    onPressed: getImageFromCamera,
                    child: Text('Selecionar imagem da camera'),
                    textColor: Colors.white,
                    color: Colors.purple,
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  ),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: getImageFromGallery,
                  child: Text('Selecionar imagem da galeria'),
                  textColor: Colors.white,
                  color: Colors.purple,
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                ),
              )
            ),
          ],
        ),
        if(imageURI != null)
          Image.file(imageURI, width: 300, height: 200, fit: BoxFit.cover),
    ]);
  }
}