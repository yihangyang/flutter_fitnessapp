import 'package:fitness_app/viewmodel/stufe_view_model.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider<StufeViewModel>(create: (ctx) => StufeViewModel()),
];