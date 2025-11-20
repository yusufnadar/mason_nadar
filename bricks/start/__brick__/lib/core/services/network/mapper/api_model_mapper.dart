class APIModelMapper {
  static List<T> jsonToList<T>(dynamic json, T Function(Map<String, dynamic>) fromJson) {
    return json.map((e) => fromJson(e)).toList().cast<T>();
  }

  static T jsonToItem<T>(dynamic json, T Function(Map<String, dynamic>) fromJson) => fromJson(json);
}
