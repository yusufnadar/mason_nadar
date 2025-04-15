class {{feature_name.pascalCase()}}Model {
  final String sample;

  {{feature_name.pascalCase()}}Model({required this.sample});

  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) => {{feature_name.pascalCase()}}Model(
        sample: json['sample'],
      );

  Map<String, dynamic> toJson() => {
        'sample': sample,
      };
}
