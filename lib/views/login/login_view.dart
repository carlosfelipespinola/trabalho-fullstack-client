import 'package:client/cubits/auth/auth_cubit.dart';
import 'package:client/cubits/auth/auth_cubit_state.dart';
import 'package:client/helpers/navigation_helper.dart';
import 'package:client/helpers/spacings_helper.dart';
import 'package:client/views/login/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: BlocListener<AuthCubit, AuthCubitState>(
              listenWhen: (previous, current) => previous is AuthCubitBusy,
              listener: (context, state) {
                if (state is AuthCubitAuthenticated) {
                  Navigator.of(context).pushReplacementNamed(NavigationHelper.routes.home);
                }
                if (state is AuthCubitError) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Ocorreu um erro ao fazer login",
                      style: TextStyle(color: Theme.of(context).colorScheme.onError),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ));
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const LoginForm(),
                  Divider(height: SpacingsHelper.large,),
                  TextButton(
                    onPressed: () => Navigator.of(context).pushNamed(NavigationHelper.routes.register),
                    child: const Text("REGISTRAR")
                  )
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}