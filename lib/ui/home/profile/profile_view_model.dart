import 'package:star_wars/core/api/auth/models/profile.model.dart';
import 'package:star_wars/services/auth.service.dart';

class ProfileViewModel {
  ProfileViewModel({required this.authService});
  final AuthService authService;
  Future<void> signOut() async {
    await authService.signOut();
  }
  Future<ProfileModel> fetchProfile() async {
    return await authService.fetchProfile();
  }
}