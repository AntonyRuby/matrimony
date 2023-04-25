import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:matrimony/models/user.dart';
import 'package:matrimony/screen/edit_profile_screen.dart';
import 'package:matrimony/screen/profile_screen.dart';

class User {
  final int id;
  final String name;
  final String image;

  final int age;

  User(
      {required this.id,
      required this.name,
      required this.age,
      required this.image});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User>? _users;
  List<User>? _filteredUsers;
  bool? _isSearching;
  String? _searchQuery;
  bool isLoading = true;

  int? user;

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    _searchQuery = '';
    _fetchUsers();
  }

  // Future<void> _fetchUsers() async {
  //   final response = await http.get(Uri.parse('https://yourapi.com/users'));
  //   final data = jsonDecode(response.body) as List<dynamic>;
  //   _users = data
  //       .map((userJson) => User(
  //             id: userJson['id'],
  //             name: userJson['name'],
  //             dateOfBirth: DateTime.parse(userJson['dateOfBirth']),
  //             email: userJson['email'],
  //             address: userJson['address'],
  //           ))
  //       .toList();
  //   _filteredUsers = _users;
  //   setState(() {
  //   isLoading = false;
  // });
  // }

  // Future<void> getData() async {
  //   final response = await http
  //       .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> responseData = json.decode(response.body);
  //     setState(() {
  //       user = responseData;
  //       isLoading = false;
  //     });
  //   } else {
  //     throw Exception('Failed to load user');
  //   }
  // }

  Future<void> _fetchUsers() async {
    setState(() {
      isLoading = true;
    });
    // Your implementation to fetch data locally
    final List<Map<String, dynamic>> data = [
      {
        'id': 1,
        'name': 'John Doe',
        'age': 30,
        'image':
            'https://fastly.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU'
      },
      {
        'id': 2,
        'name': 'Jane Smith',
        'age': 25,
        'image': 'https://picsum.photos/seed/picsum/200/300'
      },
      {
        'id': 3,
        'name': 'Bob Johnson',
        'age': 35,
        'image': 'https://picsum.photos/seed/picsum/200/300'
      },
    ];

    _users = data
        .map((userJson) => User(
              id: userJson['id'],
              image: userJson['image'],
              name: userJson['name'],
              age: userJson['age'],
            ))
        .toList();
    _filteredUsers = _users;

    setState(() {
      isLoading = false;
    });
  }

  void _onSearchQueryChanged(String query) {
    _searchQuery = query;
    if (_searchQuery!.isNotEmpty) {
      _filteredUsers = _users!
          .where((user) =>
              user.name.toLowerCase().contains(_searchQuery!.toLowerCase()) ||
              user.age.toString().contains(_searchQuery!) ||
              user.id.toString().contains(_searchQuery!))
          .toList();
    } else {
      _filteredUsers = _users;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _isSearching!
              ? TextField(
                  onChanged: _onSearchQueryChanged,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                )
              : const Text('Users'),
          actions: [
            IconButton(
              icon: _isSearching!
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching!;
                  if (!_isSearching!) {
                    _filteredUsers = _users;
                    _searchQuery = '';
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () async {
                User? updatedUser = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(userId: user!),
                  ),
                );
                if (updatedUser != null) {
                  // Update the user object if changes were saved
                  setState(() {
                    _users = updatedUser as List<User>?;
                  });
                }
              },
            ),
          ],
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _filteredUsers?.length ?? 0,
                itemBuilder: (context, index) {
                  final user = _filteredUsers![index];
                  return ListTile(
                    leading: Hero(
                      tag: 'user_image_${user.id}',
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => Scaffold(
                              appBar: AppBar(),
                              body: Center(
                                child: Image.network(
                                  user.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ));
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(user.image),
                        ),
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(user.age.toString()),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        user: {
                          'id': user.id,
                          'name': user.name,
                          'age': user.age,
                          'image': user.image
                        },
                      ),
                    )),
                  );
                }));
  }
}
