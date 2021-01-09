

class Place {

  String description;
  String country;
  double price;
  List<String> images;
  bool favorite;

  Place(this.description, this.country, this.price, this.images, this.favorite);

}

List<Place> getPlaceList(){
  return <Place>[
    Place(
        "ถ้าได้มาเที่ยวกรุงเทพฯ ต้องแวะไปกราบ พระแก้วมรกต สักครั้ง ที่ วัดพระศรีรัตนศาสดาราม หรือ วัดพระแก้ว พระพุทธรูปคู่บ้านคู่เมืองของไทยเพื่อเป็นสิริมงคล",
        "วัดพระแก้ว",
        8888.5,
        [
          "https://cms.dmpcdn.com/travel/2020/02/24/9ddb1a30-56db-11ea-b3d8-ab89704a9bb5_original.JPG",
          "https://cms.dmpcdn.com/travel/2020/02/24/9ddb1a30-56db-11ea-b3d8-ab89704a9bb5_original.JPG",
          "https://cms.dmpcdn.com/travel/2020/02/24/9ddb1a30-56db-11ea-b3d8-ab89704a9bb5_original.JPG",
          "https://cms.dmpcdn.com/travel/2020/02/24/9ddb1a30-56db-11ea-b3d8-ab89704a9bb5_original.JPG",


        ],
        false
    ),
    Place(
        "เตรียมชุดสวยๆ พร้อมสะพายกล้องถ่ายรูป ของทุกคนกันให้พร้อม ! ชิลชมวิวดาดฟ้ากรุงเทพฯ ที่ มหานคร สกายวอล์ค (Mahanakhon Skywalk)",
        "มหานคร สกายวอล์ค",
        2990,
        [
          "https://cms.dmpcdn.com/travel/2020/02/24/593dfd10-56dc-11ea-8ded-c572ddfbb31d_original.JPG",
        ],
        false
    ),
    Place(
        "ตลาดน้ำแสนคลาสสิคริมคลองแสนแสบ จากนิยายอมตะที่สร้างเป็นภาพยนตร์มาแล้วหลายเวอร์ชั่น เชื่อมสองฝั่งระหว่างวัดบำเพ็ญเหนือ",
        "ตลาดน้ำขวัญเรียม",
        4870.5,
        [
          "https://cms.dmpcdn.com/travel/2020/02/24/8ef6e340-56dc-11ea-8ded-c572ddfbb31d_original.JPG",
        ],
        false
    ),
    Place(
        "ริมแม่น้ำเจ้าพระยา ไอคอนสยาม อภิมหาโครงการเมือง ที่ตอบโจทย์ทุกไลฟ์สไตล์ที่นำเสนอในรูปแบบของความวิจิตรล้ำสมัย",
        "ไอคอนสยาม",
        4120.5,
        [
          "https://cms.dmpcdn.com/travel/2020/02/24/1a8948e0-56dc-11ea-8ded-c572ddfbb31d_original.JPG",
        ],
        false
    ),
  ];
}