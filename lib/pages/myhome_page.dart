import 'package:flutter/material.dart';
import 'package:flutterapppractice/components/counter_bloc.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
//    BLoC(providerを使う時)はbuild()メソッドで呼ぶ。
    final countStream = Provider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
//              最初に表示しておくもの。
              initialData: 0,
//              これがsnapshotに入るデータ。StreambuilderはStreamから流れてくるイベントを常に監視する。
              stream: countStream.count,
              builder: (context, snapshot) {
                return Text(
//              snapshotからデータを取得。
                '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => countStream.increment.add(null),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
