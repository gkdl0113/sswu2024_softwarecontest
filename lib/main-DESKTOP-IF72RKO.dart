import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/start.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Wealth Trainer',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              Spacer(),
              Center(
                child: Text(
                  '투자스쿨',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '@Wealth Trainer 2024 All rights reserved',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final id = _idController.text;
    final password = _passwordController.text;

    if (id == 'admin' && password == 'password') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EpisodeSelectionPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid ID or Password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wealth Trainer",
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'PASSWORD'),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: _login,
                  child: Text('로그인'),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    '회원가입',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
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

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: '이름'),
              ),
              TextField(
                decoration: InputDecoration(labelText: '아이디'),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: '비밀번호'),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: '비밀번호 확인'),
              ),
              TextField(
                decoration: InputDecoration(labelText: '닉네임'),
              ),
              TextField(
                decoration: InputDecoration(labelText: '소속'),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('가입하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EpisodeSelectionPage extends StatelessWidget {
  const EpisodeSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'episode',
          style: TextStyle(fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            EpisodeCard(title: '주식', isLocked: false, onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StockEpisodePage()),
              );
            }),
            EpisodeCard(title: '부동산', isLocked: true),
            EpisodeCard(title: '외화', isLocked: true),
            EpisodeCard(title: '채권', isLocked: true),
          ],
        ),
      ),
    );
  }
}

class EpisodeCard extends StatelessWidget {
  final String title;
  final bool isLocked;
  final VoidCallback? onTap;

  const EpisodeCard({
    Key? key,
    required this.title,
    this.isLocked = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 40), // 글자 크기 키움
            ),
            if (isLocked)
              Positioned(
                top: 8,
                right: 8,
                child: Icon(
                  Icons.lock,
                  color: Colors.yellow,
                  size: 50,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class StockEpisodePage extends StatelessWidget {
  const StockEpisodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wealth Trainer'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('주차: 1주차'),
                    Text('보유 금액: 100,000원'),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/news.jpg', // Corrected path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
          Positioned(
            bottom: 35,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                // Logic for navigating to the next page
              },
              child: Icon(Icons.arrow_forward),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                minimumSize: Size(56, 56),
              ),
            ),
          ),
        ],
      ),
    );
  }
}