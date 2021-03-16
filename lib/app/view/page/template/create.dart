import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/notifier/template/template_create_notifier.dart';
import 'package:omelet/app/view/component/dismissible_card.dart';
import 'package:omelet/app/view/component/future_modal.dart';
import 'package:omelet/common/func/validator.dart';

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
        onPressed: () {
          futureModal(
            context: context,
            future: event.save(),
            child: Text('Saving...'),
          ).then((result) {
            if (result) PageNavigator.of(context).pop();
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Form(
            key: event.formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    validator: emptyValidator,
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
                  itemCount: state.items.length,
                  itemBuilder: (_, int index) {
                    return DismissibleCard(
                      // 最後の一つは消せないようにする
                      isDismissible: event.items.length != 1,
                      onDismissed: (_) {
                        event.removeItem(index);
                      },
                      child: Column(
                        children: [
                          TextFormField(
                            maxLength: 20,
                            validator: emptyValidator,
                            decoration: InputDecoration(labelText: '表示名'),
                            initialValue: state.items[index].name,
                            onChanged: (v) {
                              event.updateItemName(index, v);
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
                    );
                  },
                ),
                if (state.items.length != 10)
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        event.addItem();
                      },
                      icon: Icon(Icons.add, size: 18),
                      label: Text('追加'),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
