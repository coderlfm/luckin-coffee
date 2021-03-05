import 'package:flutter/material.dart';
import 'package:luckincoffee/pages/main/main.dart';
import 'package:luckincoffee/routes/router.dart';

void main() => runApp(MaterialApp(
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    ));
