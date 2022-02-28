import 'package:flutter/material.dart';
import 'package:snackbar01/model/ContactModel.dart';
import 'package:snackbar01/pages/contactList.dart';

class ContactItem extends StatelessWidget {
  final ContactModel _contact;
  ContactItem(this._contact);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(_contact.name),
    );
  }
}
