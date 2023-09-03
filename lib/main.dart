// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:note/resources/bloc.dart';
import 'package:note/note/note_view.dart';
import 'package:note/resources/cache_helper.dart';
import 'package:note/resources/constents.dart';
import 'package:note/resources/cubit/note_cubit.dart';
import 'package:note/resources/cubit/note_state.dart';
import 'package:flutter_app_restart/flutter_app_restart.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  isA = CacheHelper.getData(key: 'isAr');

  print('ar:$isA');
  runApp(MyApp(isA));
}

class MyApp extends StatelessWidget {
  final bool isA;
  const MyApp(this.isA, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AddNoteCubit()..appChangeMode(fromShared: isA))
      ],
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (BuildContext context, state) {
          if (state is AppChangeLanguageState) {
            FlutterRestart.restartApp();
          }
        },
        builder: (BuildContext context, state) => MaterialApp(
          locale: isA ? Locale('ar') : Locale('en'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins',
          ),
          debugShowCheckedModeBanner: false,
          home: NoteView(),
        ),
      ),
    );
  }
}
