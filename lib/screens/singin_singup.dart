import 'package:flutter/material.dart';
import 'package:medic/comon/constant.dart';
import 'package:medic/comon/methods.dart';
import 'package:medic/gen/assets.gen.dart';
import 'package:medic/screens/main_screen.dart';

class SingUp extends StatelessWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SinginOrSingup(
      title: 'Sign Up',
      subTitle: 'Sign up now for free and start meditating, and explore Medic.',
      isSingInPage: false,
      onTapButton: (email, password, name) {
        if (email.isNotEmpty && password.isNotEmpty && name != null) {
          pushReplacement(context, const MainScreen());
        } else {
          showSnakbar(context, 'Complete the requested information ');
        }
      },
    );
  }
}

class SingIn extends StatelessWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SinginOrSingup(
      title: 'Sign In',
      subTitle: 'Sign in now to acces your excercises and saved music.',
      isSingInPage: true,
      onTapButton: (email, password, name) {
        //name is null in SignIn screen
        if (email.isNotEmpty && password.isNotEmpty) {
          pushReplacement(context, const MainScreen());
        } else {
          // ScaffoldMessenger.of(context).showSnackBar(
          //     SnackBar(content: Text('تمام اطلاعات را وارد نمایید.')));
          showSnakbar(context, 'Complete the requested information');
        }
      },
    );
  }
}

class _SinginOrSingup extends StatefulWidget {
  final String title;
  final String subTitle;

  final bool isSingInPage;
  final Function(String email, String password, String? name) onTapButton;

  const _SinginOrSingup(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.isSingInPage,
      required this.onTapButton})
      : super(key: key);

  @override
  State<_SinginOrSingup> createState() => _SinginOrSingupState();
}

class _SinginOrSingupState extends State<_SinginOrSingup> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Assets.img.background.leaf.image(),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              physics: Constant.defaultPhysics,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    Constant.defMargin,
                    Constant.defMargin * 3,
                    Constant.defMargin,
                    Constant.defMargin),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Assets.img.icon.logo.svg(
                      width: 43.41,
                      height: 49,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      widget.title,
                      style: themeData.textTheme.headline4,
                    ),
                    Text(
                      widget.subTitle,
                      style: themeData.textTheme.bodyText2!.apply(
                        fontSizeFactor: 1.1,
                        color: themeData.textTheme.bodyText2!.color!
                            .withOpacity(.5),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            widget.isSingInPage
                                ? const SizedBox.shrink()
                                : TextField(
                                    controller: _nameController,
                                    keyboardType: TextInputType.name,
                                    decoration: const InputDecoration(
                                        labelText: 'Name'),
                                  ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a Email';
                                } else if (!RegExp(
                                        r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
                                    .hasMatch(value)) {
                                  return 'Please enter a valid Email';
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  labelText: 'Email Address'),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                            ),
                            widget.isSingInPage
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Forgot Password?',
                                          style: themeData.textTheme.caption!
                                              .copyWith(
                                                  fontSize: 14, height: 2),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox.shrink(),
                            const SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    widget.onTapButton(
                                        _emailController.text,
                                        _passwordController.text,
                                        widget.isSingInPage
                                            ? null
                                            : _nameController.text);
                                  }
                                },
                                child: Text(
                                    widget.isSingInPage ? 'LOGIN' : 'SIGN UP'),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(widget.isSingInPage
                                    ? 'Don’t have an account? '
                                    : 'Already have an account? '),
                                InkWell(
                                  onTap: () {
                                    // pushReplacement(context,
                                    //     isSingInPage ? const SingUp() : const SingIn());
                                    widget.isSingInPage
                                        ? pushReplacement(
                                            context,
                                            Builder(
                                                builder: (context) =>
                                                    const SingUp()))
                                        : pushReplacement(
                                            context,
                                            Builder(
                                                builder: (context) =>
                                                    const SingIn()));
                                  },
                                  child: Text(
                                    widget.isSingInPage ? 'Sign Up' : 'Sign In',
                                    style:
                                        themeData.textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
