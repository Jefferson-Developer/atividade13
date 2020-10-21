import 'package:atividade_elder7/produto.dart';
import 'package:atividade_elder7/produto_listview_page.dart';
import 'package:flutter/material.dart';

class ProdutoPage extends StatefulWidget {
  final Produto produto;
  const ProdutoPage({Key key, this.produto}) : super(key: key);
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {
  //static List<Produto> produtos = [];
  Produto produtos;
  GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  TextEditingController marcaController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  List<Produto> _listaProdutos = [];

  @override
  void initState() {
    super.initState();
    if (widget.produto != null) {
      marcaController.text = widget.produto.marca;
      nomeController.text = widget.produto.nome;
      precoController.text = widget.produto.preco;
      quantidadeController.text = widget.produto.quantidade;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Produto"),
        centerTitle: true,
      ),
      body: Form(
          key: _keyForm,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              TextFormField(
                controller: marcaController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Marca",
                  labelStyle: TextStyle(color: Colors.indigo, fontSize: 20),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo Marca não pode ser vazio;";
                  } else if (value.length <= 3) {
                    return "Campo Marca deve ter mais de 3 letras;";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: nomeController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(color: Colors.indigo, fontSize: 20),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo nome não pode ser vazio.";
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              TextFormField(
                controller: precoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Preco",
                  labelStyle: TextStyle(color: Colors.indigo, fontSize: 20),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo valor não pode ser vazio.";
                  }
                  try {
                    int.parse(value);
                  } catch (e) {
                    return "Digite um valor valido";
                  }
                  try {
                    if (int.parse(value) < 0) {
                      return "Apenas valores acima de 0 reais;";
                    }
                  } catch (e) {}

                  return null;
                },
                onSaved: (value) {},
              ),
              TextFormField(
                controller: quantidadeController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Quantidade",
                  labelStyle: TextStyle(color: Colors.indigo, fontSize: 20),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Campo Quantidade não pode ser vazio;";
                  }
                  try {
                    int.parse(value);
                  } catch (e) {
                    return "Digite um quantidade valida";
                  }
                  try {
                    if (int.parse(value) < 0) {
                      return "Apenas quantidades acima de 0;";
                    }
                  } catch (e) {}

                  return null;
                },
              ),
              Divider(
                height: 10.0,
              ),
              RaisedButton(
                child: Text("Confirme"),
                onPressed: () {
                  produtos = (new Produto(
                      nomeController.text,
                      marcaController.text,
                      precoController.text,
                      quantidadeController.text));

                  _listaProdutos.add(produtos);
                  print(_listaProdutos[0].marca);
                  print(_listaProdutos[0].nome);
                  print(_listaProdutos[0].preco);
                  print(_listaProdutos[0].quantidade);
                  _salvar();
                },
              )
            ],
          )),
    );
  }

  _salvar() {
    if (_keyForm.currentState.validate()) {
      _keyForm.currentState.save();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProdutoListViewPage(
                    produto: _listaProdutos,
                  )));
    }
  }
}
