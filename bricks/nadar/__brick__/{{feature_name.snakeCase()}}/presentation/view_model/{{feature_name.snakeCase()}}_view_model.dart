import 'package:flutter/material.dart';

import '../../data/data_source/{{feature_name.snakeCase()}}_data_source.dart';
import '../../data/model/{{feature_name.snakeCase()}}_model.dart';

class {{feature_name.pascalCase()}}ViewModel extends ChangeNotifier {
  final {{feature_name.pascalCase()}}DataSource _dataSource;

  {{feature_name.pascalCase()}}ViewModel(this._dataSource);

  bool isLoading = false;

  void changeLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> sample() async {
    if (isLoading == true) return;
    changeLoading(true);
    final {{feature_name.camelCase()}}Model = {{feature_name.pascalCase()}}Model(sample: 'sample');
    final result = await _dataSource.sample({{feature_name.camelCase()}}Model: {{feature_name.camelCase()}}Model);
    result.fold(
      (error) => changeLoading(false),
      (response) async {
        changeLoading(false);
      },
    );
  }
}
