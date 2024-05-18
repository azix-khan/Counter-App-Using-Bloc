import 'package:counter_app_using_bloc/bloc/counter/counter_bloc.dart';
import 'package:counter_app_using_bloc/ui/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '*Counter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: true,
        ),
        home: const CounterScreen(),
      ),
    );
  }
}
