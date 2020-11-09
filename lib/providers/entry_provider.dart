import 'dart:ffi';

import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:hamburgueria_gado_dmais/models/entry.dart';
import 'package:hamburgueria_gado_dmais/service/firestore_service.dart';
import 'package:uuid/uuid.dart';

class EntryProvider with ChangeNotifier{
  final firestoreService = FirestoreService();

  String _entryId;
  String _nome;
  String _descricao;
  String _preco;
  var uuid = Uuid();


  //Getters
  String get nome => _nome;
  String get descricao => _descricao;
  String get preco => _preco;

  Stream<List<Entry>> get entries => firestoreService.getEntries();

  //Setters
  set changeNome(String nome){
    _nome = nome;
    notifyListeners();
  }

  set changeDescricao(String descricao){
    _descricao = descricao;
    notifyListeners();
  }

  set changePreco(String preco){
    _preco = preco;
    notifyListeners();
  }

  //functions
  loadAll(Entry entry){
    if(entry != null){
      _nome = entry.nome;
      _descricao = entry.descricao;
      _preco = entry.preco;
      _entryId = entry.entryId;
    } else {
      _nome = null;
      _descricao = null;
      _preco = null;
      _entryId = null;
    }
  }

  saveEntry(){
    if(_entryId == null){
      //add
      var newEntry = Entry(nome: _nome, descricao: _descricao, preco: _preco, entryId: uuid.v1());
      firestoreService.setEntry(newEntry);
    } else {
      //edit
      var updatedEntry = Entry(nome: _nome, descricao: _descricao, preco: _preco, entryId: _entryId);
      firestoreService.setEntry(updatedEntry);
    }
  }

  removeEntry(String entryId){
      firestoreService.removeEntry(entryId);
  }



}