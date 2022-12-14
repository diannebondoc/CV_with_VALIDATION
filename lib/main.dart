import 'package:flutter/material.dart';
import 'form.dart';

// function to trigger build when the app is run
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/form': (context) => FormRoute(),
      '/first': (context) => const FirstRoute(),
      '/second': (context) => const SecondRoute(),
      '/third': (context) => const ThirdRoute(),
      '/fourth': (context) => const FourthRoute(),
    },
  ));
}

class HomeRoute extends StatelessWidget {
  HomeRoute({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/violet.png'), fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'WELCOME',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'Enter email',
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (String value) {},
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email is required';
                                  } else if (value.isEmpty ||
                                      !RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                    return "Enter a valid email";
                                  }
                                },
                              )),
                          SizedBox(height: 30.0),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              child: TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  hintText: 'Enter password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (String value) {},
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.isEmpty ||
                                      !RegExp(r'[A-Z]').hasMatch(value)) {
                                    return "Enter Uppercase Letter";
                                  } else if (value.isEmpty ||
                                      !RegExp(r'[_@#$%^&*(),.?":{}|<>]')
                                          .hasMatch(value)) {
                                    return "Enter Special Character";
                                  }
                                  return null;
                                },
                              )),
                          SizedBox(height: 20.0),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
                              child: MaterialButton(
                                  minWidth: double.infinity,
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      Navigator.pushNamed(context, '/first');
                                      return;
                                    }
                                  },
                                  child: Text('Login'),
                                  color: Colors.purpleAccent,
                                  textColor: Colors.white)),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: const Text('Forget Password'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don`t have an Account ? ",
                                style: TextStyle(
                                  fontFamily: 'Calibri',
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/form');
                                },
                                child: Text('Sign Up Here!'),
                              ),
                            ],
                          ),
                        ],
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
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Curriculum Vitae'),
        backgroundColor: Colors.deepPurpleAccent,
      ), // AppBar

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('images/profile.png'),
              ),
              Text(
                'Tumanan, Dianne Nicole D.',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'IT Consultant',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.purple,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 20.0,
                width: 300.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),

              Text(
                'Objective:',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Center(
                child: Text(
                  '    Pursuing opportunity which will allow me\n'
                  '      to grow professionaly while effectively\n'
                  '        utilizing my versatile skill set to help\n'
                  '           promote your corporate mission\n'
                  '                 and exceed team goals.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Source Sans Pro',
                    fontSize: 20.0,
                  ),
                ),
              ),

              SizedBox(
                height: 20.0,
                width: 300.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              SizedBox(height: 20.0),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // background
                        // onPrimary: Colors.white, // foreground
                      ),
                      child: const Text('Info'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: const Text('Educ'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/third');
                      },
                    ),
                    SizedBox(width: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: const Text('Skills'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/fourth');
                      },
                    ),
                  ],
                ),
              ), // ElevatedButton
            ],
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.deepPurpleAccent,
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/profile.png'),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Name:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                'Dianne Nicole D. Tumanan',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'Age:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                '27 years old',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'Gender:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                'Female',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'Address:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                'Lokeb Norte Malasiqui, Pangasinan',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'BirthDate:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                'October 11,1994',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'Contact No:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                '09107066796',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                'Email:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                'diannenicoledacanay@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'Citizenship:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Text(
                'Filipino',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Education"),
        backgroundColor: Colors.deepPurpleAccent,
      ), // AppBar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/education.png'),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'College:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Bachelor of Science in Information Technology\n Philippine College of Science and Technology\n'
                '                              (2022-2023)',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'Secondary:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Malasiqui Agno Valley College\n'
                '               (2010-2011)',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
            ),
            Center(
              child: Text(
                'Elementary:',
                style: TextStyle(
                  color: Colors.purpleAccent,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'San Juan Elementary School\n'
                '              (2006-2007)',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ), // Center
    ); // Scaffold
  }
}

class FourthRoute extends StatelessWidget {
  const FourthRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Background"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/skills.png'),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'General Management',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Problem Solving Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Business Development Strategies',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Interpersonal Communication Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Time Management Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 25.0,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Multitasking Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Source Sans Pro',
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
