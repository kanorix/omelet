import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/notifier/record/record_list_notifier.dart';
import 'package:omelet/app/view/page/record/list.dart';

class TemplatePage extends StatelessWidget {
  TemplatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Notifier
        ChangeNotifierProvider<RecordListNotifier>(
          create: (ctx) => RecordListNotifier(ctx),
        ),
      ],
      child: NoteListView(),
      // 後々、レスポンシブに対応する
      // ScreenTypeLayout.builder(
      //   mobile: (BuildContext context) => RecordListView(),
      //   tablet: (BuildContext context) => Container(color: Colors.yellow),
      //   desktop: (BuildContext context) => HomeDesktopPage(),
      // ),
    );
  }
}
