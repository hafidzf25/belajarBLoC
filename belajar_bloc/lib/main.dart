import 'package:belajar_bloc/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final counter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: BlocBuilder(
              bloc: counter,
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: TextStyle(fontSize: 30),
                );
              }),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Icon(Icons.plus_one),
              onPressed: () => counter.increment(),
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              child: Icon(Icons.exposure_minus_1_rounded),
              onPressed: () => counter.decrement(),
            )
          ],
        ),
      ),
    );
  }
}
