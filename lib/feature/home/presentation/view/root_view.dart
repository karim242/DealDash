import 'package:flutter/material.dart';

import '../data/constrain.dart';
import '../widget/bottom_navbar_widget.dart';
import '../widget/floating_action_button.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(toolbarHeight: MediaQuery.of(context).size.height*.02,),
      resizeToAvoidBottomInset: false,
      body: pages[_selectedIndex],
        floatingActionButton:FABWidget(selectFun: _onItemTapped,),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBarWidget(change:_onItemTapped ,)
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}










/*
 FloatingActionButton(
          backgroundColor: Colors.orange,
          shape: const StadiumBorder(),
          onPressed: () {
            setState(() {
              _selectedIndex=2;
            });
          },
          child: const Icon(Icons.location_on_outlined,size: 40,color: Colors.white,),
          //params
        )
 */






//old
/*
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60, // حجم أكبر للزر العائم
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ), //
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          backgroundColor: ColorManager.red,
          child: Icon(
            Icons.location_on,
            size: 30,
            color: ColorManager.primary,
          ),
        ),
      ),


Container(
decoration: BoxDecoration(
border: Border(
top: BorderSide(
color: Colors.grey.shade300, width: 1.5), // الحد السفلي فقط
),
),
child: BottomNavigationBar(
type: BottomNavigationBarType.fixed,
selectedItemColor: ColorManager.yellow,
unselectedItemColor: ColorManager.primary,
currentIndex: _selectedIndex,
onTap: _onItemTapped,
items: const [
BottomNavigationBarItem(
icon: Icon(Icons.home),
label: 'Home',
),
BottomNavigationBarItem(
icon: Icon(Icons.favorite),
label: 'Favorite',
),
BottomNavigationBarItem(
icon: Icon(null), // تركه فارغًا لزر الـ FloatingActionButton
label: '',
),
BottomNavigationBarItem(
icon: Icon(Icons.notifications),
label: 'Notification',
),
BottomNavigationBarItem(
icon: Icon(Icons.person),
label: 'Profile',
),
],
),
),
*/

