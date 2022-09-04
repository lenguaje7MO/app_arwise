import 'package:app_arwise/src/ui/pages/destreza1_page.dart';
import 'package:flutter/material.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage();

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  Widget portada() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Image.asset('assets/img/fondo_actividades.png', fit: BoxFit.fill),
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
                  MaterialPageRoute(builder: (context) => const Destreza1Page()),
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

  Widget btnBack() {
    return Positioned(
      right: 0,
      bottom: MediaQuery.of(context).size.height * 0.10,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    button('DESATREZA 1'),
                    button('DESATREZA 2'),
                    button('DESATREZA 3'),
                    button('DESATREZA 4'),
                    button('DESATREZA 5')
                  ],
                )
              ],
            ),
            btnBack()
          ],
        ));
  }
}
