import 'dart:async';

enum CounterAction {
  Increment,
  Decrement,
  Reset,
}

int counter;

class CounterBloc {
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _counterSink =>
      _counterStateController.sink; // this is for getting the input
  Stream<int> get counterStream =>
      _counterStateController.stream; // this is for the output

  final _eventStateController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStateController.sink;
  Stream<CounterAction> get _eventStream => _eventStateController.stream;

  CounterBloc() {
    counter = 0;
    _eventStream.listen((event) {
      if (event == CounterAction.Increment) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter--;
      } else if (event == CounterAction.Reset) {
        counter = 0;
      }
      _counterSink.add(counter);
    });
  }
}
