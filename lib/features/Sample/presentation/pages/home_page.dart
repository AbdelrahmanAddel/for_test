import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:for_test/features/Sample/presentation/bloc/test_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<TestBloc>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              '${bloc.counter}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            ElevatedButton(
              onPressed: () {
                context.read<TestBloc>().add(TestEventIncrement());
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
