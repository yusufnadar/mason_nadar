import 'package:flutter/material.dart';
import '../../data_source/user_data_source.dart';
import '../../model/user/user_model.dart';

class UserProvider with ChangeNotifier {
  final UserDataSource _dataSource;
  UserModel? user;

  UserProvider(this._dataSource);

  Future<void> getUser() async {
    final res = await _dataSource.getUser();
    return res.fold(
          (_) {},
          (response) {
        user = response;
        notifyListeners();
      },
    );
  }
}
