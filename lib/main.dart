import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/ui/get_view_widget.dart';
import 'package:getx_project/ui/internationalization.dart';
import 'package:getx_project/ui/state_management.dart';
import 'data/messages.dart';
import 'ui/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tutoriel GetX',
        translations: Messages(),
      locale: const Locale('fr', 'FR'),
      defaultTransition: Transition.native,
      getPages: [
        GetPage(name:"/state_management_page",page:()=>const StateManagement()),
        GetPage(name:"/internationalization_page",page:()=>const InternationalizationPage()),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo Getx Flutter"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(blurRadius: 25.0)
            ]
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Get.snackbar('Snackbar', 'Contenu du Snackbar');
                          },

                          child: const Text('Test de la SnackBar')
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: 'Titre',
                              middleText: 'Contenu de la boite',
                              textConfirm: 'OK',
                              textCancel: "Annuler",

                              onConfirm: (){
                                Get.snackbar('Dialoge', 'Contenu');
                              },
                              onCancel: () {

                              }
                            );
                          },

                          child: const Text('Afficher boite de dialogue')
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Get.bottomSheet(
                              Container(
                                child: Wrap(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.wb_sunny_outlined, color: Colors.blueGrey),
                                      title: const Text('Dark mode', style: TextStyle(color: Colors.blueGrey)),
                                      onTap: (){
                                        Get.changeTheme(ThemeData.dark());
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(
                                        Icons.wb_sunny, color: Colors.blueGrey,
                                      ),
                                      title: const Text('Light Mode', style: TextStyle(color: Colors.blueGrey)),
                                      onTap: () {
                                        Get.changeTheme(ThemeData.light());
                                      },
                                    )
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                    color: Colors.yellow,
                                    width: 2
                                  )
                                )
                            );
                          },

                          child: const Text('Changer de thème')
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Get.to(
                              const Homepage(),
                              arguments:"Les données" ,
                              transition: Transition.fade,
                              duration: const Duration(seconds: 2),
                              fullscreenDialog: true

                          );
                        },

                        child:const Text("Page d'accueil"),
                      ),
                      //5)Routing for named routes && statement management
                      ElevatedButton(
                        onPressed: (){
                          //Get.toNamed("state_management_screen",);
                          Get.to(
                            const StateManagement(),
                            fullscreenDialog:true,
                          );

                        },

                        child:const Text("page de gestion d'etat"),
                      ),
                      //6)Internationalization
                      ElevatedButton(
                        onPressed: (){
                          Get.toNamed("internationalization_page");
                        },

                        child:const Text("Internationalization"),
                      ),
                      //Get view vs widget
                      ElevatedButton(
                        onPressed: (){
                          Get.to(
                              const GetViewVsWidget()
                          );
                        },
                        child: const Text("GetView vs GetWidget"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


