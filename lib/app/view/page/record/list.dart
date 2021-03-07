import 'package:flutter/material.dart';
import 'package:omelet/app/config/export/default.dart';
import 'package:omelet/app/config/export/model.dart';
import 'package:omelet/app/config/export/notifier.dart';

class RecordListView extends StatelessWidget {
  const RecordListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = context.read<RecordListNotifier>();
    final state = context.watch<RecordListNotifier>();

    void _showDialog(List selections) {
      showGeneralDialog(
        context: context,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (_, __, ___) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: selections
                .map(
                  (v) => Container(
                    width: 200,
                    child: v,
                    margin: EdgeInsets.only(bottom: 16),
                  ),
                )
                .toList(),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'メモ一覧',
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              event.addRecord();
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: state.records,
        builder: (_, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Container(
            padding: EdgeInsets.all(16),
            child: ListView.builder(
              itemBuilder: (_, int index) {
                final Record record = (snapshot.data as List)[index];
                return Card(
                  child: ListTile(
                    title: Text(record.title),
                    subtitle: Text(record.createdAt.toString()),
                    onLongPress: () {
                      _showDialog([
                        TextButton.icon(
                            label: const Text('Edit'),
                            icon: Icon(Icons.edit),
                            onPressed: () {}),
                        TextButton.icon(
                            label: const Text('Delete'),
                            icon: Icon(Icons.delete),
                            onPressed: () {})
                      ]);
                    },
                  ),
                );
              },
              itemCount: (snapshot.data as List).length,
            ),
          );
        },
      ),
    );
  }
}
