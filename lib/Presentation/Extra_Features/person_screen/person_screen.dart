import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/app_export.dart';
import '../../../widgets/custom_bottom_bar.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) => const PersonScreen();

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _universityController = TextEditingController();
  final _yearController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();

  bool _isLoading = true;
  final userId = FirebaseAuth.instance.currentUser?.uid;

  final List<String> _universities = [
    'Tbilisi State University',
    'Ilia State University',
    'Georgian Technical University',
    'Caucasus University',
    'Free University of Tbilisi'
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    if (userId == null) return;
    final doc = await FirebaseFirestore.instance.collection('users').doc(userId).get();
    final data = doc.data();
    if (data != null) {
      _fullNameController.text = data['fullName'] ?? '';
      _phoneController.text = data['phoneNumber'] ?? '';
      _birthdateController.text = data['birthdate'] ?? '';
      _universityController.text = data['university'] ?? '';
      _yearController.text = data['yearOfStudy'] ?? '';
      _studentIdController.text = data['studentId'] ?? '';
      _addressController.text = data['address'] ?? '';
      _cityController.text = data['city'] ?? '';
    }
    setState(() => _isLoading = false);
  }

  Future<void> _saveUserData() async {
    if (userId == null) return;
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'fullName': _fullNameController.text,
      'phoneNumber': _phoneController.text,
      'birthdate': _birthdateController.text,
      'university': _universityController.text,
      'yearOfStudy': _yearController.text,
      'studentId': _studentIdController.text,
      'address': _addressController.text,
      'city': _cityController.text,
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated!")),
    );
  }

  Future<void> _pickBirthDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      _birthdateController.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray50,
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.settingsPage),
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue.shade300,
              child: const Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 30),
            _buildField("Full Name", _fullNameController),
            _buildField("Phone", _phoneController),
            GestureDetector(
              onTap: _pickBirthDate,
              child: AbsorbPointer(
                child: _buildField("Birthdate", _birthdateController),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: DropdownButtonFormField<String>(
                value: _universities.contains(_universityController.text)
                    ? _universityController.text
                    : null,
                decoration: InputDecoration(
                  labelText: "University",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: _universities
                    .map((uni) => DropdownMenuItem(value: uni, child: Text(uni)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _universityController.text = val);
                },
              ),
            ),
            _buildField("Year of Study", _yearController),
            _buildField("Student ID", _studentIdController),
            _buildField("Address", _addressController),
            _buildField("City", _cityController),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveUserData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        onChanged: (type) => Navigator.pushNamed(context, getCurrentRoute(type)),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  String getCurrentRoute(ButtomBarEnum type) {
    switch (type) {
      case ButtomBarEnum.Favorite:
        return AppRoutes.likedScreen;
      case ButtomBarEnum.Searchwhitea700:
        return AppRoutes.filterPage;
      case ButtomBarEnum.Lock:
        return AppRoutes.personScreen;
      case ButtomBarEnum.Home:
      default:
        return AppRoutes.homePage;
    }
  }
}