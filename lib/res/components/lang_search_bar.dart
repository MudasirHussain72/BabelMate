import 'package:babel_mate/view/view_barrel_file.dart';

class LanguageSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onTextChanged;

  const LanguageSearchBar({
    super.key,
    required this.controller,
    required this.onTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onTextChanged,
      decoration: const InputDecoration(
        hintText: 'Search for languages...',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
