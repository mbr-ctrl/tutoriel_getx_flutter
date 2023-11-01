import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/controller/controller.dart';

class GetViewVsWidget extends GetView<Controller> {
  const GetViewVsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    //Get.create(() => CountController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetView and GetWidget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
                  () => Text(
                'Valeur: ${controller.count}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: const Text('Incrementé'),
              onPressed: () {
                print(controller.hashCode);
                controller.increment();
              },
            ),
          ],
        ),
      ),
    );

  }
}
