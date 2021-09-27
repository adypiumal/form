//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();

  String _name;
  String _email;
  int _number;
  String _pass;

  Widget _buildNameField() {
    return TextFormField(
        maxLength: 50,
        decoration: InputDecoration(
          hintText: 'Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        maxLines: 1,
        validator: (text) {
          if (text.isEmpty) {
            return 'Name cannot be empty';
          }
          return null;
        },
        onSaved: (text) {
          _name = text;
        });
  }

  Widget _buildemailField() {
    return TextFormField(
        maxLength: 50,
        decoration: InputDecoration(
          hintText: 'email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        maxLines: 1,
        validator: (email) {
          if (email.isEmpty) {
            return 'email cannot be empty';
          }
          return null;
        },
        onSaved: (email) {
          _name = email;
        });
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
        maxLength: 20,
        decoration: InputDecoration(
          hintText: 'phoneNumber',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        keyboardType: TextInputType.number,
        maxLines: 1,
        validator: (number) {
          if (number.isEmpty) {
            return 'phoneNumber annot be empty';
          }
          return null;
        },
        onSaved: (number) {
          _name = number;
        });
  }

  Widget _buildPasswordField() {
    return TextFormField(
        maxLength: 20,
        decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        maxLines: 1,
        validator: (pass) {
          if (pass.isEmpty) {
            return 'Password annot be empty';
          }
          return null;
        },
        onSaved: (pass) {
          _name = pass;
        });
  }

  @override
  Widget build(BuildContext context) {
    title.text = 'search';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: TextField(
                controller: title,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          title.text = '';
                        },
                        icon: Icon(Icons.close))))),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 300,
                    child: Text(
                      'Form',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _buildNameField(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildemailField(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildPhoneNumberField(),
                  SizedBox(
                    height: 10,
                  ),
                  _buildPasswordField(),
                  Container(
                    width: 100,
                  
                    child: TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.green))
                    ) ),
                      child: Text('Save',style:TextStyle(color: Colors.white)),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          print(_name);
                          print(_email.toString());
                          print(_number);
                          print(_pass);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
