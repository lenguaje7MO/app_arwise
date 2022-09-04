import 'package:app_arwise/src/ui/pages/unity_option_page.dart';
import 'package:app_arwise/src/ui/pages/unity_page.dart';
import 'package:flutter/material.dart';

class UnityDescPage extends StatefulWidget {
  final int idUnity;
  final String title;
  final String description;
  const UnityDescPage(
      {required this.idUnity, required this.title, required this.description});

  @override
  State<UnityDescPage> createState() => _UnityDescPageState();
}

class _UnityDescPageState extends State<UnityDescPage> {
  Widget button(String title) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 20, left: 80, right: 80),
      child: ElevatedButton(
        onPressed: () {},
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
      backgroundColor: const Color(0xfff01bf67),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 120,
              child: Image.asset('assets/img/logos/fondo_verde_cabecera.png',
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: 110,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.50,
              child: Column(
                children: [
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 80, right: 80, top: 5, bottom: 5),
                      child: Text('UNIDAD ${widget.idUnity}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 80, right: 80, top: 5, bottom: 40),
                    child: Column(
                      children: [
                        Text(widget.title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Destreza: ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                        TextSpan(
                            text: widget.description,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 120,
              child: Image.asset('assets/img/logos/fondo_verde_pie.png',
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UnityPage()),
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
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          UnityOptionPage(idUnity: widget.idUnity)));
                    },
                    child: const Text('PLAY'),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side:
                              const BorderSide(width: 3.0, color: Colors.black),
                        ),
                        primary: Colors.red,
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
