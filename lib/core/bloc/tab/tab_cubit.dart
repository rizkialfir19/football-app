import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/common/common.dart';

/// Cubit for handling tab interaction
/// We can add more logic as the user tap the tab
class TabCubit extends Cubit<DetailTab> {
  TabCubit() : super(DetailTab.standing);

  /// Change tab
  void changeTab({
    required DetailTab tab,
  }) {
    emit(tab);
  }
}
