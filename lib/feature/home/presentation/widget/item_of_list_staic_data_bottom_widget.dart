import 'package:dealdash/feature/home/presentation/widget/cart_offer_item_of_list_static_widget.dart';
import 'package:flutter/material.dart';
import '../../logic/product_model.dart';


class ItemOfListStaticDataBottomWidget extends StatelessWidget {
  final ProductModel? productModel;

  const ItemOfListStaticDataBottomWidget({super.key, this.productModel});

  @override
  Widget build(BuildContext context) {
    return CardOfferItemOfListStaticDataWidget(productModel:productModel ,);
  }
}