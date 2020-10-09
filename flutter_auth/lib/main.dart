import 'package:flutter/material.dart';
import 'package:flutter_auth/form.dart';
import 'package:flutter_auth/contact_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Colors.lightBlue,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        )
      ),
     
       debugShowCheckedModeBanner: false,
          
      initialRoute: '/formulaire',    
          routes: {
        '/formulaire' : (context) => Formular(),
        '/contactList': (context) => ContactList(),
      },
    );
  }
}
