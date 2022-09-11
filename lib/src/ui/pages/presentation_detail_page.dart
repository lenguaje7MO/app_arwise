import 'package:app_arwise/src/ui/pages/menu_page.dart';
import 'package:flutter/material.dart';

class PresentationDetailPage extends StatefulWidget {
  const PresentationDetailPage();

  @override
  State<PresentationDetailPage> createState() => _PresentationDetailPageState();
}

class _PresentationDetailPageState extends State<PresentationDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color(0xffd9d9d9),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomPaint(
              painter: _HeaderDiagonalPainter(),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: const [
                    Text('BIENVENIDOS A',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                    Text(' "ARWISE" ',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                    Text(''),
                    Text('Dirigido a los Alumnos del',style: TextStyle(fontSize: 20)),
                    Text('7mo EGB "B"',style: TextStyle(fontSize: 20)),
                    Text('Unidad Educativa Particular',style: TextStyle(fontSize: 20)),
                    Text('"Hermano Miguel"',style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(
                  height: 180,
                  width: 180,
                  child: Image.asset('assets/img/logos/logo5.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('CREADORES:',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      Text('PEÑAFIEL VALERIA',
                          style: TextStyle(fontSize: 20)),
                      Text('RICO ELIANA',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: 50,
              height: 350,
              child: VerticalDivider(
                color: Color(0xffd9d9d9),
                thickness: 3,
              ),
            )),
          const Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              width: 50,
              height: 350,
              child: VerticalDivider(
                color: Color(0xff03989e),
                thickness: 3,
              ),
            )),

        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SizedBox(
          width: 150,
          height: 40,
          child: ElevatedButton(
          onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MenuPage()),
          );
        },
        child: const Text('PLAY'),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              side: const BorderSide(width: 4.0, color: Colors.black),
            ),
            primary: Colors.red,
            onPrimary: Colors.black,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        )
        )
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();
    lapiz.color = const Color(0xff03989e);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();
    path.lineTo(size.width, size.height);
    path.lineTo(0,size.height);
    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
