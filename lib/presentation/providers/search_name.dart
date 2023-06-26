import 'package:flutter_riverpod/flutter_riverpod.dart';

/// provider for search input
final searchNameProvider = StateProvider<String>((ref) => '');
