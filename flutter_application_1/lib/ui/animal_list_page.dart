import 'package:flutter/material.dart';

class AnimalList extends StatelessWidget {
  const AnimalList({super.key});

  @override
  Widget build(BuildContext context) {

    final username =
        ModalRoute.of(context)?.settings.arguments as String?;

    final List<String> animals = [
      "Cat",
      "Dog",
      "Elephant",
      "Lion",
      "Tiger",
      "Rabbit",
      "Horse",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animal List"),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Welcome $username",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.pets),
                  title: Text(animals[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}