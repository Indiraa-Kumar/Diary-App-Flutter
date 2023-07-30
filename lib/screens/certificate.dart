import 'package:flutter/material.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  State<CertificatePage> createState() => CertificatePageState();
}

class CertificatePageState extends State<CertificatePage> {
  final List<CertificateDetails> _certificateItems = [];

  // This will be called each time the + button is pressed
  void _addCertificate(CertificateDetails task) {
    // Only add the task if the user actually entered something
    setState(() => _certificateItems.add(task));
  }

  // Build the whole list of todo items
  Widget _buildList() {
    if (_certificateItems.isEmpty) {
      return const Center(
        child: Text(
          'No certifications has been added...',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
      );
    }
    return ListView.builder(
        itemCount: _certificateItems.length,
        itemBuilder: (context, index) {
          return _buildWithItem(_certificateItems[index], index);
        });
  }

  Widget _buildWithItem(CertificateDetails details, int index) {
    return ListTile(
        title: Text(details.name),
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
    // Push this page onto the stack
    Navigator.of(context).push(
        // MaterialPageRoute will automatically animate the screen entry, as well
        // as adding a back button to close it
        MaterialPageRoute(builder: (context) {
      CertificateDetails details = CertificateDetails();
      return Scaffold(
          appBar: AppBar(
            title: Text('Add a certificate'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => details.name = value,
                  decoration: InputDecoration(
                    labelText: "Certification name",
                    border: OutlineInputBorder(),
                    hintText: 'Enter your certificate name',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => details.provider = value,
                  decoration: InputDecoration(
                    labelText: "Certification provider",
                    border: OutlineInputBorder(),
                    hintText: 'Enter provider',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter refreshState) {
                  return TextField(
                      controller: () {
                        print("date");
                        return TextEditingController(text: details.expirydate);
                      }(),
                      //onChanged: (value) => details.expirydate = value,
                      decoration: InputDecoration(
                        labelText: "Validity",
                        border: OutlineInputBorder(),
                        hintText: 'Mention date',
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          details.expirydate = pickedDate.year.toString() +
                              "-" +
                              pickedDate.month.toString() +
                              "-" +
                              pickedDate.day.toString();
                          refreshState(() {});
                        }
                      });
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    child: Text("  Done  "),
                    onPressed: () {
                      _addCertificate(details);
                      Navigator.pop(context);
                    }),
              )
            ],
          ));
    }));
  }

  void _removeItem(int index) {
    setState(() => _certificateItems.removeAt(index));
  }

  // Show an alert dialog asking the user to confirm that the task is done
  void _clickToRemove(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Delete "${_certificateItems[index]}"?'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Certifications'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addToList, // pressing this button now opens the  screen
        child: Icon(Icons.add),
        tooltip: 'Add certificate',
      ),
    );
  }
}

class CertificateDetails {
  CertificateDetails({
    this.name = "",
    this.provider = "",
    this.expirydate = "",
  });
  String name;
  String provider;
  String expirydate;
}
