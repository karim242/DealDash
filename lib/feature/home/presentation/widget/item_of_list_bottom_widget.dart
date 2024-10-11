import 'package:dealdash/core/resources/routes_manger/routes_manager.dart';
import 'package:dealdash/core/widget/cart_offer_item.dart';
import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:dealdash/feature/location/data/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ItemOfListBottomWidget extends StatelessWidget {
  final StoreInCategory? store;

  const ItemOfListBottomWidget({super.key, this.store});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
          GoRouter.of(context).push(Routes.aboutStoreRoute, extra: store);
      },
      child: CardOfferItem(offerData: store));
  }
}
