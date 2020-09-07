-- 회원
INSERT INTO MEMBER
VALUES ('admin', 'admin', '관리자', '00/00/00','010-1234-5678', default, default, default);
INSERT INTO MEMBER
VALUES ('user01', 'pass01', '홍길동', '95/12/12','010-1111-2222', default, default, default);
INSERT INTO MEMBER
VALUES ('user02', 'pass02', '이순신', '98/05/23','010-3333-4444', default, default, default);

-- 관광지 카테고리
INSERT INTO TOUR_CATEGORY
VALUES (1, '자연');
INSERT INTO TOUR_CATEGORY
VALUES (2, '맛집');
INSERT INTO TOUR_CATEGORY
VALUES (3, '액티비티');

-- 관광지
INSERT INTO TOUR
VALUES (1, '우도', '우도입니다', SYSDATE, '우도입니다', NULL, NULL, '우도.jpg','20200905011910.jpg', DEFAULT, 1, 'user01');
INSERT INTO TOUR
VALUES (2, '해수욕장', '한라산입니다', SYSDATE, '제주도 서귀포시 서귀동', NULL, NULL, '한라산.PNG', NULL, DEFAULT, 1, 'user02');
INSERT INTO TOUR
VALUES (3, '성산일출봉', '성산일출봉입니다', SYSDATE, '서귀포시', NULL, NULL, '성산일출봉.JPG', NULL, DEFAULT, 1, 'admin');
INSERT INTO TOUR
VALUES (4, '상춘재', '한정식 / 백반 / 정통 한식 식당입니다', SYSDATE, '제주 제주시 조천읍 선흘리 1829-11', NULL, NULL, '상춘재.JPG', NULL, DEFAULT, 2, 'user02');
INSERT INTO TOUR
VALUES (5, '곰막', '	해산물 요리 식당입니다', SYSDATE, ' 제주 제주시 구좌읍 동복리 667-1', NULL, NULL, '곰막.JPG', NULL, DEFAULT, 2, 'user01');
INSERT INTO TOUR
VALUES (6, '오드랑베이커리', '베이커리 입니다', SYSDATE ,'제주 제주시 조천읍 함덕리 270-1', NULL, NULL, '베이커리.JPG', NULL, DEFAULT, 2, 'user01');
INSERT INTO TOUR
VALUES (7, '커피 마스터 클래스', '커피만들기입니다', SYSDATE ,'애월읍, 제주시', '2020/09/05', '2020/09/25', '커피.JPG', NULL, DEFAULT, 3, 'user01');
INSERT INTO TOUR
VALUES (8, '제주도 오름 투어와 야경 스냅촬영', '사진촬영 입니다', SYSDATE ,'용담일동, 제주시', '2020/10/1', '2020/11/25', '?삤由?.JPG', NULL, DEFAULT, 3, 'user02');
INSERT INTO TOUR
VALUES (9, '제주 숲속 알파카와 함께 하는 힐링 체험', '알파카체험입니다', SYSDATE ,'애월읍, 제주시', '2020/05/15', '2020/07/20', '알파카.JPG', NULL, DEFAULT, 3, 'admin');

-- 관광지 이미지
INSERT INTO TOUR_IMAGE
VALUES (1, '우도.jpg', NULL, 1);
INSERT INTO TOUR_IMAGE
VALUES (2, '천지연폭포.PNG', NULL, 1);
INSERT INTO TOUR_IMAGE
VALUES (3, '성산일출봉.JPG', NULL, 1);
INSERT INTO TOUR_IMAGE
VALUES (4, '상춘재.JPG', NULL, 2);
INSERT INTO TOUR_IMAGE
VALUES (5, '곰막.JPG', NULL, 2);
INSERT INTO TOUR_IMAGE
VALUES (6, '베이커리.JPG', NULL, 2);
INSERT INTO TOUR_IMAGE
VALUES (7, '커피.JPG', NULL, 3);
INSERT INTO TOUR_IMAGE
VALUES (8, '오름.JPG', NULL, 3);
INSERT INTO TOUR_IMAGE
VALUES (9, '알파카.JPG', NULL, 3);

-- 관광지 리뷰 
INSERT INTO TOUR_REVIEW
VALUES (1, '정말 좋았어요', SYSDATE, 4.5 , 1, 'user01');
INSERT INTO TOUR_REVIEW
VALUES (2, '정말 맛있어요', SYSDATE, 4.9 , 2, 'user02');
INSERT INTO TOUR_REVIEW
VALUES (3, '정말 재밌었어요', SYSDATE, 4.8 , 3, 'user01');

-- 자주 묻는 질문 타입
insert into faq_type
values ( 1, '결제');
-- 자주 묻는 질문
insert into faq
values (1, '결제 질문', '결제는 카드진행 하시면 됩니다.', 1);


-- 편의 시설
insert into amenity values(1,'주방');
insert into amenity values(2,'샴푸');
insert into amenity values(3,'난방');
insert into amenity values(4,'에어컨');
insert into amenity values(5,'세탁기');
insert into amenity values(6,'건조기');
insert into amenity values(7,'무선인터넷');
insert into amenity values(8,'아침식사');
insert into amenity values(9,'실내벽난로');
insert into amenity values(10,'옷걸이');
insert into amenity values(11,'다리미');
insert into amenity values(12,'헤어 드라이기');
insert into amenity values(13,'TV');
insert into amenity values(14,'아기 침대');
insert into amenity values(15,'유아용 식탁');
insert into amenity values(16,'셀프 체크인');
insert into amenity values(17,'화재 경보기');
insert into amenity values(18,'해변과 인접');
insert into amenity values(19,'욕실 단독 사용');

-- 시설
insert into facility values(1,'건물 내 주차');
insert into facility values(2,'자쿠지');
insert into facility values(3,'개인 바베큐');
insert into facility values(4,'헬스장');
insert into facility values(5,'수영장');

-- 건물 유형
insert into build_type values (1,'주택');
insert into build_type values (2,'글램핑');
insert into build_type values (3,'게스트 하우스');
insert into build_type values (4,'펜션');
insert into build_type values (5,'복층');
insert into build_type values (6,'호텔');
insert into build_type values (7,'B&B');
insert into build_type values (8,'리조트');

--이용 규칙
insert into rule values (1,'흡연가능');
insert into rule values (2,'반려동물 입실 가능');


-- 방 유형
INSERT INTO ROOM_TYPE VALUES(1, '개인실');
INSERT INTO ROOM_TYPE VALUES(2, '다인실');
INSERT INTO ROOM_TYPE VALUES(3, '집 전체');

-- 숙소
insert into room values (1, 'admin', 'jejuhouse', 'welcome to jejuHouse', '제주시 서귀포', '3','12시', '4시', '5', '3','2', default,default,default,default,'ggg', 'N', '2','0', default, default);
insert into room values (2, 'user01', 'ShillaHotel', 'welcome to ShillaHotel', '제주공항', '2','11시', '2시', '2', '2','1', default,default,default,default,'ggg', 'N', '2','5000', default, default);
insert into room values (3, 'user02', 'LotteHotel', 'welcome to LotteHotel', '제주시 제주도', '8','11시', '3시', '2', '2','1', default,default,default,default,'ggg', 'N', '2','10000', default, default);

-- 숙소 사진
insert into room_file values (1,'22.jpg','33.jpg',1);
insert into room_file values (2,'shilla.jpg','shilla2.jpg',1);
insert into room_file values (3,'lotte.jpg','lotte2.jpg',1);


-- 숙소리뷰
insert into review values (1,'9','8','8','good Service', default, default, default, 1, 'admin');
insert into review values (2,'8','8','9','clean room', default, default, default, 1, 'admin');
insert into review values (3,'1','9','9','nice customer service', default, default, default, 1, 'admin');

--예약내용
insert into reservation values(1, '2', null, null, '2020-09-01', '2020-09-02', 1, 'user01');
insert into reservation values(1, '3', null, '2', '2020-09-04', '2020-09-06', 2, 'user02');


