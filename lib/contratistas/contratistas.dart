import 'package:flutter/material.dart';

class Contratistas extends StatefulWidget {
  @override
  _ContratistasState createState() => _ContratistasState();
}

class _ContratistasState extends State<Contratistas> {

 final _formKey = GlobalKey<FormState>();

 String _maritalStatus = 'single';
 
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fomulario Contratistas')
      ),
      body: Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget(),
        )));
    
    

  }
  
List<Widget> getFormWidget() {
   List<Widget> formWidget = new List();
   
   formWidget.add(new Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('Single'),
          value: 'single',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Married'),
          value: 'married',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value;
            });
          },
        ),
      ],
    ));
    return formWidget;
  }
}