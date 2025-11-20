class UserModel {
  final String id;
  final bool isPremium;

  UserModel({required this.id, required this.isPremium});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        isPremium: json['isPremium'],
      );
}
