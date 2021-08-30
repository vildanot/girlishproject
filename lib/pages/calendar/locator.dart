import 'package:loginpage/pages/calendar/FirestoreDB.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirestoreDB());
}