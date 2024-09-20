import 'package:flutter/material.dart';

class ItemListTopPageViewAddisWidget extends StatelessWidget {
  final Function function;
  final String imagePath;
  const ItemListTopPageViewAddisWidget({super.key, required this.function, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        function();
      },
      child: Container(
        width: MediaQuery.of(context).size.width*.9,
        margin: const EdgeInsets.symmetric(horizontal: 8),

        color: Colors.red,
        child: Image.asset(
          imagePath,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  }
}
