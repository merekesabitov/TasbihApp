import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/hive/dhikr_adapter.dart';
import 'package:flutter_application_1/pages/auth/account_screen.dart';
import 'package:flutter_application_1/pages/auth/login_screen.dart';
import 'package:flutter_application_1/pages/auth/reset_password_screen.dart';
import 'package:flutter_application_1/pages/auth/signup_screen.dart';
import 'package:flutter_application_1/pages/auth/verify_email_screen.dart';
import 'package:flutter_application_1/providers/counter_provider.dart';
import 'package:flutter_application_1/providers/top_panel_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'pages/home/home.dart';
import 'pages/settings/settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(DhikrAdapter());

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
        Locale('es'),
      ],
      path: 'assets/langs/langs.csv',
      fallbackLocale: const Locale('en'),
      assetLoader: CsvAssetLoader(),
      child: const Tasbih()));
}

class Tasbih extends StatelessWidget {
  const Tasbih({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => TopPanelProvider()),
      ],
      child: KeyedSubtree(
        key: ValueKey(context.locale),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Gilroy-Medium',
          ),
          routerConfig: _router,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const Settings();
          },
        ),
        GoRoute(
          path: 'account',
          builder: (BuildContext context, GoRouterState state) {
            return const AccountScreen();
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          path: 'signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          path: 'reset_password',
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordScreen();
          },
        ),
        GoRoute(
          path: 'verify_email',
          builder: (BuildContext context, GoRouterState state) {
            return const VerifyEmailScreen();
          },
        ),
      ],
    ),
  ],
);
