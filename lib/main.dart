import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/login_screen.dart';

void main() async {
  // Garantir que os bindings do Flutter sejam inicializados
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializar o Firebase antes de rodar o app
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "your-api-key", // Coloque aqui as suas credenciais do Firebase
      authDomain: "your-auth-domain",
      projectId: "your-project-id",
      storageBucket: "your-storage-bucket",
      messagingSenderId: "your-messaging-sender-id",
      appId: "your-app-id",
    ),
  );

  runApp(HabitTrackerApp());
}

class HabitTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: LoginScreen(), // Inicia com a tela de login
    );
  }
}
