import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProximosSorteos extends StatelessWidget {
  const ProximosSorteos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Rifa'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ElevatedButton(
            child: const Text('Open route'),
            onPressed: () {
              // Navigate to second route when tapped.
            },
          ),
        ),
      ),
    );
  }
}
