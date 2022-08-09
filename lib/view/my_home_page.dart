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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ボタンを押した回数:',
            ),
            Text(
              '${_viewModel.getCounter()}', // <-- _viewModelのgetCounter()
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
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
