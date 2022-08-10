import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_with_repository/view_model/my_home_view_model.dart';

class MyHomePage extends ConsumerWidget {
  // StatefulWidgetからConsumerWidgetに変更

  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchメソッドのパラメータにChangeNotifierProviderに格納したMyHomeViewModelを取得する
    // これによって、_viewModelでnotifyListeners()が実行された場合、本Widgetのリビルドが走る
    final _viewModel = ref.watch(myHomeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
              const Text(
                'ボタンを押した回数:',
              ),
              Text(
                '${_viewModel.getCounter()}', // <-- _viewModelのgetCounter()
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  'メモ',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 12,
                ),
                const SelectableText(
                  'アプリ内容',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SelectableText(
                  '右下のFABをタップするとカウンタを+1する。',
                ),
                const SizedBox(height: 12),
                const SelectableText(
                  '使用したパッケージ',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 12),
                const SelectableText('・flutter_riverpod: ^1.0.4'),
                const SizedBox(height: 12),
                const SelectableText(
                  'アプリを作る流れ',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                const SizedBox(height: 12),
                const SelectableText(
                  '➀ モデルの実装\nResultModelというクラスを作成。int型のcounter = 0という変数を持っている。\nproviderにResultModelのインスタンスを持たせる',
                  style: TextStyle(height: 2),
                ),
                const SizedBox(height: 10),
                const SelectableText(
                  '➁ Repositoryの実装\nproviderにMyHomeRepositoryImpl(model: ref.read(resultModelProvider))を渡す\nabstract class(抽象クラス) MyHomeRepositoryを作成。Future<ResultModel> incrementCounter()という空のメソッドを含む',
                  style: TextStyle(height: 2),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 1010,
                  decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.black, width: 3))),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: SelectableText(
                      '※ abstract classとは何か?\n継承されることを前提とし、処理内容を記述しないメソッドを含むクラスのこと。\n抽象クラスのメリット: 抽象クラスを継承したサブクラスは、抽象クラスにある抽象メソッドを必ずオーバライドしなければならない。メソッドの実装忘れ、メソッド名の書き間違いなどを防ぐ。\nhttps://qiita.com/aiko_han/items/e8ddce85188970fd77da',
                      style: TextStyle(height: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                const SelectableText(
                  'MyHomeRepositoryImplというMyHomeRepositoryをimplementするクラスを作成。',
                  style: TextStyle(height: 2),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 1010,
                  decoration: const BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.black, width: 3))),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: SelectableText(
                      '※ implementsとは何か?\nインターフェイス(関数定義)を利用するために使用。全関数のオーバーライドが必須。',
                      style: TextStyle(height: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const SelectableText(
                  '➂ ViewModelの実装\nChangeNotifierProviderにViewModelを格納する。\nfinal myHomeViewModelProvider = ChangeNotifierProvider((ref) => MyHomeViewModel(repository: ref.read(myHomeRepositoryProvider)));\nMyHomeViewModelというクラスはChangeNotifierを継承する。\nint型の_counterをreturnするint getCounter()メソッドを作成する。\nまた、notifyListeners()を含むvoid incrementCounter()というメソッドを作成。notifyListeners()を実行することで、呼び出し元に変更が通知され、UIがリビルドされる。',
                  style: TextStyle(height: 2),
                ),
                const SizedBox(height: 10),
                const SelectableText(
                  '➃ Viewの実装\nfinal _viewModel = ref.watch(myHomeViewModelProvider);\n\${_viewModel.getCounter()}\nonPressed: _viewModel.incrementCounter,',
                  style: TextStyle(height: 2),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            _viewModel.incrementCounter, // <-- _viewModelのincrementCounter
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
