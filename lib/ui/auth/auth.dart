import 'package:ecommerce_shop/ui/auth/bloc/auth_bloc.dart';
import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  TextEditingController textEditingControllerUserName = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) {
      final authBloc = AuthBloc();
      authBloc.add(AuthStarted(0));
      return authBloc;
    }, child: BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
              Text('welcome'),
              Text('please enter your data to continue'),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              AuthTextField(
                icon: Icon(Icons.task_alt_outlined),
                lable: 'UserName',
                suffixText: '',
                textEditingController: textEditingControllerUserName,
                isUsername: true,
              ),
              SizedBox(
                height: 30,
              ),
              AuthTextField(
                  textEditingController: textEditingControllerPassword,
                  icon: Icon(Icons.stacked_bar_chart),
                  lable: 'Password',
                  suffixText: 'Strong',
                  isUsername: false),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //TODO  فاصله متن با ساختار کلی متفاوت است
                  TextButton(
                      onPressed: () {},
                      child: const Text('Forgot your password ?')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Remember me'),
                    FkToggle(
                      width: 30,
                      height: 30,
                      labels: const ['no', 'yes'],
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'By connecting your account confirm that you agree with our Term and Condition',
                textAlign: TextAlign.center,
              )
            ]),
          )),
        );
      },
    ));
  }
}

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.textEditingController,
    required this.icon,
    required this.lable,
    required this.suffixText,
    required this.isUsername,
  });
  final TextEditingController textEditingController;
  final Icon icon;
  final String lable;
  final String suffixText;
  final bool isUsername;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      //TODO : prifix and suffix dont work
      controller: widget.textEditingController,

      decoration: InputDecoration(
          suffixIcon:
              widget.isUsername && widget.textEditingController.text.isNotEmpty
                  ? widget.icon
                  : null,
          suffixIconColor: Colors.green,
          labelText: widget.lable,
          suffixText: widget.textEditingController.text.isNotEmpty
              ? widget.suffixText
              : '',
          suffixStyle: TextStyle(color: Colors.green),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(35))),
    );
  }
}
