import 'package:app_arwise/src/ui/pages/menu_page.dart';
import 'package:flutter/material.dart';


class LanguagePage extends StatefulWidget {
  const LanguagePage();

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Widget portada() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Image.asset('assets/img/fondo_secundario.png', fit: BoxFit.fill),
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
                right: MediaQuery.of(context).size.width * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.10,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MenuPage()),
                      );
                    }, 
                    child: const Text('START'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(width: 3.0, color: Colors.black),
                      ),
                    primary: const Color.fromARGB(255, 45, 111, 79),
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
