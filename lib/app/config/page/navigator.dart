import 'package:omelet/app/config/export/default.dart';

class PageNavigator {
  final BuildContext _context;

  PageNavigator.of(BuildContext context) : this._context = context;

  void pop({Object result}) {
    Navigator.of(_context).pop(result);
  }

  void popUntil(String routeName) {
    Navigator.of(_context).popUntil(ModalRoute.withName(routeName));
  }

  Future<void> pushNamed(String routeName, [Object argument]) {
    return Navigator.of(_context).pushNamed(
      routeName,
      arguments: argument,
    );
  }

  Object getArgument({Object orElse, Function orElseGet}) {
    return ModalRoute.of(_context).settings.arguments ?? orElse ?? orElseGet();
  }
}
