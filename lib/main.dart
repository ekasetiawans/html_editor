import 'package:flutter/material.dart';
import 'package:html_editor/widget/html_editor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  final htmlEditorKey = GlobalKey<HtmlEditorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(
                  htmlEditorKey.currentState.text,
                ),
              ),
            );
          },
          child: Text('Show Value'),
        ),
        Expanded(
          child: HtmlEditor(
            key: htmlEditorKey,
          ),
        ),
      ],
    );
  }
}
