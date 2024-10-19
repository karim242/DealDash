import 'package:dealdash/feature/search/data/model/offer_model.dart';

class NotificationListResponse {
  final bool success;
  final String message;
  final List<NotificationItem> data;
  final Meta meta;
  final Links links;

  NotificationListResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.meta,
    required this.links,
  });

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) {
    return NotificationListResponse(
      success: json['success'],
      message: json['message'],
      data: List<NotificationItem>.from(json['data']
          .map((notification) => NotificationItem.fromJson(notification))),
      meta: Meta.fromJson(json['meta']),
      links: Links.fromJson(json['links']),
    );
  }
}

class NotificationReadResponse {
  final bool success;
  final String message;
  final List<NotificationItem>? data;
  final Meta? meta;
  final Links? links;

  NotificationReadResponse({
    required this.success,
    required this.message,
    this.data,
    this.meta,
    this.links,
  });

  factory NotificationReadResponse.fromJson(Map<String, dynamic> json) {
    return NotificationReadResponse(
      success: json['success'],
      message: json['message'],
      // data: List<NotificationItem>.from(json['data']
      //     .map((notification) => NotificationItem.fromJson(notification))),
      // meta: Meta.fromJson(json['meta']),
      // links: Links.fromJson(json['links']),
    );
  }
}

class NotificationItem {
  final String id;
  final String type;
  final String notifiableType;
  final int notifiableId;
  final Offer data;
  final DateTime? readAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NotificationItem({
    required this.id,
    required this.type,
    required this.notifiableType,
    required this.notifiableId,
    required this.data,
    required this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      type: json['type'],
      notifiableType: json['notifiable_type'],
      notifiableId: json['notifiable_id'],
      data: Offer.fromJson(json['data']),
      // data: Data.fromJson(json['data']),
      // readAt: DateTime.parse(json['read_at']),
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}

// class Data {
//   final Offer offerDetails;
//
//   Data({
//     required this.offerDetails,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       offerDetails: Offer.fromJson(json['offer_details']),
//     );
//   }
//
//
// }

class Meta {
  final int currentPage;
  final int totalCount;
  final int perPage;
  final int totalPages;
  final bool hasMorePages;

  Meta({
    required this.currentPage,
    required this.totalCount,
    required this.perPage,
    required this.totalPages,
    required this.hasMorePages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['current_page'],
      totalCount: json['total_count'],
      perPage: json['per_page'],
      totalPages: json['total_pages'],
      hasMorePages: json['has_more_pages'],
    );
  }
}

class Links {
  final String? nextPageUrl;
  final String? prevPageUrl;
  final String firstPageUrl;
  final String lastPageUrl;

  Links({
    this.nextPageUrl,
    this.prevPageUrl,
    required this.firstPageUrl,
    required this.lastPageUrl,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      nextPageUrl: json['next_page_url'],
      prevPageUrl: json['prev_page_url'],
      firstPageUrl: json['first_page_url'],
      lastPageUrl: json['last_page_url'],
    );
  }
}
