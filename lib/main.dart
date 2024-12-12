import 'package:flutter/material.dart'; // Importa a biblioteca principal do Flutter
import 'package:simple_todo/pages/home_page.dart'; // Importa a página principal do aplicativo

// Função principal que inicia o aplicativo
void main() {
  runApp(const MyApp()); // Executa o aplicativo com o widget MyApp
}

// Widget que define a raiz do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Widget que fornece a estrutura básica do aplicativo
      debugShowCheckedModeBanner: false, // Remove a faixa de depuração no canto superior direito
      home: HomePage(), // Define a página inicial do aplicativo como HomePage
    );
  }
}