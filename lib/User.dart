import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String _nome;
  int _idade;

  User(this._nome, this._idade);

  String get nome => _nome;
  int get idade => _idade;

  void aniversario() {
    _idade++;
    notifyListeners();
  }

  void mudarDeNome(String novoNome) {
    _nome = novoNome;
    notifyListeners();
  }
}
