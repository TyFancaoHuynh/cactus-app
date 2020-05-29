import 'package:cactus_app/core/error/failures.dart';

import '../state.dart';

abstract class UseCase<Type, Params> {
  Future<State<Type, Failure>> call(Params params);
}

class NoParams {}
