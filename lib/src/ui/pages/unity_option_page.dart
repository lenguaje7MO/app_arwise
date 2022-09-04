import 'package:app_arwise/src/ui/pages/unity_week_page.dart';
import 'package:flutter/material.dart';

class UnityOptionPage extends StatefulWidget {
  final int idUnity;
  const UnityOptionPage({required this.idUnity});

  @override
  State<UnityOptionPage> createState() => _UnityOptionPageState();
}

class _UnityOptionPageState extends State<UnityOptionPage> {
  Widget button(String title,int idWeek) {
    return Container(
      height: 10,
      child: ElevatedButton(
        onPressed: () {
          if (widget.idUnity == 1 && idWeek==1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UnityWeekPage()),
            );
          }
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
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffc2cef3),
        body: Stack(children: [
          Center(
            child: Container(
              width: 280,
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3,
                shrinkWrap: true,
                mainAxisSpacing: 18,
                crossAxisSpacing: 5,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 5),
                children: [
                  button('SEMANA 1',1),
                  button('SEMANA 2',2),
                  button('SEMANA 3',3),
                  button('SEMANA 4',4),
                  button('SEMANA 5',5),
                  button('SEMANA 6',6),
                  button('SEMANA 7',7),
                  button('SEMANA 8',8),
                  button('SEMANA 9',9),
                  button('SEMANA 10',10),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: MediaQuery.of(context).size.width * 0.2,
            right: MediaQuery.of(context).size.width * 0.2,
            child: SizedBox(
              height: 60,
              child: Card(
                elevation: 10,
                color: const Color(0xfffcd24f),
                child: Center(
                  child: Text('UNIDAD ${widget.idUnity}',
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
              bottom: 30,
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
