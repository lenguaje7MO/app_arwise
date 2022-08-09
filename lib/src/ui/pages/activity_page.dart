import 'package:app_arwise/src/ui/utils/urls.dart';
import 'package:app_arwise/src/ui/utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage();

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  Widget containerActividades() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        color: const Color.fromARGB(205, 255, 241, 214),
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(25), topLeft: Radius.circular(25)),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Center(
        child: Text(
          'ACTIVIDADES',
          style: GoogleFonts.mouseMemoirs(
            textStyle: const TextStyle(
                color: Colors.red, letterSpacing: .5, fontSize: 40),
          ),
        ),
      ),
    );
  }

  Widget containerVideo() {
    return GestureDetector(
        onTap: () {
          launchUrlUtil(videosUrl);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(205, 255, 241, 214),
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(25)),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Text(
              'VIDEOS',
              style: GoogleFonts.mouseMemoirs(
                textStyle: const TextStyle(
                    color: Colors.black, letterSpacing: .5, fontSize: 25),
              ),
            ),
          ),
        ));
  }

  Widget containerEjercicios() {
    return GestureDetector(
        onTap: () {
          launchUrlUtil(ejerciciosUrl);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(205, 255, 241, 214),
            borderRadius:
                const BorderRadius.only(bottomRight: Radius.circular(25)),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Center(
            child: Text(
              'EJERCICIOS',
              style: GoogleFonts.mouseMemoirs(
                textStyle: const TextStyle(
                    color: Colors.black, letterSpacing: .5, fontSize: 25),
              ),
            ),
          ),
        ));
  }

  Widget botonBack(){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(width: 10),
                Text('BACK', style: TextStyle(fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_left, size: 30),
                SizedBox(width: 10),
              ],
            ),
            elevation: 8,
            color: const Color(0xFFfcd24f),
            shadowColor: Colors.orangeAccent,
          ))
        );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFedd8c9),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Stack(
        children: [
          Image.asset(
            'assets/img/fondo2.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              containerActividades(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  containerVideo(),
                  containerEjercicios()
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: botonBack()
    );
  }
}
