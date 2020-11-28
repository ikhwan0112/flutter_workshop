import 'package:flutter/material.dart';
import 'package:flutter_workshop_part_2/constants.dart';
import 'package:flutter_workshop_part_2/displayData.dart';

class StudentAdd extends StatefulWidget {
  @override
  _StudentAddState createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> {
  TextEditingController name = new TextEditingController();
  TextEditingController id = new TextEditingController();
  TextEditingController programme = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();

  String studentName = '', studentId = '', studentEmail = '', studentProgram = '', studentPhoneNum = '';
  String error = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                width: size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue, boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 12,
                          spreadRadius: 3,
                        )
                      ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text("Student Name :"),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                            child: TextFormField(
                              controller: name,
                              decoration: kTextBorder,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Text("Student id :"),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                            child: TextFormField(
                              controller: id,
                              decoration: kTextBorder,
                              validator: (value) {
                                if (value.length < 10 ) {
                                  return 'Please enter correct Id';
                                }
                                return null;
                              },
                            ),
                          ),
                          Text("Student Email"),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                            child: TextFormField(
                              controller: email,
                              decoration: kTextBorder,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Text("Student Programme :"),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                            child: TextFormField(
                              controller: programme,
                              decoration: kTextBorder,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Text("Phone Number"),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                            child: TextFormField(
                              controller: phoneNumber,
                              decoration: kTextBorder,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  color: Colors.green,
                                  child: Text("Submit"),
                                  onPressed: () {
                                    setState(() {
                                      if (_formKey.currentState.validate()) {
                                        studentName = name.text;
                                        studentEmail = email.text;
                                        studentId = id.text;
                                        studentPhoneNum = phoneNumber.text;
                                        studentProgram = programme.text;
                                      }
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  color: Colors.yellow,
                                  child: Text("Display Data"),
                                  onPressed: () {
                                    if (studentName != null && studentEmail != null && studentId != null && studentPhoneNum != null && studentProgram != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DisplayData(
                                            id: studentId,
                                            name: studentName,
                                            email: studentEmail,
                                            phoneNumber: studentPhoneNum,
                                            programme: studentProgram,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text("Student Name :"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                    width: size.width * 0.8,
                    height: size.height * 0.05,
                    child: Center(child: Text(studentName)),
                  ),
                  Text("Student Id :"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                    width: size.width * 0.8,
                    height: size.height * 0.05,
                    child: Center(child: Text(studentId)),
                  ),
                  Text("Student Email :"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                    width: size.width * 0.8,
                    height: size.height * 0.05,
                    child: Center(child: Text(studentEmail)),
                  ),
                  Text("Student Programme :"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                    width: size.width * 0.8,
                    height: size.height * 0.05,
                    child: Center(child: Text(studentProgram)),
                  ),
                  Text("Phone Number :"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20),
                    width: size.width * 0.8,
                    height: size.height * 0.05,
                    child: Center(
                      child: Text(studentPhoneNum),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
