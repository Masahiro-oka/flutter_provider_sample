import 'package:flutter/material.dart';
import 'package:flutterapppractice/pages/myhome_page.dart';
import 'package:provider/provider.dart';

import 'components/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      providerを使うことでchildパラメータに指定したWidget以下全てのWidgetで、同じBLoCインスタンスにアクセスすることができる。
      home: Provider<CounterBloc>(
        create: (context) => CounterBloc(),
//      disposeパラメータを使うことで、Widgetとblocの生存期間を一緒にします。これをしないと必要ないblocがいつまでも残ってしまうことになる。
//      StatelessWidget だと自動で破棄されない、さらにInheritedWidgetでも破棄されないので、ここで指定しておく。
        dispose: (context, value) => value.dispose(),
        child: MyHomePage(title: 'BLoC_Test'),
      )
    );
  }
}
