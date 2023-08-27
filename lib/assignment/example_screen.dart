import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade Example'),
      ),
      body: Column(
        children: [
          const Text('Header Text'),
          Expanded(
            child: AnimatedCrossFade(
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstChild: _buildGrid(),
              secondChild:
                  _buildGrid(), // For demonstration, using the same grid for both
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showFirst = !_showFirst;
          });
        },
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  Widget _buildGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.grey[(index % 9 + 1) * 100],
          child: Center(
            child: Text('Item $index'),
          ),
        );
      },
    );
  }
}
