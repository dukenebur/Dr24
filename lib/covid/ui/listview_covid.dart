
import 'package:dr24/covid/model/covid.dart';
import 'package:dr24/covid/ui/covid_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class ListViewCovid extends StatefulWidget {
  @override
  _ListViewCovidState createState() => _ListViewCovidState();
}

final covidReference = FirebaseDatabase.instance.reference().child('covid');

class _ListViewCovidState extends State<ListViewCovid> {

  List<Covid> items;
  StreamSubscription<Event> _onCovidAddedSubscription;
  StreamSubscription<Event> _onCovidChangedSubscription;


  @override
  void initState() {
    super.initState();
    items = new List();
    _onCovidAddedSubscription = covidReference.onChildAdded.listen(_onCovidAdded);
    _onCovidChangedSubscription = covidReference.onChildChanged.listen(_onCovidUpdate);

  }

  @override
  void dispose() {
    super.dispose();
    _onCovidAddedSubscription.cancel();
    _onCovidChangedSubscription.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Formulario COVID - 19')),
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
                            //onTap: () => _navigateToCovid(context, items[position])
                            ),),
                        /*    
                        IconButton(
                            icon: Icon(Icons.delete, color: Colors.deepOrange,),
                              onPressed: ()=>_showDialog(context, position)),
                            //onPressed: () => _deleteCovid(context, items[position],position)),
                        */
                        IconButton(
                            icon: Icon(Icons.remove_red_eye, color: Colors.blueAccent,),
                            onPressed: () => _navigateToCovidInformation(context, items[position])),
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
          onPressed: () => _createNewCovid(context),
        ),

    );
  }



  void _onCovidAdded(Event event){
    setState(() {
      items.add(new Covid.fromSnapShot(event.snapshot));
    });
  }

  void _onCovidUpdate(Event event){
    var oldCovidValue = items.singleWhere((covid) => covid.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldCovidValue)] = new Covid.fromSnapShot(event.snapshot);
    });
  }

  void _navigateToCovidInformation(BuildContext context, Covid covid)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => CovidScreen(covid)),
    );
  }
  /*
  void _navigateToCovid(BuildContext context, Covid covid)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => CovidInformation(covid)),
    );
  }
  */
  void _createNewCovid(BuildContext context)async{
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => CovidScreen(Covid(null,'','','','','','',))),
    );
  }


}