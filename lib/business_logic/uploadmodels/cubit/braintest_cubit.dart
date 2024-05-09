import 'package:bloc/bloc.dart';
import 'package:graduation_project/business_logic/repo/repository.dart';
import 'package:meta/meta.dart';

part 'braintest_state.dart';

class BraintestCubit extends Cubit<BraintestState> {
  BraintestCubit() : super(BraintestInitial());

  Future<void> uploadBrainTest({required String image, required String token}) async {
    emit(BraintestLoading());
    try {
      final response = await HomeRepo().breastcanser('ai/upload-breast-cancer', token, image);
      final message = response['diag'];
      emit(BraintestSuccess(message));
    } catch (e) {
      emit(BraintestError('Something went wrong. Please try again.'));
}
  }
}