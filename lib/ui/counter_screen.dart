// ignore_for_file: avoid_print

import 'package:counter_app_using_bloc/bloc/Counter/counter_bloc.dart';
import 'package:counter_app_using_bloc/bloc/Counter/counter_event.dart';
import 'package:counter_app_using_bloc/bloc/Counter/counter_state.dart';
import 'package:counter_app_using_bloc/ui/visibility_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print("initial build111");
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 25, 178, 238),
        centerTitle: true,
        title: const Text(
          'Counter App Using Bloc',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 25, 178, 238),
              Color.fromARGB(255, 21, 236, 229),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("You have pushed the button this many times:"),
            //---> used when it is necessary to both rebuild UI and execute other reactions to state changes in the bloc
            /*
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state.counter == 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text("Counter value is ${state.counter.toString()}"),
                    ),
                  );
                }
              },
            builder: (context, state) {
              print("build");
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 60),
              );
            }),
            */
            //---> used when we want to draw a Widget based on what is the current State
            BlocBuilder<CounterBloc, CounterState>(
                buildWhen: (previous, current) {
              print("Privious: ${previous.counter}");
              print("Current: ${current.counter}");
              return true;
            }, builder: (context, state) {
              print("build");
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 60),
              );
            }),
            //---> allows you to select a specific value in a Provider to listen to
            BlocSelector<CounterBloc, CounterState, bool>(
                // selector is nothing but a fxn that takes the current state
                selector: (state) =>
                    state.counter % 2 ==
                    0, //if the count vaue is divided by 2 then it will return ture other wise false
                builder: (context, isEven) {
                  return isEven ? Text("Even") : Container();
                }),

            /* BlocListener used for functionality that needs to occur once per state change
            such as navigation, showing a SnackBar , showing a Dialog */
            BlocListener<CounterBloc, CounterState>(
              listenWhen: (previous, current) => true,
              listener: (context, state) {
                if (state.counter == 3) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text("Counter value is ${state.counter.toString()}"),
                    ),
                  );
                }
              },
              child: const Text('Bloc Listener'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Text('Increment'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Text('Decrement'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const VisibilityScreen()));
        },
        child: const Icon(Icons.visibility),
      ),
    );
  }
}
