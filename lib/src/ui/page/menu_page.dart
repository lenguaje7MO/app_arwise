import 'package:app_arwise/src/domain/class/link.dart';
import 'package:app_arwise/src/ui/page/presentation_detail_page.dart';
import 'package:app_arwise/src/ui/page/unity_page.dart';
import 'package:app_arwise/src/ui/widgets/loader.dart';
import 'package:app_arwise/src/utils/urls.dart';
import 'package:app_arwise/src/utils/utilities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage();

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Link> listLink = [];
  bool loadData = false;

  @override
  void initState() {
    loadDataLinks();
    super.initState();
  }

  void loadDataLinks() async {
    loadData = true;
    setState(() {});

    CollectionReference collRefUnits =
        FirebaseFirestore.instance.collection('links');
    collRefUnits
        .get()
        .then((value) => {
              // ignore: avoid_function_literals_in_foreach_calls
              value.docs.forEach((element) {
                print(element.data());
                listLink.add(Link(
                    idDocument: element.id,
                    urlActivities: element['urlActivities'],
                    urlVideos: element['urlVideos']));
              })
            })
        .whenComplete(() => {
              loadData = false,
              setState(() {}),
            })
        // ignore: argument_type_not_assignable_to_error_handler
        .catchError((err) => {
              loadData = false,
              setState(() {}),
            });
  }

  Widget button(String title, int idTitle) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          if (idTitle == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UnityPage()),
            );
          }
          if (idTitle == 2) {
            if(listLink.isNotEmpty){
              launchUrlUtil(listLink[0].urlActivities.toString());
            }
          }
          if (idTitle == 3) {
            if (listLink.isNotEmpty) {
              launchUrlUtil(listLink[0].urlVideos.toString());
            }
          }
          if (idTitle == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const PresentationDetailPage()),
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
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9d9d9),
      body: Stack(
        children: [
          loadData
              ? loader()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: Image.asset('assets/img/logos/logo_menu.png'),
                    ),
                    button('TEMAS', 1),
                    button('ACTIVIDADES', 2),
                    button('VIDEOS', 3),
                    button('SALIR', 4),
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/img/logos/logo_mochila.png'),
                    ),
                  ],
                ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/img/logos/logo_linea_amarilla.png'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            right: 0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/img/logos/logo_linea_verde.png'),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            right: 0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/img/logos/logo_linea_azul.png'),
            ),
          )
        ],
      ),
    );
  }
}
