import 'package:flutter/material.dart';
import 'package:hive_project/atoms/header.dart';
import 'package:hive_project/atoms/padding_md.dart';
import 'package:hive_project/atoms/textfield.dart';
import 'package:hive_project/constants/style.dart';
import 'package:hive_project/main.dart';
import 'package:hive_project/models/person.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController name;
  late TextEditingController age;
  List<Person> items = [];

  @override
  void initState() {
    name = TextEditingController();
    age = TextEditingController();
    items = box.values.map((value) {
      final person = value as Person;
      return person;
    }).toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CHeader(title: 'Hive Form'),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) {
                  return PaddingMd(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Add person',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Style.PRIMARY,
                          ),
                        ),
                        const SizedBox(height: Style.GAP_MD),
                        CTextField(
                          controller: name,
                          hintText: 'Full Name*',
                        ),
                        const SizedBox(height: Style.GAP_SM),
                        CTextField(
                          controller: age,
                          hintText: 'Age*',
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: Style.GAP_SM),
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () async {
                                  await box.clear();

                                  items = box.values.map((value) {
                                    final person = value as Person;
                                    return person;
                                  }).toList();

                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Style.PRIMARY,
                                ),
                                icon: const Icon(Icons.delete),
                                label: const Text('Delete all'),
                              ),
                              const SizedBox(width: Style.GAP_SM),
                              ElevatedButton.icon(
                                onPressed: () async {
                                  var person = Person(
                                    name: name.text,
                                    age: int.parse(age.text),
                                  );

                                  await box.add(person);

                                  items = box.values.map((value) {
                                    final person = value as Person;
                                    return person;
                                  }).toList();

                                  FocusScope.of(context).requestFocus(
                                    FocusNode(),
                                  );

                                  name.text = '';
                                  age.text = '';

                                  setState(() {});
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Style.PRIMARY,
                                ),
                                icon: const Icon(Icons.save),
                                label: const Text('Save'),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            if (items.isNotEmpty)
                              ...items.map((value) {
                                return ListTile(
                                  title: Text(value.name!),
                                  trailing: Text('${value.age}'),
                                  onTap: () {
                                    box.delete(value.key);

                                    items = box.values.map((value) {
                                      final person = value as Person;
                                      return person;
                                    }).toList();

                                    setState(() {});
                                  },
                                );
                              }).toList(),
                            if (items.isEmpty)
                              SizedBox(
                                height: 100,
                                child: Center(
                                  child: const Text('vacio'),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
