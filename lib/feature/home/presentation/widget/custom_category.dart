import 'package:flutter/material.dart';
class CustomCategory extends StatelessWidget {
  final String title;
  final String image;

  const CustomCategory({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Stack(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
              top: 2,
              right: 15,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                color: Colors.black.withOpacity(.7),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
