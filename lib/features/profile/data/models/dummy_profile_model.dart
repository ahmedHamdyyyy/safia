import 'package:safiaa/features/profile/data/models/profile_model.dart';

class DummyProfileModel {
  static ProfileModel getDummyProfile() {
    return ProfileModel(
      phoneNumber: '',
      name: 'زائر',
      email: '',
      // Add any other required fields with default values
    );
  }
} 