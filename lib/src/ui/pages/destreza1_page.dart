import 'package:app_arwise/src/ui/pages/activity_page.dart';
import 'package:app_arwise/src/ui/pages/destreza1_play_page.dart';
import 'package:app_arwise/src/ui/pages/menu_page.dart';
import 'package:flutter/material.dart';

class Destreza1Page extends StatefulWidget {
  const Destreza1Page();

  @override
  State<Destreza1Page> createState() => _Destreza1PageState();
}

class _Destreza1PageState extends State<Destreza1Page> {
  Widget portada() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Image.asset('assets/img/fondo_destreza1.png', fit: BoxFit.fill),
    );
  }

  Widget button(String title) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        child: SizedBox(
          width: 150,
          child: ElevatedButton(
            onPressed: () {
              if (title == 'DESATREZA 1') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ActivityPage()),
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
                onPrimary: const Color.fromARGB(255, 7, 13, 103),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
        ));
  }

  Widget btnOption(String title) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          if(title == 'MENU'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          }
          if(title == 'START'){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Destreza1PlayPage()),
            );
          }
          
        },
        child: Text(title),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(width: 3.0, color: Colors.black),
            ),
            primary: const Color.fromARGB(255, 45, 111, 79),
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      ),
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
            Positioned(
              right: MediaQuery.of(context).size.width * 0.10,
              left: MediaQuery.of(context).size.width * 0.10,
              bottom: MediaQuery.of(context).size.height * 0.15,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btnOption('MENU'),
                  btnOption('START')
                ],
              ),
            )
           
          ],
        ));
  }
}
