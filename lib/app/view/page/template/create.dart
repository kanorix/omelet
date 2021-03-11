import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/notifier/template/template_create_notifier.dart';

class TemplateCreatePage extends StatelessWidget {
  const TemplateCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TemplateCreateNotifier>(
      create: (_) => TemplateCreateNotifier(),
      child: TemplateCreateView(),
    );
  }
}

class TemplateCreateView extends StatelessWidget {
  const TemplateCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = context.read<TemplateCreateNotifier>();
    final state = context.watch<TemplateCreateNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Template作成'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Scrollbar(
        child: SingleChildScrollView(
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
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (_, int index) {
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
                              initialValue: state.items[index].name,
                              onChanged: (v) {
                                event.items[index].name = v;
                              },
                            ),
                            DropdownButtonFormField<RecordType>(
                              decoration: InputDecoration(labelText: 'レコードタイプ'),
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 20,
                              value: state.items[index].type,
                              onChanged: (v) {
                                event.updateItemType(index, v);
                              },
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
                    ),
                    onDismissed: (_) {
                      event.removeItem(index);
                    },
                  );
                },
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                  onPressed: () {
                    event.addItem();
                  },
                  icon: Icon(Icons.add, size: 18),
                  label: Text("追加"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
