class TokenModel {
  final String accessToken;

  TokenModel({required this.accessToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        accessToken: json['accessToken'],
      );
}
