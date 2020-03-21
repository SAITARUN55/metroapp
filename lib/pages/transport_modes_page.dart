import 'package:flutter/material.dart';
import 'package:metroapp/pages/search_routes_page.dart';
import 'package:metroapp/pages/transport_mode_details_page.dart';

class TransportModesPage extends StatefulWidget {
  TransportModesPage({Key key}) : super(key: key);

  @override
  _TransportModesPageState createState() => _TransportModesPageState();
}

class _TransportModesPageState extends State<TransportModesPage> {

  List<TransportMode> list=[
    TransportMode(title:"Metro",iconData:Icons.title,page:SearchRoutesPage()),
    TransportMode(title:"Bus",iconData:Icons.access_alarm,page:SearchRoutesPage()),
    TransportMode(title:"Train",iconData:Icons.print,page:SearchRoutesPage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Transport Modes'),
      ),
      body: Container(
        child: GridView.builder(itemCount: list.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (BuildContext context,int index){

          return GestureDetector(

            child: Card(

              elevation: 5.0,

              child: Container(

                alignment: Alignment.center,

                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Icon(list[index].iconData,size: 40,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                        child:Text(list[index].title))


                  ],
                )


              ),
            ),

              onTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (_)=> TransportModeDetailsPage()));

              }
          );
        })
      )
    );
  }
}


class TransportMode{

  String title;
  IconData iconData;
  Widget page;

  TransportMode({@required this.title,@required this.iconData,@required this.page});
}