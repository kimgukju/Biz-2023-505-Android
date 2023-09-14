/// 확장에서 `dart data class` 다운로드 후 아래같이
/// Dto 만든후 컨트롤+. 사용하여 간단하게 생성가능

class NaverBookDto {
  String? title; //	String	책
  String? link; //	String	네이버 도서 정보 URL
  String? image; //	String	섬네일 이미지의 URL
  String? author; //	String	저자 이름
  String? discount; //	Integer	판매 가격. 절판 등의 이유로 가격이 없으면 값을 반환하지 않습니다.
  String? publisher; //	String	출판사
  String? isbn; //	Integer	ISBN
  String? description; //	String	네이버 도서의 책 소개
  String? pubdate; //	dateTime
}
