import 'package:cloud_firestore/cloud_firestore.dart';


   Future<void> uploadProductsToFirestore() async {
    // Firestore veritabanına referans alın
    final FirebaseFirestore db = FirebaseFirestore.instance;

    // 'Products' koleksiyonuna referans alın
    final CollectionReference productsCollection = db.collection('Products');

    print('Ürünleri Firestore\'a yükleme işlemi başlıyor...');

    // Her bir ürün verisi için döngü oluşturun
    for (final product in productDataList) {
      // Ürünün productId'sini döküman ID'si olarak kullanın
      final String productId = product['productId'] as String;

      // Veriyi toMap() formatına dönüştürün (zaten map olduğu için gerek yok ama mantık budur)
      final Map<String, dynamic> productMap = product;

      // Ürünü Firestore'a ekleyin
      try {
        await productsCollection.doc(productId).set(productMap);
        print('Ürün $productId başarıyla eklendi.');
      } catch (e) {
        print('Ürün $productId yüklenirken bir hata oluştu: $e');
      }
    }

    print('Tüm ürünler yükleme işlemi tamamlandı.');
  }

   final List<Map<String, dynamic>> productDataList = [
    // Ürün 1: Hoody
    // {
    //   'categoryId': 'Grn93pIjFLztrN5uDKd8',
    //   'colors': [
    //     {
    //       'title': 'Gri',
    //       'rgb': [128, 128, 128],
    //     },
    //     {
    //       'title': 'Siyah',
    //       'rgb': [0, 0, 0],
    //     },
    //   ],
    //   'createdDate': Timestamp.fromDate(DateTime(2025, 8, 25, 14, 0)),
    //   'discountedPrice': 29.99,
    //   'gender': 2,
    //   'images': ['hoody.jpg'],
    //   'price': 49.99,
    //   'sizes': ['S', 'M', 'L', 'XL'],
    //   'productId': 'prod-013',
    //   'salesNumber': 250,
    //   'title': 'Hoody',
    // },

    // Ürün 2: Bag
    {
      'categoryId': 'fLA0u3Psr7zr1qMUTNgh',
      'colors': [
        {
          'title': 'Yeşil',
          'rgb': [0, 128, 0],
        },
        {
          'title': 'Kırmızı',
          'rgb': [255, 0, 0],
        },
      ],
      'createdDate': Timestamp.fromDate(DateTime(2025, 8, 24, 15, 30)),
      'discountedPrice': 19.99,
      'gender': 2,
      'images': ['bag.jpg'],
      'price': 25.99,
      'sizes': ['Tek Beden'],
      'productId': 'prod-014',
      'salesNumber': 320,
      'title': 'Bag',
    },

    // Ürün 3: Jacket
    {
      'categoryId': 'ZxXmHm5RQXTLNnEAQYbI',
      'colors': [
        {
          'title': 'Mavi',
          'rgb': [3, 114, 219],
        },
        {
          'title': 'Beyaz',
          'rgb': [255, 255, 255],
        },
      ],
      'createdDate': Timestamp.fromDate(DateTime(2025, 8, 23, 10, 0)),
      'discountedPrice': 69.99,
      'gender': 1,
      'images': ['jacket.jpg'],
      'price': 89.99,
      'sizes': ['XS', 'S', 'M'],
      'productId': 'prod-015',
      'salesNumber': 180,
      'title': 'Jacket',
    },

    // Ürün 4: Shoes
    {
      'categoryId': 'm7EL42L2QG4FJrNejKed',
      'colors': [
        {
          'title': 'Beyaz',
          'rgb': [255, 255, 255],
        },
        {
          'title': 'Siyah',
          'rgb': [0, 0, 0],
        },
      ],
      'createdDate': Timestamp.fromDate(DateTime(2025, 8, 21, 9, 20)),
      'discountedPrice': 59.99,
      'gender': 2,
      'images': ['shoes.jpg'],
      'price': 75.00,
      'sizes': ['36', '37', '38', '39', '40', '41', '42'],
      'productId': 'prod-016',
      'salesNumber': 520,
      'title': 'Shoes',
    },

    // Ürün 5: Short
    {
      'categoryId': 'SClAuXlBrxrxlDaYmkDx',
      'colors': [
        {
          'title': 'Bej',
          'rgb': [245, 245, 220],
        },
        {
          'title': 'Pembe',
          'rgb': [255, 192, 203],
        },
      ],
      'createdDate': Timestamp.fromDate(DateTime(2025, 8, 19, 11, 45)),
      'discountedPrice': 24.99,
      'gender': 1,
      'images': ['short.jpg'],
      'price': 35.00,
      'sizes': ['S', 'M', 'L'],
      'productId': 'prod-017',
      'salesNumber': 110,
      'title': 'Short',
    },
  ];

