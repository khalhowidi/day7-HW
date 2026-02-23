import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/product.dart';

class ApiService {
  final supabase = Supabase.instance.client;

  Future<List<Product>> getProducts() async {
    final response = await supabase
        .from('products')
        .select()
        .order('created_at', ascending: false);

    return (response as List)
        .map((item) => Product.fromJson(item))
        .toList();
  }
}