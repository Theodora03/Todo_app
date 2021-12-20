import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatTodoView extends StatefulWidget {
  const CreatTodoView({Key? key}) : super(key: key);

  @override
  _CreatTodoViewState createState() => _CreatTodoViewState();
}

class _CreatTodoViewState extends State<CreatTodoView> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Create a Todo'),
          backgroundColor: Colors.white60,
        ),
        body: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(15),
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    hintText: ' Please enter a title',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title ';
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    hintText: 'Please describe your task',
                  ),
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a description';
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  onTap: () => showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)))
                      .then((value) {
                    setState(() {
                      _dateController.text = DateFormat.yMMMMd().format(value!);
                    });
                  }),
                  controller: _dateController,
                  decoration: const InputDecoration(
                      labelText: 'Date',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Please enter a date'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please select a date';
                    }
                    else if (value==DateFormat.yMMMMd().format(DateTime.now())*
                    
                    
                    
                    
                    
                    
                    
                    
                    ){


                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  onTap: () => showTimePicker(
                          context: context, initialTime: TimeOfDay.now())
                      .then((value) => setState(() {
                            _timeController.text = value!.format(context);
                          })),
                  controller: _timeController,
                  decoration: const InputDecoration(
                      labelText: 'Time',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      hintText: 'Please enter a time'),
                  keyboardType: TextInputType.datetime,
                  validator: (value) {},
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Create',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.green),
                )
              ],
            )),
      ),
    );
  }
}
