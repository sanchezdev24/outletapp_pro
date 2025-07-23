// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/di/injection.dart' as di;
import 'core/config/themes/app_theme.dart';
import 'core/config/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar dependencias
  await di.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OutletApp',
      debugShowCheckedModeBanner: false,
      
      // Configuración de tema
      theme: AppTheme.getTheme(context, false),
      darkTheme: AppTheme.getTheme(context, true),
      themeMode: ThemeMode.system,
      
      // Configuración de rutas
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
      
      // Configuración de localización
      locale: const Locale('es', 'ES'),
      fallbackLocale: const Locale('en', 'US'),
      
      // Configuración de transiciones
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}