import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page d'accueil"),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text("Il s'agit de la page d'accueil"),
              ElevatedButton(
                  onPressed: (){
                    Get.to(
                      Get.snackbar('snackbar', 'contenu')
                    );
                  },
                  child: const Text('Page suivante')
              ),
              // Recevoir les données depuis la page MainPage
              Text("${Get.arguments}"),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Page précédente')
              )
            ],
          ),
        ),
      ),
    );
  }
}
