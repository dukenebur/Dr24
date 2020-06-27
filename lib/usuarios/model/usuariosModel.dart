
import 'package:firebase_database/firebase_database.dart';


class Usuarios {
  String _id;
  String _fecha;
  String _fechaNacimiento;
  String _nombre;
  String _apellido;
  String _email;
  String _contrasena;
  String _tipoUsuario;
  String _supervisor;
  String _formularios;
  String _activo;

  Usuarios(this._id,this._fecha,this._fechaNacimiento,this._nombre,
      this._apellido,this._email,this._contrasena,
      this._tipoUsuario,this._supervisor,this._formularios,this._activo);

  Usuarios.map(dynamic obj){
    this._fecha = obj['fecha'];
    this._fechaNacimiento = obj['fechaNacimiento'];
    this._nombre = obj['nombre'];
    this._apellido = obj['apellido'];
    this._email = obj['email'];
    this._contrasena = obj['contrasena'];
    this._tipoUsuario = obj['tipoUsuario'];
    this._supervisor = obj['supervisor'];
    this._formularios = obj['formularios'];
    this._activo = obj['activo'];
  }

  String get id => _id;
  String get fecha => _fecha;
  String get fechaNacimiento => _fechaNacimiento;
  String get nombre => _nombre;
  String get apellido => _apellido;
  String get email => _email;
  String get contrasena => _contrasena;
  String get tipoUsuario => _tipoUsuario;
  String get supervisor => _supervisor;
  String get formularios => _formularios;
  String get activo => _activo;

  Usuarios.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _fecha = snapshot.value['fecha'];
    _fechaNacimiento = snapshot.value['fechaNacimiento'];
    _nombre = snapshot.value['nombre'];
    _apellido = snapshot.value['apellido'];
    _email = snapshot.value['email'];
    _contrasena = snapshot.value['contrasena'];
    _tipoUsuario = snapshot.value['tipoUsuario'];
    _supervisor = snapshot.value['supervisor'];
    _formularios = snapshot.value['formularios'];
    _activo = snapshot.value['activo'];
  }
}