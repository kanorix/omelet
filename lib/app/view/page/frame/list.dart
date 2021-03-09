import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/notifier/record/record_list_notifier.dart';

class FrameListPage extends StatelessWidget {
  const FrameListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordListNotifier>(
      create: (_) => RecordListNotifier(),
      child: FrameListView(),
    );
  }
}

class FrameListView extends StatelessWidget {
  const FrameListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTE'),
      ),
      // 追加ボタン
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          PageNavigator.of(context).pushNamed(
            PageRouter.frameCreate,
          );
        },
      ),
      // 追加ボタンの位置指定
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // レコードのリスト
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, int index) {
            return Card(
              child: ListTile(
                title: Text('frame-name'),
                subtitle: Text('2021/03/07'),
                onTap: () {
                  PageNavigator.of(context).pushNamed(
                    PageRouter.recordList,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
