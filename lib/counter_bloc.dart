import 'dart:async';

class CounterBloc {
  final _counterStateController = StreamController<int>();
  StreamSink<int> get counterSink =>
      _counterStateController.sink; // this is for getting the input
  Stream<int> get counterStream =>
      _counterStateController.stream; // this is for the output

}
