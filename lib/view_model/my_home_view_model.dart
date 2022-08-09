import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_with_repository/repository/my_home_repository.dart';

final myHomeViewModelProvider = ChangeNotifierProvider((ref) {
  return MyHomeViewModel(repository: ref.read(myHomeRepositoryProvider));
});

class MyHomeViewModel extends ChangeNotifier {
  int _counter = 0;

  MyHomeRepository? repository;

  MyHomeViewModel({this.repository});

  int getCounter() {
    return _counter;
  }

  void incrementCounter() {
    repository?.incrementCounter().then((resultModel) {
      _counter = resultModel.counter;
      notifyListeners();
    });
  }
}
