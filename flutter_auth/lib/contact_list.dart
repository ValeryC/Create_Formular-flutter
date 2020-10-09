import 'package:flutter/material.dart';
import 'package:flutter_auth/contact.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = [
    Contact(name: 'Lux', imageProfil: 'image-1.jpg'),
    Contact(name: 'Yasuo', imageProfil: 'image-2.jpg'),
    Contact(name: 'Heimer', imageProfil: 'image-3.jpg'),
    Contact(name: 'Jarvan', imageProfil: 'image-4.jpg'),
    Contact(name: 'Neeko', imageProfil: ''),
    Contact(name: 'Lulu', imageProfil: ''),
   
  ];

Color _color =Colors.grey;

  Widget _dialogBuilder(BuildContext context, Contact contact){
    ThemeData localTheme = Theme.of(context);
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      children: <Widget>[
        Image.asset(
          'assets/${contact.imageProfil}'
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text( contact.name,
                  style: localTheme.textTheme.display1
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: Wrap(
                  children: <Widget>[
                    FlatButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/detailContact',
                        arguments: {
                          'imageProfil': contact.imageProfil,
                          'name': contact.name
                        });
                      },
                      child: Text('DETAIL'),
                    ),
                    RaisedButton(
                      onPressed: (){
                       
                        Navigator.pushReplacementNamed(context, '/contactList');
                      },
                      child: Text('ANNULER'),
           
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contact'),
        actions: <Widget>[Icon(Icons.search), Icon(Icons.more_vert)],
      ),
      body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index){

            var nameInitial = contacts[index].name[0];
            if (contacts[index].imageProfil.length > 0) {
              nameInitial = '';
            }
            return Padding(
              padding:EdgeInsets.symmetric(vertical: 0.0, horizontal: 4.0),
              child: Card(
                child: ListTile(

                  onTap: () => showDialog(context: context, builder: (context)
                  => _dialogBuilder(context, contacts[index])),

                  title: Text(contacts[index].name, style: Theme.of(context).textTheme.title),
                  leading: CircleAvatar(
                    backgroundColor: _color,
                    backgroundImage:
                        AssetImage('assets/${contacts[index].imageProfil}'),
                      child: Text(
                      nameInitial,
                      style: TextStyle(color:Colors.pinkAccent, fontSize: 30.0),
                      
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}