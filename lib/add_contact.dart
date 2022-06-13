import 'package:crud_en_flutter/my_home_page.dart';
import 'package:crud_en_flutter/text_box.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddContact();
}

class _AddContact extends State<AddContact> {
  TextEditingController controllerName;
  TextEditingController controllerSurname;
  TextEditingController controllerPhone;

  @override
  void initState() {
    controllerName = new TextEditingController();
    controllerSurname = new TextEditingController();
    controllerPhone = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Registrar Contactos"),
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

                  if (name.isNotEmpty &&
                      surname.isNotEmpty &&
                      phone.isNotEmpty) {
                    Navigator.pop(context,
                        new Client(name: name, surname: surname, phone: phone));
                  }
                },
                child: Text("Save Contact")),
          ],
        ));
  }
}
