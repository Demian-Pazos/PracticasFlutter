
class Singleton {
  static Singleton? _instance;

  Singleton._internal(){
    _instance = this;
  }

  factory Singleton() => _instance ?? Singleton._internal();

  //Cada variable que se rea dentro de Singleton se le debe asignar un valor fijo
  String nameUser = '';
}