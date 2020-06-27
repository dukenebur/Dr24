
import 'package:dr24/usuarios/model/usuariosModel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UsuariosScreen extends StatefulWidget {
  final Usuarios usuarios;
  UsuariosScreen(this.usuarios);
  @override
  _UsuariosScreenState createState() => _UsuariosScreenState();
}

final usuariosReference = FirebaseDatabase.instance.reference().child('usuarios');

class _UsuariosScreenState extends State<UsuariosScreen> {

  final _selectedDay = DateTime.now();
  String _ano;
  String _mes;
  String _dia;
  String _hoy;
  String variableCovid;
  String variableSegHigiene;
  String variableART;
  String variableContratistas;  

  List<Usuarios> items;
  TextEditingController _fechaNacimientoController;
  TextEditingController _nombreController;
  TextEditingController _apellidoController;
  TextEditingController _emailController;
  TextEditingController _contrasenaController;
  TextEditingController _tipoUsuarioController;
  TextEditingController _supervisorController;
  TextEditingController _activoController;

  String tipoUserValue = '-';
 
  List <String> tipoUserItems = [
    '-', 
    'Empleado',
    'Supervisor',
    ] ;

  String supervisorValue = '-';
 
  List <String> supervisorItems = [
    '-', 
    'Diego Delgado',
    'Carlos Gomez',
    ] ;

  String activoValue = '-';
 
  List <String> activoItems = [
    '-', 
    'Si',
    'No',
    ] ;        


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
    _fechaNacimientoController = new TextEditingController(text: widget.usuarios.fecha);
    _nombreController = new TextEditingController(text: widget.usuarios.nombre);
    _apellidoController = new TextEditingController(text: widget.usuarios.apellido);
    _emailController = new TextEditingController(text: widget.usuarios.email);
    _contrasenaController = new TextEditingController(text: widget.usuarios.contrasena);
    _tipoUsuarioController = new TextEditingController(text: widget.usuarios.tipoUsuario);
    _supervisorController = new TextEditingController(text: widget.usuarios.supervisor);
    _activoController = new TextEditingController(text: widget.usuarios.activo);    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nuevo Usuario')),
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: ListView(
              children: <Widget>[
                /*
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Text('Fecha: ', style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                      Text(_hoy.substring(1,11), style: TextStyle(fontSize: 17.0,color: Colors.black87)),
                    ],
                  ),
                ),
                */
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Apellido',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                TextField(
                  controller: _apellidoController,
                  style: TextStyle(color: Colors.teal[700], fontSize: 18),
                  decoration: InputDecoration(icon: Icon(Icons.person)),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Nombre',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                TextField(
                  controller: _nombreController,
                  style: TextStyle(color: Colors.teal[700], fontSize: 18),
                  decoration: InputDecoration(icon: Icon(Icons.person_outline)),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Fecha de Nacimiento',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                TextField(
                  controller: _fechaNacimientoController,
                  style: TextStyle(color: Colors.teal[700], fontSize: 18),
                  decoration: InputDecoration(icon: Icon(Icons.date_range)),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Correo Electronico',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                TextField(
                  controller: _emailController,
                  style: TextStyle(color: Colors.teal[700], fontSize: 18),
                  decoration: InputDecoration(icon: Icon(Icons.alternate_email)),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Contraseña',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                TextField(
                  controller: _contrasenaController,
                  style: TextStyle(color: Colors.teal[700], fontSize: 18),
                  decoration: InputDecoration(icon: Icon(Icons.keyboard_hide)),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Tipo de Usuario',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                DropdownButton<String>(
                  value: tipoUserValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.teal[700], fontSize: 18),
                  onChanged: (String data) {
                    setState(() {
                      tipoUserValue = data;
                    });
                  },
                  items: tipoUserItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Supervisor',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                DropdownButton<String>(
                  value: supervisorValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.teal[700], fontSize: 18),
                  onChanged: (String data) {
                    setState(() {
                      supervisorValue = data;
                    });
                  },
                  items: supervisorItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Formularios',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),                  
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Text(
                            'COVID - 19',
                            style: TextStyle(color: Colors.teal[700], fontSize: 18),
                          ),
                        ),
                        RadioListTile<String>(
                          title: const Text('No'),
                          value: 'No',
                          groupValue: variableCovid,
                          onChanged: (value) {
                            setState(() {
                              variableCovid = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Si'),
                          value: 'Si',
                          groupValue: variableCovid,
                          onChanged: (value) {
                            setState(() {
                              variableCovid = value;
                            });
                          },
                        ),      
                      ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),                  
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Text(
                            'Seguridad e Higiene',
                            style: TextStyle(color: Colors.teal[700], fontSize: 18),
                          ),
                        ),
                        RadioListTile<String>(
                          title: const Text('No'),
                          value: 'No',
                          groupValue: variableSegHigiene,
                          onChanged: (value) {
                            setState(() {
                              variableSegHigiene = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Si'),
                          value: 'Si',
                          groupValue: variableSegHigiene,
                          onChanged: (value) {
                            setState(() {
                              variableSegHigiene = value;
                            });
                          },
                        ),      
                      ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),                  
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Text(
                            'Formulario ART',
                            style: TextStyle(color: Colors.teal[700], fontSize: 18),
                          ),
                        ),
                        RadioListTile<String>(
                          title: const Text('No'),
                          value: 'No',
                          groupValue: variableART,
                          onChanged: (value) {
                            setState(() {
                              variableART = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Si'),
                          value: 'Si',
                          groupValue: variableART,
                          onChanged: (value) {
                            setState(() {
                              variableART = value;
                            });
                          },
                        ),      
                      ]
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),                  
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
                          child: Text(
                            'Ingreso Contratistas',
                            style: TextStyle(color: Colors.teal[700], fontSize: 18),
                          ),
                        ),
                        RadioListTile<String>(
                          title: const Text('No'),
                          value: 'No',
                          groupValue: variableContratistas,
                          onChanged: (value) {
                            setState(() {
                              variableContratistas = value;
                            });
                          },
                        ),
                        RadioListTile<String>(
                          title: const Text('Si'),
                          value: 'Si',
                          groupValue: variableContratistas,
                          onChanged: (value) {
                            setState(() {
                              variableContratistas = value;
                            });
                          },
                        ),      
                      ]
                    ),
                  ),
                ),
                Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Text('Activo',
                  style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                DropdownButton<String>(
                  value: activoValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.teal[700], fontSize: 18),
                  onChanged: (String data) {
                    setState(() {
                      activoValue = data;
                    });
                  },
                  items: activoItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                FlatButton(onPressed: () {
                  if (widget.usuarios.id != null) {
                    usuariosReference.child(widget.usuarios.id).set({
                      'fecha': _hoy.substring(1,11),
                      'fechaNacimiento': _fechaNacimientoController.text,
                      'nombre': _nombreController.text,
                      'apellido': _apellidoController.text,
                      'email': _emailController.text,
                      'contrasena': _contrasenaController.text,
                      'tipoUsuario': _tipoUsuarioController.text,
                      'supervisor': _supervisorController.text,
                      'activo': _activoController.text,
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  } else {
                    usuariosReference.push().set({
                      'fecha': _hoy.substring(1,11),
                      'fechaNacimiento': _fechaNacimientoController.text,
                      'nombre': _nombreController.text,
                      'apellido': _apellidoController.text,
                      'email': _emailController.text,
                      'contrasena': _contrasenaController.text,
                      'tipoUsuario': _tipoUsuarioController.text,
                      'supervisor': _supervisorController.text,
                      'activo': _activoController.text,
                    }).then((_) {
                      Navigator.pop(context);
                    });
                  }
                },
                    child: (widget.usuarios.id != null) ? Text('Actualizar') : Text('Guardar')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
