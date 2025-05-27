class HomeModel {
  final String sample;

  HomeModel({required this.sample});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        sample: json['sample'],
      );

  Map<String, dynamic> toJson() => {
        'sample': sample,
      };
}
