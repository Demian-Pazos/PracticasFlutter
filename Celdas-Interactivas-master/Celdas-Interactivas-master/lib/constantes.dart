//archivo donde se crean las variables que siempre tendran el mismo valor y
// se puede acceder desde cualquier vista

import 'package:flutter/material.dart';

const azul = Colors.blue;
const color = Color(0xBB4B6DA1);

const user = 'Demian';
const pass = '123+';

const message = 'Usuario y constraseña invalidos';
const message1 = 'Usuario invalido';
const message2 = 'Contraseña invalida';
const messageDefault = '';

/// ID # NOMBRE # APELLIDO # BANDERA
const List nombres = [
  '1#Nombre1#apellido1#1',
  '1#Nombre2#apellido1#1',
  '1#Nombre3#apellido1#1',
  '1#Nombre4#apellido1#1',
];

List crearLista(int index){
  List names = [];
  for(int i = 0; i < index; i++){
    names.add('$i#nombre $i#apellido $i#1');
  }
  return names;
}