import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'Api1.dart';
import 'Api2.dart';
import 'Api3.dart';
import 'Api4.dart';
import 'Api5.dart';
import 'Api6.dart';
import 'Api7.dart';
import 'Api8.dart';
import 'line_chart.dart';
import 'linear_charts.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/APIS.png",
                  width: 450,
                  height: 450,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }

//Zona de correo
  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Ejemplo @Correo.com',
            labelText: 'Correo electrónico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

//Zona de contraseña
  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

//Botón de iniciar sesión
  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(
            'Iniciar sesión',
            style: TextStyle(color: Colors.black),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondScreen()));
        },
      );
    });
  }
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  "assets/logotipo.png",
                  width: 450,
                  height: 450,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15.0,
              ),
              _passwordTextField(),
              SizedBox(
                height: 20.0,
              ),
              _bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }

//Zona de correo
  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'Ejemplo @Correo.com',
            labelText: 'Correo electrónico',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

//Zona de contraseña
  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
          ),
          onChanged: (value) {},
        ),
      );
    });
  }

//Botón de iniciar sesión
  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(
            'Iniciar sesión',
            style: TextStyle(color: Colors.black),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondScreen()));
        },
      );
    });
  }
}

//Clase para la siguiente pantalla
class SecondScreen extends StatefulWidget {
  SecondState createState() => SecondState();
}

class SecondState extends State<SecondScreen> {
  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return Api1();
      case 1:
        return Api2();
      case 2:
        return Api3();
      case 3:
        return Api4();
      case 4:
        return Api5();
      case 5:
        return Api6();
      case 6:
        return Api7();
      case 7:
        return Api8();
    }
  }

  _OnSelectItem(pos) {
    setState(() {
      _selectDrawerItem = pos;
    });
  }

//Segunda pantalla con el Drawer
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 70, 31, 161),
        title: const Text("Bienvenido a las APIS"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        )),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Germán Simá"),
              accountEmail: Text("a.jose.sima@utponiente.edu.mx"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    'assets/fox.png',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/moradoazul2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications_active),
              title: Text("Notificación"),
              onTap: () {
                _OnSelectItem(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text("Clima"),
              onTap: () {
                _OnSelectItem(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.perm_media),
              title: Text("OpenIA"),
              onTap: () {
                _OnSelectItem(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Google Pay"),
              onTap: () {
                _OnSelectItem(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code_2),
              title: Text("Escaneo QR"),
              onTap: () {
                _OnSelectItem(4);
              },
            ),
            ListTile(
              leading: Icon(Icons.analytics),
              title: Text("Diagrama"),
              onTap: () {
                _OnSelectItem(5);
              },
            ),
            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text("PDF"),
              onTap: () {
                _OnSelectItem(6);
              },
            ),
            ListTile(
              leading: Icon(Icons.mic),
              title: Text("ChatBot"),
              onTap: () {
                _OnSelectItem(7);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}
