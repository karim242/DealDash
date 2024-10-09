import 'package:dealdash/core/widget/cart_offer_item.dart';
import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:dealdash/feature/location/data/model/store_model.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:flutter/material.dart';


class ItemOfListBottomWidget extends StatelessWidget {
  final StoreInCategory? store;

  const ItemOfListBottomWidget({super.key, this.store});

  @override
  Widget build(BuildContext context) {
    return CardOfferItem(offerData: store);
  }
}
