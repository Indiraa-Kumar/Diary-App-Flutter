import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'NotesPage.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  var _formKey = GlobalKey<FormState>();
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  @override
  void initState() {
    super.initState();
    notesDescriptionMaxLenth =
        notesDescriptionMaxLines * notesDescriptionMaxLines;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: noteHeading.isNotEmpty
          ? buildNotes()
          : const Center(child: Text('No notes has been added...',
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 18,
        ),
      ),),
      floatingActionButton: FloatingActionButton(
        mini: false,
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          _settingModalBottomSheet(context);
        },
        child: Icon(Icons.create),
      ),
    );
  }

  Widget buildNotes() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
      ),
      child: ListView.builder(
        itemCount: noteHeading.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.5),
            child: Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                setState(() {
                  noteHeading.removeAt(index);
                  noteDescription.removeAt(index);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.purple,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Diary deleted",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
              background: ClipRRect(
                borderRadius: BorderRadius.circular(5.5),
                child: Container(
                  color: Colors.red,
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              child: noteList(index),
            ),
          );
        },
      ),
    );
  }

  Widget noteList(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: noteColor[(index % noteColor.length).floor()],
          borderRadius: BorderRadius.circular(5.5),
        ),
        height: 100,
        child: Center(
          child: Row(
            children: [
              new Container(
                color:
                    noteMarginColor[(index % noteMarginColor.length).floor()],
                width: 3.5,
                height: double.infinity,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: Text(
                          noteHeading[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20.00,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.5,
                      ),
                      GestureDetector(
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "View",
                                style: TextStyle(
                                  fontSize: 20.00,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          _settingModalBottomSheet(context, index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDiaryDetails(context, index) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 50, // z-index
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (MediaQuery.of(context).size.height),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 250, top: 50),
                  child: new Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${(noteHeading[index])}",
                            style: TextStyle(
                              fontSize: 20.00,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 20.00,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  noteDescription[index] =
                                      (noteDescriptionController.text);
                                  noteDescriptionController.clear();
                                });
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.blueAccent,
                        thickness: 2.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          margin: EdgeInsets.all(1),
                          height: 5 * 24.0,
                          child: TextFormField(
                            focusNode: textSecondFocusNode,
                            maxLines: notesDescriptionMaxLines,
                            maxLength: notesDescriptionMaxLenth,
                            controller: noteDescriptionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: noteDescription[index],
                              hintStyle: TextStyle(
                                fontSize: 15.00,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _settingModalBottomSheet(BuildContext context, [int index = -1]) {
    if (index == -1) {
      noteHeadingController.clear();
      noteDescriptionController.clear();
    } else {
      date.add(formatter.format(now));
      noteHeadingController.text = noteHeading[index];
      noteDescriptionController.text = noteDescription[index];
    }
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (contexxt) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: DraggableScrollableSheet(
                  initialChildSize: 0.6,
                  maxChildSize: 0.6,
                  minChildSize: 0.3,
                  builder: (_, controller) {
                    return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(left: 25, right: 25),
                            child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight:
                                        (MediaQuery.of(context).size.height),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 250, top: 50),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              index == -1
                                                  ? "New Diary"
                                                  : "Diary - Edit",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            GestureDetector(
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    "Save",
                                                    style: TextStyle(
                                                      fontSize: 20.00,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onTap: () {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  setState(() {
                                                    if (index == -1) {
                                                      date.add(formatter
                                                          .format(now));
                                                      noteHeading.add(
                                                          noteHeadingController
                                                              .text);
                                                      noteDescription.add(
                                                          noteDescriptionController
                                                              .text);
                                                    } else {
                                                      noteDescription[index] =
                                                          (noteDescriptionController
                                                              .text);
                                                      noteHeading[index] =
                                                          (noteHeadingController
                                                              .text);
                                                    }
                                                    noteHeadingController
                                                        .clear();
                                                    noteDescriptionController
                                                        .clear();
                                                  });
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.blueAccent,
                                          thickness: 2.5,
                                        ),
                                        TextFormField(
                                          maxLength: notesHeaderMaxLenth,
                                          controller: noteHeadingController,
                                          decoration: const InputDecoration(
                                            hintText:
                                                "Heading of your Diary...",
                                            hintStyle: TextStyle(
                                              fontSize: 15.00,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            prefixIcon: Icon(Icons.text_fields),
                                          ),
                                          validator: (String? noteHeading) {
                                            if (noteHeading!.isEmpty) {
                                              return "Please enter Note Heading";
                                            } else if (noteHeading
                                                .startsWith(" ")) {
                                              return "Please avoid whitespaces";
                                            }
                                            return null;
                                          },
                                          onFieldSubmitted: (String value) {
                                            FocusScope.of(context).requestFocus(
                                                textSecondFocusNode);
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15),
                                          child: Container(
                                            margin: const EdgeInsets.all(1),
                                            height: 5 * 24.0,
                                            child: TextFormField(
                                              focusNode: textSecondFocusNode,
                                              maxLines:
                                                  notesDescriptionMaxLines,
                                              maxLength: 200,
                                              controller:
                                                  noteDescriptionController,
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'Description',
                                                hintStyle: TextStyle(
                                                  fontSize: 15.00,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              validator:
                                                  (String? noteDescription) {
                                                if (noteDescription!.isEmpty) {
                                                  return "Please enter Note Desc";
                                                } else if (noteDescription
                                                    .startsWith(" ")) {
                                                  return "Please avoid whitespaces";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ));
                  }));
        });
  }
  /* 
    );
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // full height on screen
      elevation: 50, // z-index
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (MediaQuery.of(context).size.height),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 250, top: 50),
                  child: new Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "New Diary",
                            style: TextStyle(
                              fontSize: 20.00,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 20.00,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  date.add(formatter.format(now));
                                  noteHeading.add(noteHeadingController.text);
                                  noteDescription
                                      .add(noteDescriptionController.text);
                                  noteHeadingController.clear();
                                  noteDescriptionController.clear();
                                });
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.blueAccent,
                        thickness: 2.5,
                      ),
                      TextFormField(
                        maxLength: notesHeaderMaxLenth,
                        controller: noteHeadingController,
                        decoration: InputDecoration(
                          hintText: "Heading of your Diary...",
                          hintStyle: TextStyle(
                            fontSize: 15.00,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(Icons.text_fields),
                        ),
                        validator: (String? noteHeading) {
                          if (noteHeading!.isEmpty) {
                            return "Please enter Note Heading";
                          } else if (noteHeading.startsWith(" ")) {
                            return "Please avoid whitespaces";
                          }
                        },
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context)
                              .requestFocus(textSecondFocusNode);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          margin: EdgeInsets.all(1),
                          height: 5 * 24.0,
                          child: TextFormField(
                            focusNode: textSecondFocusNode,
                            maxLines: notesDescriptionMaxLines,
                            maxLength: 200,
                            controller: noteDescriptionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Description',
                              hintStyle: TextStyle(
                                fontSize: 15.00,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            validator: (String? noteDescription) {
                              if (noteDescription!.isEmpty) {
                                return "Please enter Note Desc";
                              } else if (noteDescription.startsWith(" ")) {
                                return "Please avoid whitespaces";
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
} */

  Widget notesHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 2.5,
        right: 2.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('images/profile_pic.png'),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            "My Diary",
            style: TextStyle(
              //color: Colors.blueAccent,
              fontSize: 25.00,
              fontWeight: FontWeight.w500,
            ),
          ),
          Divider(
            color: Colors.blueAccent,
            thickness: 2.5,
          ),
        ],
      ),
    );
  }
}
