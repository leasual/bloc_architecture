import 'package:bloc_architecture/ui/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            color: Colors.green,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (state is CounterIncrementState)
                    ? Text("bloc counter= ${state.counter}")
                : Container(),
                Text("bloc counter= $state"),
                FloatingActionButton(
                  child: Icon(Icons.add, color: Colors.white,),
                  onPressed: () {
                    context.bloc<CounterBloc>().add(CounterIncrementEvent());
                  },
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
