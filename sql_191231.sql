CREATE TABLE authors (
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`address` VARCHAR(50) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


#CRUD(insert into, select,update,delete ) 문 사용
INSERT INTO authors(NAME,address) VALUES("대한이","서울시");
INSERT INTO authors(NAME,address) VALUES("민국이","대전시");
INSERT INTO authors(NAME,address) VALUES("만세","충주시");

#변수 2개 (name,address) , 한 행이 record
#데이터베이스(외부 접속 단위 ), 테이블 , 필드(변수 이름) , 레코드
#* : 모두다

#명령어는 대소문자를 구분하지않지만, ""내부는 대소문자 구분 

SELECT * FROM authors ; 
SELECT * FROM authors WHERE NAME = "대한이";  # db에서는 =를 하나만 사용 (같다의 의미로 )
SELECT address FROM authors WHERE NAME = "만세";


UPDATE authors SET NAME = "대한민국" WHERE NAME = "대한이";




#결과보기 
SELECT * FROM authors ; 

DELETE FROM authors WHERE NAME = "만세";
SELECT * FROM authors ; 


#문제 3인분 성적을 STUDENTS 테이블에 입력하고 출력해보시오 
# 이름 국어 영어 수학 총점 평균 
#대한이, 90 ,90 ,90
#민국이, 80,80,81
#만세, 100,100,100



CREATE TABLE `students` (
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`kor` INT(11) NULL DEFAULT NULL,
	`eng` INT(11) NULL DEFAULT NULL,
	`math` INT(11) NULL DEFAULT NULL,
	`total` INT(11) NULL DEFAULT NULL,
	`avr` INT(11) NULL DEFAULT NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


INSERT INTO students (NAME,kor,eng,math) VALUES ('대한이',90,90,90);
INSERT INTO students (NAME,kor,eng,math) VALUES ('민국이',80,80,81);
INSERT INTO students (NAME,kor,eng,math) VALUES ('만세',100,100,100);

SELECT * FROM students;

UPDATE students 대한이  SET total = kor+eng+math  WHERE total = "대한이";