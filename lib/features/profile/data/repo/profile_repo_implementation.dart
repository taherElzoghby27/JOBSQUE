// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jobsque/core/services/api_service/auth_service/signout_service.dart';
import 'package:jobsque/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImplementation extends ProfileRepo {
  SignOutService signOutService;
  ProfileRepoImplementation({
    required this.signOutService,
  });
  @override
  Future<bool> signOut() async {
    return signOutService.signOut();
  }
}
