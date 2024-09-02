import 'package:bloc/bloc.dart';
import 'package:flutter_test_project/models/user.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class UserCubit extends Cubit<User> {
  /// {@macro counter_cubit}
  UserCubit() : super(User.defaultUser());

  /// Add 1 to the current state.
  void changeEmail(String newEmail) {
    User newUser = User(userEmail: newEmail, userId: state.userId);
    emit(newUser);
  }

  /// Subtract 1 from the current state.
  void changeId(String newId) {
    User newUser = User(userId: newId, userEmail: state.userEmail);
    emit(newUser);
  }
}
