import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Responsive Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1200) {
            // Desktop layout
            return DesktopView();
          } else if (constraints.maxWidth >= 800) {
            // Tablet layout
            return TabletView();
          } else {
            // Mobile layout
            return MobileView();
          }
        },
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          NavigationBar(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CourseDetails(),
                SizedBox(width: 40),
                CallToAction('Join Course'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabletView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          NavigationBar(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CourseDetails(),
                  SizedBox(height: 20),
                  CallToAction('Join Course'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          NavigationBar(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CourseDetails(),
                  SizedBox(height: 20),
                  CallToAction('Join Course'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Humming Bird.'),
      actions: [
        if (MediaQuery.of(context).size.width >= 600) ...[
          TextButton(onPressed: () {}, child: Text('Episodes')),
          TextButton(onPressed: () {}, child: Text('About')),
        ] else ...[
          IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        ]
      ],
    );
  }
}

class CourseDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FLUTTER WEB.\nTHE BASICS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
        SizedBox(height: 20),
        Text(
          'In this course we will go over the basics of using '
              'Flutter Web for development. Topics include Responsive '
              'Layouts, Designing for Desktop, and more.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class CallToAction extends StatelessWidget {
  final String text;

  CallToAction(this.text);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
      ),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    );
  }
}