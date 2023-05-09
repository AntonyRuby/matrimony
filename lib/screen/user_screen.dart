import 'package:flutter/material.dart';
import 'package:matrimony/screen/profile_screen.dart';

class User {
  final int id;
  final String name;
  final String image;
  final String caste;
  final String religion;
  final String occupation;

  final int age;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.image,
    required this.caste,
    required this.religion,
    required this.occupation,
  });
}

class UserScreen extends StatefulWidget {
  const UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User>? _users;

  bool isLoading = true;

  int? user;

  @override
  void initState() {
    super.initState();

    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() {
      isLoading = true;
    });
    final List<Map<String, dynamic>> data = [
      {
        'name': 'John Doe',
        'id': 1,
        'age': 25,
        'caste': 'Brahmin',
        'religion': 'Hindu',
        'occupation': 'Engineer',
        'image': 'https://images.unsplash.com/photo-1521747116042-5a810fda9664'
      },
      {
        'name': 'Jane Doe',
        'id': 2,
        'age': 20,
        'caste': 'Jat',
        'religion': 'Sikh',
        'occupation': 'Doctor',
        'image': 'https://images.unsplash.com/photo-1521747116042-5a810fda9664'
      },
    ];

    _users = data
        .map((userJson) => User(
              id: userJson['id'],
              caste: userJson['caste'],
              image: userJson['image'],
              name: userJson['name'],
              age: userJson['age'],
              occupation: userJson['occupation'],
              religion: userJson['religion'],
            ))
        .toList();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: GridView.builder(
                padding: const EdgeInsets.all(30.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 40.0,
                  childAspectRatio: 0.90,
                ),
                itemCount: _users?.length ?? 0,
                itemBuilder: (context, index) {
                  final user = _users![index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProfileScreen(
                          user: {
                            'id': index,
                            'name': user.name,
                            'age': user.age,
                            'image': user.image,
                            'caste': user.caste,
                          },
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 25.0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(user.image),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10.0,
                                  left: 10.0,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0,
                                      vertical: 5.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    child: const Text(
                                      'New',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            '${user.age} years',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            user.caste,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
