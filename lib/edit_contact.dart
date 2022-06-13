import 'package:crud_en_flutter/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:crud_en_flutter/text_box.dart';

class EditContact extends StatefulWidget {
  final Client _client;
  EditContact(this._client);
  @override
  State<StatefulWidget> createState() => _EditContact();
}

class _EditContact extends State<EditContact> {
  TextEditingController controllerName;
  TextEditingController controllerSurname;
  TextEditingController controllerPhone;

  @override
  void initState() {
    Client c = widget._client;
    controllerName = new TextEditingController(text: c.name);
    controllerSurname = new TextEditingController(text: c.surname);
    controllerPhone = new TextEditingController(text: c.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Contact"),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Nombre"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(controllerPhone, "Telefono"),
          ElevatedButton(
              onPressed: () {
                String name = controllerName.text;
                String surname = controllerSurname.text;
                String phone = controllerPhone.text;

                if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
                  Navigator.pop(context,
                      new Client(name: name, surname: surname, phone: phone));
                }
              },
              child: Text("Save Contact")),
        ],
      ),
    );
  }
}
