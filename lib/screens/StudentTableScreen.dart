import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentTableScreen extends StatelessWidget {
  const StudentTableScreen({super.key});

  void _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  void _sendMessage(String messageNumber) async {
    final Uri smsUri = Uri(scheme: 'sms', path: messageNumber);
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'Could not launch $messageNumber';
    }
  }

  void _openGitHub() async {
    const url = 'https://github.com/xMyerss';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información Personal'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Pedro Josafat Ruiz Robles',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _makePhoneCall('9616665782'),
                icon: const Icon(Icons.phone),
                label: const Text('Llamar'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () => _sendMessage('9616665782'),
                icon: const Icon(Icons.message),
                label: const Text('Enviar Mensaje'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: _openGitHub,
                icon: const Icon(Icons.web),
                label: const Text('Abrir GitHub'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
