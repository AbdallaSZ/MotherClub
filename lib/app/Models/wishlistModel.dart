class CreateWishlistModel {
  CreateWishlistModel({
    this.id,
    this.userId,
    this.dateAdded,
    this.title,
    this.shareKey,
    this.status,
  });

  final int? id;
  final int? userId;
  final DateTime? dateAdded;
  final String? title;
  final String? shareKey;
  final String? status;

  CreateWishlistModel copyWith({
    int? id,
    int? userId,
    DateTime? dateAdded,
    String? title,
    String? shareKey,
    String? status,
  }) =>
      CreateWishlistModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        dateAdded: dateAdded ?? this.dateAdded,
        title: title ?? this.title,
        shareKey: shareKey ?? this.shareKey,
        status: status ?? this.status,
      );
}
