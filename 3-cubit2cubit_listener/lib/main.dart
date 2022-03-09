import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/color/color_cubit.dart';
import 'cubit/counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cubit2Cubit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int increment = 1;
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          increment = 1;
        } else if (state.color == Colors.blue) {
          increment = 10;
        } else if (state.color == Colors.green) {
          increment = 100;
        } else if (state.color == Colors.black) {
          context.read<CounterCubit>().changeCounter(-100);
          increment = -100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        appBar: AppBar(
          title: const Text('Cubit2Cubit'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  context.read<ColorCubit>().changeColor();
                },
                child: const Text(
                  'Change Color',
                  style: TextStyle(fontSize: 25),
                ),
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 10),
              Text(
                context.watch<CounterCubit>().state.counter.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 35),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  context.read<CounterCubit>().changeCounter(increment);
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
