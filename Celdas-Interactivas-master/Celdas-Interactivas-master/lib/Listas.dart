import 'package:flutter/material.dart';
import 'package:tareauno/constantes.dart' as con;
import 'package:tareauno/singleton.dart';

class Listas extends StatefulWidget {
  const Listas({super.key});
  Singleton singleton = Singleton();

  @override
  State<Listas> createState() => _ListasState();
}

class _ListasState extends State<Listas> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(singleton.nameUser),
      )
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children:[
         /* Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(10, (index){
                  return buildContainer2('nombre','apellidos');
                }),
              ),
            )
          ),*/
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              child: ListView.builder(
                itemCount: con.crearLista(15).length,
                itemBuilder: (BuildContext context, int index){
                  /// var -> de cualquier tipo de variable
                  var lista = con.crearLista(15); //Creando lista de 15 registros
                  //Pasamos el registro index a datos en forma de arreglo
                  var datos = lista[index].toString().split('#');
                  //datos[0] 
                  return NewWidget2();
                },
              )
          ),
          Container(
          color: Colors.grey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[ Row(
            children: [
              Expanded(
                  flex: 11,
                  child: Text('Martin')),
              Expanded(
                  flex: 1,
                  child: Icon(Icons.icecream))

            ]
          ),
            Row(
              children: [
                Expanded(
                    flex: 11,
                    child: Text('Juarez')),
                Expanded(
                    flex: 1,
                    child: Icon(Icons.edit)),
                Expanded(
                    flex: 1,
                    child: IconButton(
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(name),
                        content: Text('Seguro que quieres eliminar a este usuario'),
                        actions[
                          TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                            },
                          child: Text('Aceptar')
                        )
                        ),
                        ),
                      )
                    );
                },
                icon: Icon(Icons.delete),
              ),


            ],

            )
          ],
        ),
          ),
          SizedBox(height: 20,),
          Container(
            color: Colors.grey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[ Row(
                  children: [
                    Expanded(
                        flex: 11,
                        child: Text('Nom')),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.icecream))

                  ]
              ),
                Row(
                  children: [
                    Expanded(
                        flex: 11,
                        child: Text('Ap')),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.edit)),
                    Expanded(
                        flex: 1,
                        child: Icon(Icons.delete))

                  ],
                )
              ],
            ),
          ),

          ],
      ),
    );
  }
}
