class WishlistModel {
  WishlistModel({
    this.id,
    this.userId,
    this.dateAdded,
    this.title,
    this.shareKey,
    this.status,
  });

  final int? id;
  final int? userId;
  final String? dateAdded;
  final String? title;
  final String? shareKey;
  final String? status;

  WishlistModel copyWith({
    int? id,
    int? userId,
    String? dateAdded,
    String? title,
    String? shareKey,
    String? status,
  }) =>
      WishlistModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        dateAdded: dateAdded ?? this.dateAdded,
        title: title ?? this.title,
        shareKey: shareKey ?? this.shareKey,
        status: status ?? this.status,
      );
}
