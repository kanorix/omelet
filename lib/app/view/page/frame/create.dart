import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/notifier/record/record_list_notifier.dart';

class FrameCreatePage extends StatelessWidget {
  const FrameCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecordListNotifier>(
      create: (_) => RecordListNotifier(),
      child: FrameCreateView(),
    );
  }
}

class FrameCreateView extends StatelessWidget {
  const FrameCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Template作成'),
      ),
      // 追加ボタン
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {},
      ),
      // 追加ボタンの位置指定
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: TextFormField(
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'テンプレート名',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            AnimatedList(
                shrinkWrap: true,
                initialItemCount: 0,
                itemBuilder: (_, int index, __) {
                  return Dismissible(
                      key: UniqueKey(),
                      child: Card(
                        elevation: 6,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              TextFormField(
                                maxLength: 20,
                                decoration: InputDecoration(labelText: '表示名'),
                              ),
                              DropdownButtonFormField<RecordType>(
                                decoration:
                                    InputDecoration(labelText: 'レコードタイプ'),
                                icon: Icon(Icons.arrow_downward),
                                iconSize: 20,
                                value: RecordType.TEXT,
                                onChanged: (v) {},
                                items: RecordType.values
                                    .where((e) => e != RecordType.NONE)
                                    .map<DropdownMenuItem<RecordType>>(
                                        (RecordType type) {
                                  return DropdownMenuItem<RecordType>(
                                    value: type,
                                    child: Text(type.name),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton.icon(
                onPressed: () {
                  // Respond to button press
                },
                icon: Icon(Icons.add, size: 18),
                label: Text("追加"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
