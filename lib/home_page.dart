import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'sign_in.dart';
import 'calculator.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentPage = 'Sign In';

  void navigateToPage(String pageName) {
    setState(() {
      currentPage = pageName;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xFF9F81B9),
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Image(
                    image: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH0B6xFh7dfj-jJW1u_qV9fwrUAtyzpk035Q&usqp=CAU'),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text(
                  'Sign In',
                  style: TextStyle(
                      fontSize: 30,
                      color: currentPage == 'Sign In'
                          ? Colors.yellow
                          : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => navigateToPage('Sign In'),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40,
                ),
                title: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 30,
                      color: currentPage == 'Sign Up'
                          ? Colors.yellow
                          : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => navigateToPage('Sign Up'),
              ),
              ListTile(
                leading: Icon(
                  Icons.calculate,
                  size: 40,
                ),
                title: Text(
                  'Calculator',
                  style: TextStyle(
                      fontSize: 30,
                      color: currentPage == 'Calculator'
                          ? Colors.yellow
                          : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () => navigateToPage('Calculator'),
              ),
            ],
          ),
        ),
      ),
      body: currentPage == 'Sign Up'
          ? SignUp()
          : currentPage == 'Sign In'
              ? SignIn(toggleTheme: () {  },)
              : Calculator(),
    );
  }
}
