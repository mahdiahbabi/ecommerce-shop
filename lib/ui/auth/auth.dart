// ignore_for_file: must_be_immutable

import 'package:ecommerce_shop/mainwarpper.dart';
import 'package:ecommerce_shop/theme/theme.dart';
import 'package:ecommerce_shop/ui/auth/bloc/auth_bloc.dart';
import 'package:fk_toggle/fk_toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widget.dart/auth_text_field.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  TextEditingController textEditingControllerUserName = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          final authBloc = AuthBloc();
          authBloc.stream.forEach((state) {
            if (state is AuthEror) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message.exceptionMessage)));
            } else if (state is AuthSuccess) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));

              Navigator.of(context).pushReplacement(CupertinoPageRoute(
                builder: (context) => MainWarpper(),
              ));
            }
          });
          authBloc.add(AuthStarted(0));
          return authBloc;
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          buildWhen: (previous, current) {
            return current is AuthInitial || current is AuthEror;
          },
          builder: (BuildContext context, state) {
            var theme = Theme.of(context).textTheme;
            return Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.arrow_back)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        'welcome',
                        style: theme.titleLarge!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'please enter your data to continue',
                        style: theme.caption!.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: AuthTextField(
                          keyboardType: TextInputType.emailAddress,
                          icon: const Icon(Icons.task_alt_outlined),
                          lable: 'UserName',
                          suffixText: '',
                          textEditingController: textEditingControllerUserName,
                          isUsername: true,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: AuthTextField(
                            keyboardType: TextInputType.visiblePassword,
                            textEditingController:
                                textEditingControllerPassword,
                            icon: const Icon(Icons.stacked_bar_chart),
                            lable: 'Password',
                            suffixText: 'Strong',
                            isUsername: false),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //TODO  فاصله متن با ساختار کلی متفاوت است
                            TextButton(
                                onPressed: () {},
                                child: const Text('Forgot your password ?')),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text('Remember me',style: theme.bodySmall!.apply(color: LightColor.authTextColor),),
                            FkToggle(
                              width: 30,
                              height: 30,
                              labels: const ['no', 'yes'],
                              backgroundColor: Colors.white,
                              selectedColor: Colors.green,
                  
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.all(15),
                        child: Text(
                          'By connecting your account confirm that you agree with our Term and Condition',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(35)),
                        child: InkWell(
                          onTap: () {
                            context.read<AuthBloc>().add(BottonClicked(
                                loginMode: 1,
                                userName: textEditingControllerUserName.text,
                                password: textEditingControllerPassword.text));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text(
                              'Login',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
