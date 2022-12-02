import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Remember App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/task': (context) => const TaskPage(),
        '/task/note': (context) => const NotePage(),
        '/task/note/tags': (context) => const TagsPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('OneKeep'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Search task or note',
              onPressed: () {
                // handle the press
              },
              padding: const EdgeInsets.only(right: 10.0),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Task'),
              Tab(text: 'Note'),
              Tab(text: 'Tags'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TaskPage(),
            NotePage(),
            TagsPage(),
          ],
        ),
      ),
    );
  }
}

class TaskPage extends StatelessWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      // appBar: AppBar(
      //   title: const Text('Tasks'),
      // ),
      body: const Text('TaskPage'),
      floatingActionButton: FloatingActionButton(
        heroTag: 'taskPageTag',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTaskPage()),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      // appBar: AppBar(
      //   title: const Text('Notes'),
      // ),
      body: const Text('NotePage'),
      floatingActionButton: FloatingActionButton(
        heroTag: 'notePageTag',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateNotePage()),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class TagsPage extends StatelessWidget {
  const TagsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.limeAccent,

      // appBar: AppBar(
      //   title: const Text('Tags'),
      // ),
      body: Text('TagsPage'),
    );
  }
}

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Task'),
        ),
        body: Center(
          child: Hero(
            tag: 'taskPageTag',
            child: Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 5.0,
                    width: 5.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                      labelStyle: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    // focusNode: ,
                  ),
                  const SizedBox(
                    height: 10.0,
                    width: 10.0,
                  ),
                  TextFormField(
                    minLines: 3,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // hintText: 'Additional notes',
                      hintText: 'Additional notes',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class CreateNotePage extends StatelessWidget {
  const CreateNotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: const Center(
        child: Hero(
          tag: 'notePageTag',
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}
