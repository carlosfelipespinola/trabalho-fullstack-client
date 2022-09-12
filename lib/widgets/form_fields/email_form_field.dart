

import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  final String? initialValue;
  final Function(String)? onChanged;

  const EmailFormField({
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
        label: Text("Email")
      ),
    );
  }

  String? validator(String? email) {
    if (email?.isEmpty ?? true) {
      return 'Email é obrigatório';
    }
    if (!(email?.contains('@') ?? true)) {
      return 'Email inválido';
    }
    return null;
  }
}
