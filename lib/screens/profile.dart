import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: _height * 0.30,
              width: _width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/profile_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: const AssetImage('images/profile_pic.png'),
                  radius: _height * 0.085,
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -35),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 2.0,
                            offset: Offset(0.0, 2.0))
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Quotes:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                        Text(
                          "\t\t\t\t\t\t“Develop success from failures. Discouragement and failure are two of the surest stepping stones to success.” —Dale Carnegie",
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -12),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Personal Info',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    _status ? _getEditIcon() : _getSaveIcon()
                  ],
                ),
              ),
            ),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, -12),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Name',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: "Enter Your Name",
                                    ),
                                    enabled: !_status,
                                    autofocus: !_status,
                                  ),
                                ),
                              ],
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Email ID',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter Email ID"),
                                    enabled: !_status,
                                  ),
                                ),
                              ],
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Mobile',
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Flexible(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter Mobile Number"),
                                    enabled: !_status,
                                  ),
                                ),
                              ],
                            )),
                        const Padding(
                            padding: EdgeInsets.only(top: 25.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Pin Code',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'State',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Pin Code"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter State"),
                                    enabled: !_status,
                                  ),
                                ),
                              ],
                            )),
                        // !_status ? _getActionButtons() : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getEditIcon() {
    return InkWell(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  Widget _getSaveIcon() {
    return InkWell(
      child: const CircleAvatar(
        backgroundColor: Colors.green,
        radius: 14.0,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = true;
          FocusScope.of(context).requestFocus(FocusNode());
        });
      },
    );
  }
}
