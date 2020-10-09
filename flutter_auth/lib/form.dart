import 'package:flutter/material.dart';

class Formular extends StatelessWidget{
  String email  =''; 
  String password =''; 
  String confirmPass ='';

  final _keyform =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Authentification'
        ),
        centerTitle: true,
        ),
      body:SingleChildScrollView(
        child: Container(
          padding:EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _keyform,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder()
                    ),
                    validator: (val) => val.isEmpty? 'Put your email': null,
                    onChanged: (val) => email = val,
                  ),
                  SizedBox(height:10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder()
                    ),
//to hide charactere
                    obscureText: true,
                    onChanged: (val)=> password = val,
                    validator: (val) => val.length < 6 ? 'give minimium 6 characteres or more': null,
                  ),
                   SizedBox(height:10.0),
                   TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder()
                    ),
                    onChanged: (val)=> confirmPass = val,
                    validator: (val) => confirmPass !=password? 'Confirm your password':null,
                  ),
                  SizedBox(height:10.0),
                  OutlineButton(
                    shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                    ),
                    onPressed: (){
                      if(_keyform.currentState.validate()){
                        print('$email and $password');
                      }
                    },
                    borderSide: BorderSide(width:1.0, color: Colors.lightBlue),
                    child:Text(
                      'Click to see the list',
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                   ),
                   SizedBox(height:10.0),
                   RaisedButton(
                    shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                    ),
                    color: Colors.blue,
                    onPressed: (){
                         if(_keyform.currentState.validate()){
                        print('$email and $password');
                      }
                    },
              
                    child:Text(
                      'Need help to see the list',
                      style: TextStyle(color: Colors.white),
                    ),
                   ),
                ],
              )
          ),
        ),
      ),
    );

  }
}