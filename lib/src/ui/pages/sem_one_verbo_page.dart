import 'package:app_arwise/src/ui/pages/menu_page.dart';
import 'package:app_arwise/src/ui/pages/sem_one_verbo_ejem_page.dart';
import 'package:app_arwise/src/ui/pages/unity_desc_page.dart';
import 'package:flutter/material.dart';

class SemOneVerboPage extends StatefulWidget {
  const SemOneVerboPage();

  @override
  State<SemOneVerboPage> createState() => _SemOneVerboPageState();
}

class _SemOneVerboPageState extends State<SemOneVerboPage> {
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
            height: MediaQuery.of(context).size.height * 1,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
               const Card(
                  elevation: 3,
                  color: Colors.white,
                  child: Center(
                    child: Text('VERBOS PERSONALES',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 23),
                        textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: double.infinity,
                  child: Image.asset('assets/img/logos/img_verbos.png'),
                ),
              ],
            ),
          ),
          Positioned(
            top:0,
            left: 0,
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset('assets/img/logos/esquina_amarilla.png'),
            ),
          ),
          Positioned(
            top:0,
            right: 0,
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset('assets/img/logos/esquina_rosa.png'),
            ),
          ),
          Positioned(
            bottom:0,
            left: 0,
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset('assets/img/logos/esquina_verde.png'),
            ),
          ),
          Positioned(
            top:0,
            right: 0,
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset('assets/img/logos/esquina_rosa.png'),
            ),
          ),
          Positioned(
            bottom:0,
            right: 0,
            child: SizedBox(
              height: 80,
              width: 80,
              child: Image.asset('assets/img/logos/esquina_azul.png'),
            ),
          ),

          Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
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
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SemOneVerboEjemPage()),
                    );
                    },
                    child: Icon(Icons.play_arrow,size: 40),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.red, 
                        onPrimary:Colors.black,
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
