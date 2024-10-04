import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/image_manger/image_manger.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
import '../control/product_model.dart';
import '../../data/data.dart';

class ItemOfListBottomWidget extends StatefulWidget {
  final StoreInCategory? store;

  const ItemOfListBottomWidget({super.key, this.store});

  @override
  State<ItemOfListBottomWidget> createState() => _ItemOfListBottomWidgetState();
}

class _ItemOfListBottomWidgetState extends State<ItemOfListBottomWidget> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              SizedBox(
                height: MediaQuery.of(context).size.height * .22,
                width: double.infinity,
                child: Image.network(
                  widget.store!.image!,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //title
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.store?.name ?? AppStrings.appelMob,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(
                        fit: BoxFit.scaleDown, child: const Text("Price ")),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '${widget.store?.phone} E ',
                        style: const TextStyle(
                          fontSize: 10,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "${widget.store?.phone} E",
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorManager.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Positioned(
          //   top: 5,
          //   right: 5,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(50),
          //       color: Colors.black.withOpacity(.2),
          //     ),
          //     padding: const EdgeInsets.all(4),
          //     // color: Colors.white,
          //     child: InkWell(
          //       onTap: () {
          //         setState(() {
          //           isFav = !isFav;
          //           addDeleteListFav();
          //         });
          //       },
          //       child: isFav
          //           ? const Icon(
          //               Icons.favorite,
          //               color: Colors.red,
          //             )
          //           : const Icon(
          //               Icons.favorite,
          //               color: Colors.white,
          //             ),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorManager.whitGreen,
              ),
              child: Row(
                children: [
                  Text(
                     "3.5",
                    style: TextStyle(
                      color: ColorManager.primary,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: ColorManager.yellow,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

 
}
