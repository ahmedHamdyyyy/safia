class GuestUserModel {
  final String guestId;
  final DateTime createdAt;
  final bool isGuest;

  GuestUserModel({
    required this.guestId,
    required this.createdAt,
    this.isGuest = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'guestId': guestId,
      'createdAt': createdAt.toIso8601String(),
      'isGuest': isGuest,
    };
  }

  factory GuestUserModel.create() {
    return GuestUserModel(
      guestId: 'guest_${DateTime.now().millisecondsSinceEpoch}',
      createdAt: DateTime.now(),
    );
  }

  factory GuestUserModel.fromJson(Map<String, dynamic> json) {
    return GuestUserModel(
      guestId: json['guestId'],
      createdAt: DateTime.parse(json['createdAt']),
      isGuest: json['isGuest'],
    );
  }
} 