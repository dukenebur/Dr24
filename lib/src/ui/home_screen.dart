
import 'package:dr24/src/ui/probando_email.dart';
import 'package:dr24/usuarios/ui/listview_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dr24/home/myHome.dart';
import 'package:dr24/src/bloc/authentication_bloc/bloc.dart';
//import 'package:flutter_email_sender/flutter_email_sender.dart';


class HomeScreen extends StatefulWidget {
  final String name;

  HomeScreen({Key key, @required this.name}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int _selectDrawerItem = 0;
  String get name => widget.name;
    /*
    Future<void> send() async {
    final Email email = Email(
      body: 'rubenmashal@yahoo.com.ar',
      subject: 'rubenmashal@yahoo.com.ar',
      recipients: ['rubenmashal@yahoo.com.ar'],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }
  }
  */
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return MyHomeNuevo();
      case 1: return MyApp234();
      /*
      case 1: return Column(children: <Widget>[
        Text('Perfil'), 
        RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            send();
            print('lala');
          } ,
          child: Text('Enviar Mail'),
        )
        ],) ;
      */     
      case 2: return ListViewUsuarios();     
      case 3: return Text('Aux2');  
      //case 0: return Perfil();
      //case 1: return Clientes();
    

    }
  }

  _onSelectItem(int pos){
    Navigator.of(context).pop();    
    setState(() {
      _selectDrawerItem = pos;  
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text('Ruben'), 
              accountEmail: Text('$name'),
              currentAccountPicture: CircleAvatar(
                radius: 27,
                backgroundImage: AssetImage('images/ruben.png'),
                foregroundColor: Colors.black26,
              ),
            ),
            ListTile(
              title: Text('Inicio', style: TextStyle(color: _selectDrawerItem == 0 ? Colors.blue : Colors.black87)),
              leading: Icon(
                Icons.home,
                color: _selectDrawerItem == 0 ? Colors.blue : Colors.black87),
              selected: (0 == _selectDrawerItem),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomeNuevo()),
                );  
              },
            ),
            ListTile(
              title: Text('Perfil', style: TextStyle(color: _selectDrawerItem == 1 ? Colors.blue : Colors.black87)),
              leading: Icon(
                Icons.portrait,
                color: _selectDrawerItem == 1 ? Colors.blue : Colors.black87),
              selected: (1 == _selectDrawerItem),
              onTap: (){
                _onSelectItem(1);                            
              },                 
            ),
            ListTile(
              title: Text('Usuarios', style: TextStyle(color: _selectDrawerItem == 2 ? Colors.blue : Colors.black87)),
              leading: Icon(
                Icons.supervised_user_circle,
                color: _selectDrawerItem == 2 ? Colors.blue : Colors.black87),
              selected: (2 == _selectDrawerItem),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListViewUsuarios()),
                );  
              },              
            ),
            /*
            ListTile(
              title: Text('Formularios', style: TextStyle(color: _selectDrawerItem == 3 ? Colors.blue : Colors.black87)),
              leading: Icon(
                Icons.format_align_justify,
                color: _selectDrawerItem == 3 ? Colors.blue : Colors.black87),
              selected: (3 == _selectDrawerItem),
              onTap: (){
                _onSelectItem(3);
                },              
            ),
            */
            Divider(),            
            ListTile(
              title: Text('Salir'),
              leading: Icon(Icons.exit_to_app),
              onTap: (){
                BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());               
              },              
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}

class HomeScreenClient extends StatelessWidget {
  final String name;

  HomeScreenClient({Key key, @required this.name}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(child: Text('Bienvenido Cliente $name!'),
          )
        ],
      )
    );
  }
}
