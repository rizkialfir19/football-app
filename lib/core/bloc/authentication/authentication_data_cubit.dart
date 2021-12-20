import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';

part 'authentication_state.dart';

class AuthenticationDataCubit extends Cubit<BaseState<UserData>> {
  final AppSetupCubit appSetupCubit;

  late StreamSubscription appSetupCubitSubs;

  AuthenticationDataCubit({
    required this.appSetupCubit,
  }) : super(InitializedState()) {
    appSetupCubitSubs = appSetupCubit.stream.listen((state) {
      if (state == AppSetupState.success) {
        initialize();
      }
    });
  }

  @override
  Future<void> close() {
    appSetupCubitSubs.cancel();
    return super.close();
  }

  void initialize() async {
    String? _rawUserData;
    UserData? _userData;

    await Future.delayed(const Duration(seconds: 2));
    // Can add userAuth check here

    /// All Passed
    emit(
      AuthenticatedState(
        data: _userData,
        timestamp: DateTime.now(),
      ),
    );
  }
}
