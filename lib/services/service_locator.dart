import 'package:challenge/services/global_state.dart';
import 'package:challenge/user_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setUpGetIt() {
  getIt.registerSingleton<GlobalState>(GlobalState());

  getIt.registerSingleton<UserRepository>(
      UserRepository(globalState: getIt<GlobalState>()));
}
