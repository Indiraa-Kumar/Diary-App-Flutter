import 'package:flutter/material.dart';
import 'package:sample_diary/screens/signin.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _status = true;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late TextEditingController pincodeController;
  late TextEditingController stateController;

  @override
  void initState() {
    emailController = TextEditingController(text: "indiraa7274@gmail.com");
    nameController = TextEditingController(text: "Indhiraa");
    mobileController = TextEditingController(text: "9098765432");
    pincodeController = TextEditingController(text: "632292");
    stateController = TextEditingController(text: "Tamil Nadu");
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.30,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/profile_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage:
                          const AssetImage('images/profile_pic.jpg'),
                      radius: height * 0.085,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignIn(),
                              ));
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -35),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Card(
                  color: Colors.grey[200],
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Quotes:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(height: 7),
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
                                    controller: nameController,
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
                                    keyboardType: TextInputType.emailAddress,
                                    controller: emailController,
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
                                    keyboardType: TextInputType.phone,
                                    controller: mobileController,
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
                                      keyboardType: TextInputType.number,
                                      controller: pincodeController,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: TextField(
                                    decoration: const InputDecoration(
                                        hintText: "Enter State"),
                                    enabled: !_status,
                                    controller: stateController,
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
