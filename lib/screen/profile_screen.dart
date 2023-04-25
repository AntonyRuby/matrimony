import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final Map<String, dynamic> user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));
  late final Animation<double> _fadeAnimation =
      Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.3),
    ),
  );

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(widget.user['name'] ?? ''),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  if (widget.user['image'] != null)
                    Image.network(
                      widget.user['image'],
                      fit: BoxFit.fill,
                    ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.10),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Personal'),
                Tab(text: 'Expectation'),
              ],
            ),
          ),
          SliverToBoxAdapter(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: SizedBox(
                            height: 1000,
                            child: TabBarView(
                              children: [
                                Container(
                                  key: const ValueKey('Personal'),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Personal Information',
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 30),
                                        Text(
                                          'ID: ${widget.user['id']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Date of Birth: ${widget.user['dateOfBirth']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Age: ${widget.user['age']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Gender: ${widget.user['gender']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Marital Status: ${widget.user['maritalStatus']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Religion: ${widget.user['religion']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Caste: ${widget.user['caste']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Education: ${widget.user['education']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Mother Tongue: ${widget.user['motherTongue']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Languages Known: ${widget.user['languageKnown']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Country: ${widget.user['country']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'State: ${widget.user['state']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'City: ${widget.user['city']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        const Text(
                                          'Professional Information',
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 30),
                                        Text(
                                          'Education: ${widget.user['education']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Company Name: ${widget.user['companyName']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Designation: ${widget.user['designation']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Employment Type: ${widget.user['employmentType']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Salary: ${widget.user['salary']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        const Text(
                                          'Family Information',
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 30),
                                        Text(
                                          'Father Name: ${widget.user['fatherName']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Father Occupation: ${widget.user['fatherOccupation']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Mother Name: ${widget.user['motherName']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Mother Occupation: ${widget.user['motherOccupation']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ]),
                                ),

                                // expectation

                                Container(
                                  key: const ValueKey('Expectation'),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Personal Information',
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 30),
                                        Text(
                                          'ID: ${widget.user['id']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Date of Birth: ${widget.user['dateOfBirth']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Age: ${widget.user['age']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Gender: ${widget.user['gender']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Marital Status: ${widget.user['maritalStatus']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Religion: ${widget.user['religion']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Caste: ${widget.user['caste']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Education: ${widget.user['education']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Mother Tongue: ${widget.user['motherTongue']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Languages Known: ${widget.user['languageKnown']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Country: ${widget.user['country']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'State: ${widget.user['state']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'City: ${widget.user['city']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        const Text(
                                          'Professional Information',
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 30),
                                        Text(
                                          'Education: ${widget.user['education']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Company Name: ${widget.user['companyName']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Designation: ${widget.user['designation']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Employment Type: ${widget.user['employmentType']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Salary: ${widget.user['salary']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 50),
                                        const Text(
                                          'Family Information',
                                          style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 30),
                                        Text(
                                          'Father Name: ${widget.user['fatherName']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          'Father Occupation: ${widget.user['fatherOccupation']}',
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])))
        ]),
      ),
    );
  }
}
