import 'package:counter_app_using_bloc/bloc/Visibility/visibility_bloc.dart';
import 'package:counter_app_using_bloc/bloc/Visibility/visibility_event.dart';
import 'package:counter_app_using_bloc/bloc/Visibility/visibility_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityScreen extends StatefulWidget {
  const VisibilityScreen({super.key});

  @override
  State<VisibilityScreen> createState() => _VisibilityScreenState();
}

class _VisibilityScreenState extends State<VisibilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<VisibilityBloc, VisibilityState>(
              buildWhen: (previous, current) {
                print("Privious:${previous.show}");
                print("Privious:${current.show}");
                return true;
              },
              builder: (context, state) {
                return Visibility(
                  visible: state.show,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.amber,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.read<VisibilityBloc>().add(VisibilityShowEvent());
                  },
                  child: const Text(
                    "Show",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    context.read<VisibilityBloc>().add(VisibilityHideEvent());
                  },
                  child: const Text(
                    "Hide",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
