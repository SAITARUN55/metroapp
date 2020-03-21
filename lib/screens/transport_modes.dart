import 'package:flutter/material.dart';
import 'transport_mode_details.dart';
import 'search_routes.dart';

class TransportModes extends StatefulWidget {
  TransportModes({Key key}) : super(key: key);

  @override
  _TransportModesState createState() => _TransportModesState();
}

class _TransportModesState extends State<TransportModes> {

  List<TransportMode> list=[
    TransportMode(title:"Metro",iconData:Icons.title,page:SearchRoutes()),
    TransportMode(title:"Bus",iconData:Icons.access_alarm,page:SearchRoutes()),
    TransportMode(title:"Train",iconData:Icons.print,page:SearchRoutes())
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

                Navigator.push(context, MaterialPageRoute(builder: (_)=> TransportModeDetails()));

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