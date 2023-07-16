import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AchievementPage(),
    );
  }
}


class AchievementPage extends StatefulWidget {
  @override
  createState() => AchievementPageState();
}

class AchievementPageState extends State<AchievementPage> {
  List<AchievementDetails> _achieveDetails = [];
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _addAchievement(AchievementDetails task) {
    setState(() => _achieveDetails.add(task));
  }

  Widget _buildList() {
    if(_achieveDetails.length > 0){
      return ListView.builder(itemCount: _achieveDetails.length,
          itemBuilder: (context, index) {
            if (index < _achieveDetails.length) {
              return _buildWithItem(_achieveDetails[index], index);
            }
          });
    }
    return Center(
      child: Text('No achievemnets has been added..',
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 18,
        ),
      ),
    );
  }

  String selectedValue = "";
  final List<DropdownMenuItem<String>> dropdownMenuItems = [
    const DropdownMenuItem(child: Text("Select"), value: ""),
    const DropdownMenuItem(child: Text("Gold"), value: "Gold"),
    const DropdownMenuItem(child: Text("Silver"), value: "Silver"),
    const DropdownMenuItem(child: Text("Bronze"), value: "Bronze"),
  ];

  Widget _buildWithItem(AchievementDetails details, int index) {
    return ListTile(
        title: Text(details.name),
        subtitle: Text(details.description),
        leading: CircleAvatar(
            child: Image.asset(
              'images/achievementMedal.png',
              color: Colors.white,
            ),
            backgroundColor: () {
              if (details.prize == "Gold") return Colors.yellow;
              if (details.prize == "Silver") return Colors.blueGrey;
              return Colors.brown;
            }()),
        trailing: ActionChip(
          label: const Icon(Icons.delete),
          backgroundColor: Colors.transparent,
          onPressed: () {
            _clickToRemove(index);
          },
        ));
    //onTap: () => _clickToRemove(index));
  }

  void _addToList() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      AchievementDetails details = AchievementDetails();
      return Scaffold(
          appBar: AppBar(
            title: Text('Add a achievement'),
            centerTitle: true,
          ),
          body: StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 500),
                          child: TextField(
                            onChanged: (value) => details.name = value,
                            decoration: const InputDecoration(
                              labelText: "Achievement name",
                              border: OutlineInputBorder(),
                              hintText: 'Enter the achievement',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 500),
                          child: TextField(
                            onChanged: (value) => details.description = value,
                            decoration: InputDecoration(
                              labelText: "Achievement description",
                              border: OutlineInputBorder(),
                              hintText: 'Add description',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StatefulBuilder(builder:
                            (BuildContext context, StateSetter refreshState) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 500),
                            child: TextField(
                                controller: () {
                                  return TextEditingController(
                                      text: details.achievementdate);
                                }(),
                                //onChanged: (value) => details.expirydate = value,
                                decoration: InputDecoration(
                                  labelText: "Date of Achievement",
                                  border: OutlineInputBorder(),
                                  hintText: 'Mention date',
                                ),
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    details.achievementdate =
                                        pickedDate.year.toString() +
                                            "-" +
                                            pickedDate.month.toString() +
                                            "-" +
                                            pickedDate.day.toString();
                                    refreshState(() {});
                                  }
                                }),
                          );
                        }),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 500),
                        child: DropdownButton(
                            isExpanded: true,
                            value: details.prize,
                            onChanged: (String? newValue) {
                              setState(() {
                                details.prize = newValue!;
                                print(newValue);
                              });
                            },
                            items: [const DropdownMenuItem(child: Text("Select"),
                                value: ""),
                              const DropdownMenuItem(child: Text("Gold"),
                                  value: "Gold"),
                              const DropdownMenuItem(child: Text("Silver"),
                                  value: "Silver"),
                              const DropdownMenuItem(child: Text("Bronze"),
                                  value: "Bronze"),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            child: Text("  Done  "),
                            onPressed: () {
                              _addAchievement(details);
                              Navigator.pop(context);
                              _invokeCelebrateAnimation();
                            }),
                      )
                    ],
                  ),
                ),
              );
            },
          ));
    }));
  }

  void _removeItem(int index) {
    setState(() => _achieveDetails.removeAt(index));
  }

  // Show an alert dialog asking the user to confirm that the task is done
  void _clickToRemove(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Delete "${_achieveDetails[index]}"?'),
              actions: <Widget>[
                TextButton(
                    child: Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                TextButton(
                    child: Text('REMOVE'),
                    onPressed: () {
                      _removeItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  void _invokeCelebrateAnimation() {
    if(isPlaying) {
      return ;
    }
    else{
      _controller.play();
      isPlaying = !isPlaying;
      final timer = Timer(
        const Duration(seconds: 2),
            () {
          isPlaying = !isPlaying;
          _controller.stop();
        },
      );

    }

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children : [
        Scaffold(
          appBar: AppBar(
            title: Text('Achievements'),
            centerTitle: true,
          ),
          body: _buildList(),

          //       body: Center(
          //
          //           child: ElevatedButton(
          //             style: ButtonStyle(
          //                 backgroundColor: MaterialStateProperty.all(Colors.red),
          //                 padding: MaterialStateProperty.all(EdgeInsets.all(30)),
          //                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(50),
          //                 )),
          //                 textStyle: MaterialStateProperty.all(TextStyle(fontSize: 15))),
          //           onPressed: (){
          //             if(isPlaying) {
          //               _controller.stop();
          //             }
          //             else{
          //               _controller.play();
          //             }
          //             isPlaying = !isPlaying;
          //             },
          //             child: Text('Celebrate the achievement'),
          //             //color: Colors.deepPurpleAccent,
          //
          //
          // ),
          //       ),
          floatingActionButton: FloatingActionButton(
            onPressed: _addToList,
            child: Icon(Icons.add),
            tooltip: 'Add a achievement',
          ),
        ),

        ConfettiWidget(
          confettiController : _controller,
          blastDirection: pi/2,
          colors: [
            Colors.deepPurple,
            Colors.yellowAccent,
            Colors.pinkAccent,
            Colors.greenAccent,
          ],
          emissionFrequency: 0.1,
        ),
      ],
    );

  }

}

class AchievementDetails {
  AchievementDetails({
    this.name = "",
    this.description = "",
    this.achievementdate = "",
    this.prize = "",
  });
  String name;
  String description;
  String achievementdate;
  String prize;
}
