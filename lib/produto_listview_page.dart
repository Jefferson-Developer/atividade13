import 'package:atividade_elder7/produto.dart';
import 'package:atividade_elder7/produto_page.dart';
import 'package:flutter/material.dart';

class ProdutoListViewPage extends StatefulWidget {
  final List<Produto> produto;
  const ProdutoListViewPage({Key key, this.produto}) : super(key: key);

  @override
  _ProdutoListViewPageState createState() => _ProdutoListViewPageState();
}

class _ProdutoListViewPageState extends State<ProdutoListViewPage> {
  GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();
  int tamanho = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProdutoPage()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista Produtos"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: widget.produto != null && widget.produto.length > 0
                    ? ListView.builder(
                        itemCount: widget.produto.length,
                        itemBuilder: (BuildContext context, int i) {
                          return ListTile(
                            title: Text("${widget.produto[i].nome}"),
                            subtitle: Text("${widget.produto[i].marca}"),
                            trailing: Text("Preço ${widget.produto[i].preco}"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProdutoPage(
                                            produto: widget.produto[i],
                                          )));
                            },
                            onLongPress: () {
                              _alertDialog(context, i);
                            },
                          );
                        })
                    : Center(
                        child: Text("Nenhum"),
                      ))
          ],
        ),
      ),
    );
  }

  _alertDialog(BuildContext context, int i) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Deletar"),
            content:
                Text("Deseja deletar a produto  ${widget.produto[i].marca} ?"),
            actions: [
              FlatButton(
                child: Text("Confimar"),
                onPressed: () {
                  setState(() {
                    widget.produto.removeAt(i);
                  });
                  Navigator.pop(context);
                  _meuSnackBar();
                },
              ),
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  _meuSnackBar() {
    _keyScaffold.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2),
      action: SnackBarAction(
          textColor: Colors.red,
          label: "",
          onPressed: () {
            print("");
          }),
      content: Row(
        children: [
          Icon(Icons.save),
          SizedBox(
            width: 30,
          ),
          Text("Produto deletado com sucesso !")
        ],
      ),
    ));
  }
}
