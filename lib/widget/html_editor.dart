// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:js' as js;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class HtmlEditor extends StatefulWidget {
  HtmlEditor({Key key}) : super(key: key);

  @override
  HtmlEditorState createState() => HtmlEditorState();
}

class HtmlEditorState extends State<HtmlEditor> {
  @override
  Widget build(BuildContext context) {
    final input = DivElement()
      ..children = [
        LinkElement()
          ..href = "https://cdn.quilljs.com/1.3.6/quill.snow.css"
          ..rel = "stylesheet",
        DivElement()..id = "htmlEditor1",
        ScriptElement()
          ..innerHtml = """
              var container = document.getElementsByTagName("flt-platform-view")[0];
              var scene = container.shadowRoot;
              var editor = scene.getElementById("htmlEditor1");
              var quill = new Quill(editor, {theme: 'snow'});

              function getHtmlEditorValue(){
                return quill.root.innerHTML;
              };
        """,
      ];

    ui.platformViewRegistry.registerViewFactory(
      'htmlEditorView',
      (int viewId) {
        return DivElement()..children = [input];
      },
    );

    return SizedBox(
      width: 600,
      height: 600,
      child: HtmlElementView(
        viewType: 'htmlEditorView',
      ),
    );
  }

  String get text {
    final value = js.context.callMethod("getHtmlEditorValue");
    return value;
  }
}
