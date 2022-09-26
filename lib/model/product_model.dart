class Product {
  Product({
    this.id=0,
    this.name="",
    this.price=0,
    this.discount_price=0,
    this.imagurl="",
    this.note="",
  });

  int id;
  String name;
  int price;
  int discount_price;
  String imagurl;
  String note;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"].toInt(),
    discount_price: json["off"].toInt(),
    imagurl: json["imagurl"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "off": discount_price,
    "imagurl": imagurl,
    "note": note,
  };


  static Future<List<Product>> loadData() async{
    return Future.delayed(Duration(seconds: 3), (){
      return [
        Product(id: 1, name: "Phone 12", price: 3000, discount_price: 2500, imagurl: "https://astera.ru/wp-content/uploads/2020/03/ETfgDMiXsAAM6U4_large.jpg", note: ""),
        Product(id: 2, name: "Samsung 22 Ultra", price: 2000, discount_price: 2300, imagurl: "https://iprofishop.ru/upload/iblock/cd6/c9i38wwkah0a2p8p7j9fs6164ocqv12j.jpg", note: ""),
        Product(id: 3, name: "Power Bank", price: 1000, discount_price: 800, imagurl: "https://static-sl.insales.ru/images/products/1/6305/367638689/ef59fdee77fbe80e3524371c5cf65aca.jpg", note: "new"),
        Product(id: 4, name: "HeadPhone", price: 1000, discount_price: 700, imagurl: "https://goodsonline24.ru/image/cache/catalog/!!!!!!!!!1-90x90.jpg", note: ""),
        Product(id: 5, name: "Samsung Monitor", price: 3000, discount_price: 2500, imagurl: "https://www.printer96.ru/wp-content/uploads/catalog/monitory/monitory-samsung/monitor-27-samsung-s27h850qfi-black-pls-led-wide-2560x1440-4ms-178-178-350-cd-m-100-000-000-1-dp-ndmi-mm-usb-type-c-pivot-freesync.jpg", note: "new"),
        Product(id: 6, name: "TV LG", price: 5000, discount_price: 4500, imagurl: "https://www.comeaucomputing.com/wp-content/uploads/2019/07/4-9-1024x769.jpg", note: "new"),
        Product(id: 7, name: "Huawei P30", price: 2500, discount_price: 2100, imagurl: "https://www.millionpodarkov.ru/incoming_img/pleer.ru/9185573.jpg", note: "new"),
        Product(id: 8, name: "Phone 14 Pro", price: 4000, discount_price: 3700, imagurl: "https://www.ixbt.com/img/n1/news/2021/11/6/72984127-b426-4638-92eb-c38f277adea4_large.jpg", note: ""),
        Product(id: 9, name: "Sony Playstation 5", price: 3000, discount_price: 2500, imagurl: "https://killprice24.ru/files/categories/premiere-pub-ps5-playstation5.jpg", note: "new"),
        Product(id: 10, name: "Xiaomi Pad5", price: 2000, discount_price: 1900, imagurl: "https://www.xiaomitoday.it/wp-content/uploads/2021/09/Image4-2.jpg", note: "new"),
      ];
    });
  }
}