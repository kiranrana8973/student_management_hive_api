import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_management_hive_api/config/router/app_route.dart';
import 'package:student_management_hive_api/features/auth/domain/entity/auth_entity.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/login_usecase.dart';
import 'package:student_management_hive_api/features/auth/domain/use_case/register_usecase.dart';
import 'package:student_management_hive_api/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>(
  (ref) => AuthViewModel(
      ref.read(registerUseCaseProvider), ref.read(loginUseCaseProvider)),
);

class AuthViewModel extends StateNotifier<AuthState> {
  final RegisterUseCase _registerUseCase;
  final LoginUseCase _loginUseCase;

  AuthViewModel(this._registerUseCase, this._loginUseCase)
      : super(AuthState.initial());

  Future<void> registerStudent(AuthEntity entity) async {
    state = state.copyWith(isLoading: true);
    final result = await _registerUseCase.registerStudent(entity);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(error: failure.error),
      (success) => state = state.copyWith(isLoading: false, showMessage: true),
    );
  }

  //Login
  Future<void> loginStudent(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await _loginUseCase.loginStudent(username, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(
        error: failure.error,
        showMessage: true,
      ),
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: true,
          error: null,
        );

        Navigator.popAndPushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}
