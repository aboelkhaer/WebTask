import 'exports.dart';
import 'package:web_app_task/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await di.diInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Web Task',
        onGenerateRoute: RouteGenerator.getRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
