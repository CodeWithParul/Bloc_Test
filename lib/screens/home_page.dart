import 'package:bloctest/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloctest/blocs/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetBloc, InternetState>(
            listener: (context, state) {
              if (state is InternetGainedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                    content:  Text("Internet connected!!"),
                  backgroundColor: Colors.amber,
                  ),
                );
              }

              else if(state is InternetLostState)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                 const SnackBar(
                    content:  Text("Internet not connected!!"),
                  backgroundColor: Colors.orangeAccent,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is InternetGainedState) {
                return const Text("Connected");
              } else if (state is InternetLostState) {
                return const Text("Not Connected");
              } else {
                return const Text("Loading...");
              }
            },
          ),
        ),
      ),
    );
  }
}

  // BlocBuilder<InternetBloc, InternetState>(builder: (context, state) {
  //         if (state is InternetGainedState) {
  //           return const Text("Connected");
  //         } else if (state is InternetLostState) {
  //           return const Text("Not Connected");
  //         } else {
  //           return const Text("Loading...");
  //         }
  //       },
  //       ),