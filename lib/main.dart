import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green), // Set warna primer ke hijau
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
        '/menu1': (context) => MenuPage(title: 'Menu Pertama'),
        '/menu2': (context) => MenuPage(title: 'Menu Kedua'),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Anda dapat menambahkan validasi username dan password di sini
                // Misalnya, jika berhasil, navigasikan ke halaman dashboard
                Navigator.pushNamed(context, '/dashboard');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu1');
              },
              child: Text('Menu Pertama'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/menu2');
              },
              child: Text('Menu Kedua'),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String title;

  MenuPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Selamat datang di $title',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
