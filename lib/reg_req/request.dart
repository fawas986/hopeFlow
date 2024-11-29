import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hopeflow/dashboard.dart';


class Request extends StatefulWidget {
  const Request({super.key});

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar: AppBar(
            title: Text('Request Blood',style: TextStyle(color: Colors.white),),
            backgroundColor: Color(0xFF7E2124),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20),
                    // Blood Group Dropdown
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Select Blood Group',
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        'A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'
                      ].map((bloodGroup) {
                        return DropdownMenuItem(
                          value: bloodGroup,
                          child: Text(bloodGroup),
                        );
                      }).toList(),
                      validator: (value) =>
                      value == null ? 'Please select a blood group' : null,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 20),
                    // Contact Information
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a contact number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Hospital Details
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Hospital Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the hospital name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Additional Details
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Additional Message',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 20),
                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7E2124),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (BuildConext) {
                                  return HomePage();
                                }));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Blood request submitted!')),
                            );
                          }
                        },
                        child: Text('Submit Request',style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ],
                      ))),
          )


        );
    }
}
