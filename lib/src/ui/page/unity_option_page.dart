import 'package:app_arwise/src/domain/class/unity.dart';
import 'package:app_arwise/src/domain/class/week.dart';
import 'package:app_arwise/src/ui/page/unity_week_page.dart';
import 'package:app_arwise/src/ui/widgets/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UnityOptionPage extends StatefulWidget {
  Unity unity;
  UnityOptionPage({required this.unity});

  @override
  State<UnityOptionPage> createState() => _UnityOptionPageState();
}

class _UnityOptionPageState extends State<UnityOptionPage> {
  bool loadData = false;
  List<Week> listWeek = [];

  @override
  void initState() {
    loadDataWeek();
    super.initState();
  }

  void loadDataWeek() async {
    loadData = true;
    setState(() {});

    CollectionReference collRefUnits =
        FirebaseFirestore.instance
        .collection('units')
        .doc(widget.unity.idDocument)
        .collection('weeks');

    collRefUnits
        .orderBy('id')
        .get()
        .then((value) => {
              // ignore: avoid_function_literals_in_foreach_calls
              value.docs.forEach((element) {
                listWeek.add(Week(
                    idDocument: element.id,
                    id: element['id'],
                    title: element['title']));
              })
            })
        .whenComplete(() => {
              print(listWeek.length),
              loadData = false,
              setState(() {}),
            })
        // ignore: argument_type_not_assignable_to_error_handler
        .catchError((err) => {
              loadData = false,
              setState(() {}),
            });
  }

  Widget button(Week week) {
    return SizedBox(
      height: 10,
      child: ElevatedButton(
        onPressed: () {
          if (widget.unity.id == 1 && week.id == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => 
              UnityWeekPage(unity: widget.unity, week: week)),
            );
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(' '),
            Text(week.title.toString()),
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
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffc2cef3),
        body: Stack(children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: SizedBox(
                  width: 280,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child:(loadData) 
                  ?loader()
                  :GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 5 / 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 40
                    ),
                    itemCount: listWeek.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return button(listWeek[index]);
                    })
                ))),
          Positioned(
            top: 80,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: SizedBox(
              height: 60,
              child: Card(
                elevation: 10,
                color: const Color(0xfffcd24f),
                child: Center(
                  child: Text(widget.unity.title.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 23),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            right: 10,
            child: const Icon(Icons.brightness_1, color: Colors.red),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            left: 10,
            child: const Icon(Icons.brightness_1, color: Colors.yellow),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.4,
            right: 0,
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('assets/img/logos/s_rosa.png'),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            child: SizedBox(
              height: 40,
              width: 40,
              child: Image.asset('assets/img/logos/s_amarillo.png'),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 90,
              child: Image.asset('assets/img/logos/fondo_morado_pie.png',
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
              bottom: 100,
              left: MediaQuery.of(context).size.width * 0.3,
              right: MediaQuery.of(context).size.width * 0.3,
              child: SizedBox(
                  child: ElevatedButton(
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
              )))
        ]));
  }
}
