import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/animal_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  bool _showClue = false;
  static const String _clueText = "Username: isyraffajar, Password: 140";

  String get username => _usernameController.text.trim();

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username == "isyraffajar" && password == "140") {
      setState(() => _errorMessage = null);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const AnimalList(),
          settings: RouteSettings(arguments: username),
        ),
      );
    } else {
      if (username.isNotEmpty && password.isNotEmpty) {
        setState(
          () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Login gagal, pastikan username dan password benar!",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            ),
          ),
        );
      }
    }

    if (username.isEmpty || password.isEmpty) {
      setState(
        () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Username dan password tidak boleh kosong!",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          ),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.key),
                      ),
                    ),
                    SizedBox(height: 15),

                    if (_errorMessage != null)
                      Text(_errorMessage!, style: TextStyle(color: Colors.red)),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.blue, width: 2),
                        ),
                        onPressed: _login,
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(height: 20),

                    if (_showClue)
                      const Text(
                        _clueText,
                        style: TextStyle(color: Colors.green),
                      ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: _showClue ? Colors.red : Colors.green,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _showClue = !_showClue;
                        });
                      },
                      child: Text(
                        _showClue ? "Tutup" : "Clue",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
