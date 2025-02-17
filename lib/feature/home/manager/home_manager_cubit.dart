import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'home_manager_state.dart';

class HomeManagerCubit extends Cubit<HomeManagerState> {
  HomeManagerCubit() : super(HomeManagerInitial());
  static HomeManagerCubit get(context) => BlocProvider.of(context);
  List newsList = [];

  Future getDataFromDatabase() async {
    emit(GetNewsLoadingState());
    final supabaseClient =await Supabase.instance.client;

   await supabaseClient.from('news').select().then((value) {
      newsList = value.where((item) => item['active'] == true).toList();
    });
    emit(GetNewsSuccessState());
  }
}
