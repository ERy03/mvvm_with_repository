import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_with_repository/my_app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
