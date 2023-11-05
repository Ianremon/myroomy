import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  InputDecoration _inputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xffFF1053)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 80.0),
            Image.asset('assets/Logo_Myroomy.png', height: 100.0),
            SizedBox(height: 80.0),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration('Correo electrónico'),
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: _inputDecoration('Contraseña'),
            ),
            SizedBox(height: 48.0),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff5e18eb), Color(0xffFF1053)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  primary: Colors.white, // This is the color for the text.
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // This ensures that the text and the icon are white.
                  // The splash color is transparent because it uses the ink response
                  // which gives a highlight color that we don't want to change.
                  onSurface: Colors.white,
                ),
                onPressed: () {
                  // Aquí iría la lógica de inicio de sesión
                  print("Iniciando sesión...");
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
