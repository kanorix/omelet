import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/notifier.dart';
import 'package:omelet/app/view/component/future_list_view.dart';

class TemplateListPage extends StatelessWidget {
  const TemplateListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TemplateListNotifier>(
      create: (_) => TemplateListNotifier(),
      child: TemplateListView(),
    );
  }
}

class TemplateListView extends StatelessWidget {
  const TemplateListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<TemplateListNotifier>();
    final watch = context.watch<TemplateListNotifier>();

    return Scaffold(
        appBar: AppBar(
          title: Text('NOTE'),
        ),
        // 追加ボタン
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await PageNavigator.of(context).pushNamed(
              PageRouter.templateCreate,
            );
            read.reload();
          },
        ),
        // 追加ボタンの位置指定
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // レコードのリスト
        body: FutureListView<Template>(
          future: watch.templates,
          itemBuilder: (Template template, int index) {
            return Card(
              child: ListTile(
                title: Text(template.title),
                subtitle: Text(template.updatedAt.toString()),
                trailing: Text('10'),
                onTap: () {
                  PageNavigator.of(context)
                      .pushNamed(PageRouter.recordList, template);
                },
              ),
            );
          },
        ));
  }
}
