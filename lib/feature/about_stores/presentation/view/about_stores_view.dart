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

class AboutStoresView extends StatelessWidget {
  const AboutStoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(Assets.storesAssetsStoreLogo),
                  IconButton(onPressed: (){
                    GoRouter.of(context).pop();
                  }, icon: const Icon(Icons.arrow_back_ios_new)),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 16,horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StoreName(name: "Defacto"),
                    const SizedBox(height: 8),
                    const CategoryText(category: "Clothing"),
                    const SizedBox(height: 8),
                    const RateSection(rateNumber: 4.0, peopleRatedNum: 200),
                    const SizedBox(height: 32),
                    const HeaderText(header: "About"),
                    const SizedBox(height: 8),
                    const SideText(text: "Find all your fashion needs in one place."),
                    const SizedBox(height: 32),
                    SizedBox(
                      height: 85,
                      child:   Row(
                        children: [
                           const Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeaderText(header: "Opening Hours"),
                              SizedBox(height: 8),
                              SideText(text: "(10:00 am - 11:00 pm)"),
                            ],
                          ),),
                          VerticalDivider(
                            color: ColorManager.red,
                            thickness: 1,
                          ),
                          const SizedBox(width: 10),
                          Row(
                            children: [
                              StoreIconButtons(iconData: Icons.favorite_border, onTap: (){}),
                              const SizedBox(width: 16),
                              StoreIconButtons(iconData: Icons.call, onTap: (){}),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const HeaderText(header: "ADDRESS"),
                    const SizedBox(height: 8),
                    const SideText(text: "El-Gaish St, Mansoura Qism2, El Mansoura"),
                    const SizedBox(height: 32),
                    const HeaderText(header: "Offers"),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 10.0, // Spacing between columns
                          mainAxisSpacing: 10.0, // Spacing between rows
                          childAspectRatio: 1.0/1.9, // Aspect ratio of each item (width/height)
                        ),
                        itemCount: 10,
                        itemBuilder: (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(Assets.storesAssetsStoreOffer1),
                             const SizedBox(height: 8),
                             Text(
                              "Regular Fit V-neck short sleeve T-Shirt",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: ColorManager.primary
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "209 EGP",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Row(
                              children: [
                                 Text(
                                  "299 EGP",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.4),
                                    decoration: TextDecoration.lineThrough, // Add strikethrough effect
                                    decorationColor: Colors.grey, // Set decoration color
                                    decorationThickness: 2, // Se
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "30% Off",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ColorManager.red,
                                  ),
                                ),

                              ],
                            )
                          ],
                        )
                      ),
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
