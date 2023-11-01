import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controller/controller.dart';

class InternationalizationPage extends StatefulWidget {
  const InternationalizationPage({super.key});

  @override
  State<InternationalizationPage> createState() => _InternationalizationPageState();
}

class _InternationalizationPageState extends State<InternationalizationPage> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internationalisation'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            children: [
              Text('hello'.tr,style: const TextStyle(fontSize: 25,color: Colors.purple)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _controller.changerDeLangue('en','US');
                      },
                      child: const Text('Anglais')
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    child: const Text("Francais"),
                    onPressed: () {
                      _controller.changerDeLangue('fr','FR');

                    },
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
