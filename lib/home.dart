import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens() {
    for (int i = 0; i < 10; i++) {
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} Loren Ipsun dolor sit amet";
      item["descricao"] = "Descricao ${i} Loren Ipsun dolor sit amet";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: _itens.length,
            itemBuilder: (context, indice) {
              print("item ${_itens[indice].toString()}");

              return ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(_itens[indice]["titulo"]),
                          titlePadding: EdgeInsets.all(20),
                          content: Text(_itens[indice]["descricao"]),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  print("Selecionado SIM");
                                },
                                child: Text("Sim")),
                            FlatButton(
                                onPressed: () {
                                  print("Selecionado NÃO");
                                },
                                child: Text("Não"))
                          ],
                        );
                      });
                },
                title: Text(_itens[indice]["titulo"]),
                subtitle: Text(_itens[indice]["descricao"]),
              );
            }),
      ),
    );
  }
}
