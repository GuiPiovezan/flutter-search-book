import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PdfPreviewer extends StatefulWidget {
  final String? url;

  const PdfPreviewer({Key? key, required this.url}) : super(key: key);

  @override
  State<PdfPreviewer> createState() => _PdfPreviewerState();
}

class _PdfPreviewerState extends State<PdfPreviewer> {
  @override
  void initState() {
    super.initState();
    if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do livro"),
      ),
      body: WebView(
        initialUrl: widget.url,
      )
    );
  }
}
