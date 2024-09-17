import 'package:flutter/material.dart';

class InputAndText extends StatefulWidget {
  const InputAndText({super.key});

  @override
  State<InputAndText> createState() => _InputAndTextState();
}

class _InputAndTextState extends State<InputAndText> {
  final TextEditingController _inputController = TextEditingController();
  String _displayText = '';

  void _updateText() {
    setState(() {
      _displayText = _inputController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input and Text'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Ingresa texto',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateText,
              child: const Text('Mostrar Texto'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Text(
                _displayText.isEmpty ? 'El texto se mostrará aquí.' : _displayText,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
