import 'dart:ffi';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';


class Entry{

  final String entryId;
  final String nome;
  final String descricao;
  final String preco;
  // bool selecionado;

  Entry({@required this.entryId, this.nome, this.descricao, this.preco});

  factory Entry.fromJson(Map<String, dynamic> json){
    return Entry(
      entryId: json["entryId"],
      nome: json["nome"],
      descricao: json["descricao"],
      preco: json["preco"],
      // selecionado: json["selecionado"]
    );
  }

  Map<String, dynamic> toMap(){
    return{
      "entryId": entryId,
      "nome": nome,
      "descricao": descricao,
      "preco": preco,
      // "selecionado": selecionado
    };
  }


}