import 'package:flutter/material.dart';
import 'trainee_sql_helper.dart';

class TraineeManagement extends StatefulWidget {
  static const String path = "/trainee-management";
  const TraineeManagement({super.key});

  @override
  State<TraineeManagement> createState() => _TraineeManagementState();
}

class _TraineeManagementState extends State<TraineeManagement> {
  List<Map<String, dynamic>> trainees = [];

  bool isLoading = true;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void refreshTrainees() async {
    isLoading = true;

    final data = await SQLHelper.getItems();

    setState(() {
      trainees = data;
      isLoading = false;
    });
  }

  Future<void> addItem() async {
    await SQLHelper.createItem(
      titleController.text,
      descriptionController.text,
    );
    refreshTrainees();
  }

  Future<void> updateItem(int id) async {
    await SQLHelper.updateItem(
      id,
      titleController.text,
      descriptionController.text,
    );
    refreshTrainees();
  }

  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);

    if (!mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Successfully deleted a trainee!'),
      ),
    );

    refreshTrainees();
  }

  void showForm(int? id) async {
    if (id != null) {
      final existingTraineeListWithGivenId = await SQLHelper.getItem(id);
      final existingTrainee = existingTraineeListWithGivenId[0];
      // final existingTrainee = trainees.firstWhere((element) => element['id'] == id);
      titleController.text = existingTrainee['title'];
      descriptionController.text = existingTrainee['description'];
    }

    if (context.mounted) {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.only(
            top: 15.0,
            left: 15.0,
            right: 15.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Description',
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await addItem();
                  }

                  if (id != null) {
                    await updateItem(id);
                  }

                  titleController.text = '';
                  descriptionController.text = '';
                  if (!mounted) return;
                  Navigator.of(context).pop();
                },
                child: Text(id == null ? 'Create New' : 'Update'),
              ),
            ],
          ),
        ),
        elevation: 5.0,
        isScrollControlled: true,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    refreshTrainees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Micronsol.com"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : trainees.isEmpty
              ? Center(
                  child: Text("No trainee found"),
                )
              : ListView.builder(
                  itemCount: trainees.length,
                  itemBuilder: (context, index) => Card(
                    color: Colors.orange[200],
                    margin: EdgeInsets.all(15.0),
                    child: ListTile(
                      title: Text(trainees[index]['title']),
                      subtitle: Text(trainees[index]['description']),
                      trailing: SizedBox(
                        width: 100.0,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => showForm(trainees[index]['id']),
                              icon: Icon(Icons.edit_rounded),
                            ),
                            IconButton(
                              onPressed: () =>
                                  deleteItem(trainees[index]['id']),
                              icon: Icon(Icons.delete_rounded),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showForm(null),
      ),
    );
  }
}
