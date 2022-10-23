import 'package:app_arwise/src/domain/class/content.dart';
import 'package:app_arwise/src/domain/class/unity.dart';
import 'package:app_arwise/src/domain/class/week.dart';
import 'package:app_arwise/src/ui/page/concept_page.dart';
import 'package:app_arwise/src/ui/widgets/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UnityWeekPage extends StatefulWidget {
  Unity unity;
  Week week;
  UnityWeekPage({required this.unity, required this.week});

  @override
  State<UnityWeekPage> createState() => _UnityWeekPageState();
}

class _UnityWeekPageState extends State<UnityWeekPage> {
  List<Content> listContent = [];
  bool loadData = false;

  @override
  void initState() {
    loadDataContent();
    super.initState();
  }

  void loadDataContent() async {
    loadData = true;
    setState(() {});

    CollectionReference collRefUnits = FirebaseFirestore.instance
        .collection('units')
        .doc(widget.unity.idDocument)
        .collection('weeks')
        .doc(widget.week.idDocument)
        .collection('contents');

    collRefUnits
        .orderBy('id')
        .get()
        .then((value) => {
              // ignore: avoid_function_literals_in_foreach_calls
              value.docs.forEach((element) {
                print(element.data());
                listContent.add(Content(
                    idDocument: element.id,
                    id: element['id'],
                    title: element['title'],
                    urlConcept: element['urlConcept'],
                    urlExample: element['urlExample']));
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



  Widget buttonContent(Content content) {
    return Padding(
      padding:const EdgeInsets.only(top:5,bottom: 5),
      child:SizedBox(
        width: 150,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ConceptPage(content: content)),
            );
          },
          child:  Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Text(content.title.toString(), textAlign: TextAlign.center),
          ),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(width: 4.0, color: Color(0xfff887a6c)),
              ),
              primary: const Color(0xfffb29f8c),
              onPrimary: Colors.black,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        )));
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Image.asset('assets/img/logos/logo6.png',
                        fit: BoxFit.fill),
                  ),
                  
                  Text(widget.unity.title.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30)),
                  Text(widget.week.title.toString(),
                      style: const TextStyle(fontSize: 30)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01/5),
                  SizedBox(
                    width: 200,
                    height: MediaQuery.of(context).size.height * 0.80,
                    child: (loadData)
                      ? loader()
                      : ListView.builder(
                          itemCount: listContent.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buttonContent(listContent[index]);
                          })),
                ],
              )),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.15,
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
              bottom: MediaQuery.of(context).size.height * 0.10,
              left: 0,
              right: 0,
              child: Center(
                  child: SizedBox(
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
                        side: const BorderSide(width: 4.0, color: Colors.black),
                      ),
                      primary: const Color(0xfffcd24f),
                      onPrimary: Colors.black,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              )))
        ],
      ),
    );
  }
}
