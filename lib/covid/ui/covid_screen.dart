import 'package:dr24/covid/model/covid.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class CovidScreen extends StatefulWidget {
  final Covid covid;
  CovidScreen(this.covid);
  @override
  _CovidScreenState createState() => _CovidScreenState();
}

final covidReference = FirebaseDatabase.instance.reference().child('covid');

class _CovidScreenState extends State<CovidScreen> {

    final _selectedDay = DateTime.now();
    String _ano;
    String _mes;
    String _dia;
    String _hoy;
  

  List<Covid> items;

  TextEditingController _preguntaAController;
  TextEditingController _preguntaBController;
  TextEditingController _preguntaCController;
  TextEditingController _preguntaDController;
  TextEditingController _preguntaEController;

  String _preguntaA = '';
  String _preguntaB = '';
  String _preguntaC = '';
  String _preguntaD = '';
  String _preguntaE = '';

  List<Widget> getFormWidget(variable) {
    List<Widget> formWidget = new List();
   
    formWidget.add(new Column(
      children: <Widget>[
        RadioListTile<String>(
          title: const Text('No'),
          value: 'No',
          groupValue: variable,
          onChanged: (value) {
            setState(() {
              variable = value;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Si'),
          value: 'Si',
          groupValue: variable,
          onChanged: (value) {
            setState(() {
              variable = value;
            });
          },
        ),
      ],
    ));
    return formWidget;
  }


  @override
  void initState() {
    _ano = _selectedDay.toString()[0]+_selectedDay.toString()[1]+_selectedDay.toString()[2]+_selectedDay.toString()[3];
    _mes = _selectedDay.toString()[5]+_selectedDay.toString()[6];
    _dia = _selectedDay.toString()[8]+_selectedDay.toString()[9];
    _hoy = [DateTime(int.parse(_ano), int.parse(_mes), int.parse(_dia))].toString();

    super.initState();
    _preguntaAController = new TextEditingController(text: widget.covid.preguntaA);
    _preguntaA = _preguntaAController.text;
    _preguntaBController = new TextEditingController(text: widget.covid.preguntaB);
    _preguntaB = _preguntaBController.text;
    _preguntaCController = new TextEditingController(text: widget.covid.preguntaC);
    _preguntaC = _preguntaCController.text;
    _preguntaDController = new TextEditingController(text: widget.covid.preguntaD);
    _preguntaD = _preguntaDController.text;
    _preguntaEController = new TextEditingController(text: widget.covid.preguntaE);
    _preguntaE = _preguntaEController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulario COVID - 19')),
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                  Text('Ruben Ariel Mashal            ',style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                  Text('Fecha: ', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                  Text(_hoy.substring(1,11), style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                  ],),
                ),
                
                Divider(height: 8, color: Colors.black),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    new Flexible(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ 
                          Text('1. ¿Ha regresado de viaje del exterior durante los ultimos 14 dias?',  style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile<String>(
                      title: const Text('No'),
                      value: 'No',
                      groupValue: _preguntaA,
                      onChanged: (value) {
                        setState(() {
                          _preguntaA = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Si'),
                      value: 'Si',
                      groupValue: _preguntaA,
                      onChanged: (value) {
                        setState(() {
                          _preguntaA = value;
                        });
                      },
                    ),
                  ],
                ),
                Divider(height: 8, color: Colors.black),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    new Flexible(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ 
                          Text('2. ¿Presenta o ha presentado en los ultimos 14 dias, fiebre + uno o mas sintomas respiratorios (tos, dolor de garganta o dificultad respiratoria, anosmia (perdida del olfato), disgeusia (perdida de gusto) todos sintomas compatibles con COVID - 19?', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile<String>(
                      title: const Text('No'),
                      value: 'No',
                      groupValue: _preguntaB,
                      onChanged: (value) {
                        setState(() {
                          _preguntaB = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Si'),
                      value: 'Si',
                      groupValue: _preguntaB,
                      onChanged: (value) {
                        setState(() {
                          _preguntaB = value;
                        });
                      },
                    ),
                  ],
                ),
                Divider(height: 8, color: Colors.black),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    new Flexible(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ 
                          Text('3. ¿Ha estado en contacto con personas confirmadas o probables de COVID - 19, o con personas que seencuentren con obligacion de realizar cuarentena por haber regresado de viaje deurante los ultimos 14 dias?',  style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile<String>(
                      title: const Text('No'),
                      value: 'No',
                      groupValue: _preguntaC,
                      onChanged: (value) {
                        setState(() {
                          _preguntaC = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Si'),
                      value: 'Si',
                      groupValue: _preguntaC,
                      onChanged: (value) {
                        setState(() {
                          _preguntaC = value;
                        });
                      },
                    ),
                  ],
                ),
                Divider(height: 8, color: Colors.black),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    new Flexible(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ 
                          Text('4. ¿Posee confirmacion medica de haber contraido COVID - 19?',  style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile<String>(
                      title: const Text('No'),
                      value: 'No',
                      groupValue: _preguntaD,
                      onChanged: (value) {
                        setState(() {
                          _preguntaD = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Si'),
                      value: 'Si',
                      groupValue: _preguntaD,
                      onChanged: (value) {
                        setState(() {
                          _preguntaD = value;
                        });
                      },
                    ),
                  ],
                ),
                Divider(height: 8, color: Colors.black),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    new Flexible(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ 
                          Text('5. ¿Se encuentra dentro del personal exceptuado de prestar servicios de acuerdo a lo establecido en la Resolucion 207/20 del Ministerio de Trabajo, Empleo y Seguridad Social y sus modificatorias (Mayores de 60 años, embarazadas y grupo de riesgo y poblaciones vulnerables)?',  style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                Column(
                  children: <Widget>[
                    RadioListTile<String>(
                      title: const Text('No'),
                      value: 'No',
                      groupValue: _preguntaE,
                      onChanged: (value) {
                        setState(() {
                          _preguntaE = value;
                        });
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('Si'),
                      value: 'Si',
                      groupValue: _preguntaE,
                      onChanged: (value) {
                        setState(() {
                          _preguntaE = value;
                        });
                      },
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(height: 8, color: Colors.black),
                FlatButton(onPressed: () {
                  if (widget.covid.id != null) {
                    covidReference.child(widget.covid.id).set({
                      'fecha': _hoy.substring(1,11),
                      'preguntaA': _preguntaA,
                      'preguntaB': _preguntaB,
                      'preguntaC': _preguntaC,
                      'preguntaD': _preguntaD,
                      'preguntaE': _preguntaE,
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  } else {
                    covidReference.push().set({
                      'fecha': _hoy.substring(1,11),
                      'preguntaA': _preguntaA,
                      'preguntaB': _preguntaB,
                      'preguntaC': _preguntaC,
                      'preguntaD': _preguntaD,
                      'preguntaE': _preguntaE,
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                    child: (widget.covid.id != null) ? Text('Actualizar') : Text('Guardar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
