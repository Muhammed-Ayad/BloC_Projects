import 'package:bloc2bloc/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/color/color_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BolC2BloC',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int increment = 1;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          increment = 1;
        } else if (state.color == Colors.blue) {
          increment = 10;
        } else if (state.color == Colors.green) {
          increment = 100;
        } else if (state.color == Colors.black) {
          increment = -100;
          context
              .read<CounterBloc>()
              .add(ChangeCounterEvent(increment: increment));
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.color,
        appBar: AppBar(
          title: const Text('BolC2BloC'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  context.read<ColorBloc>().add(ChangeColorEvent());
                },
                child: const Text(
                  'Change Color',
                  style: TextStyle(fontSize: 25),
                ),
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 10),
              Text(
                context.watch<CounterBloc>().state.counter.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 35),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(ChangeCounterEvent(increment: increment));
                },
                child: const Text(
                  'Increment Counter',
                  style: TextStyle(fontSize: 25),
                ),
                color: Colors.grey.shade300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
