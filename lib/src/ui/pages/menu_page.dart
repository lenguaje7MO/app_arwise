import 'package:app_arwise/src/ui/pages/activities_page.dart';
import 'package:app_arwise/src/ui/pages/activity_page.dart';
import 'package:app_arwise/src/ui/pages/language_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage();

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Widget portada() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Image.asset('assets/img/fondo_menu.png', fit: BoxFit.fill),
    );
  }

  Widget button(String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 20, top: 20),
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
        onPressed: () {
          if(title=='ACTIVIDADES'){
            Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => const ActivitiesPage()),
            );
          }
          if(title=='SALIR'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LanguagePage()),
            );
          }
        },
        child: Text(title),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(width: 3.0, color: Colors.black),
          ),
          primary: Colors.white,
          onPrimary: Colors.red,
          textStyle:const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
       ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: portada(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    button('TEMAS'),
                    button('ACTIVIDADES',),
                    button('VIDEOS'),
                    button('SALIR')
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
