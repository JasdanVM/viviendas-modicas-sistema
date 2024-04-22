import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iniciar Viviendas Módicas',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: CustomColor.cVerde,
      ),
      home: const LoginScreen(),
    );
  }
}

class MyAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyAppButton({super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.green,
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainMenu()),
        );
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


class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Main Menu'),
    ),
    body: Stack(
      children: [
        Center(
          child: SizedBox(
            width: 300,
            height: 371,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/vm_icon.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CurrentRentersScreen()),
                    );
                  },
                  child: const Text('Añadir Datos',style: TextStyle(fontSize: 22,)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CurrentRentersScreen()),
                    );
                  },
                  child: const Text('Reportes',style: TextStyle(fontSize: 22,)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchRenterScreen()),
                    );
                  },
                  child: const Text('Buscar Arrendatario',style: TextStyle(fontSize: 22,)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchByHousingScreen()),
                    );
                  },
                  child: const Text('Buscar por Vivienda',style: TextStyle(fontSize: 22,)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ViewAccountsScreen()),
                    );
                  },
                  child: const Text('Ver Estado de Cuentas',style: TextStyle(fontSize: 22,)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViewPendingAccountsScreen()),
                    );
                  },
                  child: const Text('Ver Cuentas Pendientes',style: TextStyle(fontSize: 22,)),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

}

class CurrentRentersScreen extends StatelessWidget {
  const CurrentRentersScreen({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Reportes'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 500, 
            height: 50, 
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CurrentTenantsListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50), 
                textStyle: const TextStyle(fontSize: 22), 
              ),
              child: const Text('Lista de Arrendatarios Actuales'),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 500,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PreviousTenantsHistoryScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(500, 50),
                textStyle: const TextStyle(fontSize: 22),
              ),
              child: const Text('Historial de Arrendatarios Previos'),
            ),
          ),
        ],
      ),
    ),
  );
}

}

class CurrentTenantsListScreen extends StatelessWidget {
  const CurrentTenantsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Arrendatarios Actuales'),
      ),
      body: const Center(
        child: Text('Aquí va la lista de arrendatarios actuales'),
      ),
    );
  }
}

class PreviousTenantsHistoryScreen extends StatelessWidget {
  const PreviousTenantsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Arrendatarios Previos'),
      ),
      body: const Center(
        child: Text('Aquí va el historial de arrendatarios previos'),
      ),
    );
  }
}

class SearchRenterScreen extends StatelessWidget {
  const SearchRenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Arrendatario'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage('assets/vm_icon.png'),
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
              ),
            ),
            const Text(
              'Buscar Arrendatarios',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            MyAppButton(
              text: 'Buscar',
              onPressed: () {
                print('Search by Name button pressed');
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Número de Identidad',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            MyAppButton(
              text: 'Buscar',
              onPressed: () {
                print('Search by ID Number button pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchByHousingScreen extends StatelessWidget {
  const SearchByHousingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar por Vivienda'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image(
                  image: AssetImage('assets/vm_icon.png'),
                  fit: BoxFit.fitHeight,
                  width: 100,
                  height: 100,
                ),
              ),
              const Text(
                'Filtrar ubicación de la vivienda:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Ubicación',
                  border: OutlineInputBorder(),
                ),
                items: [
                  'Ubicación 1',
                  'Ubicación 2',
                  'Ubicación 3',
                  'Mostrar Todas'
                ].map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'Buscar por código de vivienda:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Código de vivienda',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Buscar button pressed');
                  },
                  child: const Text('Buscar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewAccountsScreen extends StatelessWidget {
  const ViewAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Estado de Cuentas'),
      ),
      body: const Center(
        child: Text('View Accounts Screen'),
      ),
    );
  }
}

class ViewPendingAccountsScreen extends StatelessWidget {
  const ViewPendingAccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Cuentas Pendientes'),
      ),
      body: const Center(
        child: Text('View Pending Accounts Screen'),
      ),
    );
  }
}
