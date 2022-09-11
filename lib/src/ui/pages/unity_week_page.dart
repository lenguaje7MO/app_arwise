import 'dart:ui';

import 'package:app_arwise/src/ui/pages/menu_page.dart';
import 'package:app_arwise/src/ui/pages/sem_one_diptongo_page.dart';
import 'package:app_arwise/src/ui/pages/sem_one_verbo_page.dart';
import 'package:app_arwise/src/ui/pages/unity_desc_page.dart';
import 'package:flutter/material.dart';

class UnityWeekPage extends StatefulWidget {
  const UnityWeekPage();

  @override
  State<UnityWeekPage> createState() => _UnityWeekPageState();
}

class _UnityWeekPageState extends State<UnityWeekPage> {
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
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1),
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width * 0.30,
              child: Image.asset('assets/img/logos/fondo_blanco_cabecera.png',
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 160,
                width: 160,
                child: Image.asset('assets/img/logos/logo6.png',
                  fit: BoxFit.fill),
                ),
                
                const Text('UNIDAD 1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30)),
                const Text('SEMANA 1',style: TextStyle(fontSize: 30)),
                const SizedBox(height:40),
                SizedBox(
                width: 180,
                child:ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SemOneDiptongoPage()),
                    );
                  },
                  child:const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right:10),
                    child:  Text('EL DIPTONGO',textAlign: TextAlign.center),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(
                      width: 4.0,  color: Color(0xfff887a6c)),
                    ),
                    primary: const Color(0xfffb29f8c),
                    onPrimary: Colors.black,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
                  )),
                const SizedBox(height:40),
                SizedBox(
                width: 180,
                child:ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SemOneVerboPage()),
                    );
                  },
                  child:const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 10,right:10),
                    child:  Text('VERBOS PERSONALES',textAlign: TextAlign.center),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: const BorderSide(
                      width: 4.0, color: Color(0xfff887a6c)),
                    ),
                    primary: const Color(0xfffb29f8c),
                    onPrimary: Colors.black,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20)),
                  )),
              ],
            )    
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.width * 0.30,
              child: Image.asset('assets/img/logos/fondo_blanco_pie.png',
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
            child:Center(
            child:SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('BACK <'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: const BorderSide(
                             width: 4.0, color: Colors.black),
                        ),
                        primary: const Color(0xfffcd24f),
                        onPrimary: Colors.black,
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            ))
          )
        ],
      ),
    );
  }
}
