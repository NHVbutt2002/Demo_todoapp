import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> body = [const Todo(), const Todo2(), const Todo3()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('All Task'),
      ),
      body: Center(child: body[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(),
              label: 'Compelete',
            ),
            BottomNavigationBarItem(
              icon: Container(),
              label: 'All',
            ),
            BottomNavigationBarItem(
              icon: Container(),
              label: 'Incomplete',
            ),
          ]),
    );
  }
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('No data, please create the task new')),
        ],
      ),
    );
  }
}

class Todo2 extends StatefulWidget {
  const Todo2({super.key});

  @override
  State<Todo2> createState() => _Todo2State();
}

class _Todo2State extends State<Todo2> {
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: TextButton(
                onPressed: () async {
                  showDialog<String>(
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) => const Alerdialog());
                },
                child: const Text(
                  'Create Task',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Expanded(
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {})),
          const SizedBox(
            height: 250,
          ),
          const Center(child: Text('No data, please create the task new')),
        ],
      ),
    );
  }
}

class Todo3 extends StatelessWidget {
  const Todo3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('No data, please create the task new')),
        ],
      ),
    );
  }
}

class Alerdialog extends StatefulWidget {
  const Alerdialog({super.key});

  @override
  State<Alerdialog> createState() => _AlerdialogState();
}

class _AlerdialogState extends State<Alerdialog> {
  void add() {
    Navigator.of(context).pop(_controller.text);
  }

  final TextEditingController _controller = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

    return Material(
        color: Colors.transparent,
        child: AlertDialog(
          title: const Text('Create Task'),
          content: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  decoration: InputDecoration(hintText: 'Wrire Task Here ... '),
                ),
              ),
              Checkbox(
                  value: isChecked,
                  activeColor: Colors.blueAccent,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  }),
            ],
          ),
          actions: [
            TextButton(
              child: Text('Add'),
              onPressed: add,
            )
          ],
        ));
  }
}
