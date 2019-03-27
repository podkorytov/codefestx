import 'dart:html';

import 'package:angular/angular.dart';
import 'package:codefest/src/components/ui/button/button.dart';
import 'package:codefest/src/components/ui/link-button/link_button.dart';
import 'package:codefest/src/components/ui/popup/popup.dart';
import 'package:codefest/src/redux/actions/new_version_action.dart';
import 'package:codefest/src/redux/services/dispatcher.dart';

@Component(
  selector: 'new-version-popup',
  templateUrl: 'new_version_popup.html',
  styleUrls: const ['new_version_popup.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  preserveWhitespace: false,
  directives: [
    PopupComponent,
    ButtonComponent,
    LinkButtonComponent,
  ],
)
class NewVersionPopupComponent {
  final Dispatcher _dispatcher;

  NewVersionPopupComponent(
    this._dispatcher,
  );

  @Input()
  String message = 'У нас новые крутые фичи!';

  void close() {
    _dispatcher.dispatch(NewVersionAction(releaseNote: ''));
  }

  void reload({bool showNotes = false}) {
    if (showNotes) {
      // todo
    } else {
      window.location.reload();
    }
  }
}
