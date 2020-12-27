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
  // bool _selecionado;
  var uuid = Uuid();


  //Getters
  String get nome => _nome;
  String get descricao => _descricao;
  String get preco => _preco;
  // bool get selecionado => _selecionado;

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

  // set changeSelecionado(bool selecionado){
  //   _selecionado = selecionado;
  //   notifyListeners();
  // }

  //functions
  loadAll(Entry entry){
    if(entry != null){
      _nome = entry.nome;
      _descricao = entry.descricao;
      _preco = entry.preco;
      _entryId = entry.entryId;
      // _selecionado = entry.selecionado;
    } else {
      _nome = null;
      _descricao = null;
      _preco = null;
      _entryId = null;
      // _selecionado = null;
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