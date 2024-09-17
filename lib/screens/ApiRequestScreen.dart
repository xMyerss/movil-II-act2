import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiRequestScreen extends StatefulWidget {
  const ApiRequestScreen({super.key});

  @override
  State<ApiRequestScreen> createState() => _ApiRequestScreenState();
}

class _ApiRequestScreenState extends State<ApiRequestScreen> {
  String _apiResponse = 'Esperando respuesta...';
  bool _isLoading = false;

  // Función para hacer la solicitud HTTP
  Future<void> _makeGetRequest() async {
    setState(() {
      _isLoading = true;
      _apiResponse = 'Cargando...';
    });

    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _apiResponse = '''
            Título: ${data['title']}
            Cuerpo: ${data['body']}
          ''';
          _isLoading = false;
        });
      } else {
        setState(() {
          _apiResponse = 'Error: No se pudo obtener la respuesta.';
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _apiResponse = 'Error: $error';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitud HTTP'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _makeGetRequest,
              child: _isLoading ? const CircularProgressIndicator() : const Text('Hacer solicitud GET'),
            ),
            const SizedBox(height: 20),
            Text(
              _apiResponse,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
