import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/home.dart';
import 'package:provider_state_management/models/todo.dart';
import 'package:provider_state_management/models/todolist.dart';
import 'package:provider_state_management/providers/provider.dart';
import 'package:provider_state_management/providers/todoProvider.dart';
import 'package:hive/hive.dart';

void main () async{
    WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todobox');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context)=>Numberprovider()),
       ChangeNotifierProvider(create: (context)=>Todoprovider())
        
      ],
      child: MaterialApp(
        home:Todolist()//Home()
      ),
    );
  }
}
