import '../models/product.dart';

class CartService {
  CartService._();
  static final CartService instance = CartService._();

   List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  void add(Product p) {
    _items.add(p);
  }

  void removeAt(int index) {
    _items.removeAt(index);
  }

  void clear() {
    _items.clear();
  }

  double get total => _items.fold(0, (sum, p) => sum + p.price);
}