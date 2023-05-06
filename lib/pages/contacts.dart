import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});
  @override
  ContactsState createState() => ContactsState();
}

class ContactsState extends State<Contacts> {
  final List<People> _people = [
    People('Lucas', 'Camacho', '+591 77810954'),
    People('Raul', 'Alvarez', '+591 76554482'),
    People('Jorge', 'Garcia', '+591 75582882'),
    People('Ruben', 'Doblas', '+591 65824988'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _people.length,
      itemBuilder: (context, index) {
        return ListTile(
          onLongPress: () => _deletePerson(context, _people[index]),
          title: Text('${_people[index].name} ${_people[index].lastname}'),
          subtitle: Text(_people[index].phone),
          leading: CircleAvatar(
            child: Text(_people[index].name.substring(0, 1)),
          ),
          trailing: const Icon(Icons.delete),
        );
      },
    );
  }

  _deletePerson(context, People person) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Estas seguro de eliminar a esta persona?"),
        content: Text("Estas seguro de eliminar a ${person.name}?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _people.remove(person);
              });
              Navigator.pop(context);
            },
            child: const Text(
              'Borrar',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

class People {
  String name;
  String lastname;
  String phone;

  People(this.name, this.lastname, this.phone);
}
