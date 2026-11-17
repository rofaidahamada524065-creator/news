import 'package:material_ui/material_ui.dart';
import 'package:news/Provider/auth_provider.dart';
import 'package:news/Screen/signup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 223, 118, 153)),
        ),
        home:  Signup(),
      ),
    );
  }
}
