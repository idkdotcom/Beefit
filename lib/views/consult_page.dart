import 'package:beefit/value_objects/fitness_instructor.dart';
import 'package:flutter/material.dart';
import 'package:beefit/views/chat_page.dart';

class ConsultPage extends StatefulWidget {
  ConsultPage({super.key});

  @override
  _ConsultPageState createState() => _ConsultPageState();
}

class _ConsultPageState extends State<ConsultPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<FitnessInstructor> instructors = [
    FitnessInstructor(
      name: 'John Doe',
      specialty: 'Yoga Instructor',
      experience: 5,
      rating: 4.9,
      price: 20.0,
      imageUrl: 'https://example.com/instructor1.jpg',
    ),
    FitnessInstructor(
      name: 'Jane Smith',
      specialty: 'Personal Trainer',
      experience: 3,
      rating: 4.7,
      price: 25.0,
      imageUrl: 'https://example.com/instructor2.jpg',
    ),
    // Add more instructors as needed
  ];

  List<FitnessInstructor> _filteredInstructors = [];

  @override
  void initState() {
    super.initState();
    _filteredInstructors = instructors;
    _searchController.addListener(_filterInstructors);
  }

  void _filterInstructors() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredInstructors = instructors.where((instructor) {
        return instructor.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterInstructors);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructors'),
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Fitness Instructor',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredInstructors.length,
              itemBuilder: (context, index) {
                final instructor = _filteredInstructors[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(instructor.imageUrl),
                    ),
                    title: Text(instructor.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(instructor.specialty),
                        Text('${instructor.experience} years experience'),
                        Text('${instructor.rating} stars'),
                        Text('\$${instructor.price}/session'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(instructor: instructor),
                          ),
                        );
                      },
                      child: Text('Chat', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
