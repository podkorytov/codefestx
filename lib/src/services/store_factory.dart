import 'package:codefest/src/models/codefest_state.dart';
import 'package:codefest/src/services/effects.dart';
import 'package:codefest/src/services/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

class StoreFactory {
  final CodefestReducer _reducer;
  final Effects _effects;

  Store<CodefestState> _store;

  StoreFactory(
    this._reducer,
    this._effects,
  );

  Store<CodefestState> getStore([CodefestState initialState]) {
    if (_store == null) {
      _store = new Store(
        _reducer.getState,
        initialState: initialState,
        middleware: [
          EpicMiddleware(_effects.getEffects()),
        ],
        distinct: true,
      );
    }

    return _store;
  }
}
