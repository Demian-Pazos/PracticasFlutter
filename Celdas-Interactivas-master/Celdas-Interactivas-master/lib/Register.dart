import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});


  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(size.width * 0.1),
            padding: EdgeInsets.only(left:size.width * 0.1),
            color: Colors.amber,
            child: Column(
              mainAxisSize: MainAxisSize.min, ///Toma el tamaño total de sus hijos widgets
              children: [
                Text('Name'),
                TextFormField(

                ),
                SizedBox(height: 15,),
                Text('Username'),
                TextFormField(),
                SizedBox(height: 15,),
                Text('E-mail'),
                TextFormField(),
                SizedBox(height: 15,),
                Text('Password'),
                TextFormField(),
                SizedBox(height: 15,),
                Text('Confirm Password'),
                TextFormField(),
                SizedBox(height: 15,),
                ElevatedButton(
                    onPressed: (){},
                    child: Text('Register')
                ),
                Row(
                  children: [
                    Text('Ya tienes cuenta?'),
                    TextButton(onPressed: (){}, child: Text('Login'),
                    )
                  ],
                )
              ],
            ),
          ),
        )

    );
  }
}
