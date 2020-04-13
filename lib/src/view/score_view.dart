import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';

class ScoreScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => ScoreScreenState();
}

class ScoreScreenState extends State<ScoreScreen> {

  // static const double _topSectionTopPadding = 50.0;
  // static const double _topSectionBottomPadding = 20.0;
  static const double _topSectionHeight = 50.0;

  GlobalKey globalKey = new GlobalKey();
  // String _dataString = "Seja bem-vindo!";
  // String _inputErrorText;
  // final TextEditingController _textController =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Receber pontuação",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            Text(
              "Apresente ou compartilhe o QRCode",
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ],
        ),
        actions: <Widget>[new Padding(padding:const EdgeInsets.all(13.0), child:Icon(Icons.share))],
      ),
            body: _contentWidget(),
    );
  }

  Future<void> _captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final file = await new File('${tempDir.path}/image.png').create();
      await file.writeAsBytes(pngBytes);

      final channel = const MethodChannel('channel:me.alfian.share/share');
      channel.invokeMethod('shareFile', 'image.png');

    } catch(e) {
      print(e.toString());
    }
  }

  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    return  Container(
      color: const Color(0xFFFFFFFF),
      child:  Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              // top: _topSectionTopPadding,
              left: 20.0,
              right: 10.0,
              // bottom: _topSectionBottomPadding,
            ),
            child:  Container(
              height: _topSectionHeight,
              child:  Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Expanded(
                  //   child:  TextField(
                  //     controller: _textController,
                  //     decoration:  InputDecoration(
                  //       hintText: "Insira uma mensagem",
                  //       errorText: _inputErrorText,
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10.0),
                  //   child:  FlatButton(
                  //     child:  Text("Enviar"),
                  //     onPressed: () {
                  //       setState((){
                  //         _dataString = _textController.text;
                  //         _inputErrorText = null;
                  //       });
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Expanded(
            child:  Center(
              child: RepaintBoundary(

                key: globalKey,
                child: QrImage(
                  data: "batata", //substituir pelo UUID do cliente
                  size: 0.5 * bodyHeight
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}