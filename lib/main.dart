import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:restapp_automa/blocs/stripe_payment/payment_bloc.dart';
import 'package:restapp_automa/firebase_options.dart';
import 'package:restapp_automa/screens/homepage_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Stripe.publishableKey = "";
  // await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale newLocale) => setState(() => _locale = newLocale);

  @override
  void initState() {
    super.initState();
    _setLocale();
  }

  _setLocale() async {
    String? lang =
        (await SharedPreferences.getInstance()).getString("language");
    if (lang != null) {
      setLocale(Locale(lang));
    }
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => PaymentBloc(),
        child: MaterialApp(
          locale: _locale,
          title: 'Restaurant App',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            primarySwatch: Colors.amber,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.grey[200],
              elevation: 3,
              enableFeedback: true,
            ),
            textTheme: Theme.of(context).textTheme.copyWith(
                  titleLarge: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                      ),
                ),
          ),
          home: const HomePageScreen(),
        ),
      );
}
