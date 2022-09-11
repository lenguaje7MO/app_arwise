import 'package:app_arwise/src/ui/pages/activities_page.dart';
import 'package:app_arwise/src/ui/pages/activity_page.dart';
import 'package:app_arwise/src/ui/pages/language_page.dart';
import 'package:app_arwise/src/ui/pages/presentation_detail_page.dart';
import 'package:app_arwise/src/ui/pages/unity_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage();

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  Widget button(String title,int idTitle) {
    return SizedBox(
      height:50,
      width:200,
      child:ElevatedButton(
      onPressed: () {
        if(idTitle==1){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UnityPage()),
          );
        }
        if(idTitle==4){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PresentationDetailPage()),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(' '),
          Text(title),
          const Icon(Icons.arrow_right)
        ],
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: const BorderSide(width: 3.0, color: Colors.black),
        ),
        primary: Colors.white,
        onPrimary: Colors.black,
        textStyle:const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffd9d9d9),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height:50,
                  width: 300,
                  child:Image.asset('assets/img/logos/logo_menu.png'),
                ),
                button('TEMAS',1),
                button('ACTIVIDADES',2),
                button('VIDEOS',3),
                button('SALIR',4),
                SizedBox(
                  height:100,
                  width: 100,
                  child:Image.asset('assets/img/logos/logo_mochila.png'),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5,
              child: SizedBox(
                height:50,
                width: 50,
                child:Image.asset('assets/img/logos/logo_linea_amarilla.png'),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              right:0,
              child: SizedBox(
                height:50,
                width: 50,
                child:Image.asset('assets/img/logos/logo_linea_verde.png'),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25,
              right:0,
              child: SizedBox(
                height:50,
                width: 50,
                child:Image.asset('assets/img/logos/logo_linea_azul.png'),
              ),
            )
          ],
        ),
    );
  }
}
