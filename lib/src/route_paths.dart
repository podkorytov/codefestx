import 'package:angular_router/angular_router.dart';
import 'package:codefest/src/menu_route_path.dart';

const idParam = 'id';

class RoutePaths {
  static final lecture = RoutePath(path: 'lecture/:$idParam');
  static final lectures = RoutePath(path: 'lectures');
  static final login = RoutePath(path: 'login');
  static final loginCallback = RoutePath(path: 'loginCallback');

  // Menu route paths
  static final lectures = MenuRoutePath(title: 'Расписание', path: 'lectures');
  static final speakers = MenuRoutePath(title: 'Спикеры', path: 'speakers');
  static final map = MenuRoutePath(title: 'Карта', path: 'map');
  static final feedback = MenuRoutePath(title: 'Отправить feedback', path: 'feedback');

  static final List<MenuRoutePath> _menu = [
    lectures,
    speakers,
    map,
    feedback,
  ];

  static List<MenuRoutePath> get menu => _menu;
}
