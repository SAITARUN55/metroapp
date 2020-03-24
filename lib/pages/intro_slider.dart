import 'package:flutter/material.dart';
import 'package:metroapp/widgets//my_intro_view.dart';
import 'package:metroapp/pages/cities_page.dart';

class IntroSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _IntroSliderState(),
    );
  }
}

class _IntroSliderState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyIntroView(
      pages: <Widget>[
        Image.asset("assets/icon1.png", fit: BoxFit.cover),
        Image.asset("assets/icon1.png", fit: BoxFit.cover),
        Image.asset("assets/icon1.png", fit: BoxFit.cover),
      ],
      onIntroCompleted: () {
        print("Intro is Completed");
        //To the navigation stuff here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CitiesPage()),
        );
      },
    );
  }
}









//import 'package:flutter/material.dart';
//import 'package:intro_slider/intro_slider.dart';
//import 'package:intro_slider/slide_object.dart';
//import 'package:metroapp/pages/cities_page.dart';
//
//class IntroSliderPage extends StatefulWidget {
//
//  final List<Widget> slides;
//  final VoidCallback onIntroCompleted;
//
//  const IntroSliderPage({
//    Key key,
//    @required this.slides,
//    @required this.onIntroCompleted,
//  })  : assert(slides != null),
//        assert(onIntroCompleted != null),
//        super(key: key);
//
//  @override
//  State<StatefulWidget> createState() => _IntroSliderPageState();
//}
//
//class _IntroSliderPageState extends State<IntroSliderPage> {
//
//  Function goToTab;
//
//  @override
//  void initState() {
//    super.initState();
//
//    slides.add(
//      new Slide(
//        title: "DELHI",
//        styleTitle:
//        TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//        description: "Delhi officially the National Capital Territory of Delhi (NCT), is a city and a union territory of India containing New Delhi, the capital of India.",
//        styleDescription:
//        TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//        maxLineTextDescription: 3,
////        colorBegin: Color(0xffFFDAB9),
////        colorEnd: Color(0xff40E0D0),
////        directionColorBegin: Alignment.topLeft,
////        directionColorEnd: Alignment.bottomRight,
//        marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
//        pathImage: "icon1.png",
//        backgroundColor: Colors.amber,
//      ),
//    );
//    slides.add(
//        new Slide(
//          title: "BANGALORE",
//          styleTitle:
//          TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//          description: "Officially known as Bengaluru, is the capital of the Indian state of Karnataka",
//          styleDescription:
//          TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//          maxLineTextDescription: 3,
////          colorBegin: Color(0xffFFFACD),
////          colorEnd: Color(0xffFF6347),
////          directionColorBegin: Alignment.topRight,
////          directionColorEnd: Alignment.bottomLeft,
//          marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
//          pathImage: "icon1.png",
//          backgroundColor: Colors.amber,
//        )
//    );
//    slides.add(
//        new Slide(
//          title: "HYDERABAD",
//          styleTitle:
//          TextStyle(color: Color(0xffD02090), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//          description: "The pearl city of India and the capital of Telangana in Southern India. ",
//          styleDescription:
//          TextStyle(color: Color(0xffD02090), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//          maxLineTextDescription: 3,
////          colorBegin: Color(0xffFFA500),
////          colorEnd: Color(0xff7FFFD4),
////          directionColorBegin: Alignment.topCenter,
////          directionColorEnd: Alignment.bottomCenter,
//          marginDescription: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
//          pathImage: "icon1.png",
//          backgroundColor: Colors.amber,
//        )
//    );
//  }
//
//  void onDonePress() {
//    // Do what you want
//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => CitiesPage()),
//    );
//  }
//
//  void onTabChangeCompleted(index){
//    //index of current tab is focused
//  }
//
//  Widget renderNextBtn() {
//    return Icon(
//      Icons.navigate_next,
//      color: Color(0xffffcc5c),
//      size: 35.0,
//    );
//  }
//
//  Widget renderDoneBtn() {
//    return Icon(
//      Icons.done,
//      color: Color(0xffffcc5c),
//      size: 35.0,
//    );
//  }
//
//  Widget renderSkipBtn() {
//    return Icon(
//      Icons.skip_next,
//      color: Color(0xffffcc5c),
//      size: 35.0,
//    );
//  }
//
//
////  5. Custom Tabs
//  List<Widget> renderListCustomTabs(){
//    List<Widget> tabs = new List();
//    for(int i=0; i<slides.length; i++){
//      Slide currentSlide = slides[i];
//      tabs.add(Container(
//        width: double.infinity,
//        height: double.infinity,
//        child: Container(
//          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
//          child: ListView(
//            children: <Widget>[
//              GestureDetector(
//                child: Image.asset(
//                  currentSlide.pathImage,
//                  width: 200.0,
//                  height: 200.0,
//                  fit: BoxFit.contain,
//                ),
//              ),
//              Container(
//                child: Text(
//                  currentSlide.title,
//                  style: currentSlide.styleTitle,
//                  textAlign: TextAlign.center,
//                ),
//                margin: EdgeInsets.only(top: 20.0),
//              )
//            ],
//          ),
//        ),
//
//      ));
//    }
//    return tabs;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//     body: IntroSlider(
//      // List slides
//      slides: this.slides,
//
//      // Skip button
//      renderSkipBtn: this.renderSkipBtn(),
//      colorSkipBtn: Color(0x33ffcc5c),
//      highlightColorSkipBtn: Color(0xffffcc5c),
//
//      // Next button
//      renderNextBtn: this.renderNextBtn(),
//
//      // Done button
//      renderDoneBtn: this.renderDoneBtn(),
//      onDonePress: this.onDonePress,
//      colorDoneBtn: Color(0x33ffcc5c),
//      highlightColorDoneBtn: Color(0xffffcc5c),
//
//      // Dot indicator
//      colorDot: Color(0xffffcc5c),
//      sizeDot: 13.0,
//
//      // Tabs
//      listCustomTabs: this.renderListCustomTabs(),
//      refFuncGoToTab: (refFunc) {
//        this.goToTab = refFunc;
//      },
//
//      // Show or hide status bar
//      shouldHideStatusBar: true,
//
//      // On tab change completed
//      onTabChangeCompleted: this.onTabChangeCompleted,
//    ));
//  }
//}