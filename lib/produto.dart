import 'dart:wasm';

class Produto {
  String nome;
  String marca;
  String preco;
  String quantidade;

  Produto(String nome, String marca, String preco, String quantidade) {
    this.nome = nome;
    this.marca = marca;
    this.preco = preco;
    this.quantidade = quantidade;
  }
}
