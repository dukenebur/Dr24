import 'package:firebase_database/firebase_database.dart';


class Contratistas {
  String _id;
  String _fecha;
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


  Contratistas(this._id,this._fecha,
    this._f931,this._coberturaART,this._planSeguridad,this._notaEmp,this._seguroEmp,
    this._licConducir,this. _licNacional,this._segSemirremolque,this._revisionTecnica,
    this._certificadoLingas,
    this._licOperador,this._cedulaHabilitacion,this._seguroTecnico,this._seguroEquipo,
    this._seguroCaucionEmp,
    this._seguroAccidentesPer,this._compMonotributo,this._segSegPersonales,this._procedimientoTrabajo,
    this._notaMono,this._seguroMono,this._seguroCaucionMono
  );

  Contratistas.map(dynamic obj){
    this._fecha = obj['fecha'];
    // Requisitos empresas
    this._f931 = obj['f931'];
    this._coberturaART = obj['coberturaART'];
    this._planSeguridad = obj['planSeguridad'];
    this._notaEmp = obj['notaEmp'];
    this._seguroEmp = obj['seguroEmp'];
    // Transorte de Mercancias Peligrosas
    this._licConducir = obj['licConducir'];
    this._licNacional = obj['licNacional'];
    this._segSemirremolque = obj['segSemirremolque'];
    this._revisionTecnica = obj['revisionTecnica'];
    this._certificadoLingas = obj['certificadoLingas'];
    // Equipos de Izaje
    this._licOperador = obj['licOperador'];
    this._cedulaHabilitacion = obj['cedulaHabilitacion'];
    this._seguroTecnico = obj['seguroTecnico'];
    this._seguroEquipo = obj['seguroEquipo'];

    this._seguroCaucionEmp = obj['seguroCaucionEmp'];

    // Requisitos Monotributistas
    this._seguroAccidentesPer = obj['seguroAccidentesPer'];
    this._compMonotributo = obj['compMonotributo'];
    this._segSegPersonales = obj['segSegPersonales'];
    this._procedimientoTrabajo = obj['procedimientoTrabajo'];
    this._notaMono = obj['notaMono'];
    this._seguroMono = obj['seguroMono'];
    this._seguroCaucionMono = obj['seguroCaucionMono'];
  }

  String get id => _id;
  String get fecha => _fecha;
  // Requisitos empresas
  String get f931 => _f931;
  String get coberturaART => _coberturaART;
  String get planSeguridad => _planSeguridad;
  String get notaEmp => _notaEmp;
  String get seguroEmp => _seguroEmp;
  // Transorte de Mercancias Peligrosas
  String get licConducir => _licConducir;
  String get licNacional => _licNacional;
  String get segSemirremolque => _segSemirremolque;
  String get revisionTecnica => _revisionTecnica;
  String get certificadoLingas => _certificadoLingas;
  // Equipos de Izaje
  String get licOperador => _licOperador;
  String get cedulaHabilitacion => _cedulaHabilitacion;
  String get seguroTecnico => _seguroTecnico;
  String get seguroEquipo => _seguroEquipo;

  String get seguroCaucionEmp => _seguroCaucionEmp;

  // Requisitos Monotributistas
  String get seguroAccidentesPer => _seguroAccidentesPer;
  String get compMonotributo => _compMonotributo;
  String get segSegPersonales => _segSegPersonales;
  String get procedimientoTrabajo => _procedimientoTrabajo;
  String get notaMono => _notaMono;
  String get seguroMono => _seguroMono;
  String get seguroCaucionMono => _seguroCaucionMono;

  Contratistas.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _fecha = snapshot.value['fecha'];
    // Requisitos empresas
    _f931 = snapshot.value['f931'];
    _coberturaART = snapshot.value['coberturaART'];
    _planSeguridad = snapshot.value['planSeguridad'];
    _notaEmp = snapshot.value['notaEmp'];
    _seguroEmp = snapshot.value['seguroEmp'];
    // Transorte de Mercancias Peligrosas
    _licConducir = snapshot.value['licConducir'];
    _licNacional = snapshot.value['licNacional'];
    _segSemirremolque = snapshot.value['segSemirremolque'];
    _revisionTecnica = snapshot.value['revisionTecnica'];
    _certificadoLingas = snapshot.value['certificadoLingas'];
    // Equipos de Izaje
    _licOperador = snapshot.value['licOperador'];
    _cedulaHabilitacion = snapshot.value['cedulaHabilitacion'];
    _seguroTecnico = snapshot.value['seguroTecnico'];
    _seguroEquipo = snapshot.value['seguroEquipo'];

    _seguroCaucionEmp = snapshot.value['seguroCaucionEmp'];

    // Requisitos Monotributistas
    _seguroAccidentesPer = snapshot.value['seguroAccidentesPer'];
    _compMonotributo = snapshot.value['compMonotributo'];
    _segSegPersonales = snapshot.value['segSegPersonales'];
    _procedimientoTrabajo = snapshot.value['procedimientoTrabajo'];
    _notaMono = snapshot.value['notaMono'];
    _seguroMono = snapshot.value['seguroMono'];
    _seguroCaucionMono = snapshot.value['seguroCaucionMono'];
  }
}