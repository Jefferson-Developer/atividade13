import 'package:atividade_elder7/aula_13_shared/pessoa.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class ExemploSharedPreference extends StatefulWidget {
  @override
  _ExemploSharedPreferenceState createState() =>
      _ExemploSharedPreferenceState();
}

class _ExemploSharedPreferenceState extends State<ExemploSharedPreference> {
  _gravandoDados() async {
    List<String> _cidades = ["Patos", "Sousa", "Campina Grande", "Cajazeiras"];

    SharedPreferences instancia = await SharedPreferences.getInstance();
    instancia.setBool("key-bool", true);
    instancia.setInt("key-int", 10);

    instancia.setDouble("key-double", 2.3);
    instancia.setString("key-string", "Jefferson");
    instancia.setStringList("key-cidades", _cidades);
    print("Dados gravados");
  }

  _lendoDados() async {
    SharedPreferences instancia = await SharedPreferences.getInstance();
    print("key-bool ---> ${instancia.getBool("key-bool")}");
    print("key-bool ---> ${instancia.getInt("key-int")}");
    print("key-bool ---> ${instancia.getDouble("key-double")}");
    print("key-bool ---> ${instancia.getString("key-string")}");
    List<String> _cidades = instancia.getStringList("key-cidades");
    print("key-bool ---> ${_cidades}");
    print("Dados lidos");
  }

  _gravandoPessoa() async {
    Pessoa pessoa =
        Pessoa(nome: "Jefferson", idade: 19, peso: 2.4, jovem: true);
    String pessoaEnconde = convert.jsonEncode(pessoa.toJson());

    SharedPreferences.getInstance().then((value) {
      value.setString("key-pessoa", pessoaEnconde);
      print("Gravou");
    });
  }

  _lendoPessoa() async {
    SharedPreferences.getInstance().then((value) {
      Pessoa pessoa =
          Pessoa.fromJson(convert.jsonDecode(value.getString('key-pessoa')));
      print(pessoa.toString());
    });
  }

  _gravarListaPessoa() {
    List<Pessoa> pessoas = [
      Pessoa(nome: "Jeff", idade: 432),
      Pessoa(nome: "Jefferson", idade: 19, peso: 2.4, jovem: true),
      Pessoa(nome: "Carlos", idade: 19, peso: 2.4, jovem: true),
    ];
    List<String> pessoasEncode =
        pessoas.map((e) => convert.jsonEncode(e.toJson())).toList();
    SharedPreferences.getInstance().then((value) {
      value.setStringList("key-pessoas", pessoasEncode);
    });
  }

  _lendoListaPessoa() {
    SharedPreferences.getInstance().then((value) {
      List<String> pessoasString = value.getStringList("key-pessoas");

      List<Pessoa> pessoas = pessoasString
          .map((e) => Pessoa.fromJson(convert.jsonDecode(e)))
          .toList();
      print("Pessoas lidas com Sucesso");
      pessoas.forEach((element) => print(pessoas));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemple shared Preferences"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Gravando Dados"),
              onPressed: () {
                _gravarListaPessoa();
              },
            ),
            RaisedButton(
              child: Text("Lendo Dados"),
              onPressed: () {
                _lendoListaPessoa();
              },
            ),
          ],
        ),
      ),
    );
  }
}
