import 'package:flutter/material.dart';
import 'package:hive_project/constants/style.dart';
import 'package:hive_project/main.dart';
import 'package:hive_project/models/person.dart';
import 'package:hive_project/molecules/main_container.dart';
import 'package:hive_project/molecules/user_form.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Controllers
  late TextEditingController name;
  late TextEditingController age;

  // List of Box
  List<Person> persons = [];

  @override
  void initState() {
    super.initState();

    // Init controllers
    name = TextEditingController();
    age = TextEditingController();

    // Set persons list
    updatePersonsList();
  }

  // Update persons list
  void updatePersonsList() {
    // Update person List with box data
    persons = box.values.map((value) {
      final person = value as Person;
      return person;
    }).toList();

    // Update State
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      title: 'Hive Form',
      children: [
        const SizedBox(height: Style.GAP_SM),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Form
              UserForm(
                name: name,
                age: age,
                delete: () async {
                  // Clear persons box
                  await box.clear();
                  updatePersonsList();
                },
                // Save form
                save: () async {
                  // Set person object
                  var person = Person(
                    name: name.text,
                    age: int.parse(age.text),
                  );

                  // Add Person
                  await box.add(person);

                  // Hide keboard
                  FocusScope.of(context).requestFocus(
                    FocusNode(),
                  );

                  // Reset inputs
                  name.text = '';
                  age.text = '';

                  updatePersonsList();
                },
              ),
            ],
          ),
        ),
        Column(
          children: [
            // Persons list
            if (persons.isNotEmpty)
              ...persons.map((value) {
                return ListTile(
                  title: Text(value.name!),
                  trailing: Text('${value.age}'),
                  onTap: () {
                    box.delete(value.key);
                    updatePersonsList();
                  },
                );
              }).toList(),

            // If person list is empty
            if (persons.isEmpty)
              const SizedBox(
                height: 100,
                child: Center(
                  child: Text('vacio'),
                ),
              ),
          ],
        )
      ],
    );
  }
}
