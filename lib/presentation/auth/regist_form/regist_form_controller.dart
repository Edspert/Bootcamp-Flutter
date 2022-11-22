import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/model/register_user_request.dart';
import '../../../data/model/user_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class RegistFormController extends GetxController {
  final AuthRepository authRepository;

  RegistFormController({required this.authRepository});

  Future<void> registerUser({required UserBody user}) async {
    // TODO: Call AuthRepository.registerUser()
  }
}
