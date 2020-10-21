import 'package:flutter/material.dart';

class ExemploSharedPreference extends StatefulWidget {
  @override
  _ExemploSharedPreferenceState createState() =>
      _ExemploSharedPreferenceState();
}

class _ExemploSharedPreferenceState extends State<ExemploSharedPreference> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemple shared Preferences"),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text("Gravando dados"),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text("Lendos Dados"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
