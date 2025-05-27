import 'package:flutter/material.dart';

import '../../data/data_source/home_data_source.dart';
import '../../data/model/home_model.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeDataSource _dataSource;

  HomeViewModel(this._dataSource);

  bool isLoading = false;

  void changeLoading(value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> sample() async {
    if (isLoading == true) return;
    changeLoading(true);
    final homeModel = HomeModel(sample: 'sample');
    final result = await _dataSource.sample(homeModel: homeModel);
    result.fold(
      (error) => changeLoading(false),
      (response) async {
        changeLoading(false);
      },
    );
  }
}
