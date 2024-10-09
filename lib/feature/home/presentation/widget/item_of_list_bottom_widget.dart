import 'package:dealdash/core/widget/cart_offer_item.dart';
import 'package:flutter/material.dart';
import '../control/product_model.dart';


class ItemOfListBottomWidget extends StatelessWidget {
  final ProductModel? productModel;

  const ItemOfListBottomWidget({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
    return CardOfferItem(productModel:productModel ,);
  }
}


//
// class ItemOfListBottomWidget extends StatelessWidget {
//   final StoreInCategory? store;
//
//   const ItemOfListBottomWidget({super.key, this.store, required productModel});
//
//   @override
//   Widget build(BuildContext context) {
//     return CardOfferItem(offerData: store);
//   }
// }
//

// import 'package:dealdash/core/resources/color_manger/color_manager.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../core/resources/image_manger/image_manger.dart';
// import '../../../../core/resources/strings_manger/strings_manager.dart';
// import '../control/product_model.dart';
// import '../../data/data.dart';
//
// class ItemOfListBottomWidget extends StatefulWidget {
//   final ProductModel? productModel;
//
//   const ItemOfListBottomWidget({super.key, this.productModel});
//
//   @override
//   State<ItemOfListBottomWidget> createState() => _ItemOfListBottomWidgetState();
// }
//
// class _ItemOfListBottomWidgetState extends State<ItemOfListBottomWidget> {
//   bool isFav = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 0,
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //image
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .22,
//                 width: double.infinity,
//                 child: Image.asset(
//                   widget.productModel?.imagePath ?? ImageManger.imageMobil2,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               //title
//               Text(
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//                 widget.productModel?.title ?? AppStrings.appelMob,
//               ),
//               const SizedBox(height: 12),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const FittedBox(
//                         fit: BoxFit.scaleDown, child: Text("Price ")),
//                     FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         '${widget.productModel?.oldPrice} E ',
//                         style: const TextStyle(
//                             fontSize: 10,
//                             decoration: TextDecoration.lineThrough),
//                       ),
//                     ),
//                     FittedBox(
//                       fit: BoxFit.scaleDown,
//                       child: Text(
//                         "${widget.productModel?.newPrice} E",
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: ColorManager.red,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           // Positioned(
//           //   top: 5,
//           //   right: 5,
//           //   child: Container(
//           //     decoration: BoxDecoration(
//           //       borderRadius: BorderRadius.circular(50),
//           //       color: Colors.black.withOpacity(.2),
//           //     ),
//           //     padding: const EdgeInsets.all(4),
//           //     // color: Colors.white,
//           //     child: InkWell(
//           //       onTap: () {
//           //         setState(() {
//           //           isFav = !isFav;
//           //           addDeleteListFav();
//           //         });
//           //       },
//           //       child: isFav
//           //           ? const Icon(
//           //               Icons.favorite,
//           //               color: Colors.red,
//           //             )
//           //           : const Icon(
//           //               Icons.favorite,
//           //               color: Colors.white,
//           //             ),
//           //     ),
//           //   ),
//           // ),
//           Positioned(
//             top: 5,
//             right: 5,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 4),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: ColorManager.whitGreen,
//               ),
//               child: Row(
//                 children: [
//                   Text(
//                     widget.productModel?.rate ?? "3.5",
//                     style: TextStyle(
//                       color: ColorManager.primary,
//                     ),
//                   ),
//                   Icon(
//                     Icons.star,
//                     color: ColorManager.yellow,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void addDeleteListFav() {
//     bool found = true;
//     if (isFav) {
//       if (favList.isEmpty) {
//         favList.add(widget.productModel ?? mobileList[0]);
//       } else {
//         String img = widget.productModel!.imagePath;
//         for (ProductModel i in favList) {
//           print(img);
//           print(i.imagePath);
//           if (img == i.imagePath) {
//             found = false;
//           }
//         }
//         print(found);
//         if (found) {
//           favList.add(widget.productModel ?? mobileList[0]);
//         } else {
//           favList.remove(widget.productModel);
//         }
//       }
//     }
//   }
// }