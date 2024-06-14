import 'package:counter_app_using_bloc/bloc/Counter/counter_bloc.dart';
import 'package:counter_app_using_bloc/bloc/Visibility/visibility_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => VisibilityBloc()),
      ],
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
