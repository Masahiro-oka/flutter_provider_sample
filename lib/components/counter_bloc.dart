import 'dart:async';

class CounterBloc{

  int _counter = 0;

  final _actionController = StreamController<void>();
//  _actionControllerがprivate変数なので、getterで他のファイルから_actionControllerを参照のみを可能とする。
  Sink<void> get increment => _actionController.sink;

  final _countController = StreamController<int>();
  Stream<int> get count => _countController.stream;

  CounterBloc(){
//    (_)を使用するということは、この（）内のパラメーターを使用しない場合に用いる。
//  コンストラクタ内で監視。
    _actionController.stream.listen((event) {
      print('押された');
      _counter++;
      _countController.sink.add(_counter);
    },
    onError: (e) => print('エラー$e')
    );
  }

  void dispose(){
    print('なくなった');
    _actionController.close();
    _countController.close();
  }
}