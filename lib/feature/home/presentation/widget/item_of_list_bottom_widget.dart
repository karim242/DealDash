import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/widget/formate_date.dart';
import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/strings_manger/strings_manager.dart';

class ItemOfListBottomWidget extends StatefulWidget {
  final OfferModel? store;

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
                  widget.store!.image,
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
                  children: [
                    FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${widget.store!.price} E",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorManager.primary,
                          ),
                        )),
                    Text(
                      "30% Off",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.red,
                      ),
                    ),
                    const SizedBox(),
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
