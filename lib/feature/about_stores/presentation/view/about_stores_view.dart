import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/feature/about_stores/presentation/widgets/category_text.dart';
import 'package:dealdash/feature/about_stores/presentation/widgets/header_text.dart';
import 'package:dealdash/feature/about_stores/presentation/widgets/rate_section.dart';
import 'package:dealdash/feature/about_stores/presentation/widgets/side_text.dart';
import 'package:dealdash/feature/about_stores/presentation/widgets/store_icon_buttons.dart';
import 'package:dealdash/feature/about_stores/presentation/widgets/store_name.dart';
import 'package:dealdash/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:dealdash/feature/location/data/model/store_model.dart';

class AboutStoresView extends StatelessWidget {
   AboutStoresView({super.key, required this.store, });
  final Store store;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    store.image ??
                        'https://media.istockphoto.com/id/681622484/photo/concrete-wall-shiny-smooth-backgrounds-white-textured.jpg?s=2048x2048&w=is&k=20&c=87J5-OznIqEEKD923thUgWZBNIiAD4oDVAmHSQYLr1o=',
                  ),
                  IconButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new)),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 16, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StoreName(name: store.name!),
                    SizedBox(height: 8.h),
                    CategoryText(category: store.category.toString()!),
                    SizedBox(height: 8.h),
                    const RateSection(rateNumber: 4.0, peopleRatedNum: 200),
                    SizedBox(height: 32.h),
                    const HeaderText(header: "About"),
                    SizedBox(height: 8.h),
                    SideText(text: store.about!),
                    SizedBox(height: 32.h),
                    SizedBox(
                      height: 85.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const HeaderText(header: "Opening Hours"),
                                SizedBox(height: 8.h),
                                const SideText(text: "(10:00 am - 11:00 pm)"),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: ColorManager.red,
                            thickness: 1,
                          ),
                          SizedBox(width: 10.w),
                          Row(
                            children: [
                              StoreIconButtons(
                                  iconData: Icons.favorite_border,
                                  onTap: () {}),
                              SizedBox(width: 16.w),
                              StoreIconButtons(
                                  iconData: Icons.call, onTap: () {}),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    const HeaderText(header: "ADDRESS"),
                    SizedBox(height: 8.h),
                    SideText(text: store.address),
                    SizedBox(height: 32.h),
                    const HeaderText(header: "Offers"),
                    SizedBox(height: 8.h),
                     SizedBox(
                      width: double.infinity,
                      child:  OfferGridView(offerList:store.offers ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OfferGridView extends StatelessWidget {
  const OfferGridView({
    super.key,  this.offerList,
  });
final List<Offer>? offerList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0.w, // Spacing between columns
          mainAxisSpacing: 10.0.h, // Spacing between rows
          childAspectRatio: 1.0.w /
              2.3.h, // Aspect ratio of each item (width/height)
        ),
        itemCount: offerList!.length,
        itemBuilder: (context, index) =>  OfferItem(offers:offerList![index] ,));
  }
}

class OfferItem extends StatelessWidget {
  const OfferItem({
    super.key, required this.offers,
  });
final Offer offers;
  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network( offers.image!),
            SizedBox(height: 8.h),
            Text(
              offers.name!,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.sp,
                  color: ColorManager.primary),
            ),
            SizedBox(height: 6.h),
            Text(
              "209 EGP",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Text(
                  "299 EGP",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.4),
                    decoration: TextDecoration
                        .lineThrough, // Add strikethrough effect
                    decorationColor: Colors
                        .grey, // Set decoration color
                    decorationThickness: 2, // Se
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "30% Off",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.red,
                  ),
                ),
              ],
            )
          ],
        );
  }
}
