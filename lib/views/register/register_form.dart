

import 'package:client/cubits/auth/auth_cubit.dart';
import 'package:client/cubits/auth/auth_cubit_state.dart';
import 'package:client/helpers/spacings_helper.dart';
import 'package:client/services/api/models/authentication_register_dto.dart';
import 'package:client/widgets/form_fields/email_form_field.dart';
import 'package:client/widgets/form_fields/name_form_field.dart';
import 'package:client/widgets/form_fields/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({ Key? key }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String? _email;
  String? _password;
  String? _name;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Builder(
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Registrar", style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center,),
              SizedBox(height: SpacingsHelper.medium),
              EmailFormField(
                initialValue: '',
                onChanged: (email) => _email = email,
              ),
              SizedBox(height: SpacingsHelper.medium),
              PasswordFormField(
                initialValue: '',
                onChanged: (password) => _password = password,
              ),
              SizedBox(height: SpacingsHelper.medium),
              NameFormField(
                initialValue: '',
                onChanged: (name) => _name = name,
              ),
              SizedBox(height: SpacingsHelper.medium),
              BlocBuilder<AuthCubit, AuthCubitState>(
                builder: (context, authState) {
                  if (authState is AuthCubitBusy) {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if(Form.of(context)!.validate()) {
                        context.read<AuthCubit>().register(AuthenticationRegisterDto(
                          email: _email!,
                          password: _password!,
                          name: _name!
                        ));
                      }
                    },
                    child: const Text("REGISTRAR")
                  );
                }
              )
            ],
          );
        }
      )
    );
  }
}