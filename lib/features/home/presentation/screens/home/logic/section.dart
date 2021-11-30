import 'package:cronicadeportiva/features/home/home.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';

@freezed
class Section with _$Section {
  static const values = [
    Section.home(),
    Section.search(),
    Section.bookmarks(),
    Section.profile()
  ];

  const Section._();

  const factory Section.home({
    @Default(HomeLocation.home)
    String path
  }) = HomeSection;

  const factory Section.search({
    @Default(HomeLocation.search)
    String path
  }) = SearchSection;

  const factory Section.bookmarks({
    @Default(HomeLocation.bookmarks)
    String path
  }) = BookmarksSection;

  const factory Section.profile({
    @Default(HomeLocation.profile)
    String path
  }) = ProfileSection;
}

@freezed
class Sections with _$Sections {
  Section get section => sections[index];

  const Sections._();
  const factory Sections({
    required int index,
    required List<Section> sections
  }) = _Sections;
}