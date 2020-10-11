import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabBar extends StatefulWidget {
  
  final List<BottomBarItem> barItems;
  ValueChanged<int> onTabChanged;
  
  BottomTabBar({
    @required this.barItems,
    this.onTabChanged,
    Key key,
  }) : assert(barItems != null), super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  int _currentPage = 0;
  int _prevPage = -1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250)
    );
    final curve = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    // _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey[300], offset: Offset(3, -3), blurRadius: 1, spreadRadius: 0)
          ]
          // border: Border.all(color: Colors.grey[300], width: 0.5, style: BorderStyle.solid)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this.widget.barItems.asMap().entries.map((entry) => buildBarItem(entry.value, entry.key)).toList(),
      ),
    );
  }

  Widget buildBarItem(BottomBarItem barItem, int index) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if(_currentPage != index) {
            _prevPage = _currentPage;
            _currentPage = index;
            _animationController.reset();
            _animationController.forward();
            // logger.d("TabBar", "index= $index currentPage= $_currentPage prevPage= $_prevPage");
            this.widget.onTabChanged(_currentPage);
          }
        },
        child: Container(
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: calculateTopMovePosition(index),
                  child: SvgPicture.asset(barItem.image)
              ),
              Positioned(
                  bottom: calculateBottomMovePosition(index),
                  child: Text(barItem.title, style: barItem.titleStyle,)
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateTopMovePosition(int index) {
    double marginTop = (30 - 16 / 2);
    if(index == _currentPage) {
      return (_prevPage == -1) ? (-marginTop) : marginTop - (_animation.value * (30 + 14));
    } else {
      if(index == _prevPage) {
        return -marginTop + (_animation.value * (30 + 14));
      } else {
        return marginTop;
      }
    }
  }
  double calculateBottomMovePosition(int index) {
    double marginTop = (30 - 16 / 2);
    if(index == _currentPage) {
        return (_prevPage == -1) ? 18 : -16 + (_animation.value * (marginTop + 16));
    } else {
      if(index == _prevPage) {
          return 18 - (_animation.value * (marginTop + 16));
      } else {
        return -16;
      }
    }
  }
}

class BottomBarItem {
  final String title;
  final String image;
  final TextStyle titleStyle;

  const BottomBarItem({
    @required this.title,
    @required this.image,
    this.titleStyle = const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
  });
}