import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopeflow/dbhealper.dart';
import 'package:hopeflow/home.dart';
import 'package:hopeflow/user.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {


  Dbhealper dbhealper = Dbhealper();
  Gender defaultgender = Gender.male;
  TextEditingController nameclr = TextEditingController();
  TextEditingController phclr = TextEditingController();
  TextEditingController wigtclr = TextEditingController();
  TextEditingController ageclr = TextEditingController();
  TextEditingController ldonatclr = TextEditingController();
  TextEditingController bloodclr = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  showmydatepicker(BuildContext context) async {
    DateTime? pickdate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (pickdate != null) {
      String formatedate = DateFormat("yyyy/MM/dd").format(pickdate);
      setState(() {
        ldonatclr.text = formatedate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF050622),
        title: Text(
          "Registeration",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Fill out the for to add a Donor",
                  style: GoogleFonts.aBeeZee(
                    textStyle: TextStyle(
                        color: Color(0xFF050622),
                        letterSpacing: .5,
                        decoration: TextDecoration.underline,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                TextFormField(
                  controller: nameclr,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(30)),
                      suffixIcon: Icon(Icons.person),
                      hintText: "Name",
                      labelText: "Name"),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "must fill";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: phclr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.phone),
                      hintText: "Phone number",
                      labelText: "Phone no"),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "must fill";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: ageclr,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month),
                    hintText: "Date of Birth",
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickdate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2006));
                    if (pickdate != null) {
                      String formatedate =
                          DateFormat("yyyy/MM/dd").format(pickdate);
                      setState(() {
                        ageclr.text = formatedate;
                      });
                    }
                  },
                  validator: (value) {
                    if (value!.length == 0) {
                      return "must fill";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                        value: Gender.male,
                        groupValue: defaultgender,
                        onChanged: (value) {
                          setState(() {
                            defaultgender = Gender.male;
                          });
                        }),
                    Text("Male"),
                    Radio(
                        value: Gender.female,
                        groupValue: defaultgender,
                        onChanged: (value) {
                          setState(() {
                            defaultgender = Gender.female;
                          });
                        }),
                    Text("Female"),
                    Radio(
                        value: Gender.other,
                        groupValue: defaultgender,
                        onChanged: (value) {
                          setState(() {
                            defaultgender = Gender.other;
                          });
                        }),
                    Text("Other")
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: wigtclr,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.width_full),
                      hintText: "Weight",
                      labelText: "Weight"),
                  validator: (value) {
                    if (value!.length == 0) {
                      return "must fill";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: BloodGroupDropdown()
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: ldonatclr,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.calendar_month),
                    hintText: "Last donated date",
                  ),
                  readOnly: true,
                  onTap: () {
                    showmydatepicker(context);
                  },
                  validator: (value) {
                    if (value!.length == 0) {
                      return "must fill";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          User u = User(
                              name: nameclr.text,
                              ph: phclr.text,
                              age: ageclr.text,
                              blood: bloodclr.text,
                              gender: defaultgender.toString(),
                              donated: ldonatclr.text,
                              weight: wigtclr.text);
                          dbhealper.insertuser(u).then((onValue) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildContext) {
                              return Home();
                            }));
                          });
                        }
                      },
                      child: Text("Register",
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF050622)),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum Gender { male, female, other }
class BloodGroupDropdown extends StatefulWidget {
  @override
  _BloodGroupDropdownState createState() => _BloodGroupDropdownState();
}

class _BloodGroupDropdownState extends State<BloodGroupDropdown> {
  String? selectedBloodGroup;

  // List of blood groups
  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedBloodGroup,
      hint: Text('Select Blood Group'),
      icon: Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: 16),
      onChanged: (String? newValue) {
        setState(() {
          selectedBloodGroup = newValue;
        });
      },
      items: bloodGroups.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}