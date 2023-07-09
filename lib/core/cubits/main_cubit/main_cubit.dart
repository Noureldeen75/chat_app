import 'package:chat_app/core/cubits/main_cubit/main_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());
  static MainCubit get(context) => BlocProvider.of(context);
}
