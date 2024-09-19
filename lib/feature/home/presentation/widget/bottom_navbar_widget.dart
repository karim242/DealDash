import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
class BottomNavBarWidget extends StatefulWidget {
  Function(int) change;
  BottomNavBarWidget({super.key,required this.change});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
    notchMargin: 8,
      height: 50,
      iconSize: 30,
      elevation: 0,
      backgroundColor: Colors.black54,
      activeColor: Colors.orange,
      inactiveColor: Colors.white,
      icons: const [ Icons.home, Icons.favorite, Icons.notifications,Icons.person],
      activeIndex: counter,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: changed ,
      //other params
    );
  }
  changed(index){
    setState(() {
      counter=index;
    });
    if(index==2||index==3){
      index++;
    }
    widget.change(index);
  }
}