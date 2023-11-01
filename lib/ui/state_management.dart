import 'package:flutter/material.dart';
import 'package:getx_project/controller/controller.dart';
import 'package:get/get.dart';
import 'package:getx_project/data/book_data.dart';

class StateManagement extends StatefulWidget {
  const StateManagement({super.key});

  @override
  State<StateManagement> createState() => _StateManagementState();
}

class _StateManagementState extends State<StateManagement> {
  final Controller _controller = Get.put(Controller());
  Livre livre = Livre();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion d\'états'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            children: [
              Obx(
                    ()=>Text("Incrémentation :${_controller.count}", style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 1.5),
              ),
              const SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: (){
                    _controller.increment();
                  },
                  child: const Text("Increment")),
              const SizedBox(height: 20),
              Obx(
                    ()=>Text("Titre :${_controller.livre.titre} ", style: const TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 1.5),
              ),
              ElevatedButton(
                  onPressed: (){
                    _controller.mettreEnMajuscule();
                  },
                  child: const Text("En majuscule"))
            ],
          ),
        ),
      ),
    );
  }
}
