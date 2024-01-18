import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_count/provider/count_provider.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  var countProvider = CountProvider();

  @override
  Widget build(BuildContext context) {
    countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter"),
      ),
      body: Center(
          child: Consumer<CountProvider>(builder: (context, value, child) {
        print("consumer build");
        return Text(
          value.count.toString(),
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
