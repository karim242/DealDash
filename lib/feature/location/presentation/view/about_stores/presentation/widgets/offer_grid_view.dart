
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/offer_item.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 12.0.w, // Spacing between columns
          mainAxisSpacing: .0.h, // Spacing between rows
          childAspectRatio:
              1.6.w / 2.3.h, // Aspect ratio of each item (width/height)
        ),
        itemCount: offerList!.length,
        itemBuilder: (context, index) => OfferItem(
              offers: offerList![index],
            ));
  }
}
