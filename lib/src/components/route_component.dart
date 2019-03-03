import 'dart:async';

import 'package:angular/core.dart';
import 'package:angular/di.dart';
import 'package:codefest/src/models/codefest_state.dart';
import 'package:codefest/src/services/store_factory.dart';
import 'package:redux/redux.dart';

abstract class RouteComponent implements OnDestroy {
  final NgZone _zone;
  final ChangeDetectorRef _cdr;
  final StoreFactory _storeFactory;

  final List<StreamSubscription> _subscriptions = List<StreamSubscription>();

  Store<CodefestState> _store;

  CodefestState get state => _store.state;

  RouteComponent(
    this._zone,
    this._cdr,
    this._storeFactory,
  ) {
    _zone.runOutsideAngular(() {
      _store = _storeFactory.getStore();

      _subscriptions.addAll([
        _store.onChange.listen((_) {
          _zone.run(() {
            _cdr
              ..markForCheck()
              ..detectChanges();
          });
        }),
      ]);
    });
  }

  @override
  void ngOnDestroy() {
    _subscriptions.forEach((s) => s.cancel());
  }
}
