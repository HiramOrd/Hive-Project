import 'package:flutter/material.dart';
import 'package:hive_project/constants/style.dart';

class CDropdown<T> extends StatelessWidget {
  const CDropdown({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  final T? value;
  final Function(T?) onChanged;
  final List<DropdownMenuItem<T>> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Style.GAP_MD),
          ),
        ),
      ),
      onChanged: onChanged,
      items: items,
    );
  }
}
