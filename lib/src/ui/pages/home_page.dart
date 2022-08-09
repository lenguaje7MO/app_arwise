import 'package:app_arwise/src/ui/pages/activity_page.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.40,
      margin: const EdgeInsets.only(left: 60, right: 60, bottom: 60),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: Image.asset('assets/img/portada.png', fit: BoxFit.cover),
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
        backgroundColor: const Color(0xFFedd8c9),
        body: Stack(
          children: [
            Image.asset(
              'assets/img/fondo1.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  portada(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      btnContenido(),
                      btnActividades()
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }


}
