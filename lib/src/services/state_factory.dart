import 'package:codefest/src/models/codefest_state.dart';

class StateFactory {
  CodefestState getInitialState() => CodefestState((b) {
    b.isReady = false;
    b.isLoaded = false;
    b.isError = false;
  });
}
