import 'package:omelet/app/config/export/default.dart';

class DismissibleCard extends StatelessWidget {
  final bool isDismissible;
  final Widget child;
  final EdgeInsets padding;
  final Function(DismissDirection) onDismissed;

  DismissibleCard({
    @required this.child,
    this.isDismissible = true,
    this.onDismissed,
    this.padding = const EdgeInsets.all(10),
  });
  @override
  Widget build(BuildContext context) {
    final card = Card(
      elevation: 6,
      child: Container(
        padding: padding,
        child: child,
      ),
    );

    return isDismissible
        ? Dismissible(
            key: UniqueKey(),
            onDismissed: onDismissed,
            child: card,
          )
        : card;
  }
}
