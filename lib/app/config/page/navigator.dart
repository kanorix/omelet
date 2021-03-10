import 'package:omelet/app/config/export/default.dart';

class PageNavigator {
  final BuildContext _context;

  PageNavigator.of(this._context);

  void pop({Object result}) {
    Navigator.of(_context).pop(result);
  }

  void popUntil(String routeName) {
    Navigator.of(_context).popUntil(ModalRoute.withName(routeName));
  }

  Future<void> pushNamed(String routeName, {Object arguments}) {
    return Navigator.of(_context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Object getArguments() {
    return ModalRoute.of(_context).settings.arguments;
  }
}
