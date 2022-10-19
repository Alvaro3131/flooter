// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String infotext = "Informe sus datos";
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  Widget buildTextField(String text, TextEditingController c) {
    return TextField(
      decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: Colors.black, fontSize: 20),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.black, fontSize: 25.0),
      keyboardType: TextInputType.number,
      controller: c,
    );
  }

  _calculate() {
    double wight = double.parse(weightcontroller.text);
    double height = double.parse(heightcontroller.text) / 100;
    double imc = wight / (height * height);
    setState(() {
      infotext = imc.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Calcular IMC"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                Widget>[
          Icon(
            Icons.person_outline,
            size: 170.0,
            color: Colors.red,
          ),
          buildTextField("Peso", weightcontroller),
          Divider(),
          buildTextField("Altura", heightcontroller),
          Divider(),
          Container(
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  _calculate();
                },
                child: Text("Verficar"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red)),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              infotext,
              style: TextStyle(color: Colors.black38, fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Table(
              border: TableBorder.all(),
              children: const [
                TableRow(children: [Text("Menor a 18.5"), Text("PESO BAJO")]),
                TableRow(children: [Text("18.6 a 24.9"), Text("PESO NORMAL")]),
                TableRow(children: [Text("25 a 29.9"), Text("SOBREPESO")]),
                TableRow(children: [Text("30 a 34.9"), Text("OBESIDAD LEVE")]),
                TableRow(children: [Text("35 A 39.9"), Text("OBESIDAD MEDIA")]),
                TableRow(children: [Text("40 a MÁS"), Text("OBESIDAD EXTREMA")])
              ],
            ),
          )
        ]),
      ),
    );
  }
}
