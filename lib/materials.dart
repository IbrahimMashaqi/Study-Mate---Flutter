import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Materials extends StatefulWidget {
  const Materials({super.key});

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  List<Map<String, dynamic>> courses = [
    {
      'name': 'Data Structures',
      'icon': Icons.storage,
      'desc': 'Algorithms & data structures',
    },
    {
      'name': 'Computer Networks',
      'icon': Icons.network_wifi,
      'desc': 'Network basics',
    },
    {
      'name': 'Operating Systems',
      'icon': Icons.settings,
      'desc': 'Processes & threads',
    },
    {
      'name': 'Software Engineering',
      'icon': Icons.code,
      'desc': 'Design patterns & docs',
    },
  ];

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  IconData _selectedIcon = Icons.book;

  void _addCourse() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        courses.add({
          'name': _nameController.text,
          'desc': _descController.text,
          'icon': _selectedIcon,
        });
      });
      _nameController.clear();
      _descController.clear();
      Navigator.pop(context);
    }
  }

  void _showAddCourseDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Course'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Course Name',
                  prefixIcon: Icon(Icons.book),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter course name' : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.info),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter description' : null,
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<IconData>(
                initialValue: _selectedIcon,
                decoration: const InputDecoration(labelText: 'Select Icon'),
                items: const [
                  DropdownMenuItem(
                    value: Icons.book,
                    child: Row(
                      children: [
                        Icon(Icons.book),
                        SizedBox(width: 10),
                        Text('Book'),
                      ],
                    ),
                  ),

                  DropdownMenuItem(
                    value: Icons.computer,
                    child: Row(
                      children: [
                        Icon(Icons.computer),
                        SizedBox(width: 10),
                        Text('Computer'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: Icons.storage,
                    child: Row(
                      children: [
                        Icon(Icons.storage),
                        SizedBox(width: 10),
                        Text('Data'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: Icons.network_wifi,
                    child: Row(
                      children: [
                        Icon(Icons.network_wifi),
                        SizedBox(width: 10),
                        Text('Network'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: Icons.settings,
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(width: 10),
                        Text('OS'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: Icons.code,
                    child: Row(
                      children: [
                        Icon(Icons.code),
                        SizedBox(width: 10),
                        Text('Software'),
                      ],
                    ),
                  ),
                ],
                onChanged: (icon) {
                  setState(() {
                    _selectedIcon = icon!;
                  });
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(onPressed: _addCourse, child: const Text('Add')),
        ],
      ),
    );
  }

  Widget _createCard(String title, IconData icon, String desc) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(top: 10),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.aBeeZee(
            fontSize: 20,
            color: Colors.purple,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(desc),
        leading: Icon(icon, color: Colors.purple),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            setState(() {
              courses.removeWhere((c) => c['name'] == title);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme().copyWith(
          titleLarge: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
          titleTextStyle: GoogleFonts.aBeeZee(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Materials')),
        backgroundColor: const Color.fromARGB(255, 235, 230, 230),
        body: SingleChildScrollView(
          child: Column(
            children: courses
                .map(
                  (course) => _createCard(
                    course['name'],
                    course['icon'],
                    course['desc'],
                  ),
                )
                .toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddCourseDialog,
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
