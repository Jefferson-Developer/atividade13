class Pessoa {
  String nome;
  int idade;
  double peso;
  bool jovem;

  Pessoa({this.nome, this.idade, this.peso, this.jovem});

  Pessoa.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    idade = json['idade'];
    peso = json['peso'];
    jovem = json['jovem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['peso'] = this.peso;
    data['jovem'] = this.jovem;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "Pessoa[nome $nome, idade: $idade, peso: $peso, jovem: $jovem]";
  }
}
