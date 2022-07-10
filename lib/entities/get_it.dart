import 'package:flutter_coffee/entities/http_client.dart';
import 'package:flutter_coffee/entities/bloc/page_bloc.dart';
//import 'package:flutter_coffee/service/auth_impl.dart';
//import 'package:flutter_coffee/service/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<Client>(() => Client());

  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPref);

  getIt.registerLazySingleton<HttpClient>(
      () => HttpClient(client: getIt(), sharedPreferences: getIt()));

// need to fix for login/signup authorization
  // getIt.registerLazySingleton<IAuthService>(
  // () => AuthServiceImpl(httpClient: getIt(), sharedPreferences: getIt()));

  getIt.registerFactory<PageBloc>(() => PageBloc());
}
