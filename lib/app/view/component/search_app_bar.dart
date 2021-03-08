import 'package:omelet/app/config/export/default.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  static const _searchFormPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 12,
  );

  static const _searchFormBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: const BorderRadius.all(
      const Radius.circular(kToolbarHeight),
    ),
  );

  final bool searchMode;
  final String titleText;
  final onTapSearchIcon;
  final onTapCloseIcon;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  const SearchAppBar(
      {Key key,
      @required this.searchMode,
      @required this.titleText,
      @required this.onTapSearchIcon,
      @required this.onTapCloseIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      // animationさせたいウィジェットをラップする
      duration: Duration(milliseconds: 280),
      child: searchMode
          ? AppBar(
              key: ValueKey(1),
              foregroundColor: Colors.grey,
              backgroundColor: Colors.black,
              title: Container(
                child: TextField(
                  // onChanged: (v) {
                  //   print(v);
                  // },
                  // onEditingComplete: () => print('s'),
                  autofocus: true,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    hintText: 'search',
                    border: _searchFormBorder,
                    isDense: true,
                    contentPadding: _searchFormPadding,
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: onTapCloseIcon,
                ),
              ],
            )
          : AppBar(
              key: ValueKey(2),
              title: Text(titleText),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: onTapSearchIcon,
                ),
              ],
            ),
    );
  }
}
