import 'package:flutter/material.dart';
import 'package:jwt_auth_plus/jwt_auth_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueAccent,
      ),
      home: const TokenDebuggerScreen(),
    );
  }
}

class TokenDebuggerScreen extends StatefulWidget {
  const TokenDebuggerScreen({super.key});

  @override
  State<TokenDebuggerScreen> createState() => _TokenDebuggerScreenState();
}

class _TokenDebuggerScreenState extends State<TokenDebuggerScreen> {
  final TextEditingController _controller = TextEditingController();
  JWTModel? _decodedModel;
  String? _error;

  void _processToken() {
    setState(() {
      _error = null;
      try {
        if (_controller.text.isEmpty) {
          _decodedModel = null;
          return;
        }
        _decodedModel = JWTAuthPlus.decode(_controller.text);
      } catch (e) {
        _decodedModel = null;
        _error = e.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JWT Auth Plus Debugger')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Paste JWT Token',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cleaning_services),
                  onPressed: () => _controller.clear(),
                ),
              ),
              maxLines: 3,
              onChanged: (_) => _processToken(),
            ),
            const SizedBox(height: 20),
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            if (_decodedModel != null) ...[
              _InfoCard(
                title: 'Status',
                value: _decodedModel!.isExpired ? 'EXPIRED' : 'VALID',
                color: _decodedModel!.isExpired ? Colors.red : Colors.green,
              ),
              _InfoCard(
                  title: 'User ID (sub)',
                  value: _decodedModel!.userId ?? 'N/A'),
              const Divider(),
              const Text('Full Payload:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(_decodedModel!.payload.toString()),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const _InfoCard({required this.title, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Text(
        value,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}
