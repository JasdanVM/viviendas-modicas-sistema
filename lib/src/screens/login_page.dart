import 'package:flutter/material.dart';
import '../shared/constantes.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  String? _username, _password;
  bool _loginError = false;

  void _handleLogin() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_username == 'Admin' && _password == '123456789') {
        print('Login Successful!');
        setState(() {
          _loginError = false;
        });
        Navigator.pushNamed(context, Rutas.menuPrincipal.name);
      } else {
        print('Invalid username or password');
        setState(() {
          _loginError = true;
        });
      }
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RawKeyboardListener(
          focusNode: _focusNode,
          onKey: (event) {
            if (event is RawKeyDownEvent &&
                event.logicalKey == LogicalKeyboardKey.enter) {
              _handleLogin();
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 300.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image(
                        image: AssetImage('assets/vm_icon.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Inicio de Sesión',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Usuario',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa tu nombre de Usuario';
                        }
                        return null;
                      },
                      onSaved: (value) => _username = value,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa tu Contraseña';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _handleLogin,
                        child: const Text('Entrar'),
                      ),
                    ),
                    if (_loginError)
                      const Text(
                        'Usuario o contraseña incorrectos',
                        style: TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}