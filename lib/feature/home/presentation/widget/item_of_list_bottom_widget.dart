import 'package:dealdash/core/resources/routes_manger/routes_manager.dart';
import 'package:dealdash/core/widget/cart_offer_item.dart';
import 'package:dealdash/feature/home/data/model/category_model.dart';
import 'package:dealdash/feature/location/data/model/store_model.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/offer_item.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class ItemOfListBottomWidget extends StatelessWidget {
  final StoreInCategory? store;

  const ItemOfListBottomWidget({super.key, this.store});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         GoRouter.of(context).push(Routes.offerListInCategory, extra: store!.offers);
      },
      child: CardOfferItem(offerData: store));
  }
}


class OffersListInCategory extends StatelessWidget {
  const OffersListInCategory({
    super.key,
    this.offerList,
  });
  final List<Offer>? offerList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Offers"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.builder(
            shrinkWrap: true,
          //  physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 12,
          childAspectRatio: 1 / 1.3,
            ),
            itemCount: offerList!.length,
            itemBuilder: (context, index) {
              if(offerList!.isEmpty ){
              return const Center(child: Text("No Data",style: TextStyle(fontSize: 20),));
              }
             return OfferItem(
                   offers: offerList![index],
                 );
            
          }),
      ),
    );
  }
}
