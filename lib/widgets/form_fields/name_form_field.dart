

import 'package:flutter/material.dart';

class NameFormField extends StatelessWidget {
  final String? initialValue;
  final Function(String)? onChanged;

  const NameFormField({
    Key? key,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      decoration: const InputDecoration(
        label: Text("Nome")
      ),
    );
  }

  String? validator(String? name) {
    if (name?.isEmpty ?? true) {
      return 'Nome é obrigatório';
    }
    if (name!.length < 6) {
      return 'Nome deve ter mais que 6 caracteres';
    }
    return null;
  }
}
