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
                                        heading('Personal Information'),
                                        text('ID: ${widget.user['id']}'),
                                        text(
                                          'Date of Birth: ${widget.user['dateOfBirth']}',
                                        ),
                                        text('Age: ${widget.user['age']}'),
                                        text(
                                            'Gender: ${widget.user['gender']}'),
                                        text(
                                          'Marital Status: ${widget.user['maritalStatus']}',
                                        ),
                                        text(
                                            'Religion: ${widget.user['religion']}'),
                                        text('Caste: ${widget.user['caste']}'),
                                        text(
                                            'Martial Status: ${widget.user['martialStatus']}'),
                                        text(
                                            'Mother Tongue: ${widget.user['motherTongue']}'),
                                        text(
                                            'Languages Known: ${widget.user['languageKnown']}'),
                                        text(
                                            'Country: ${widget.user['country']}'),
                                        text('State: ${widget.user['state']}'),
                                        text('City: ${widget.user['city']}'),
                                        text(
                                            'Height: ${widget.user['height']}'),
                                        text(
                                            'Weight: ${widget.user['weight']}'),
                                        text(
                                            'Complexion: ${widget.user['complexion']}'),
                                        text(
                                            'About Me: ${widget.user['aboutMe']}'),
                                        const SizedBox(height: 50),
                                        heading('Professional Information'),
                                        text(
                                            'Education: ${widget.user['education']}'),
                                        text(
                                            'Company Name: ${widget.user['companyName']}'),
                                        text(
                                            'Designation: ${widget.user['designation']}'),
                                        text(
                                            'Employment Type: ${widget.user['employmentType']}'),
                                        text(
                                            'Salary: ${widget.user['salary']}'),
                                        const SizedBox(height: 50),
                                        heading('Family Information'),
                                        text(
                                          'Father Name: ${widget.user['fatherName']}',
                                        ),
                                        text(
                                          'Father Occupation: ${widget.user['fatherOccupation']}',
                                        ),
                                        text(
                                          'Father Caste: ${widget.user['fatherCaste']}',
                                        ),
                                        text(
                                          'Mother Name: ${widget.user['motherName']}',
                                        ),
                                        text(
                                          'Mother Occupation: ${widget.user['motherOccupation']}',
                                        ),
                                        text(
                                          'Mother Caste: ${widget.user['motherCaste']}',
                                        ),
                                        text(
                                          'Number of Siblings: ${widget.user['numberofSiblings']}',
                                        ),
                                        text(
                                          'Number of Siblings Married: ${widget.user['numberofSiblingsMarried']}',
                                        ),
                                        text(
                                          'About Family: ${widget.user['aboutFamily']}',
                                        ),
                                      ]),
                                ),

                                // expectation

                                Container(
                                  key: const ValueKey('Expectation'),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        heading(
                                          'Partner perference',
                                        ),
                                        text(
                                          'Age: ${widget.user['selectedPartnerAge']}',
                                        ),
                                        text(
                                          'Religion: ${widget.user['selectedPartnerReligion']}',
                                        ),
                                        text(
                                          'Caste: ${widget.user['selectedPartnerCaste']}',
                                        ),
                                        text(
                                          'Languages Known: ${widget.user['selectedPartnerLanguages']}',
                                        ),
                                        text(
                                          'Height: ${widget.user['partnerHeight']}',
                                        ),
                                        text(
                                          'Weight: ${widget.user['partnerWeight']}',
                                        ),
                                        text(
                                          'Complexion: ${widget.user['partnerComplexion']}',
                                        ),
                                        text(
                                          'Education: ${widget.user['partnerEducation']}',
                                        ),
                                        text(
                                          'Employment Type: ${widget.user['employmentType']}',
                                        ),
                                        text(
                                          'Salary: ${widget.user['partnerSalary']}',
                                        ),
                                        text(
                                          'About partner: ${widget.user['aboutpartner']}',
                                        ),
                                        const SizedBox(height: 50),
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

  Widget heading(String heading) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0, bottom: 30),
      child: Text(
        heading,
        style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget text(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
