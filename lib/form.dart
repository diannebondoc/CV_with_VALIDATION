import 'package:flutter/material.dart';

class FormRoute extends StatelessWidget {
  FormRoute({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Full Name:',
                            border: UnderlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty || value.isEmpty) {
                              return 'Name is required';
                            } else if (value.isEmpty ||
                                RegExp(r'[!@#$%^&*(),?":+{}/-_=|<>]')
                                    .hasMatch(value)) {
                              return "Don't enter symbols";
                            } else if (value == null || value.isEmpty) {
                              return 'Please enter correct name';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Age:',
                            border: UnderlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your age';
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Sex:',
                            border: UnderlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (String value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Put your gender';
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Address:',
                            border: UnderlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (String value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Address is required';
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          controller: _date,
                          decoration: InputDecoration(
                            labelText: 'Birthdate:',
                            border: UnderlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (String value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Date of Birth is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Number:',
                            border: UnderlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email:',
                            border: UnderlineInputBorder(),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                    .hasMatch(value)) {
                              return "Enter correct Email";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          child: Text('Create Account'),
                          color: Colors.purpleAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              (Navigator.pushNamed(context, '/'));
                              return;
                            }
                          },
                        ),
                      )
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
}
