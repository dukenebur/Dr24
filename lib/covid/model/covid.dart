
import 'package:firebase_database/firebase_database.dart';


class Covid {
  String _id;
  String _fecha;
  String _preguntaA;
  String _preguntaB;
  String _preguntaC;
  String _preguntaD;
  String _preguntaE;

  Covid(this._id,this._fecha,this._preguntaA,this._preguntaB,
      this._preguntaC,this._preguntaD,this._preguntaE);

  Covid.map(dynamic obj){
    this._fecha = obj['fecha'];
    this._preguntaA = obj['preguntaA'];
    this._preguntaB = obj['preguntaB'];
    this._preguntaC = obj['preguntaC'];
    this._preguntaD = obj['preguntaD'];
    this._preguntaE = obj['preguntaE'];
  }

  String get id => _id;
  String get fecha => _fecha;
  String get preguntaA => _preguntaA;
  String get preguntaB => _preguntaB;
  String get preguntaC => _preguntaC;
  String get preguntaD => _preguntaD;
  String get preguntaE => _preguntaE;

  Covid.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _fecha = snapshot.value['fecha'];
    _preguntaA = snapshot.value['preguntaA'];
    _preguntaB = snapshot.value['preguntaB'];
    _preguntaC = snapshot.value['preguntaC'];
    _preguntaD = snapshot.value['preguntaD'];
    _preguntaE = snapshot.value['preguntaE'];
  }
}