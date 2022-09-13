import 'package:client/cubits/auth/auth_cubit.dart';
import 'package:client/cubits/auth/auth_cubit_state.dart';
import 'package:client/helpers/navigation_helper.dart';
import 'package:client/helpers/spacings_helper.dart';
import 'package:client/views/register/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: SpacingsHelper.xlarge),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SpacingsHelper.xlarge, vertical: SpacingsHelper.xlarge),
              child: BlocListener<AuthCubit, AuthCubitState>(
                listenWhen: (previous, current) => previous is AuthCubitBusy,
                listener: (context, state) {
                  if (state is AuthCubitAuthenticated) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      NavigationHelper.routes.home,
                      (route) => false,
                    );
                  }
                  if (state is AuthCubitError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Ocorreu um erro ao fazer cadastro",
                        style: TextStyle(color: Theme.of(context).colorScheme.onError),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ));
                  }
                },
                child: const RegisterForm()
              )
            ),
          ),
        ),
      ),
    );
  }
}