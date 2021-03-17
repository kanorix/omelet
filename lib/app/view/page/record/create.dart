import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/notifier.dart';
import 'package:omelet/app/view/component/future_modal.dart';
import 'package:omelet/common/func/validator.dart';

class RecordCreatePage extends StatelessWidget {
  const RecordCreatePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Template template =
        PageNavigator.of(context).getArgument(orElse: Template(title: 'test'));

    return ChangeNotifierProvider<RecordCreateNotifier>(
      create: (_) => RecordCreateNotifier(template: template),
      child: RecordCreateView(),
    );
  }
}

class RecordCreateView extends StatelessWidget {
  const RecordCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final read = context.read<RecordCreateNotifier>();
    final watch = context.watch<RecordCreateNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: Text('レコード作成'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          futureModal(
            context: context,
            future: read.save(),
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
              key: read.formKey,
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(8),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: watch.items.length,
                  itemBuilder: (_, int index) {
                    return TextFormField(
                      maxLength: 20,
                      validator: emptyValidator,
                      decoration: InputDecoration(
                          labelText: read.template.items[index].name),
                      initialValue: watch.items[index].content,
                      onChanged: (v) {
                        read.updateItem(index, v);
                      },
                    );
                  },
                ),
              ))),
        ),
      ),
    );
  }
}
