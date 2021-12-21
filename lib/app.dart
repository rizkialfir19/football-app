import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/app_router.dart';
import 'package:football_app/common/common.dart';
import 'package:football_app/core/core.dart';

class App extends StatelessWidget {
  final BaseApiClient apiClient;
  final BaseCompetitionRepository competitionRepository;

  const App({
    Key? key,
    required this.apiClient,
    required this.competitionRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => apiClient,
        ),
        RepositoryProvider(
          create: (context) => competitionRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppSetupCubit()..initialize(),
          ),
          BlocProvider(
            create: (context) => TabCubit(),
          ),
          BlocProvider(
            create: (context) => AuthenticationDataCubit(
              appSetupCubit: context.read<AppSetupCubit>(),
            ),
          ),
        ],
        child: const FootballApp(),
      ),
    );
  }
}

class FootballApp extends StatefulWidget {
  const FootballApp({Key? key}) : super(key: key);

  @override
  State<FootballApp> createState() => _FootballAppState();
}

class _FootballAppState extends State<FootballApp> {
  final AppRouter _appRouter = AppRouter();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  DateTime? _lastUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: _appRouter.onGenerateRoute,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          body: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationDataCubit, BaseState>(
                listener: (context, state) {
                  UserData? user;

                  if (state is AuthenticatedState) {
                    if (_lastUser == null) {
                      _lastUser = state.timestamp;
                      user = state.data;
                      // // Trigger Patch Change Tab
                      // context.read<TabCubit>().changeTab(tab: AppTab.account);
                      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                        RouteName.landingScreen,
                        (route) => false,
                      );
                    }
                  }

                  if (state is UnauthenticatedState) {
                    /// Always set to Authenticated

                    // _lastUser = null;
                    // // Can navigate to login/register screen if needed
                    // _navigatorKey.currentState!.pushNamedAndRemoveUntil(
                    //   RouteName.signInScreen,
                    //       (route) => false,
                    // );
                  }
                },
              ),
            ],
            child: child!,
          ),
        );
      },
    );
  }
}
