import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/notifier.dart';

const _searchFormPadding = EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 12,
);

const _searchFormBorder = OutlineInputBorder(
  borderSide: const BorderSide(
    width: 0,
    style: BorderStyle.none,
  ),
  borderRadius: const BorderRadius.all(
    const Radius.circular(kToolbarHeight),
  ),
);

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  // タイトル
  final String titleText;

  // 検索欄が変化したときのイベント
  final void Function(String) onChanged;

  // 検索欄が開いた時のイベント
  final void Function() onSearchOpened;

  // 検索欄が閉じたときのイベント
  final void Function() onSearchClosed;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const SearchAppBar({
    @required this.titleText,
    @required this.onChanged,
    Key key,
    this.onSearchOpened,
    this.onSearchClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = context.read<ApplicationNotifier>();

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 280),
      child: context.watch<ApplicationNotifier>().searchMode
          ? AppBar(
              key: ValueKey(1),
              title: Container(
                child: TextField(
                  onChanged: onChanged,
                  onEditingComplete: () {
                    (onSearchClosed ?? () {})();
                    event.toggleSearchMode();
                  },
                  autofocus: true,
                  cursorColor:
                      Theme.of(context).accentTextTheme.headline1.color,
                  decoration: InputDecoration(
                    hintText: 'search',
                    border: _searchFormBorder,
                    isDense: true,
                    contentPadding: _searchFormPadding,
                    filled: true,
                    fillColor: Theme.of(context).focusColor,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    (onSearchClosed ?? () {})();
                    event.toggleSearchMode();
                  },
                ),
              ],
            )
          : AppBar(
              key: ValueKey(2),
              title: Text(titleText),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    (onSearchOpened ?? () {})();
                    event.toggleSearchMode();
                  },
                ),
              ],
            ),
    );
  }
}
