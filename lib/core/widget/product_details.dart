import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/core/widget/formate_date.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/side_text.dart';
import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:timeago/timeago.dart' as timeago;

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final Offer product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with timer overlay
              Stack(
                children: [
                  Image.network(
                    product.image,
                    height: 300.h,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.timer,
                              color: ColorManager.whitGreen, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            timeago.format(product.createdAt),
                            style: TextStyle(color: ColorManager.whitGreen),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Offer price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 248.w,
                          child: Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 24.sp,
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(),
                        // Offer text
                        Text(
                          "${product.price} E ",
                          style: TextStyle(
                            fontSize: 20,
                            color: ColorManager.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // About offer section

                    Text(
                      'About',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.about,
                      style: TextStyle(color: Colors.grey[600], height: 1.5),
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      height: 40.h,
                      child: Row(
                        children: [
                          Text(
                            'The show is on',
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorManager.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 16.h),
                          VerticalDivider(
                            color: ColorManager.red,
                            thickness: 1,
                          ),
                          SizedBox(width: 16.h),
                          SideText(
                              text:
                                  "${formatDate(product.createdAt.toString())} - ${formatDate(product.updatedAt.toString())} "),
                        ],
                      ),
                    ),
                    // People interested and button
                    // Row(
                    //   children: [
                    //     Text(
                    //       '126 People interested in offer',
                    //       style: TextStyle(color: Colors.grey[400]),
                    //     ),
                    //     const Spacer(),
                    //     ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //         backgroundColor: Colors.black,
                    //         side: const BorderSide(color: Colors.orange),
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20)),
                    //       ),
                    //       onPressed: () {},
                    //       child: const Text('I am interested'),
                    //     ),
                    //   ],
                    // ),
                    // Offer by and Address
                    // Text(
                    //   'OFFER BY',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: ColorManager.primary,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // const SizedBox(height: 8),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           'The Johnson Shop',
                    //           style: TextStyle(
                    //             fontSize: 16,
                    //             color: Colors.grey[700],
                    //             fontWeight: FontWeight.bold,
                    //           ),
                    //         ),
                    //         Text(
                    //           'Fashion Store',
                    //           style: TextStyle(color: Colors.grey[600]),
                    //         ),
                    //       ],
                    //     ),
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: Text('View store',
                    //           style: TextStyle(color: ColorManager.yellow)),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(height: 16),
                    const SizedBox(height: 16),

                    // Address
                    Text(
                      'ADDRESS',
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            product.address,
                            style: TextStyle(color: ColorManager.primary),
                            // softWrap: true,
                            // overflow: TextOverflow.visible,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Get Direction',
                              style: TextStyle(color: ColorManager.yellow)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Map Section
                    SizedBox(
                      height: 300,
                      child: FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(product.latitude,
                              product.longitude), // Center the map over London
                          initialZoom: 15.2,
                        ),
                        children: [
                          TileLayer(
                            // Display map tiles from any source
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
                            userAgentPackageName: 'com.example.app',
                            // And many more recommended properties!
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: LatLng(
                                   product.latitude,
                                    product.longitude),
                                width: 40,
                                height: 40,
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
