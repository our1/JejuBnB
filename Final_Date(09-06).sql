-- ȸ��
INSERT INTO MEMBER
VALUES ('admin', 'admin', '������', '00/00/00','010-1234-5678', default, default, default);
INSERT INTO MEMBER
VALUES ('user01', 'pass01', 'ȫ�浿', '95/12/12','010-1111-2222', default, default, default);
INSERT INTO MEMBER
VALUES ('user02', 'pass02', '�̼���', '98/05/23','010-3333-4444', default, default, default);

-- ������ ī�װ�
INSERT INTO TOUR_CATEGORY
VALUES (1, '�ڿ�');
INSERT INTO TOUR_CATEGORY
VALUES (2, '����');
INSERT INTO TOUR_CATEGORY
VALUES (3, '��Ƽ��Ƽ');

-- ������
INSERT INTO TOUR
VALUES (1, '�쵵', '�쵵�Դϴ�', SYSDATE, '�쵵�Դϴ�', NULL, NULL, '�쵵.jpg','20200905011910.jpg', DEFAULT, 1, 'user01');
INSERT INTO TOUR
VALUES (2, '�ؼ�����', '�Ѷ���Դϴ�', SYSDATE, '���ֵ� �������� ���͵�', NULL, NULL, '�Ѷ��.PNG', NULL, DEFAULT, 1, 'user02');
INSERT INTO TOUR
VALUES (3, '���������', '����������Դϴ�', SYSDATE, '��������', NULL, NULL, '���������.JPG', NULL, DEFAULT, 1, 'admin');
INSERT INTO TOUR
VALUES (4, '������', '������ / ��� / ���� �ѽ� �Ĵ��Դϴ�', SYSDATE, '���� ���ֽ� ��õ�� ���긮 1829-11', NULL, NULL, '������.JPG', NULL, DEFAULT, 2, 'user02');
INSERT INTO TOUR
VALUES (5, '����', '	�ػ깰 �丮 �Ĵ��Դϴ�', SYSDATE, ' ���� ���ֽ� ������ ������ 667-1', NULL, NULL, '����.JPG', NULL, DEFAULT, 2, 'user01');
INSERT INTO TOUR
VALUES (6, '���������Ŀ��', '����Ŀ�� �Դϴ�', SYSDATE ,'���� ���ֽ� ��õ�� �Դ��� 270-1', NULL, NULL, '����Ŀ��.JPG', NULL, DEFAULT, 2, 'user01');
INSERT INTO TOUR
VALUES (7, 'Ŀ�� ������ Ŭ����', 'Ŀ�Ǹ�����Դϴ�', SYSDATE ,'�ֿ���, ���ֽ�', '2020/09/05', '2020/09/25', 'Ŀ��.JPG', NULL, DEFAULT, 3, 'user01');
INSERT INTO TOUR
VALUES (8, '���ֵ� ���� ����� �߰� �����Կ�', '�����Կ� �Դϴ�', SYSDATE ,'����ϵ�, ���ֽ�', '2020/10/1', '2020/11/25', '?���?.JPG', NULL, DEFAULT, 3, 'user02');
INSERT INTO TOUR
VALUES (9, '���� ���� ����ī�� �Բ� �ϴ� ���� ü��', '����īü���Դϴ�', SYSDATE ,'�ֿ���, ���ֽ�', '2020/05/15', '2020/07/20', '����ī.JPG', NULL, DEFAULT, 3, 'admin');

-- ������ �̹���
INSERT INTO TOUR_IMAGE
VALUES (1, '�쵵.jpg', NULL, 1);
INSERT INTO TOUR_IMAGE
VALUES (2, 'õ��������.PNG', NULL, 1);
INSERT INTO TOUR_IMAGE
VALUES (3, '���������.JPG', NULL, 1);
INSERT INTO TOUR_IMAGE
VALUES (4, '������.JPG', NULL, 2);
INSERT INTO TOUR_IMAGE
VALUES (5, '����.JPG', NULL, 2);
INSERT INTO TOUR_IMAGE
VALUES (6, '����Ŀ��.JPG', NULL, 2);
INSERT INTO TOUR_IMAGE
VALUES (7, 'Ŀ��.JPG', NULL, 3);
INSERT INTO TOUR_IMAGE
VALUES (8, '����.JPG', NULL, 3);
INSERT INTO TOUR_IMAGE
VALUES (9, '����ī.JPG', NULL, 3);

-- ������ ���� 
INSERT INTO TOUR_REVIEW
VALUES (1, '���� ���Ҿ��', SYSDATE, 4.5 , 1, 'user01');
INSERT INTO TOUR_REVIEW
VALUES (2, '���� ���־��', SYSDATE, 4.9 , 2, 'user02');
INSERT INTO TOUR_REVIEW
VALUES (3, '���� ��վ����', SYSDATE, 4.8 , 3, 'user01');

-- ���� ���� ���� Ÿ��
insert into faq_type
values ( 1, '����');
-- ���� ���� ����
insert into faq
values (1, '���� ����', '������ ī������ �Ͻø� �˴ϴ�.', 1);


-- ���� �ü�
insert into amenity values(1,'�ֹ�');
insert into amenity values(2,'��Ǫ');
insert into amenity values(3,'����');
insert into amenity values(4,'������');
insert into amenity values(5,'��Ź��');
insert into amenity values(6,'������');
insert into amenity values(7,'�������ͳ�');
insert into amenity values(8,'��ħ�Ļ�');
insert into amenity values(9,'�ǳ�������');
insert into amenity values(10,'�ʰ���');
insert into amenity values(11,'�ٸ���');
insert into amenity values(12,'��� ����̱�');
insert into amenity values(13,'TV');
insert into amenity values(14,'�Ʊ� ħ��');
insert into amenity values(15,'���ƿ� ��Ź');
insert into amenity values(16,'���� üũ��');
insert into amenity values(17,'ȭ�� �溸��');
insert into amenity values(18,'�غ��� ����');
insert into amenity values(19,'��� �ܵ� ���');

-- �ü�
insert into facility values(1,'�ǹ� �� ����');
insert into facility values(2,'������');
insert into facility values(3,'���� �ٺ�ť');
insert into facility values(4,'�ｺ��');
insert into facility values(5,'������');

-- �ǹ� ����
insert into build_type values (1,'����');
insert into build_type values (2,'�۷���');
insert into build_type values (3,'�Խ�Ʈ �Ͽ콺');
insert into build_type values (4,'���');
insert into build_type values (5,'����');
insert into build_type values (6,'ȣ��');
insert into build_type values (7,'B&B');
insert into build_type values (8,'����Ʈ');

--�̿� ��Ģ
insert into rule values (1,'������');
insert into rule values (2,'�ݷ����� �Խ� ����');


-- �� ����
INSERT INTO ROOM_TYPE VALUES(1, '���ν�');
INSERT INTO ROOM_TYPE VALUES(2, '���ν�');
INSERT INTO ROOM_TYPE VALUES(3, '�� ��ü');

-- ����
insert into room values (1, 'admin', 'jejuhouse', 'welcome to jejuHouse', '���ֽ� ������', '3','12��', '4��', '5', '3','2', default,default,default,default,'ggg', 'N', '2','0', default, default);
insert into room values (2, 'user01', 'ShillaHotel', 'welcome to ShillaHotel', '���ְ���', '2','11��', '2��', '2', '2','1', default,default,default,default,'ggg', 'N', '2','5000', default, default);
insert into room values (3, 'user02', 'LotteHotel', 'welcome to LotteHotel', '���ֽ� ���ֵ�', '8','11��', '3��', '2', '2','1', default,default,default,default,'ggg', 'N', '2','10000', default, default);

-- ���� ����
insert into room_file values (1,'22.jpg','33.jpg',1);
insert into room_file values (2,'shilla.jpg','shilla2.jpg',1);
insert into room_file values (3,'lotte.jpg','lotte2.jpg',1);


-- ���Ҹ���
insert into review values (1,'9','8','8','good Service', default, default, default, 1, 'admin');
insert into review values (2,'8','8','9','clean room', default, default, default, 1, 'admin');
insert into review values (3,'1','9','9','nice customer service', default, default, default, 1, 'admin');

--���೻��
insert into reservation values(1, '2', null, null, '2020-09-01', '2020-09-02', 1, 'user01');
insert into reservation values(1, '3', null, '2', '2020-09-04', '2020-09-06', 2, 'user02');


