import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/animal_model.dart';

class AnimalDetailPage extends StatelessWidget {
  final Animal animal;

  const AnimalDetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          animal.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Image.network(
                animal.image,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Type: ${animal.type}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Weight: ${animal.weight} kg"),
                  Text("Height: ${animal.height} cm"),
                  const Divider(),
                  const Text(
                    "Habitats:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(animal.habitat.join(", ")),
                  const SizedBox(height: 10),
                  const Text(
                    "Activities:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(animal.activities.join(", ")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
