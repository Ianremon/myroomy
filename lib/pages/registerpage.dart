import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:myroomy/pages/LoginPage.dart'; // Asegúrate de que la ruta de importación es correcta.

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String? universityValue;
  bool _showUserIcon = true;

  void _toggleUserIconVisibility(bool value) {
    setState(() {
      _showUserIcon = value;
    });
  }

  InputDecoration _inputDecoration([String? labelText]) {
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
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _nameController,
                      decoration: _inputDecoration('Nombre y apellido'),
                      onTap: () => _toggleUserIconVisibility(false),
                      onEditingComplete: () => _toggleUserIconVisibility(true),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: universityValue,
                          items: ['UMU', 'UCAM', 'OTROS']
                              .map((String value) => DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            setState(() {
                              universityValue = newValue;
                              _toggleUserIconVisibility(true);
                            });
                          },
                          hint: Text('Universidad'),
                          onTap: () => _toggleUserIconVisibility(false),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: _inputDecoration('Correo eléctrico'),
                      onTap: () => _toggleUserIconVisibility(false),
                      onEditingComplete: () => _toggleUserIconVisibility(true),
                    ),
                    SizedBox(height: 16.0),
                    IntlPhoneField(
                      decoration: _inputDecoration('Número de teléfono'),
                      initialCountryCode: 'ES',
                      onChanged: (phone) => print(phone.completeNumber),
                      onTap: () => _toggleUserIconVisibility(false),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: _inputDecoration('Contraseña'),
                      onTap: () => _toggleUserIconVisibility(false),
                      onEditingComplete: () => _toggleUserIconVisibility(true),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: _inputDecoration('Confirmar contraseña'),
                      onTap: () => _toggleUserIconVisibility(false),
                      onEditingComplete: () => _toggleUserIconVisibility(true),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: () {
                        print("Registrando usuario...");
                        // Agrega aquí la lógica de registro si es necesario.
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xff5e18eb), Color(0xffFF1053)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                            maxWidth: double.infinity,
                            minHeight: 50,
                          ),
                          child: Text(
                            'Confirmar',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_showUserIcon)
            Positioned(
              top: 40,
              right: 50,
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff5e18eb), Color(0xffFF1053)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {
                    // Navegación a LoginPage al presionar el icono de usuario
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
