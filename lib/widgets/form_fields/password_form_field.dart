

import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  final String? initialValue;
  final Function(String)? onChanged;

  const PasswordFormField({
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
        label: Text("Senha")
      ),
    );
  }

  String? validator(String? password) {
    if (password?.isEmpty ?? true) {
      return 'Senha é obrigatória';
    }
    if (password!.length < 6) {
      return 'Senha deve ter mais que 6 caracteres';
    }
    return null;
  }
}
