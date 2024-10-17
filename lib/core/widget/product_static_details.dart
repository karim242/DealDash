import 'package:dealdash/core/resources/color_manger/color_manager.dart';
import 'package:dealdash/feature/home/logic/product_model.dart';
import 'package:dealdash/feature/location/presentation/view/about_stores/presentation/widgets/side_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class ProductStaticDetails extends StatelessWidget {
  const ProductStaticDetails({super.key, required this.product});

  final ProductModel? product;
 
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
                  Image.asset(
                    product?.imagePath ?? '',
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
                            (product?.rate?? "4.5"),
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
                            product?.title ?? '',
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
                          "${product?.newPrice ?? 'free'} E ",
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
                     product?.title ?? '',
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
                         // SizedBox(width: 16.h),
                          VerticalDivider(
                            color: ColorManager.red,
                            thickness: 1,
                          ),
                          SizedBox(width: 16.h),
                          const SideText(
                              text:
                                  "30-10-2024 to 5-11-2024"),
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
                            "",
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
                          initialCenter: LatLng(double.parse("31.034883" ),
                                    double.parse("31.372013"),), // Center the map over London
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
                                point: LatLng(double.parse("31.034883" ),
                                    double.parse("31.372013"),),
                                    
                                width: 40,
                                height: 40,
                                child: const Icon(Icons.location_on,color: Colors.red,),
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
