import 'package:flutter/material.dart';
import 'package:tareauno/Register.dart';
import 'package:tareauno/constantes.dart' as con;
import 'package:tareauno/singleton.dart' ;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Singleton singleton = Singleton();
  bool verTexto = true;
  String msg = con.messageDefault;
  //variables para obtener el valor de los textformfield
  final user = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(size.width * 0.1),
          padding: EdgeInsets.all(size.width * 0.1),
        color: Colors.amber,
        child: Column(
          mainAxisSize: MainAxisSize.min, ///Toma el tamaño total de sus hijos widgets
          children: [
            Text('User'),
            TextFormField(
              controller: user,
            ),
            SizedBox(height: 15,),
            Text('Password'),
            TextFormField(
              controller: password,
              obscureText: verTexto,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          verTexto = !verTexto;
                        });
                      }, icon: verTexto ? Icon(
                    Icons.visibility,
                    color: Colors.white,
                  ) : Icon(
                    Icons.visibility_off,
                    color: Colors.white,)
                  ),

                  //labelText: 'Escribe tu contraseña',
                  hintText: 'Escribe tu contraseña',
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide(
                        style: BorderStyle.solid,
                      )
                  ),
                  filled: true,
                  fillColor: con.color,
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.white,
                  )
              ) ,
            ),
            SizedBox(height: 15,),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    print(user.text);
                    print(password.text);
                    if(user.text == con.user && password.text == con.pass){
                      //si son correctas cambiamos la vista
                      singleton.username = 'Demianggs',
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder:
                              (context) => const Register()));
                    }else{
                      if(user.text != con.user && password.text == con.pass){
                        msg = con.message1;
                      }else{
                        if(user.text == con.user && password.text != con.pass) {
                          msg = con.message2;
                        }else{
                          msg = con.message;
                        }
                      }



                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  fixedSize: Size(size.width * 0.7, 50)
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            Row(
              children: [
                Text('No tienes cuenta'),
                TextButton(onPressed: (){}, child: Text('Registrarte'),
                ),


              ],
            ),
            Row(
              children: [
                Text(msg, style:
                TextStyle(
                    color: Colors.red
                ),)

              ]
            )

          ],
        ),
      ),
      )
      
    );
  }
}
