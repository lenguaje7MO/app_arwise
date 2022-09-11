import 'package:app_arwise/src/ui/pages/menu_page.dart';
import 'package:app_arwise/src/ui/pages/unity_desc_page.dart';
import 'package:flutter/material.dart';

class UnityPage extends StatefulWidget {
  const UnityPage();

  @override
  State<UnityPage> createState() => _UnityPageState();
}

class _UnityPageState extends State<UnityPage> {
  Widget button(String title, int idUnidad) {
    String titleUnidad = '';
    String descriptionUnidad = '';
    if (idUnidad == 1) {
      titleUnidad = 'Observación y Razonamiento';
      descriptionUnidad = 'Escribir descripciones organizadas y con vocabulario especí­fico relativo al ser, objeto, lugar o hecho que se describe e integrarlas en producciones escritas';
    }
    if (idUnidad == 2) {
      titleUnidad = 'Noticias que cuentan';
      descriptionUnidad = '';
    }
    if (idUnidad == 3) {
      titleUnidad = 'PASO A PASO';
      descriptionUnidad = '';
    }
    if (idUnidad == 4) {
      titleUnidad = 'Aprendamos con la enciclopedia';
      descriptionUnidad = '';
    }
    if (idUnidad == 5) {
      titleUnidad = 'Lectura de una reseña';
      descriptionUnidad = '';
    }
    if (idUnidad == 6) {
      titleUnidad = 'Describamos el mundo y sus personajes';
      descriptionUnidad = '';
    }

    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 80, right: 80),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UnityDescPage(
                    idUnity: idUnidad,
                    title: titleUnidad,
                    description: descriptionUnidad)),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
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
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 1),
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(height:50),
                button('UNIDAD 1', 1),
                SizedBox(height:14),
                button('UNIDAD 2', 2),
                SizedBox(height:14),
                button('UNIDAD 3', 3),
                SizedBox(height:14),
                button('UNIDAD 4', 4),
                SizedBox(height:14),
                button('UNIDAD 5', 5),
                SizedBox(height:14),
                button('UNIDAD 6', 6),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            right: 5,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/img/logos/logo_linea_verdefb.png'),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            right: 5,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/img/logos/logo_linea_azulfb.png'),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.4,
            left: 5,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/img/logos/logo_linea_amarillafb.png'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 5,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/img/logos/logo_linea_rosafb.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width * 0.30,
              child: Image.asset('assets/img/logos/logo_verticales.png',
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.45,
            right: 10,
            child: const Icon(Icons.brightness_1, color: Colors.red),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            left: 10,
            child: const Icon(Icons.brightness_1, color: Colors.yellow),
          ),
          Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuPage()),
                      );
                    },
                    child: const Text('BACK <'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: const BorderSide(
                              width: 4.0, color: Color(0xfffea8439)),
                        ),
                        primary: const Color(0xfffcd24f),
                        onPrimary: Colors.black,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MenuPage()),
                      );
                    },
                    child: const Text('MENU'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: const BorderSide(
                              width: 3.0, color: Color(0xfffea8439)),
                        ),
                        primary: const Color(0xfffcd24f),
                        onPrimary: Colors.black,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
