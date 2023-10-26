import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/bloc_observer.dart';
import 'package:todo_app/core/di.dart' as di;
import 'package:todo_app/features/todo/data/database/todo_database.dart';
import 'package:todo_app/features/todo/domain/entities/todo_model.dart';
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';
import 'package:todo_app/features/todo/presentation/screens/todos_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initAppModule();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.sl<TodoCubit>(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: TodoScreen(),
        ));
  }
}
