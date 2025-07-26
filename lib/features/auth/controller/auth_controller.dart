import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/auth_model.dart';
import '../repository/auth_repo.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  return AuthRepo();
});

final authControllerProvider = StateNotifierProvider<AuthController , AuthModel?>((ref){
  return AuthController(ref.read(authRepoProvider));

});


class AuthController extends StateNotifier<AuthModel?>{
  final AuthRepo authRepo;
   AuthController(this.authRepo) : super(null);

  Future<void>login(String username, String password) async{
    try{
      print("login");
      final user = await authRepo.login(username, password);
      state = user;
    }catch(e){
      state= null;
    }
  }
}
