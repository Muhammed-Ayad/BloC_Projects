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
            create: (context) => CounterCubit(
                  colorCubit: context.read<ColorCubit>(),
                )),
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
    return Scaffold(
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
                context.read<CounterCubit>().changeCounter();
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
    );
  }
}
