import 'package:flutter/material.dart';
import 'package:projek_riska/daftar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: const Text("MY SCHOOL"),
        ),
        body: Container(
            child: GridView.count(crossAxisCount: 2, children: [
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DaftarPage()));
              },
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/img/siswa.jpg",
                      height: 150.0,
                    ),
                    Text("SISWA", style: TextStyle(fontSize: 17.0)),
                  ],
                ),
              ),
            ),
          )
        ])));
  }
}
