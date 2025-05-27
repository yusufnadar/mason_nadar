class BasePaginationModel<T> {
  final String? nextToken;

  BasePaginationModel({this.nextToken});

  factory BasePaginationModel.fromJson(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return BasePaginationModel(nextToken: json['next_token']);
  }
}
