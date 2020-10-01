import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ImagePickerTflite extends StatefulWidget {
  ImagePickerTflite({Key key}) : super(key: key);

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
  }

  Future getImageFromGallery() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    var imageFile = File(image.path);
    setState(() {
      imageURI = imageFile;
      path = imageFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        imageURI == null
          ? Text('Sem Imagem')
          : Image.file(imageURI, width: 300, height: 200, fit: BoxFit.cover),
        Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
          child: RaisedButton(
            onPressed: getImageFromCamera,
            child: Text('Selecione imagem da camera'),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          )),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: RaisedButton(
            onPressed: getImageFromGallery,
            child: Text('Selecione imagem da galeria'),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          )),
/*         Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
          child: RaisedButton(
            onPressed: classifyImage,
            child: Text('Classificar imagem'),
            textColor: Colors.white,
            color: Colors.blue,
            padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
          )),
        result == null
          ? Text('Resultado: ')
          : Text(result) */
    ]))
    );
  }
}