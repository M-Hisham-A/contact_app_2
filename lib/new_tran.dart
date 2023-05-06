import 'package:flutter/material.dart';

class NewContact extends StatefulWidget {
  Function addTx;
  String name;
  String user;
  String email;
  String astreet;
  String acity;
  String azip;
  String phone;
  String website;
  String company;

  NewContact(
      {required this.addTx,
      required this.name,
      required this.user,
      required this.email,
      required this.phone,
      required this.astreet,
      required this.acity,
      required this.azip,
      required this.website,
      required this.company});

  @override
  _NewContactState createState() => _NewContactState(
      name: this.name,
      user: this.user,
      email: this.email,
      astreet: this.astreet,
      acity: this.acity,
      azip: this.azip,
      phone: this.phone,
      website: this.website,
      company: this.company);
}

class _NewContactState extends State<NewContact> {
  String name;
  String user;
  String email;
  String astreet;
  String acity;
  String azip;
  String phone;
  String website;
  String company;

  _NewContactState(
      {required this.name,
      required this.user,
      required this.email,
      required this.phone,
      required this.astreet,
      required this.acity,
      required this.azip,
      required this.website,
      required this.company});

  late final _nameController = TextEditingController(text: name);
  late final _userController = TextEditingController(text: user);
  late final _emailController = TextEditingController(text: email);
  late final _astreetController = TextEditingController(text: astreet);
  late final _acityController = TextEditingController(text: acity);
  late final _azipController = TextEditingController(text: azip);
  late final _phoneController = TextEditingController(text: phone);
  late final _websiteController = TextEditingController(text: website);
  late final _companyController = TextEditingController(text: company);

  void _submitData() {
    final enteredname = _nameController.text;
    final enteruser = _userController.text;
    final enteredemail = _emailController.text;
    final enterstreet = _astreetController.text;
    final entercity = _acityController.text;
    final enterzip = _azipController.text;
    final enteredphone = _phoneController.text;
    final enteredwebsite = _websiteController.text;
    final enteredcompany = _companyController.text;

    widget.addTx(enteredname, enteruser, enteredemail, enterstreet, entercity,
        enterzip, enteredphone, enteredwebsite, enteredcompany);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _nameController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'UserName',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _userController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _emailController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Phone number',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _phoneController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Street',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _astreetController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'City',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _acityController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'ZipCode',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _azipController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Website',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _websiteController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Company',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            controller: _companyController,
            onSubmitted: (_) => _submitData(),
            style: TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 10, 181, 161),
            ),
            child: Text(
              'Add',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: _submitData,
          ),
        ],
      ),
    );
  }
}
