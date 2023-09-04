import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

import 'package:gotomoon/screens/intro_page.dart';
import 'package:gotomoon/menu_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const MyApp()),
  ));
}

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'Add meg az email címed';

  @override
  String get passwordInputLabel => 'Add meg a jelszavad';

  @override
  String get confirmPasswordInputLabel => 'Add meg mégegyszer a jelszavad';

  @override
  String get deleteAccount => 'Fiók törlése';

  @override
  String get forgotPasswordButtonLabel => 'Elfelejtettem a jelszavamat';

  @override
  String get isNotAValidEmailErrorText => 'Helytelen email cím';

  @override
  String get signInText => 'Bejelentkezés';

  @override
  String get signOutButtonText => 'Kijelentkezés';

  @override
  String get signInActionText => 'Bejelentkezés';

  @override
  String get registerActionText => 'Regisztrálj';

  @override
  String get registerHintText => 'Nincs még fiókod?';

  @override
  String get registerText => 'Regisztráció';

  @override
  String get signInHintText => 'Már van fiókod?';

  @override
  String get forgotPasswordHintText =>
      'Add meg az email címed, ahová kapsz egy linket új jelszó megadáshoz.';

  @override
  String get forgotPasswordViewTitle => 'Elfelejtett jelszó';

  @override
  String get resetPasswordButtonLabel => 'Új jelszó kérés';

  @override
  String get goBackButtonLabel => "Vissza";
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroPage(),
      routes: [
        GoRoute(
          path: 'menupage',
          builder: (context, state) => const MenuPage(),
          routes: [
            GoRoute(
              path: 'sign-in',
              builder: (context, state) {
                return SignInScreen(
                  headerBuilder: (context, constraints, shrinkOffset) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset('images/image.jpg'),
                      ),
                    );
                  },
                  subtitleBuilder: (context, action) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: action == AuthAction.signIn
                          ? const Text(
                              'Üdvözlünk az ETAR applikációban, jelenkezz be a fiókodba!')
                          : const Text(
                              'Üdvözlünk az ETAR applikációban, hozz létre egy fiókot!'),
                    );
                  },
                  footerBuilder: (context, action) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        'Amennyiben továbblépsz, elfogadod a felhasználási feltételeket, valamint az adatvédelmi irányelveket.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  },
                  sideBuilder: (context, shrinkOffset) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset('images/image.jpg'),
                      ),
                    );
                  },
                  actions: [
                    ForgotPasswordAction(((context, email) {
                      final uri = Uri(
                        path: '/menupage/sign-in/forgot-password',
                        queryParameters: <String, String?>{
                          'email': email,
                        },
                      );
                      context.push(uri.toString());
                    })),
                    AuthStateChangeAction(((context, state) {
                      final user = switch (state) {
                        SignedIn state => state.user,
                        UserCreated state => state.credential.user,
                        _ => null
                      };
                      if (user == null) {
                        return;
                      }
                      if (state is UserCreated) {
                        user.updateDisplayName(user.email!.split('@')[0]);
                      }
                      if (!user.emailVerified) {
                        user.sendEmailVerification();
                        const snackBar = SnackBar(
                            content: Text(
                                'Emailt kaptál a címedre, ahol igazolhatod az email címed helyességét.'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      context.pushReplacement('/');
                    })),
                  ],
                );
              },
              routes: [
                GoRoute(
                  path: 'forgot-password',
                  builder: (context, state) {
                    final arguments = state.uri.queryParameters;
                    return ForgotPasswordScreen(
                      email: arguments['email'],
                      headerMaxExtent: 200,
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: 'profile',
              builder: (context, state) {
                return ProfileScreen(
                  appBar: AppBar(
                    title: const Text('User Profile'),
                  ),
                  providers: const [],
                  actions: [
                    SignedOutAction((context) {
                      context.pushReplacement('/');
                    }),
                  ],
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        // Creates an instance of FirebaseUILocalizationDelegate with overridden labels
        FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),

        // Delegates below take care of built-in flutter widgets
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,

        // This delegate is required to provide the labels that are not overridden by LabelOverrides
        FirebaseUILocalizations.delegate,
      ],
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
