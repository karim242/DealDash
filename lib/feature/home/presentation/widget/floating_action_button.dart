import 'package:flutter/material.dart';
class FABWidget extends StatelessWidget {
  Function (int)selectFun;
  FABWidget({super.key,required this.selectFun});

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      backgroundColor: Colors.orange,
      shape: const StadiumBorder(),
      onPressed: () {
        selectFun(2);
      },
      child: const Icon(Icons.location_on_outlined,size: 40,color: Colors.white,),
      //params
    );
  }
}
