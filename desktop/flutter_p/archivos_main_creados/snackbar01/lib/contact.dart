import 'package:flutter/material.dart';
import 'package:snackbar01/model/ContactModel.dart';
import 'package:snackbar01/pages/contactList.dart';

class Contact extends StatelessWidget {
  _buildList() {
    return <ContactModel>[
      const ContactModel(
          name: 'Rodrigo Morales', email: 'rodrigo.morales@gmail.com')
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ContactList(_buildList()),
    );
  }
}
