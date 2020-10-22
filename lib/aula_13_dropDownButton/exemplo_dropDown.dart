import 'package:flutter/material.dart';

class ExemploDropDownButton extends StatefulWidget {
  @override
  _ExemploDropDownButtonState createState() => _ExemploDropDownButtonState();
}

class _ExemploDropDownButtonState extends State<ExemploDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("exemplo drop"),
      ),
      body: _buildDropDownEstatico(),
    );
  }

  Container _buildDropDownEstatico() {
    return Container(
      child: Column(
        children: [
          Text("Selecione a cidade"),
          DropdownButton<String>(
            items: [
              DropdownMenuItem(
                child: Text("Patos-PB"),
                value: "Patos",
              ),
              DropdownMenuItem(
                child: Text("Sousa-PB"),
                value: "Sousa",
              ),
              DropdownMenuItem(
                child: Text("Cajazeiras-PB"),
                value: "Cajazeiras",
              ),
            ],
            onChanged: (value) {},
          )
        ],
      ),
    );
  }
}
