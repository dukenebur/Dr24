//import 'package:dr24/covid/covid.dart';
//import 'package:dr24/covid/ui/listview_cliente.dart';
import 'package:dr24/contratistas/ui/listview_contratistas.dart';
import 'package:dr24/covid/ui/listview_covid.dart';
//import 'package:dr24/covid/ui/listview_covid.dart';
import 'package:flutter/material.dart';


class MyHomeNuevo extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomeNuevo> {
  int _selectDrawerItem = 0;

  _getDrawerItemWidget(int pos){
    switch(pos){
      //case 0: return Perfil();
      //case 1: return Clientes();
      case 0: return Documentos();
      case 1: return ListViewCovid();   
      case 2: return Text('opcion 3');     
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getDrawerItemWidget(_selectDrawerItem)
    );
  }
}

class Documentos extends StatelessWidget {
  const Documentos({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 0.9,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      children: <Widget>[
        myGridItems("COVID - 19", "https://elmedicointeractivo.com/wp-content/uploads/2020/03/coronavirus-5.jpg", Colors.red[400], Colors.red[600], 1, context),
        myGridItems("Seguridad e Higiene", "https://miro.medium.com/max/2400/1*VT_Qgj0ogVzdytM4_PdnoQ.jpeg", Colors.green[400], Colors.green[800], 2, context),
        myGridItems("Formulario ART", "http://canalveo.com/wp-content/uploads/2019/10/accidentes-laborales-730x405.jpg", Colors.blue[400], Colors.blue[800], 3, context),
        myGridItems("Ingreso Contratistas", "http://guiadealbanileria.com/wp-content/uploads/2017/04/APR_MAY2017_Safety.jpg", Colors.amber[400], Colors.amber[800], 4, context),
      ],
    );
  }
}


Widget myGridItems(String gridName, String gridimage, Color color1, Color color2, int numberOption, context) {
  return InkWell(
    onTap: () {
      (numberOption == 1) ?
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => ListViewCovid())) :
      (numberOption == 2) ?
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => ListViewCovid())) :
      (numberOption == 3) ?
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => ListViewCovid())) :
      (numberOption == 4) ?
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => ListViewContratistas())) :
      print('Sin opcion');
     
    //return HomeScreen(opcion: 1);  
    //onSelectItem(1);  
    }, // handle your onTap here
      child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        gradient: new LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 1.0) 
        )
      ),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.3,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                image: DecorationImage(
                  image: new NetworkImage(
                    gridimage
                  ),
                  fit: BoxFit.fill 
                )
              ),
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Container(child: Text("Job", style: TextStyle(color: Colors.white, fontSize: 16))),
                    //SizedBox(width:10.0),
                    //Container(child: Icon(Icons.access_alarm, color: Colors.white)),
                    //SizedBox(width:10.0),
                    //Container(child: Text("Guide", style: TextStyle(color: Colors.white, fontSize: 16)))
                  ],
                )
              ),
              SizedBox(width:10.0),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(gridName, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
              )
            ],
          )
        ],
      )
    )
  );
}