
import 'package:dr24/usuarios/model/usuariosModel.dart';
import 'package:dr24/usuarios/ui/usuarios_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class ListViewUsuarios extends StatefulWidget {
  @override
  _ListViewUsuariosState createState() => _ListViewUsuariosState();
}

final usuariosReference = FirebaseDatabase.instance.reference().child('usuarios');

class _ListViewUsuariosState extends State<ListViewUsuarios> {

  List<Usuarios> items;
  StreamSubscription<Event> _onUsuariosAddedSubscription;
  StreamSubscription<Event> _onUsuariosChangedSubscription;


  @override
  void initState() {
    super.initState();
    items = new List();
    _onUsuariosAddedSubscription = usuariosReference.onChildAdded.listen(_onUsuariosAdded);
    _onUsuariosChangedSubscription = usuariosReference.onChildChanged.listen(_onUsuariosUpdate);

  }

  @override
  void dispose() {
    super.dispose();
    _onUsuariosAddedSubscription.cancel();
    _onUsuariosChangedSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Configuracion de Usuarios')),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 12.0),
              itemBuilder: (context, position){
                return Column(
                  children: <Widget>[
                    Divider(height: 7.0,),
                    Row(
                      children: <Widget>[
                        Expanded(child: ListTile(title: Text('${items[position].apellido}' + ', ' + '${items[position].nombre}',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 21.0,
                          ),
                          
                        ),
                        subtitle: Text('${items[position].tipoUsuario}'),
                            leading: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.green[400],
                                  radius: 17.0,
                                  child: Text('${position + 1}',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //onTap: () => _navigateToUsuarios(context, items[position])
                            ),),
                            
                        
                        IconButton(
                            icon: Icon(Icons.remove_red_eye, color: Colors.blueAccent,),
                            padding: EdgeInsets.all(1.0),
                            onPressed: () => _navigateToUsuariosInformation(context, items[position])),
                        IconButton(
                            icon: Icon(Icons.edit, color: Colors.deepOrange[200],),
                            padding: EdgeInsets.all(1.0),
                              onPressed: ()=>_showDialog(context, position)),
                            //onPressed: () => _deleteUsuarios(context, items[position],position)),
                            
                        IconButton(
                            icon: Icon(Icons.delete, color: Colors.red,),
                            padding: EdgeInsets.all(1.0),
                              onPressed: ()=>_showDialog(context, position)),
                            //onPressed: () => _deleteUsuarios(context, items[position],position)),
                          
                      ],
                    ),
                  ],
                );
              }
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: () => _createNewUsuarios(context),
        ),

    );
  }


  void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Text('¿Esta seguro que desa borrar este formulario?'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.delete, color: Colors.purple,),
                onPressed: () => _deleteUsuarios(context, items[position],position)),
            new FlatButton(
              child: Text('Cancelar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  void _onUsuariosAdded(Event event){
    setState(() {
      items.add(new Usuarios.fromSnapShot(event.snapshot));
    });
  }

  void _onUsuariosUpdate(Event event){
    var oldUsuariosValue = items.singleWhere((usuarios) => usuarios.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldUsuariosValue)] = new Usuarios.fromSnapShot(event.snapshot);
    });
  }

  void _deleteUsuarios(BuildContext context, Usuarios usuarios,int position)async{
    await usuariosReference.child(usuarios.id).remove().then((_){
      setState(() {
        items.removeAt(position);
      });
    });

  }

  void _navigateToUsuariosInformation(BuildContext context, Usuarios usuarios)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => UsuariosScreen(usuarios)),
    );
  }
  /*
  void _navigateToUsuarios(BuildContext context, Usuarios usuarios)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => UsuariosInformation(usuarios)),
    );
  }
  */
  void _createNewUsuarios(BuildContext context)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => UsuariosScreen(Usuarios(null,'','','','','','','','','','',))),
    );
  }


}