import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/bloc_observer.dart';
import 'package:todo_app/core/di.dart' as di;
import 'package:todo_app/features/todo/presentation/controller/cubit/todo_cubit.dart';
import 'package:todo_app/features/todo/presentation/screens/todos_screen/view/todos_screen.dart';
import 'package:todo_app/utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initAppModule();
  Bloc.observer = MyBlocObserver();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360.0, 640.0),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di.sl<TodoCubit>()..getAllTodos(),
            )
          ],
          child: MaterialApp(
            builder: (context, child) {
              ScreenUtil.init(context);
              return Theme(
                data: appTheme,
                child: child!,
              );
            },
            debugShowCheckedModeBanner: false,
            //  theme: appTheme,
            home: const TodoScreen(),
          )),
    );
  }
}
