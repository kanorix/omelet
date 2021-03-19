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

  Future<void> pushReplacementNamed(String routeName, [Object argument]) {
    return Navigator.of(_context).pushReplacementNamed(
      routeName,
      arguments: argument,
    );
  }

  Object getArgument({Object orElse, Error orThrow, Function ifEmpty}) {
    assertZeroOrOneArgument([orElse, orThrow, ifEmpty]);

    final argument = ModalRoute.of(_context).settings.arguments ?? orElse;
    if (argument != null) {
      return argument;
    }

    if (orElse != null) {
      return orElse;
    } else if (orThrow != null) {
      throw orThrow;
    } else if (ifEmpty != null) {
      ifEmpty();
    }
    return null;
  }

  assertZeroOrOneArgument(List argments) {
    final notNullArgs = argments.where((e) => e != null).toList();
    assert(notNullArgs.isEmpty || notNullArgs.length == 1);
  }
}
