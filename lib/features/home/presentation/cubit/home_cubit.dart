import 'package:web_app_task/features/home/data/models/trip_model_response.dart';

import '../../../../exports.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
  static HomeCubit get(context) => BlocProvider.of(context);

  initHomeIndex() {
    emit(const HomeState.loaded(0));
  }

  List<TripModel> trips = [
    TripModel(
      status: 'Pending Approval',
      title: 'Item title',
      date: 'Jan 16 - Jan 20, 2024',
      nights: '',
      image: AppImages.pic1,
    ),
    TripModel(
      status: 'Pending Approval',
      title: 'Item title',
      date: 'Jan 16 - Jan 20, 2024',
      nights: '5 Nights',
      image: AppImages.pic2,
    ),
    TripModel(
      status: 'Pending Approval',
      title: 'Item title',
      date: 'Jan 16 - Jan 20, 2024',
      nights: '5 Nights',
      image: AppImages.pic3,
    ),
    TripModel(
      status: 'Pending Approval',
      title: 'Item title',
      date: 'Jan 16 - Jan 20, 2024',
      nights: '5 Nights',
      image: AppImages.pic2,
    ),
    TripModel(
      status: 'Pending Approval',
      title: 'Item title',
      date: 'Jan 16 - Jan 20, 2024',
      nights: '5 Nights',
      image: AppImages.pic1,
    ),
    TripModel(
      status: 'Pending Approval',
      title: 'Item title',
      date: 'Jan 16 - Jan 20, 2024',
      nights: '5 Nights',
      image: AppImages.pic2,
    ),
    TripModel(
      status: 'Pending Approval',
      title: 'Item title',
      date: 'Jan 16 - Jan 20, 2024',
      nights: '5 Nights',
      image: AppImages.pic1,
    ),
    TripModel(
      status: 'Pending Approval',
      title: 'Item title',
      date: 'Jan 16 - Jan 20, 2024',
      nights: '5 Nights',
      image: AppImages.pic2,
    ),
  ];

  changeHomeIndex(int index) {
    emit(state.maybeMap(
      orElse: () => state,
      loaded: (value) {
        if (index != value.homeTabIndex) {
          return HomeState.loaded(index);
        }
        return HomeState.loaded(value.homeTabIndex);
      },
    ));
  }
}
