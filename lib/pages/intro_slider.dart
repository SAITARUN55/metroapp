import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:metroapp/pages/cities_page.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      highlightColorSkipBtn: Color(0x33000000),
      colorSkipBtn: Color(0x33000000),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0x33000000),

      // Dot indicator
      colorDot: Color(0xffD02090),
      colorActiveDot: Color(0xff000000),
      sizeDot: 13.0,

      // Tabs
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: true, backgroundColorAllSlides: Colors.grey,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    ));
  }

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "WELCOME TO METRO APP",
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Get information of all metro services of India at one place",
        styleDescription: TextStyle(
            color: Color(0xff000000),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        maxLineTextDescription: 3,
        colorBegin: Color(0xffFFDAB9),
        colorEnd: Color(0xff40E0D0),
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        marginDescription:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 70.0),
        pathImage: "assets/train.png",
      ),
    );
    slides.add(new Slide(
      title: "FASTER AND EASIER",
      styleTitle: TextStyle(
          color: Color(0xffD02090),
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono'),
      description:
          "We make your travel easier and faster in all metro cities",
      styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway'),
      maxLineTextDescription: 3,
          colorBegin: Color(0xffFFFACD),
          colorEnd: Color(0xffFF6347),
          directionColorBegin: Alignment.topRight,
          directionColorEnd: Alignment.bottomLeft,
      marginDescription:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 70.0),
      pathImage: "assets/train.png",
    ));
    slides.add(new Slide(
      title: "SMOOTH EXPERIENCE",
      styleTitle: TextStyle(
          color: Color(0xffD02090),
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoMono'),
      description:
          "Get a smooth experience in an ALL-IN-ONE user dedicated app",
      styleDescription: TextStyle(
          color: Color(0xff000000),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway'),
      maxLineTextDescription: 3,
      colorBegin: Color(0xffFFA500),
      colorEnd: Color(0xff7FFFD4),
      directionColorBegin: Alignment.topCenter,
      directionColorEnd: Alignment.bottomCenter,
      marginDescription:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 70.0),
      pathImage: "assets/train.png",
    ));
  }

  void onDonePress() {
    // Do what you want
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CitiesPage()),
    );
  }

  void onTabChangeCompleted(index) {
    //index of current tab is focused
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.black,
      size: 35.0,
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Colors.black,
      size: 35.0,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Colors.black,
      size: 35.0,
    );
  }
}