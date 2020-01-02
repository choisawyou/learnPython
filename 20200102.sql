-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.4.11-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- jeju 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jeju` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `jeju`;

-- 테이블 jeju.authors 구조 내보내기
CREATE TABLE IF NOT EXISTS `authors` (
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.authors:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` (`name`, `address`) VALUES
	('대한민국', '서울시'),
	('민국이', '대전시');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- 테이블 jeju.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `code` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `su` int(11) DEFAULT NULL,
  `dan` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='primary key : 중복이 불가능, 외부에서 참조가 가능한 키 ';

-- 테이블 데이터 jeju.goods:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`code`, `name`, `su`, `dan`) VALUES
	(1, '냉장고', 2, 850000),
	(2, '세탁기', 3, 550000),
	(3, '전자레인지', 2, 350000),
	(4, 'HDTV', 3, 1500000),
	(5, '드론', 1, 100000);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 jeju.school 구조 내보내기
CREATE TABLE IF NOT EXISTS `school` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `schoolname` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `schoolcode` char(10) NOT NULL,
  `studentcount` int(11) DEFAULT NULL,
  PRIMARY KEY (`schoolcode`),
  KEY `no` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.school:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`no`, `schoolname`, `address`, `schoolcode`, `studentcount`) VALUES
	(1, '충주여자고등학교', '충주시', 'CH00000001', 300),
	(2, '신성여자고등학교', '제주시', 'IC00000001', 560),
	(3, '종로여자고등학교', '종로구', 'JR00000001', 300),
	(4, '제주여자고등학교', '서울시', 'SE00000001', 300);
/*!40000 ALTER TABLE `school` ENABLE KEYS */;

-- 테이블 jeju.shoplist 구조 내보내기
CREATE TABLE IF NOT EXISTS `shoplist` (
  `num` int(11) NOT NULL,
  `id` varchar(10) NOT NULL,
  `product` varchar(30) DEFAULT NULL,
  `group` varchar(30) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `id` (`id`),
  CONSTRAINT `FK_shoplist_user` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.shoplist:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `shoplist` DISABLE KEYS */;
INSERT INTO `shoplist` (`num`, `id`, `product`, `group`, `price`, `amount`) VALUES
	(1, 'KBS', '운동화', '전자', 30, 2),
	(2, 'KBS', '노트북', '전자', 1000, 1),
	(3, 'JYP', '모니터', '전자', 200, 1),
	(4, 'BBK', '모니터', '전자', 200, 5),
	(5, 'KBS', '청바지', '의류', 50, 3),
	(6, 'BBK', '메모리', '전자', 80, 10),
	(7, 'SSK', '책', '서적', 15, 5),
	(8, 'EJW', '책', '서적', 15, 2),
	(9, 'EJW', '청바지', '의류', 50, 1),
	(10, 'BBK', '운동화', '전자', 30, 2),
	(11, 'EJW', '책', '서적', 15, 1),
	(12, 'BBK', '운동화', '서적', 30, 2);
/*!40000 ALTER TABLE `shoplist` ENABLE KEYS */;

-- 테이블 jeju.student 구조 내보내기
CREATE TABLE IF NOT EXISTS `student` (
  `bunho` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `kor` tinyint(4) DEFAULT NULL,
  `mat` tinyint(4) DEFAULT NULL,
  `eng` tinyint(4) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `average` float DEFAULT NULL,
  `grade` char(2) DEFAULT NULL,
  `schoolcode` char(10) DEFAULT NULL,
  PRIMARY KEY (`bunho`),
  KEY `schoolcode` (`schoolcode`),
  CONSTRAINT `FK__school` FOREIGN KEY (`schoolcode`) REFERENCES `school` (`schoolcode`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.student:~20 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`bunho`, `name`, `kor`, `mat`, `eng`, `total`, `average`, `grade`, `schoolcode`) VALUES
	(1, '전공인', 85, 86, 95, 266, 88.67, 'B', 'SE00000001'),
	(2, '전공이', 86, 86, 86, 258, 86, 'B', 'SE00000001'),
	(3, '전공삼', 96, 105, 105, 306, 102, 'A', 'CH00000001'),
	(4, '전공사', 105, 105, 105, 315, 105, 'A', 'SE00000001'),
	(5, '고려인', 105, 105, 105, 315, 105, 'A', 'CH00000001'),
	(6, '종로구', 105, 86, 76, 267, 89, 'B', 'IC00000001'),
	(7, '종로구', 105, 86, 76, 267, 89, 'B', 'IC00000001'),
	(8, '김만덕', 105, 86, 76, 267, 89, 'B', 'IC00000001'),
	(9, '전공인', 85, 86, 95, 266, 88.67, 'B', 'SE00000001'),
	(10, '전공이', 86, 86, 86, 258, 86, 'B', 'SE00000001'),
	(11, '전공삼', 96, 105, 105, 306, 102, 'A', 'CH00000001'),
	(12, '전공사', 105, 105, 105, 315, 105, 'A', 'SE00000001'),
	(13, '고려인', 105, 105, 105, 315, 105, 'A', 'CH00000001'),
	(14, '종로구', 105, 86, 76, 267, 89, 'B', 'IC00000001'),
	(15, '종로구', 105, 86, 76, 267, 89, 'B', 'IC00000001'),
	(16, '김만덕', 105, 86, 76, 267, 89, 'B', 'IC00000001'),
	(17, '제주민', 105, 105, 105, 315, 105, 'A', 'IC00000001'),
	(18, '제주민', 105, 105, 105, 315, 105, 'A', 'IC00000001'),
	(19, '제주민', 105, 105, 105, 315, 105, 'A', 'IC00000001'),
	(21, '제주민', 105, 105, 105, 315, 105, 'A', 'IC00000001');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- 테이블 jeju.student2 구조 내보내기
CREATE TABLE IF NOT EXISTS `student2` (
  `num` int(11) NOT NULL,
  `name` varchar(12) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `addr` varchar(15) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.student2:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `student2` DISABLE KEYS */;
INSERT INTO `student2` (`num`, `name`, `sex`, `age`, `major`, `addr`, `tel`, `money`) VALUES
	(20120001, '고길동', 'm', 27, '선박', 'seoul', '-4502', 5000),
	(20120003, '도우너', 'w', 15, '역사', 'daegu', '-6100', 6500),
	(20120004, '김만덕', 'w', 35, '유아', 'mokpo', '-8322', 7000),
	(20120005, '류현진', 'm', 22, '컴퓨터공학', 'seoul', '-2334', 8000),
	(20120006, '손흥민', 'm', 22, '컴퓨터공학', 'seoul', '-10988', 8000),
	(20122002, '최둘리', 'm', 22, '역사', 'pusan', '-10988', 4500);
/*!40000 ALTER TABLE `student2` ENABLE KEYS */;

-- 테이블 jeju.students 구조 내보내기
CREATE TABLE IF NOT EXISTS `students` (
  `name` varchar(50) DEFAULT NULL,
  `kor` int(11) DEFAULT NULL,
  `eng` int(11) DEFAULT NULL,
  `math` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `avr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.students:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`name`, `kor`, `eng`, `math`, `total`, `avr`) VALUES
	('대한이', 90, 90, 90, NULL, NULL),
	('민국이', 80, 80, 81, NULL, NULL),
	('만세', 100, 100, 100, NULL, NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

-- 프로시저 jeju.student_insert 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_insert`(
	IN `name` VARCHAR(50),
	IN `kor` INT,
	IN `mat` INT,
	IN `eng` INT,
	IN `schoolcode` CHAR(10),
	OUT `result` INT
)
BEGIN
  DECLARE exit handler for SQLEXCEPTION  #나갈때 작동하는  HANDLER
  BEGIN
  ROLLBACK; #commit , savepoint
  SET RESULT = -1;  #이 값을 기준으로  error 여부 확인 
 END;
START TRANSACTION;
   INSERT INTO student(name,kor,mat,eng,schoolcode)
   VALUE(name,kor,mat,eng,schoolcode);
COMMIT; #위에서 error가 없으면 commit
SET RESULT = 0;   #0 이면 정상, -1은 error
END//
DELIMITER ;

-- 프로시저 jeju.student_select 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_select`()
BEGIN
   SELECT * FROM STUDENT ;
END//
DELIMITER ;

-- 프로시저 jeju.student_sum 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_sum`()
BEGIN
  DROP TABLE IF EXISTS sungjuk_hab;  #로딩할 때 자주 사용 #밑에서 만들거니까 있다면 지워라 
  CREATE TABLE sungjuk_hab(korhab float,mathab float, enghab float) AS
  SELECT SUM(kor) as korhab, SUM(mat) as mathab,
  sum(eng) as enghab from student;
  insert into sungjuk_hab(korhab,mathab,enghab)
    select round(avg(kor),2) , round(avg(mat),2), round(avg(eng),2)
    from student;
	 select * from sungjuk_hab;
 END//
DELIMITER ;

-- 프로시저 jeju.student_updatename 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_updatename`(
	IN `name1` VARCHAR(50),
	IN `name2` VARCHAR(50),
	IN `result` INT
)
BEGIN

  DECLARE cnt int default 0; #cnt 라는 변수를 만들고 디폴트 0 
  select count(*) into cnt from student where name = name1;
  
  if cnt>0 then 
 
   update student set name = name2 where name = name1;
   SET result = 0;
	  
  else set result = -1;
  end if ;
  
END//
DELIMITER ;

-- 프로시저 jeju.student_updateone 구조 내보내기
DELIMITER //
CREATE PROCEDURE `student_updateone`()
BEGIN  #모든데이터에 1점씩 추가  #데이터를 가져와서 가공한 뒤 다시 넣기 
 #무한루프의 종료 조건 
  DECLARE _done INT DEFAULT FALSE; #각데이터를 하나씩 처리 
  DECLARE name_var VARCHAR(20);    #하나의 데이터를 처리하기 위한 변수 
  DECLARE kor_var INT; #
  DECLARE mat_var INT;
  DECLARE eng_var INT;
  
  DECLARE CURSOR_STUDENT CURSOR FOR SELECT name,kor,mat,eng  #cursor : student에 있는 데이터를 순서대로 가르키는 위치 
             FROM student;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET _done = TRUE;  #not found 할 때 true 값 -> 종료 
  OPEN CURSOR_STUDENT;
 REPEAT
  FETCH CURSOR_STUDENT INTO name_var, kor_var,mat_var,eng_var; #FETCH :데이터를 하나씩 가져오기 
  IF NOT _done THEN #거짓을 부정
 		UPDATE student SET kor = kor_var+1, mat= mat_var+1, eng=eng_var +1
    			WHERE name = name_var;
    	SET _done = FALSE;  #종료조건 : true가 될 때까지 무한루프 
    END IF;
  UNTIL _done
  END REPEAT;
  CLOSE CURSOR_STUDENT;
END//
DELIMITER ;

-- 테이블 jeju.sungjuk_hab 구조 내보내기
CREATE TABLE IF NOT EXISTS `sungjuk_hab` (
  `korhab` float DEFAULT NULL,
  `mathab` float DEFAULT NULL,
  `enghab` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.sungjuk_hab:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sungjuk_hab` DISABLE KEYS */;
INSERT INTO `sungjuk_hab` (`korhab`, `mathab`, `enghab`) VALUES
	(1904, 1810, 1768),
	(95.2, 90.5, 88.4);
/*!40000 ALTER TABLE `sungjuk_hab` ENABLE KEYS */;

-- 테이블 jeju.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `addr` char(20) DEFAULT NULL,
  `mobile1` varchar(20) DEFAULT NULL,
  `mobile2` varchar(20) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `mdate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jeju.user:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `year`, `addr`, `mobile1`, `mobile2`, `height`, `mdate`) VALUES
	('BBK', '바비킴', 1973, '서울', '010', '0', 176, '2013-05-05'),
	('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-03-03'),
	('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10'),
	('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-04-04'),
	('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-04-04'),
	('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-07-07'),
	('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-09-09'),
	('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-08-08'),
	('SSK', '성시경', 1979, '서울', NULL, NULL, 186, '2013-12-12'),
	('YJS', '윤종신', 1969, '경남', NULL, NULL, 170, '2005-05-05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 트리거 jeju.student_before_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_insert` BEFORE INSERT ON `student` FOR EACH ROW BEGIN  -- OLD : 입력된 값, NEW 새롭게 만들어질 데이터 , SET :데이터 불러올때 
  set NEW.total = NEW.kor + NEW.mat + NEW.eng;
  set NEW.average = round(NEW.total/3,2);
  
  IF NEW.average >= 90 THEN SET NEW.grade ='A';
  ELSEIF NEW.average >=80 THEN SET NEW.grade = 'B';
  ELSEIF NEW.average >=70 THEN SET NEW.grade = 'C';
  ELSEIF NEW.average >=60 THEN SET NEW.grade = 'D';
  ELSE SET NEW.grade = 'F';
  END IF;  
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- 트리거 jeju.student_before_update 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `student_before_update` BEFORE UPDATE ON `student` FOR EACH ROW BEGIN
  set NEW.total = NEW.kor + NEW.mat + NEW.eng;
  set NEW.average = round(NEW.total/3,2);
  
  IF NEW.average >= 90 THEN SET NEW.grade ='A';
  ELSEIF NEW.average >=80 THEN SET NEW.grade = 'B';
  ELSEIF NEW.average >=70 THEN SET NEW.grade = 'C';
  ELSEIF NEW.average >=60 THEN SET NEW.grade = 'D';
  ELSE SET NEW.grade = 'F';
  END IF;  

END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
