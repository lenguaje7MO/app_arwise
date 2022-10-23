import 'package:app_arwise/src/domain/class/unity.dart';
import 'package:app_arwise/src/ui/page/menu_page.dart';
import 'package:app_arwise/src/ui/page/unity_desc_page.dart';
import 'package:app_arwise/src/ui/widgets/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UnityPage extends StatefulWidget {
  const UnityPage();

  @override
  State<UnityPage> createState() => _UnityPageState();
}

class _UnityPageState extends State<UnityPage> {
  List<Unity> listUnity = [];
  bool loadData = false;

  @override
  void initState() {
    loadDataUnity();
    super.initState();
  }

  void loadDataUnity() async {
    loadData = true;
    setState(() {});

    CollectionReference collRefUnits =
        FirebaseFirestore.instance.collection('units');
    collRefUnits
        .orderBy('id')
        .get()
        .then((value) => {
              // ignore: avoid_function_literals_in_foreach_calls
              value.docs.forEach((element) {
                print(element.data());
                listUnity.add(
                      Unity(
                        idDocument: element.id,
                        id: element['id'], 
                        title: element['title'],
                        titleUnit: element['titleUnit'],
                        titleDetail: element['titleDetail']));
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

  Widget button(Unity unity) {
    return Padding(
      padding:(unity.id==1)
      ? const EdgeInsets.only(top: 30, bottom: 14)
      : const EdgeInsets.only(top: 14, bottom: 14),
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 80, right: 80),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UnityDescPage(unity:unity)),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(' '),
              Text(unity.title.toString()),
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
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.80,
            child: (loadData)
                ? loader()
                : ListView.builder(
                    itemCount: listUnity.length,
                    itemBuilder: (BuildContext context, int index) {
                      return button(listUnity[index]);
                    })),
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
