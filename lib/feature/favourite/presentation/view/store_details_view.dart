
import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/widget/formate_date.dart';
import 'package:dealdash/feature/favourite/data/model/favourite_model.dart';
import 'package:dealdash/feature/favourite/logic/favourite_cubit.dart';
import 'package:dealdash/feature/favourite/logic/favourite_state.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/header_text.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/rate_section.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/side_text.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/store_icon_buttons.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/store_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreFavouriteDetails extends StatelessWidget {
  const StoreFavouriteDetails({
    super.key,
    required this.store,
  });
  final FavoriteStore store;

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
   // var blocBuilder = BlocBuilder;
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
                    StoreName(name: store.name),
                    SizedBox(height: 8.h),
                    // CategoryText(category: store..name),
                    // SizedBox(height: 8.h),
                    const RateSection(rateNumber: 4.0, peopleRatedNum: 200),
                    SizedBox(height: 32.h),
                    const HeaderText(header: "About"),
                    SizedBox(height: 8.h),
                    SideText(text: store.about!),
                    SizedBox(height: 32.h),
                    SizedBox(
                      height: 88.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const HeaderText(header: "The show is on"),
                                SizedBox(height: 8.h),
                                SideText(
                                    text:
                                        "(${formatDate(store.createdAt.toString())} - ${formatDate(store.updatedAt.toString())} )"),
                              ],
                            ),
                          ),
                          VerticalDivider(
                            color: ColorManager.red,
                            thickness: 1,
                          ),
                          SizedBox(width: 10.w),
                          BlocBuilder<FavouriteCubit, FavouriteState>(
                            builder: (context, state) {
                              // if (state is FavouriteAddSuccess) {}
                              return Row(
                                children: [
                                  StoreIconButtons(
                                    iconData:    Icons.favorite,
                                    onTap: () {
                                      final cubit =
                                          context.read<FavouriteCubit>();
                                      cubit
                                          .toggleFavourite(store.id.toString());
                                    },
                                  ),
                                  SizedBox(width: 16.w),
                                  StoreIconButtons(
                                    iconData: Icons.call,
                                    onTap: () {
                                      makePhoneCall(store.phone!);
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
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
                  //    child: OfferGridView(offerList: store.offers),
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
