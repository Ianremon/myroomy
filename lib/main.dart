import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myroomy/pages/registerpage.dart'; // Importamos la página de registro.
import 'package:myroomy/pages/LoginPage.dart'; // Importamos la página de login.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myroomy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final List<String> imgList = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
  ];

  late AnimationController _animationController;
  late Animation<Color?> animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    animation = ColorTween(begin: Color(0xFF5E18EB), end: Color(0xFFff1053))
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 60,
            left: 20,
            child: Image.asset(
              'assets/Logo_Myroomy.png',
              width: 49,
              height: 49,
            ),
          ),
          Positioned(
            top: 60,
            right: 50,
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff5e18eb), Color(0xffFF1053)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  // Aquí se maneja la acción al presionar el botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginPage()), // Navega a LoginPage
                  );
                },
              ),
            ),
          ), // Cierre del Positioned del icono de usuario.
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: CarouselSlider(
              items: imgList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                  height: 500.0,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {});
                  }),
            ),
          ),
          Positioned(
            top: 650,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage('assets/Myroomy girl room.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 240.0,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width:
                    MediaQuery.of(context).size.width - 40, // define el ancho
                height: 50, // define la altura
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff5e18eb), Color(0xffFF1053)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Registrarme',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
