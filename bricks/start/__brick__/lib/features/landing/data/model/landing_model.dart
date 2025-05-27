class LandingModel {
  final String sample;

  LandingModel({required this.sample});

  factory LandingModel.fromJson(Map<String, dynamic> json) => LandingModel(
        sample: json['sample'],
      );

  Map<String, dynamic> toJson() => {
        'sample': sample,
      };
}
