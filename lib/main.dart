import 'package:flutter/material.dart';
import 'package:phone_app/screens/InputAndText.dart';
import 'package:phone_app/screens/StudentTableScreen.dart';
import 'package:phone_app/screens/ApiRequestScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Lista de pantallas a mostrar en el Navigation Bar
  final List<Widget> _screens = [
    const InputAndText(),        // Pantalla de entrada de texto
    const StudentTableScreen(),  // Pantalla de información personal
    const ApiRequestScreen(),    // Pantalla de solicitud HTTP
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'Text Input',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contact Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.http),
            label: 'API Request',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
