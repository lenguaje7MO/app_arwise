import 'package:app_arwise/src/ui/pages/activity_page.dart';
import 'package:app_arwise/src/ui/pages/language_page.dart';
import 'package:app_arwise/src/ui/utils/urls.dart';
import 'package:app_arwise/src/ui/utils/utilities.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget portada() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.90,
      child: Image.asset('assets/img/fondo_principal.png', fit: BoxFit.fill),
    );
  }

  Widget btnContenido() {
    return GestureDetector(
      onTap: () {
        launchUrlUtil(contenidoUrl);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Image.asset('assets/img/btnContenido.png', scale: 1.8),
      ),
    );
  }

  Widget btnActividades() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ActivityPage()),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Image.asset('assets/img/btnActividades.png', scale: 1.8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
               portada(),
               Positioned(
                left: MediaQuery.of(context).size.width * 0.22,
                right: MediaQuery.of(context).size.width * 0.40,
                bottom: MediaQuery.of(context).size.height * 0.10,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LanguagePage()),
                      );
                    }, 
                    child: const Text('START'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(width: 3.0, color: Colors.black),
                      ),
                    primary: Color.fromARGB(255, 45, 111, 94),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25)
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
