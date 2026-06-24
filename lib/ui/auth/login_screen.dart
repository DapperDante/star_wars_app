import 'package:flutter/material.dart';
import 'package:star_wars/ui/auth/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});
  final LoginViewModel viewModel;
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final res = await widget.viewModel.login(
        _emailController.text,
        _passwordController.text,
      );
      if (!context.mounted) {
        return;
      }
      if (res) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login successful')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Login failed')));
      }
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      padding: EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image(
                image: AssetImage(widget.viewModel.getLogoPath(context)),
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                height: 350,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      spacing: 10,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email', style: TextStyle(fontSize: 16)),
                            TextFormField(
                              controller: _emailController,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Please enter your email'
                                  : null,
                              decoration: InputDecoration(
                                hintText: 'example@gmail.com',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Password'),
                            TextFormField(
                              controller: _passwordController,
                              validator: (value) =>
                                  value == null || value.isEmpty
                                  ? 'Please enter your password'
                                  : null,
                              obscureText: true,
                              decoration: InputDecoration(hintText: '••••••••'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => _login(context),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Icon(Icons.login, size: 24),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
