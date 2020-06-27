import 'package:dr24/contratistas/model/contratistas.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ContratistasScreen extends StatefulWidget {
  final Contratistas contratistas;
  ContratistasScreen(this.contratistas);
  @override
  _ContratistasScreenState createState() => _ContratistasScreenState();
}

final contratistasReference = FirebaseDatabase.instance.reference().child('contratistas');

class _ContratistasScreenState extends State<ContratistasScreen> {

    final _selectedDay = DateTime.now();
    String _ano;
    String _mes;
    String _dia;
    String _hoy;
  

  List<Contratistas> items;

  // Requisitos empresas
  TextEditingController _f931Controller;
  TextEditingController _coberturaARTController;
  TextEditingController _planSeguridadController;
  TextEditingController _notaEmpController;
  TextEditingController _seguroEmpController;
  // Transorte de Mercancias Peligrosas
  TextEditingController _licConducirController;
  TextEditingController _licNacionalController;
  TextEditingController _segSemirremolqueController;
  TextEditingController _revisionTecnicaController;
  TextEditingController _certificadoLingasController;
  // Equipos de Izaje
  TextEditingController _licOperadorController;
  TextEditingController _cedulaHabilitacionController;
  TextEditingController _seguroTecnicoController;
  TextEditingController _seguroEquipoController;

  TextEditingController _seguroCaucionEmpController;

  // Requisitos Monotributistas
  TextEditingController _seguroAccidentesPerController;
  TextEditingController _compMonotributoController;
  TextEditingController _segSegPersonalesController;
  TextEditingController _procedimientoTrabajoController;
  TextEditingController _notaMonoController;
  TextEditingController _seguroMonoController;
  TextEditingController _seguroCaucionMonoController;


  // Requisitos empresas
  String _f931;
  String _coberturaART;
  String _planSeguridad;
  String _notaEmp;
  String _seguroEmp;
  // Transorte de Mercancias Peligrosas
  String _licConducir;
  String _licNacional;
  String _segSemirremolque;
  String _revisionTecnica;
  String _certificadoLingas;
  // Equipos de Izaje
  String _licOperador;
  String _cedulaHabilitacion;
  String _seguroTecnico;
  String _seguroEquipo;

  String _seguroCaucionEmp;

  // Requisitos Monotributistas
  String _seguroAccidentesPer;
  String _compMonotributo;
  String _segSegPersonales;
  String _procedimientoTrabajo;
  String _notaMono;
  String _seguroMono;
  String _seguroCaucionMono;

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

    // Requisitos empresas
    _f931Controller = new TextEditingController(text: widget.contratistas.f931);
    _f931 = _f931Controller.text;
    _coberturaARTController = new TextEditingController(text: widget.contratistas.coberturaART);
    _coberturaART = _coberturaARTController.text;
    _planSeguridadController = new TextEditingController(text: widget.contratistas.planSeguridad);
    _planSeguridad = _planSeguridadController.text;
    _notaEmpController = new TextEditingController(text: widget.contratistas.notaEmp);
    _notaEmp = _notaEmpController.text;
    _seguroEmpController = new TextEditingController(text: widget.contratistas.seguroEmp);
    _seguroEmp = _seguroEmpController.text;
    // Transorte de Mercancias Peligrosas
    _licConducirController = new TextEditingController(text: widget.contratistas.licConducir);
    _licConducir = _licConducirController.text;
    _licNacionalController = new TextEditingController(text: widget.contratistas.licNacional);
    _licNacional = _licNacionalController.text;
    _segSemirremolqueController = new TextEditingController(text: widget.contratistas.segSemirremolque);
    _segSemirremolque = _segSemirremolqueController.text;
    _revisionTecnicaController = new TextEditingController(text: widget.contratistas.revisionTecnica);
    _revisionTecnica = _revisionTecnicaController.text;
    _certificadoLingasController = new TextEditingController(text: widget.contratistas.certificadoLingas);
    _certificadoLingas = _certificadoLingasController.text;
    // Equipos de Izaje
    _licOperadorController = new TextEditingController(text: widget.contratistas.licOperador);
    _licOperador = _licOperadorController.text;
    _cedulaHabilitacionController = new TextEditingController(text: widget.contratistas.cedulaHabilitacion);
    _cedulaHabilitacion = _cedulaHabilitacionController.text;
    _seguroTecnicoController = new TextEditingController(text: widget.contratistas.seguroTecnico);
    _seguroTecnico = _seguroTecnicoController.text;
    _seguroEquipoController = new TextEditingController(text: widget.contratistas.seguroEquipo);
    _seguroEquipo = _seguroEquipoController.text;

    _seguroCaucionEmpController = new TextEditingController(text: widget.contratistas.seguroCaucionEmp);
    _seguroCaucionEmp = _seguroCaucionEmpController.text;

    // Requisitos Monotributistas
    _seguroAccidentesPerController = new TextEditingController(text: widget.contratistas.seguroAccidentesPer);
    _seguroAccidentesPer = _seguroAccidentesPerController.text;
    _compMonotributoController = new TextEditingController(text: widget.contratistas.compMonotributo);
    _compMonotributo = _compMonotributoController.text;
    _segSegPersonalesController = new TextEditingController(text: widget.contratistas.segSegPersonales);
    _segSegPersonales = _segSegPersonalesController.text;
    _procedimientoTrabajoController = new TextEditingController(text: widget.contratistas.procedimientoTrabajo);
    _procedimientoTrabajo = _procedimientoTrabajoController.text;
    _notaMonoController = new TextEditingController(text: widget.contratistas.notaMono);
    _notaMono = _notaMonoController.text;
    _seguroMonoController = new TextEditingController(text: widget.contratistas.seguroMono);
    _seguroMono = _seguroMonoController.text;
    _seguroCaucionMonoController = new TextEditingController(text: widget.contratistas.seguroCaucionMono);
    _seguroCaucionMono = _seguroCaucionMonoController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ingreso Contratistas')),
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
                
                Divider(thickness: 1, color: Colors.black, indent: 4, endIndent: 4),
                Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 5.0),
                child: Text('Requisitos para Empresas',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                Divider(height: 8, color: Colors.black54, indent: 4, endIndent: 4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    new Flexible(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[ 
                          Text('- F-931 y comprobante de pago',  style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _f931,
                      onChanged: (value) {
                    setState(() {
                      _f931 = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _f931,
                      onChanged: (value) {
                    setState(() {
                      _f931 = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _f931,
                      onChanged: (value) {
                    setState(() {
                      _f931 = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
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
                          Text('- Certificado de cobertura de ART con nomina y Clausula de No Repeticion a nombre de la Comision Nacional de Energia Atomica y Dioxitec S.A.', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _coberturaART,
                      onChanged: (value) {
                    setState(() {
                      _coberturaART = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _coberturaART,
                      onChanged: (value) {
                    setState(() {
                      _coberturaART = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _coberturaART,
                      onChanged: (value) {
                    setState(() {
                      _coberturaART = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
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
                          Text(
                            '- Plan de Seguridad de la empresa (aprobado por ART) o Procedimiento de trabajo seguro, '
                            'que defina claramente los puntos a implementarse y la forma en que dicho programa se implementara.'
                            'Debera contener al menos: Descripcion y enumeracion detallada del programa de obra y trabajos y '
                            'de sus etapas constructivas. Enumeracion de los riesgos generales que se presentaran en cada etapa '
                            'del trabajo / obra, Medidas de prevencion que el oferente adoptara, para controlar, minimizar o '
                            'eliminar los riesgos emergentes y evitar lesiones al personal o daños a bienes fisicos, Plan de '
                            'contingencias, Manejo de residuos, Programa de capacitacion; el contenido y alcance del mismo'
                            'debera estar relacionado con la tarea  desarrollar, Listado de E.P.P, previstos a utilizar'
                            'en la obra y registro de entrega de los mismos (segun corresponda)',
                             style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _planSeguridad,
                      onChanged: (value) {
                    setState(() {
                      _planSeguridad = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _planSeguridad,
                      onChanged: (value) {
                    setState(() {
                      _planSeguridad = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _planSeguridad,
                      onChanged: (value) {
                    setState(() {
                      _planSeguridad = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
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
                          Text('- Nota indicando quien es el Responsable de Higiene y Seguridad de la empresa (con matricula y registro de la SRT)', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _notaEmp,
                      onChanged: (value) {
                    setState(() {
                      _notaEmp = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _notaEmp,
                      onChanged: (value) {
                    setState(() {
                      _notaEmp = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _notaEmp,
                      onChanged: (value) {
                    setState(() {
                      _notaEmp = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
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
                          Text('- Seguro automotor', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _seguroEmp,
                      onChanged: (value) {
                    setState(() {
                      _seguroEmp = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _seguroEmp,
                      onChanged: (value) {
                    setState(() {
                      _seguroEmp = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _seguroEmp,
                      onChanged: (value) {
                    setState(() {
                      _seguroEmp = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Divider(height: 8, color: Colors.black),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 5.0),
                child: Text('En caso de Transporte de Mercancias Peligrosas',
                  style:
                    TextStyle(fontStyle: FontStyle.italic, fontSize: 18.0,decoration: TextDecoration.underline)),
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
                          Text('- Licencia de conducir', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _licConducir,
                      onChanged: (value) {
                    setState(() {
                      _licConducir = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _licConducir,
                      onChanged: (value) {
                    setState(() {
                      _licConducir = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _licConducir,
                      onChanged: (value) {
                    setState(() {
                      _licConducir = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
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
                          Text('- Licencia Nacional Habilitante para mercancias peligrosas (Psicofiso-Curso teorico practico)', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _licNacional,
                      onChanged: (value) {
                    setState(() {
                      _licNacional = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _licNacional,
                      onChanged: (value) {
                    setState(() {
                      _licNacional = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _licNacional,
                      onChanged: (value) {
                    setState(() {
                      _licNacional = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
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
                          Text('- Seguro automotor / semiremolque', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _segSemirremolque,
                      onChanged: (value) {
                    setState(() {
                      _segSemirremolque = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _segSemirremolque,
                      onChanged: (value) {
                    setState(() {
                      _segSemirremolque = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _segSemirremolque,
                      onChanged: (value) {
                    setState(() {
                      _segSemirremolque = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
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
                          Text('- Certificado de Revision Tecnica', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _revisionTecnica,
                      onChanged: (value) {
                    setState(() {
                      _revisionTecnica = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _revisionTecnica,
                      onChanged: (value) {
                    setState(() {
                      _revisionTecnica = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _revisionTecnica,
                      onChanged: (value) {
                    setState(() {
                      _revisionTecnica = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
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
                          Text('- Certificado de lingas, cadenas y accesorios para arrumazon', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                        ]
                      )
                    )
                  ],
                ),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 'Si',
                      groupValue: _certificadoLingas,
                      onChanged: (value) {
                    setState(() {
                      _certificadoLingas = value;
                    });
                  },
                    ),
                    new Text(
                      'Si',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 'No',
                      groupValue: _certificadoLingas,
                      onChanged: (value) {
                    setState(() {
                      _certificadoLingas = value;
                    });
                  },
                    ),
                    new Text(
                      'No',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 'Na',
                      groupValue: _certificadoLingas,
                      onChanged: (value) {
                    setState(() {
                      _certificadoLingas = value;
                    });
                  },
                    ),
                    new Text(
                      'N/A',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(height: 8, color: Colors.black),
                FlatButton(onPressed: () {
                  if (widget.contratistas.id != null) {
                    contratistasReference.child(widget.contratistas.id).set({
                      'fecha': _hoy.substring(1,11),
                      // Requisitos empresas
                      'f931': _f931,
                      'coberturaART': _coberturaART,
                      'planSeguridad': _planSeguridad,
                      'notaEmp': _notaEmp,
                      'seguroEmp': _seguroEmp,
                      // Transorte de Mercancias Peligrosas
                      'licConducir': _licConducir,
                      'licNacional': _licNacional,
                      'segSemirremolque': _segSemirremolque,
                      'revisionTecnica': _revisionTecnica,
                      'certificadoLingas': _certificadoLingas,
                      // Equipos de Izaje
                      'licOperador': _licOperador,
                      'cedulaHabilitacion': _cedulaHabilitacion,
                      'seguroTecnico': _seguroTecnico,
                      'seguroEquipo': _seguroEquipo,
                      'seguroCaucionEmp': _seguroCaucionEmp,

                      // Requisitos Monotributistas
                      'seguroAccidentesPer': _seguroAccidentesPer,
                      'compMonotributo': _compMonotributo,
                      'segSegPersonales': _segSegPersonales,
                      'procedimientoTrabajo': _procedimientoTrabajo,
                      'notaMono': _notaMono,
                      'seguroMono': _seguroMono,
                      'seguroCaucionMono': _seguroCaucionMono,
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  } else {
                    contratistasReference.push().set({
                      'fecha': _hoy.substring(1,11),
                      // Requisitos empresas
                      'f931': _f931,
                      'coberturaART': _coberturaART,
                      'planSeguridad': _planSeguridad,
                      'notaEmp': _notaEmp,
                      'seguroEmp': _seguroEmp,
                      // Transorte de Mercancias Peligrosas
                      'licConducir': _licConducir,
                      'licNacional': _licNacional,
                      'segSemirremolque': _segSemirremolque,
                      'revisionTecnica': _revisionTecnica,
                      'certificadoLingas': _certificadoLingas,
                      // Equipos de Izaje
                      'licOperador': _licOperador,
                      'cedulaHabilitacion': _cedulaHabilitacion,
                      'seguroTecnico': _seguroTecnico,
                      'seguroEquipo': _seguroEquipo,
                      'seguroCaucionEmp': _seguroCaucionEmp,

                      // Requisitos Monotributistas
                      'seguroAccidentesPer': _seguroAccidentesPer,
                      'compMonotributo': _compMonotributo,
                      'segSegPersonales': _segSegPersonales,
                      'procedimientoTrabajo': _procedimientoTrabajo,
                      'notaMono': _notaMono,
                      'seguroMono': _seguroMono,
                      'seguroCaucionMono': _seguroCaucionMono,
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                    child: (widget.contratistas.id != null) ? Text('Actualizar') : Text('Guardar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
