import 'package:bloc_architecture/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

final _counterBloc = CounterBloc();

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _counterBloc,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          body: SafeArea(child: _counterWidgetBody(context)),
        ),
      ),
    );
  }

  Widget _counterWidgetBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _incrementCounterWidget(context),
          SizedBox(
            height: 10,
          ),
          _decrementCounterWidget(context),
          SizedBox(
            height: 10,
          ),
          BlocBuilder<CounterBloc, CounterInitialState>(
            builder: (context, state) {
              return Text(_counterBloc.state.counterNumber.toString());
            },
          ),
        ],
      ),
    );
  }

  Widget _incrementCounterWidget(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _counterBloc.add(IncrementEvent());
        },
        child: Icon(Icons.add));
  }

  Widget _decrementCounterWidget(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _counterBloc.add(DecrementEvent());
        },
        child: Icon(Icons.remove));
  }
}

@override
void dispose() {
  _counterBloc.close();
}
