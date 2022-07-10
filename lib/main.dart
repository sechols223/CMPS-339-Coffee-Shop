// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee/entities/bloc/page_bloc.dart';
import 'package:flutter_coffee/entities/responsive.dart';
import 'package:flutter_coffee/widgets/side__menu.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_coffee/entities/get_it.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageBloc(),
      child: MaterialApp(
        title: 'Coffee App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.brown,
        ),
        home: FutureBuilder<Widget>(
          initialData: MainScreen(),
          future: checkWhetherUserHaveJwtToken(),
          builder: (context, snapshot) {
            return snapshot.data;
          },
        ),
      ),
    );
  }

  Future<Widget> checkWhetherUserHaveJwtToken() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      return MainScreen();
    } else {
      return MainScreen();
    }
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PageBloc>().add(ChangePageEvent(index: 0));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          ResponsiveWidget(
            desktop: Container(
              height: 1000,
              child: Row(
                children: [
                  Expanded(
                    flex: (width < 1200) ? 2 : 1,
                    child: SideMenu(),
                  ),
                  Expanded(
                    flex: (width < 1200) ? 7 : 5,
                    child: BlocBuilder<PageBloc, PageState>(
                      builder: (context, state) {
                        if (state is PageLoaded) {
                          return state.page;
                        }
                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
