import 'package:flutter/material.dart';
import 'package:hive_project/constants/style.dart';

class UserForm extends StatelessWidget {
  const UserForm({
    Key? key,
    required this.name,
    required this.age,
    required this.save,
    required this.delete,
  }) : super(key: key);

  final TextEditingController name;
  final TextEditingController age;
  final Function() delete;
  final Function() save;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Form Title
        const Text(
          'Add person',
          style: Style.TEXT_MD_BOLD_PRIMARY,
        ),
        const SizedBox(height: Style.GAP_MD),

        // Name Input
        TextFormField(
          controller: name,
          decoration: Style.textFieldStyle('Full Name*'),
        ),
        const SizedBox(height: Style.GAP_SM),

        // Age Input
        TextField(
          controller: age,
          decoration: Style.textFieldStyle('Age*'),
          keyboardType: TextInputType.number,
        ),

        // Delete button
        ElevatedButton.icon(
          onPressed: delete,
          style: Style.ELEVATED_BUTTON_PRIMARY,
          icon: const Icon(Icons.delete),
          label: const Text('Delete all'),
        ),
        const SizedBox(width: Style.GAP_SM),

        // Save button
        ElevatedButton.icon(
          onPressed: save,
          style: Style.ELEVATED_BUTTON_PRIMARY,
          icon: const Icon(Icons.save),
          label: const Text('Save'),
        ),
      ],
    );
  }
}
