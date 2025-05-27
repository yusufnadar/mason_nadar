import 'package:flutter/material.dart';

import '../../data/data_source/landing_data_source.dart';
import '../../data/model/landing_model.dart';

class LandingViewModel extends ChangeNotifier {
  final LandingDataSource _dataSource;

  LandingViewModel(this._dataSource);

  bool isLoading = false;

  void changeLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> sample() async {
    if (isLoading == true) return;
    changeLoading(true);
    final landingModel = LandingModel(sample: 'sample');
    final result = await _dataSource.sample(landingModel: landingModel);
    result.fold(
      (error) => changeLoading(false),
      (response) async {
        changeLoading(false);
      },
    );
  }
}
