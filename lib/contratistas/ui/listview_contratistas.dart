
import 'package:dr24/contratistas/model/contratistas.dart';
import 'package:dr24/contratistas/ui/contratistas_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class ListViewContratistas extends StatefulWidget {
  @override
  _ListViewContratistasState createState() => _ListViewContratistasState();
}

final contratistasReference = FirebaseDatabase.instance.reference().child('contratistas');

class _ListViewContratistasState extends State<ListViewContratistas> {

  List<Contratistas> items;
  StreamSubscription<Event> _onContratistasAddedSubscription;
  StreamSubscription<Event> _onContratistasChangedSubscription;


  @override
  void initState() {
    super.initState();
    items = new List();
    _onContratistasAddedSubscription = contratistasReference.onChildAdded.listen(_onContratistasAdded);
    _onContratistasChangedSubscription = contratistasReference.onChildChanged.listen(_onContratistasUpdate);

  }

  @override
  void dispose() {
    super.dispose();
    _onContratistasAddedSubscription.cancel();
    _onContratistasChangedSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ingreso Contratistas')),
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
                        Expanded(child: ListTile(title: Text('${items[position].fecha}',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 21.0,
                          ),
                        ),
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
                            //onTap: () => _navigateToContratistas(context, items[position])
                            ),),
                        /*    
                        IconButton(
                            icon: Icon(Icons.delete, color: Colors.deepOrange,),
                              onPressed: ()=>_showDialog(context, position)),
                            //onPressed: () => _deleteContratistas(context, items[position],position)),
                        */
                        IconButton(
                            icon: Icon(Icons.remove_red_eye, color: Colors.blueAccent,),
                            onPressed: () => _navigateToContratistasInformation(context, items[position])),
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
          onPressed: () => _createNewContratistas(context),
        ),

    );
  }


 
  void _onContratistasAdded(Event event){
    setState(() {
      items.add(new Contratistas.fromSnapShot(event.snapshot));
    });
  }

  void _onContratistasUpdate(Event event){
    var oldContratistasValue = items.singleWhere((contratistas) => contratistas.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldContratistasValue)] = new Contratistas.fromSnapShot(event.snapshot);
    });
  }

  void _navigateToContratistasInformation(BuildContext context, Contratistas contratistas)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => ContratistasScreen(contratistas)),
    );
  }
  /*
  void _navigateToContratistas(BuildContext context, Contratistas contratistas)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => ContratistasInformation(contratistas)),
    );
  }
  */
  void _createNewContratistas(BuildContext context)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => ContratistasScreen(Contratistas(null,'','','','','','','','','','','','','','','','','','','','','','','',))),
    );
  }


}