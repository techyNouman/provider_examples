import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_count/provider/slider_provider.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<SliderProvider>(context);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SliderProvider>(builder: (ctx, value, child){
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer<SliderProvider>(builder: (ctx, value, child){
            return  Row(
              children: [
                Expanded(
                    child: Container(
                      height: 100,
                      decoration:
                      BoxDecoration(color: Colors.green.withOpacity(value.value)),
                      child: const Center(
                        child: Text("Container 1"),
                      ),
                    )),
                Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(color: Colors.red.withOpacity(value.value)),
                      child: const Center(
                        child: Text("Container 2"),
                      ),
                    ))
              ],
            );
          }),

        ],
      ),
    );
  }
}
