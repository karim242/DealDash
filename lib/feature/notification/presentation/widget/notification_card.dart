import 'package:flutter/material.dart';

import '../../data/notification_item_model.dart';

Widget buildNotificationCard(NotificationItem item) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Notification Image
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            item.imageUrl,
            width: 70,
            height: 70,
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
                item.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        // Tag (New or Hot)
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            item.tag,
            style: TextStyle(
              color: item.tagColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
