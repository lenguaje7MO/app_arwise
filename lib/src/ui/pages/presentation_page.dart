import 'package:app_arwise/src/ui/pages/presentation_detail_page.dart';
import 'package:flutter/material.dart';

class PresentationPage extends StatefulWidget {
  const PresentationPage();

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd9d9d9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height:70,
              width: 250,
              child:Stack(
              children:[
                  const Center(
                    child:Text('ARWISE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45)),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child:SizedBox(
                      height:35,
                      width: 35,
                      child:Image.asset('assets/img/logos/logo1.png'),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height:150,
              width: 150,
              child:Image.asset('assets/img/logos/logo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height:100,
                  width: 100,
                  child:Image.asset('assets/img/logos/logo3.png'),
                ),
                SizedBox(
                  height:100,
                  width: 100,
                  child:Image.asset('assets/img/logos/logo2.png'),
                ),
                
              ],
            ),
            SizedBox(
              height:100,
              width: 150,
              child:Image.asset('assets/img/logos/logo4.png'),
            ),
            const SizedBox(
              height:10,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      floatingActionButton:Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: SizedBox(
          width: 150,
          height: 40,
          child: ElevatedButton(
          onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PresentationDetailPage()),
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
      )
    );
  }
}
