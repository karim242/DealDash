
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/offer_item.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:flutter/material.dart';

class OfferGridView extends StatelessWidget {
  const OfferGridView({
    super.key,
    this.offerList,
  });
  final List<Offer>? offerList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 12,
          childAspectRatio: 1 / 1.4,
        ),
        itemCount: offerList!.length,
        itemBuilder: (context, index) => OfferItem(
              offers: offerList![index],
            ));
  }
}
