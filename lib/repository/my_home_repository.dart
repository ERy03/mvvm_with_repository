// Repositoryを作る意味は？ViewModelだけではダメなのか？
// ViewModelがどこからデータを取得・更新するのかを意識させないためにビジネスロジックとデータ操作を分離する。

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_with_repository/model/result_model.dart';

final myHomeRepositoryProvider = Provider(
    // watchではなく、readを使用した理由は？
    // read()はproviderのvalueを一度しか取得しない。watch()は常に監視してる状態。
    (ref) => MyHomeRepositoryImpl(model: ref.read(resultModelProvider)));

// abstract classとは？このクラスを作る理由は？
// 抽象クラスのこと。継承されることを前提とし、処理内容を記述しないメソッドを含むクラス。
// 抽象クラスのメリット：抽象クラスを継承したサブクラスは、抽象クラスにある抽象メソッドを必ずオーバライドしなければならない。メソッドの実装忘れ、メソッド名の書き間違いなどを防ぐ。
// https://qiita.com/aiko_han/items/e8ddce85188970fd77da
abstract class MyHomeRepository {
  Future<ResultModel> incrementCounter();
}

// implementsとは？
// インターフェイス（関数定義）を利用するために使用。全関数のオーバーライドが必須。
class MyHomeRepositoryImpl implements MyHomeRepository {
  MyHomeRepositoryImpl({required ResultModel model}) : _model = model;

  final ResultModel _model;

  @override
  Future<ResultModel> incrementCounter() {
    _model.counter = _model.counter + 1;
    // Future.valueとは？
    return Future.value(_model);
  }
}
