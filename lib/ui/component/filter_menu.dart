import 'package:bloc_architecture/di/injection.dart';
import 'package:flutter/material.dart';

GlobalKey<_FilterMenuState> filterMenuKey = GlobalKey();

class FilterMenu extends StatefulWidget {

  final List<String> menuList;

  FilterMenu({
    @required this.menuList,
    Key key,
  }): assert(menuList != null), super(key: key);

  @override
  _FilterMenuState createState() => _FilterMenuState();
}

class _FilterMenuState extends State<FilterMenu> with SingleTickerProviderStateMixin {

  final String tag = "FilterMenu";

  AnimationController _animationController;
  Animation _animation;
  bool isOpen = false;

  void toggleFilterMenu() {
    logger.d(tag, "toggleFilterMenu");
    if(_animationController.isAnimating) return;
    isOpen = !isOpen;
    isOpen ? _animationController.forward() : _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    final curve = CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn);
    _animation =  Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      right: -(size.width * 0.3) * (1 - _animation.value),
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.6,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(color: Colors.grey[300], offset: Offset(3, -3), spreadRadius: 5, blurRadius: 5)
            ]
        ),
        child: ListView.builder(
            itemCount: this.widget.menuList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildMenuItem(this.widget.menuList[index]),
            padding: EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }

  Widget buildMenuItem(String title) {
    return Container(
      height: 60,
      child: MaterialButton(
        onPressed: () {
          toggleFilterMenu();
        },
        child: Text(title, style: TextStyle(fontSize: 14, color: Colors.black),),
      )
    );
  }
}
