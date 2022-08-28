import 'package:app_arwise/src/ui/pages/activity_page.dart';
import 'package:app_arwise/src/ui/pages/destreza1_page.dart';
import 'package:app_arwise/src/ui/pages/menu_page.dart';
import 'package:flutter/material.dart';

class Destreza1PlayPage extends StatefulWidget {
  const Destreza1PlayPage();

  @override
  State<Destreza1PlayPage> createState() => _Destreza1PlayPageState();
}

class _Destreza1PlayPageState extends State<Destreza1PlayPage> {
  Widget portada() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Image.asset('assets/img/fondo_destreza1_play.png', fit: BoxFit.fill),
    );
  }

  Widget button(String title) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 100,
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(title),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(width: 3.0, color: Colors.black),
                ),
                primary: Colors.white,
                onPrimary: const Color.fromARGB(255, 7, 13, 103),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 9)),
          ),
        ));
  }

  Widget btnBack() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
        },
        child: const Text('MENU'),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(width: 3.0, color: Colors.black),
            ),
            primary: const Color.fromARGB(255, 45, 111, 79),
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
             portada(),
          
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    button('BLOQUE DE LECTURA'),
                    button('BLOQUE DE ESCRITURA'),
                    button('BLOQUE DE COMUNICACIÓN ORAL'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    button('BLOQUE DE LITERATURA'),
                    button('BLOQUE DE LENGUA Y CULTURA'),
                  ],
                ),
           
               
              ],
            ),
            
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: btnBack(),
       
        );
  }
}
