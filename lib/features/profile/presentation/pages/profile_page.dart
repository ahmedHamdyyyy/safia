import 'package:flutter/material.dart';
import 'package:safiaa/core/widgets/protected_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProtectedPage(
      message: 'يجب تسجيل الدخول لعرض الملف الشخصي',
      child: const ProfilePageContent(),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Your existing profile page content
    return const Scaffold(
      // ... your profile page implementation
    );
  }
} 