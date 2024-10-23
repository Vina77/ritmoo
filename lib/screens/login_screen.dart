import 'package:flutter/material.dart';
import 'home_page.dart'; // Importando a HomePage
// import 'habit_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _signInWithGoogle() async {
    try {
      /* final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return; // O login foi cancelado
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);*/

      // Se o login for bem-sucedido, navegue para a HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()), // Redireciona para HomePage
      );
    } catch (e) {
      print('Erro ao fazer login com o Google: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Seja bem-vindo!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 34, 42, 45), // Cor 292929 em ARGB
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(5), // Aumentei o padding para 12
                child: CircleAvatar(
                  backgroundColor: Colors
                      .transparent, // Para que o fundo preto apareça atrás
                  radius: 55, // Aumentei o radius para 55
                  child: SvgPicture.asset(
                    "assets/images/logo_ritmoo.svg",
                    width: 57,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: _signInWithGoogle,
                child: Image.asset(
                  "assets/images/web_light_rd_SI@1x.png",
                  width: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
