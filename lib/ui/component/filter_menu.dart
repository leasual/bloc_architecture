import 'package:flutter/material.dart';

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

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    final curve = CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
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
      right: 0,//-(size.width * 0.3) * (1 - _animation.value),
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
            itemCount: 10,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => buildMenuItem(this.widget.menuList[index]),
            padding: EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }

  Widget buildMenuItem(String title) {
    return Container(
      child: Column(
        children: [
          Text("")
        ],
      ),
    );
  }
}
