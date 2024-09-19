import 'package:flutter/material.dart';

import '../../../../core/resources/image_manger/image_manger.dart';
import '../../../../core/resources/strings_manger/strings_manager.dart';
import '../control/product_model.dart';
import '../data/data.dart';

class ItemOfListBottomWidget extends StatefulWidget {
  ProductModel? productModel;

  ItemOfListBottomWidget({super.key, this.productModel});

  @override
  State<ItemOfListBottomWidget> createState() => _ItemOfListBottomWidgetState();
}

class _ItemOfListBottomWidgetState extends State<ItemOfListBottomWidget> {
  bool isFav = false;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .2,
                width: double.infinity,
                child: Image.asset(
                  widget.productModel?.imagePath ?? ImageManger.imageMobil2,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              //title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  maxLines: 2,
                  widget.productModel?.title ?? AppStrings.appelMob,
                ),
              ),
              // const SizedBox(height: 12),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black.withOpacity(.2),
              ),
              padding: const EdgeInsets.all(4),
              // color: Colors.white,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isFav = !isFav;
                    addDeleteListFav();
                  });
                },
                child: isFav
                    ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
                    : const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.black.withOpacity(.4),

              ),
              child: Row(
                children: [
                  Text(widget.productModel?.rate ?? "3.5"),
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            left: 12,
            child: Container(
              color: Colors.brown[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Price "),
                  Text(
                    widget.productModel?.oldPrice ?? "2500 E",
                    style:
                    const TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    color: Colors.orange,
                    child: Text(
                      widget.productModel?.newPrice ?? "2500 E",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addDeleteListFav() {
    bool found = true;
    if (isFav) {
      if (favList.isEmpty) {
        favList.add(
            widget.productModel ?? mobileList[0]
        );
      } else {
        String img = widget.productModel!.imagePath;
        for (ProductModel i in favList) {
          print(img);
        print(i.imagePath);
          if (img == i.imagePath) {
           found = false;
          }
        }
        print(found);
        if(found){
          favList.add(
              widget.productModel ?? mobileList[0]
          );
      }else{
          favList.remove(widget.productModel);
        }


      }
  }
}

}
