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
    imageUrl:
        'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/387876568_749206823917137_4796009248338038287_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Bfr6cWeYDdIQ7kNvgGfqPk2&_nc_ht=scontent.fcai19-12.fna&_nc_gid=ApAMxSZrX2erwxh1Zl92XXb&oh=00_AYCNoQQ_KNr9z2eB6zWlPOQjk6vUURSNmv4CQ74m4AOLxQ&oe=66ED0E79',
    title: 'Bremer',
    description: '10% off on all steaks. Limited time offer!',
    tag: 'New',
    tagColor: Colors.green,
  ),
  NotificationItem(
    imageUrl:
        'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/315775930_499878842169312_3064786271273637681_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=dINhyETGGvMQ7kNvgGNhKA2&_nc_ht=scontent.fcai19-12.fna&oh=00_AYC75jJzC09g7Z_uKBkv_9TEtTJH1FGJZI2PYH7l3mobRw&oe=66ECFAA0',
    title: 'Kabbani Furniture',
    description: '50% off on all wooden furniture. Limited time offer!',
    tag: 'New',
    tagColor: Colors.green,
  ),
  NotificationItem(
    imageUrl:
        'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/307089355_6208573015824909_1894586315676160423_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=5UomJ6HNy_EQ7kNvgGDM7Kx&_nc_ht=scontent.fcai19-12.fna&_nc_gid=ALGWoB4s5_VSTEooLYYj9JE&oh=00_AYAInTl8ifC5HMrNeOOCVuPd9FdWKCkLqb8oDTV4qo7lDg&oe=66ECF0C5',
    title: 'Steng',
    description: 'Buy 1 Get 1 Free on all T-Shirts this weekend!',
    tag: 'Hot',
    tagColor: Colors.red,
  ),
  NotificationItem(
    imageUrl:
        'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/393399117_724497046377329_6424704957505470940_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=Oiu6dALkqgoQ7kNvgEXcvQZ&_nc_ht=scontent.fcai19-12.fna&_nc_gid=AMg7v8WRVncbD7hRsjLQl_J&oh=00_AYAnS27tRvdFnctTvQMRHDfNhvDxvz481lcUPNW1UjIB1g&oe=66ECEF73',
    title: 'Just Bakery',
    description: 'Free delivery on all orders above 100 L.E .',
    tag: 'New',
    tagColor: Colors.green,
  ),
  NotificationItem(
    imageUrl:
        'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/414110284_349931011119929_7827086596895627449_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=-32t5jIDz0AQ7kNvgGWyuiO&_nc_ht=scontent.fcai19-12.fna&_nc_gid=Ame5txZrf9yJB-sd3Mr7SUw&oh=00_AYBPriyezNZxOSmLb1QInYnLrkvlePfuq567LdwMshYflw&oe=66ED06D4',
    title: 'The Spa',
    description: 'Up to 30% off on selected services.',
    tag: 'Hot',
    tagColor: Colors.red,
  ),
  NotificationItem(
    imageUrl:
        'https://scontent.fcai19-12.fna.fbcdn.net/v/t39.30808-6/393914982_733247025514292_2470740548751911269_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=SNkI2hVhp78Q7kNvgHupi2U&_nc_ht=scontent.fcai19-12.fna&_nc_gid=ATyJ1ivv4WwW2Dvjlj5HVwA&oh=00_AYARhCRaViHr0lIN5gUxId5LJSLhRHqOrShNTRrhQdbz6g&oe=66ECF8B3',
    title: 'Gallery Ganna',
    description: 'Exclusive offer: 20% off on luxury dining sets!',
    tag: 'New',
    tagColor: Colors.green,
  ),
];
