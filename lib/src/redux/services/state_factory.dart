import 'package:codefest/src/redux/state/codefest_state.dart';

class StateFactory {
  CodefestState getInitialState() => CodefestState((b) => b
    ..isReady = false
    ..isLoaded = false
    ..isError = false);
}