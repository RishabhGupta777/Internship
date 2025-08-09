import 'package:challenge1/ProviderTask/Task1/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderScreen1 extends StatelessWidget {
  const ProviderScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (ctx, _, __) {
            print("Consumer build function called!!");
            return Text(
              // '${Provider.of<CounterProvider>(ctx,).getCount()}',->iss tarike me by default listen=true
            '${ctx.watch<CounterProvider>().getCount()}',///->iss tarike se sochna hi nahi h ki listen ko likhe ya nahi
              style: const TextStyle(fontSize: 25),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Provider.of<CounterProvider>(context, listen: false).decrementCount(); ->iss tarike me listen likhna parta h
              context.read<CounterProvider>().decrementCount();///iss tarike me listen nahi likhna parta h
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              // Provider.of<CounterProvider>(context, listen: false).incrementCount(); ->iss tarike me listen likhna parta h
              context.read<CounterProvider>().incrementCount(5);///iss tarike me listen nahi likhna parta h
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
