import 'package:dealdash/feature/search/data/model/offer_model.dart';
import 'package:flutter/material.dart';

import '../../data/model/notification_item_model.dart';

class NotificationCard extends StatelessWidget {

  final Offer offerDetails;
  const NotificationCard({super.key, required this.offerDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Notification Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              offerDetails.image ??
                  'https://media.istockphoto.com/id/681622484/photo/concrete-wall-shiny-smooth-backgrounds-white-textured.jpg?s=2048x2048&w=is&k=20&c=87J5-OznIqEEKD923thUgWZBNIiAD4oDVAmHSQYLr1o=',
              height: 70,
              width: 70,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 12),

          // Notification Title and Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  offerDetails.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  offerDetails.about,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Tag (New or Hot)
          // Padding(
          //   padding: const EdgeInsets.only(left: 8.0),
          //   child: Text(
          //     item.tag,
          //     style: TextStyle(
          //       color: item.tagColor,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

//
// Widget buildNotificationCard(Offer offerDetails) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8.0),
//     child: Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Notification Image
//         ClipRRect(
//           borderRadius: BorderRadius.circular(8.0),
//           child: Image.asset(
//             offerDetails.image,
//             width: 70,
//             height: 70,
//             fit: BoxFit.fill,
//           ),
//         ),
//         const SizedBox(width: 12),
//
//         // Notification Title and Description
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 offerDetails.name,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 offerDetails.about,
//                 style: TextStyle(
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//         // Tag (New or Hot)
//         // Padding(
//         //   padding: const EdgeInsets.only(left: 8.0),
//         //   child: Text(
//         //     item.tag,
//         //     style: TextStyle(
//         //       color: item.tagColor,
//         //       fontWeight: FontWeight.bold,
//         //     ),
//         //   ),
//         // ),
//       ],
//     ),
//   );
// }
