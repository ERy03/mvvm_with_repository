import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providerの作成。ProviderにResultModelのインスタンスを保持させる。
final resultModelProvider = Provider((ref) => ResultModel());

class ResultModel {
  int counter = 0;
}

// ResultModelはインクリメントしたカウンタの内容をcounter(int型)という変数で保持するクラス
