

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('user'),
          ElevatedButton(
            onPressed: () {
              //signout
            },
            child: const Text('sign out'),
          ),
        ],
      ),
      
    );
  }
}