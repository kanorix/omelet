import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/notifier/record/record_list_notifier.dart';

class TemplateListPage extends StatelessWidget {
  const TemplateListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordListNotifier>(
      create: (_) => RecordListNotifier(),
      child: TemplateListView(),
    );
  }
}

class TemplateListView extends StatelessWidget {
  const TemplateListView({Key key}) : super(key: key);

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
            PageRouter.templateCreate,
          );
        },
      ),
      // 追加ボタンの位置指定
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // レコードのリスト
      body: Scrollbar(
        child: Container(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, int index) {
              return Card(
                child: ListTile(
                  title: Text('frame-name'),
                  subtitle: Text('2021/03/07'),
                  trailing:
                      Text('10', style: TextStyle(color: Colors.deepOrange)),
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
      ),
    );
  }
}
