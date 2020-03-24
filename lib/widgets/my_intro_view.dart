import 'package:flutter/material.dart';

class MyIntroView extends StatefulWidget {
  final List<Widget> pages;
  final VoidCallback onIntroCompleted;

  const MyIntroView({
    Key key,
    @required this.pages,
    @required this.onIntroCompleted,
  })  : assert(pages != null),
        assert(onIntroCompleted != null),
        super(key: key);

  @override
  _MyIntroViewState createState() => _MyIntroViewState();
}

class _MyIntroViewState extends State<MyIntroView> {
  PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: _currentPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        NotificationListener<ScrollEndNotification>(
          onNotification: (x) {
            setState(() {
              _currentPage = _pageController.page.round();
            });
            return false;
          },
          child: PageView(
            children: widget.pages,
            controller: _pageController,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildBottomButtons(),
        ),
      ],
    );
  }

  bool get _isFinalPage => _currentPage == widget.pages.length - 1;

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Opacity(
            opacity: _isFinalPage ? 0.0 : 1.0,
            child: _buildButton("SKIP", _gotoLastPage),
          ),
          _buildNavIndicator(),
          _isFinalPage
              ? _buildButton("DONE", widget.onIntroCompleted)
              : _buildButton("NEXT", _gotoNextPage),
        ],
      ),
    );
  }

  Widget _buildButton(String title, VoidCallback callback) {
    return FlatButton(
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: callback,
    );
  }

  void _gotoLastPage() {
    _pageController.animateToPage(
      widget.pages.length - 1,
      duration: const Duration(milliseconds: 600),
      curve: Curves.ease,
    );
  }

  void _gotoNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildNavIndicator() {
    final indicatorList = <Widget>[];
    for (int i = 0; i < widget.pages.length; i++)
      indicatorList.add(_buildIndicator(i == _currentPage));
    return Row(children: indicatorList);
  }

  Widget _buildIndicator(bool isActive) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white : Colors.white30,
        ),
        child: SizedBox(width: 8, height: 8),
      ),
    );
  }
}