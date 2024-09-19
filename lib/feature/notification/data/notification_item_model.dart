import 'package:flutter/material.dart';

class NotificationItem {
  final String imageUrl;
  final String title;
  final String description;
  final String tag;
  final Color tagColor;

  NotificationItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.tag,
    required this.tagColor,
  });
}

final List<NotificationItem> notifications = [
  NotificationItem(
    imageUrl: 'assets/images/image_notification/bremer.jpg',
    title: 'Bremer',
    description: '10% off on all steaks. Limited time offer!',
    tag: 'New',
    tagColor: Colors.green,
  ),
  NotificationItem(
    imageUrl: 'assets/images/image_notification/kabbani.jpg',
    title: 'Kabbani Furniture',
    description: '50% off on all wooden furniture. Limited time offer!',
    tag: 'New',
    tagColor: Colors.green,
  ),
  NotificationItem(
    imageUrl: 'assets/images/image_notification/steng.jpg',
    title: 'Steng',
    description: 'Buy 1 Get 1 Free on all T-Shirts this weekend!',
    tag: 'Hot',
    tagColor: Colors.red,
  ),
  NotificationItem(
    imageUrl: 'assets/images/image_notification/justbakery.jpg',
    title: 'Just Bakery',
    description: 'Free delivery on all orders above 100 L.E .',
    tag: 'New',
    tagColor: Colors.green,
  ),
  NotificationItem(
    imageUrl: 'assets/images/image_notification/thespa.jpg',
    title: 'The Spa',
    description: 'Up to 30% off on selected services.',
    tag: 'Hot',
    tagColor: Colors.red,
  ),
  NotificationItem(
    imageUrl: 'assets/images/image_notification/galleryganna.jpg',
    title: 'Gallery Ganna',
    description: 'Exclusive offer: 20% off on luxury dining sets!',
    tag: 'New',
    tagColor: Colors.green,
  ),
];
