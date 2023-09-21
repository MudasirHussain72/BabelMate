import '../../../../view/view_barrel_file.dart';

class AgeSelectionController extends ChangeNotifier {
  List<AgeRange> ageRanges = [
    AgeRange(0, 'Under 18'),
    AgeRange(1, '18-24'),
    AgeRange(2, '25-34'),
    AgeRange(3, '35-44'),
    AgeRange(4, '45-54'),
    AgeRange(5, '55-64'),
    AgeRange(6, '65+'),
  ];

  int _selectedAgeRangeIndex = -1;

  // Getter to get the currently selected age range
  AgeRange? get selectedAgeRange {
    if (_selectedAgeRangeIndex >= 0 &&
        _selectedAgeRangeIndex < ageRanges.length) {
      return ageRanges[_selectedAgeRangeIndex];
    }
    return null;
  }

  // Method to select an age range and deselect others
  void selectAgeRange(int index) {
    if (index != _selectedAgeRangeIndex) {
      // Deselect the previously selected age range
      if (_selectedAgeRangeIndex >= 0 &&
          _selectedAgeRangeIndex < ageRanges.length) {
        ageRanges[_selectedAgeRangeIndex].isSelected = false;
      }

      // Select the new age range
      if (index >= 0 && index < ageRanges.length) {
        ageRanges[index].isSelected = true;
        _selectedAgeRangeIndex = index;
      }

      notifyListeners();
    }
  }
}

class AgeRange {
  final int id;
  final String name;
  bool isSelected;

  AgeRange(this.id, this.name, {this.isSelected = false});
}
