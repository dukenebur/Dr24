import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class MyApp234 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp234> {
  List<String> attachments = [];
  bool isHTML = false;

  final _recipientController = TextEditingController(
    text: 'rubenmashal@yahoo.com.ar',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: 'rubenmashal@yahoo.com.ar',
      subject: 'rubenmashal@yahoo.com.ar',
      recipients: ['rubenmashal@yahoo.com.ar'],
      attachmentPaths: attachments,
      isHTML: isHTML,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Plugin example app'),
          actions: <Widget>[
            IconButton(
              onPressed: send,
              icon: Icon(Icons.send),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _recipientController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Recipient',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _subjectController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Subject',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _bodyController,
                    maxLines: 10,
                    decoration: InputDecoration(
                        labelText: 'Body', border: OutlineInputBorder()),
                  ),
                ),
                CheckboxListTile(
                  title: Text('HTML'),
                  onChanged: (bool value) {
                    setState(() {
                      isHTML = value;
                    });
                  },
                  value: isHTML,
                ),
                
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.camera),
          label: Text('Add Image'),
          onPressed: _openImagePicker,
        ),
      ),
    );
  }

  void _openImagePicker() async {
    print('lala');
    setState(() {
    });
  }
}