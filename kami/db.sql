DROP TABLE  hair;
DROP TABLE reservation;
DROP TABLE  procedureInformation;
DROP TABLE  procedure;
DROP TABLE  Refund;
DROP TABLE  payment;
DROP TABLE  Orders;
DROP TABLE  Product;
DROP TABLE  productkind;
DROP TABLE  schedule;
DROP TABLE  offSchedule;
DROP TABLE  notice;
DROP TABLE  supply;
DROP TABLE  chat;
DROP TABLE career;
DROP TABLE  review;
DROP TABLE  board;
DROP TABLE member;
DROP TABLE employee;
DROP TABLE position;
DROP TABLE IDinfo;

CREATE TABLE  employee  (
    positionseq    number      NOT NULL,
    emp_id    varchar2(30)      NOT NULL,
    emp_hiredate    date      NULL,
    emp_firedate    date      NULL,
    emp_flag    VARCHAR(255)      not null
);

CREATE TABLE  position  (
    positionSeq    number      NOT NULL,
    position    varchar2(10)      NULL,
    salary    number      NULL
);

CREATE TABLE  career  (
    careeaseq    number      NOT NULL,
    emp_id    varchar2(30)      NOT NULL,
    care_date    date      NULL,
    care_content    varchar2(2000)      NULL
);

CREATE TABLE  reservation  (
    reservationseq    number      NOT NULL,
    emp_id    varchar2(30)      NOT NULL,
    mem_id    varchar2(30)      NOT NULL,
    paymentNum    varchar2(100)      NOT NULL,
    rsv_date    date      not NULL,
    rsv_time    varchar2(10)      not NULL,
    rsv_totalPrice number  null
);

CREATE TABLE  chat  (
    chatseq    number      NOT NULL,
    mem_id    varchar2(30)      NOT NULL,
    chat_content    varchar2(2000)      NULL,
    chat_date    date      NULL
);

CREATE TABLE  board  (
    boardseq    number      NOT NULL,
    id    varchar2(30)      NOT NULL,
    brd_title    varchar2(200)      NULL,
    brd_content    varchar2(2000)      NULL,
    brd_date    date      NULL,
    brd_savfile    date      NULL,
     brd_orgfile    varchar2(2000)  null
);

CREATE TABLE  member  (
    mem_id    varchar2(30)      NOT NULL,
    mem_money    number      NULL,
    mem_registDate    date   not NULL,
    mem_flag    number      NULL
);

CREATE TABLE  supply  (
    supplyseq    number      NOT NULL,
    emp_id    varchar2(30)      NOT NULL,
    sup_name    varchar2(30)      NULL,
    sup_amount    number      NULL,
    sup_content    varchar2(2000)      NULL
);

CREATE TABLE  Product  (
    productseq    number      NOT NULL,
    kindseq    number      NOT NULL,
    prd_name    varchar2(50)      not NULL,
    prd_price1    number      NULL,
    prd_price2    number      not NULL,
    prd_content    varchar2(2000)      NULL,
    prd_savfile    date      NULL,
     prd_ognfile    varchar2(2000)      null,
    prd_quantity    number      NULL,
    prd_indate    date      NULL
);

CREATE TABLE  Orders  (
    billseq    number      NOT NULL,
    productseq    number      NOT NULL,
    mem_id    varchar2(30)      NOT NULL,
    ord_amount    number      NULL,
    ord_date    date      NULL,
    ord_quantity    number      NULL,
    ord_status    varchar2(30)      NULL
);

CREATE TABLE  hair  (
    Key    number      NOT NULL,
    Field    varchar2(200)      NULL,
    Field2    varchar2(50)      NULL
);

CREATE TABLE  procedure  (
    procedureseq    number      NOT NULL,
    colorseq    number      NULL,
    pcd_name    varchar2(200)      NULL,
    pcd_time    varchar2(10)      NULL,
    pcd_price    varchar2(30)      NULL,
    pcd_content    varchar2(300)      NULL,
     pcd_savfile    date  null,
     pcd_orgfile    varchar2(2000)  null
);

CREATE TABLE  notice  (
    noticeseq    number      NOT NULL,
    emp_id    varchar2(30)      NOT NULL,
    ntc_title    varchar2(200)      NULL,
    ntc_content    varchar2(2000)      NULL,
    ntc_date    date      NULL,
    ntc_savfile    date      NULL,
     ntc_orgfile    varchar2(2000)      NULL
);

CREATE TABLE  review  (
    reveiwseq    number      NOT NULL,
    boardseq    number      NOT NULL,
    id    varchar2(30)      NOT NULL,
    rvw_content    varchar2(500)      NULL,
    rvw_date    date      NULL
);

CREATE TABLE  procedureInformation  (
    proinfoseq    number      NOT NULL,
    procedureseq    number      NOT NULL,
    reservationseq number  not null
);

CREATE TABLE  payment  (
    paymentNum    varchar2(100)      NOT NULL,
    billseq    number      NOT NULL,
    pay_resultcode    varchar2(10)      NULL,
    pay_isSucess    varchar2(2)      NULL,
    pay_meansOfPayment    varchar2(60)      NULL,
    pay_totalprice    varchar2(13)      NULL,
    pay_ordernum    varchar2(60)      NULL,
    pay_indate    date      NULL,
    pay_eventcode    varchar2(60)      NULL,
    pay_cardnum    varchar2(60)      NULL,
    pay_installment    number(3)      NULL,
    pay_ispointuse    varchar2(1)      NULL,
    pay_cardtype    varchar2(60)      NULL,
    pay_cardcompany    varchar2(60)      NULL
);

CREATE TABLE  offSchedule  (
    off_scheduleseq    number      NOT NULL,
    emp_id    varchar2(30)      NOT NULL,
    off_startdate    date      NULL,
    off_enddate    date      NULL,
    off_check    varchar2(20)      DEFAULT '미승인'
);

CREATE TABLE  schedule  (
    schedulseq    number      NOT NULL,
    emp_id    varchar2(30)      NOT NULL,
    sch_dayOfWeek    varchar2(100)      NULL,
    sch_startdate    date      NULL,
    sch_enddate    date      NULL
);

CREATE TABLE  Refund  (
    CSHR_CancelNum    varchar2(60)      NOT NULL,
    paymentNum    varchar2(100)      NOT NULL,
    ref_issucess    varchar2(2)      NULL,
    ref_resultmsg    varchar2(300)      NULL,
    ref_resultcode    varchar2(10)      NULL,
    ref_totalprice    varchar2(13)      NULL
);

CREATE TABLE  productkind  (
    kindseq    number      NOT NULL,
    productkind    varchar2(20)      NULL
);

CREATE TABLE  IDinfo  (
    id    varchar2(30)      NOT NULL,
    pw    varchar2(30)   not NULL,
     name   varchar2(50)    not null,
     birthday date  not null,
     gender varchar2(10) not null,
     email varchar2(200) null,
     phone  varchar2(100)  not null,
     address varchar2(200)  not null,
    type    number   not NULL
);

ALTER TABLE  employee  ADD CONSTRAINT  PK_EMPLOYEE  PRIMARY KEY (
    emp_id 
);

ALTER TABLE  position  ADD CONSTRAINT  PK_POSITION  PRIMARY KEY (
    positionSeq 
);

ALTER TABLE  career  ADD CONSTRAINT  PK_CAREER  PRIMARY KEY (
    careeaseq
);

ALTER TABLE  reservation  ADD CONSTRAINT  PK_RESERVATION  PRIMARY KEY (
    reservationseq 
);

ALTER TABLE  chat  ADD CONSTRAINT  PK_CHAT  PRIMARY KEY (
    chatseq
);

ALTER TABLE  board  ADD CONSTRAINT  PK_BOARD  PRIMARY KEY (
    boardseq
);

ALTER TABLE  member  ADD CONSTRAINT  PK_MEMBER  UNIQUE (
    mem_id 
);

ALTER TABLE  supply  ADD CONSTRAINT  PK_SUPPLY  PRIMARY KEY (
    supplyseq
);

ALTER TABLE  Product  ADD CONSTRAINT  PK_PRODUCT  PRIMARY KEY (
    productseq
);

ALTER TABLE  Orders  ADD CONSTRAINT  PK_ORDERS  PRIMARY KEY (
    billseq
);

ALTER TABLE  hair  ADD CONSTRAINT  PK_HAIR  PRIMARY KEY (
    Key 
);

ALTER TABLE  procedure  ADD CONSTRAINT  PK_PROCEDURE  PRIMARY KEY (
    procedureseq
);

ALTER TABLE  notice  ADD CONSTRAINT  PK_NOTICE  PRIMARY KEY (
    noticeseq
);

ALTER TABLE  review  ADD CONSTRAINT  PK_REVIEW  PRIMARY KEY (
    reveiwseq
);

ALTER TABLE  procedureInformation  ADD CONSTRAINT  PK_PROCEDUREINFORMATION  PRIMARY KEY (
    proinfoseq
);

ALTER TABLE  payment  ADD CONSTRAINT  PK_PAYMENT  PRIMARY KEY (
    paymentNum
);

ALTER TABLE  offSchedule  ADD CONSTRAINT  PK_OFFSCHEDULE  PRIMARY KEY (
    off_scheduleseq
);

ALTER TABLE  schedule  ADD CONSTRAINT  PK_SCHEDULE  PRIMARY KEY (
    schedulseq
);

ALTER TABLE  Refund  ADD CONSTRAINT  PK_REFUND  PRIMARY KEY (
    CSHR_CancelNum
);

ALTER TABLE  productkind  ADD CONSTRAINT  PK_PRODUCTKIND  PRIMARY KEY (
    kindseq 
);

ALTER TABLE  IDinfo  ADD CONSTRAINT  PK_IDINFO  PRIMARY KEY (
    id 
);

ALTER TABLE  employee  ADD CONSTRAINT  FK_position_TO_employee_1  FOREIGN KEY (
    positionseq 
)
REFERENCES  position  (
    positionSeq 
);

ALTER TABLE  employee  ADD CONSTRAINT  FK_IDinfo_TO_employee_1  FOREIGN KEY (
    emp_id 
)
REFERENCES  IDinfo  (
    id 
);

ALTER TABLE  career  ADD CONSTRAINT  FK_employee_TO_career_1  FOREIGN KEY (
    emp_id 
)
REFERENCES  employee  (
    emp_id 
);

ALTER TABLE  reservation  ADD CONSTRAINT  FK_employee_TO_reservation_1  FOREIGN KEY (
    emp_id 
)
REFERENCES  employee  (
    emp_id 
);

ALTER TABLE  reservation  ADD CONSTRAINT  FK_member_TO_reservation_1  FOREIGN KEY (
    mem_id 
)
REFERENCES  member  (
    mem_id 
);

ALTER TABLE  reservation  ADD CONSTRAINT  FK_payment_TO_reservation_1  FOREIGN KEY (
    paymentNum 
)
REFERENCES  payment  (
    paymentNum 
);

ALTER TABLE  chat  ADD CONSTRAINT  FK_member_TO_chat_1  FOREIGN KEY (
    mem_id 
)
REFERENCES  member  (
    mem_id 
);

ALTER TABLE  board  ADD CONSTRAINT  FK_IDinfo_TO_board_1  FOREIGN KEY (
    id 
)
REFERENCES  IDinfo  (
    id 
);

ALTER TABLE  member  ADD CONSTRAINT  FK_IDinfo_TO_member_1  FOREIGN KEY (
    mem_id 
)
REFERENCES  IDinfo  (
    id 
);

ALTER TABLE  supply  ADD CONSTRAINT  FK_employee_TO_supply_1  FOREIGN KEY (
    emp_id 
)
REFERENCES  employee  (
    emp_id 
);

ALTER TABLE  Product  ADD CONSTRAINT  FK_productkind_TO_Product_1  FOREIGN KEY (
    kindseq 
)
REFERENCES  productkind  (
    kindseq 
);

ALTER TABLE  Orders  ADD CONSTRAINT  FK_Product_TO_Orders_1  FOREIGN KEY (
    productseq 
)
REFERENCES  Product  (
    productseq 
);

ALTER TABLE  Orders  ADD CONSTRAINT  FK_member_TO_Orders_1  FOREIGN KEY (
    mem_id 
)
REFERENCES  member  (
    mem_id 
);

ALTER TABLE  notice  ADD CONSTRAINT  FK_employee_TO_notice_1  FOREIGN KEY (
    emp_id 
)
REFERENCES  employee  (
    emp_id 
);

ALTER TABLE  review  ADD CONSTRAINT  FK_board_TO_review_1  FOREIGN KEY (
    boardseq 
)
REFERENCES  board  (
    boardseq 
);

ALTER TABLE  review  ADD CONSTRAINT  FK_IDinfo_TO_review_1  FOREIGN KEY (
    id 
)
REFERENCES  IDinfo  (
    id 
);

ALTER TABLE  procedureInformation  ADD CONSTRAINT  FK_procedure_TO_PI_1  FOREIGN KEY (
    procedureseq 
)
REFERENCES  procedure  (
    procedureseq 
);

ALTER TABLE  payment  ADD CONSTRAINT  FK_Orders_TO_payment_1  FOREIGN KEY (
    billseq 
)
REFERENCES  Orders  (
    billseq 
);

ALTER TABLE  offSchedule  ADD CONSTRAINT  FK_employee_TO_offSchedule_1  FOREIGN KEY (
    emp_id 
)
REFERENCES  employee  (
    emp_id 
);

ALTER TABLE  schedule  ADD CONSTRAINT  FK_employee_TO_schedule_1  FOREIGN KEY (
    emp_id 
)
REFERENCES  employee  (
    emp_id 
);

ALTER TABLE  Refund  ADD CONSTRAINT  FK_payment_TO_Refund_1  FOREIGN KEY (
    paymentNum 
)
REFERENCES  payment  (
    paymentNum 
);

insert into position(positionSeq,position,salary)values(1,'인턴',140);
insert into position(positionSeq,position,salary)values(2,'초임 디자이너',230);
insert into position(positionSeq,position,salary)values(3,'디자이너',330);
insert into position(positionSeq,position,salary)values(4,'수석 디자이너',480);
insert into position(positionSeq,position,salary)values(5,'원장',550);
insert into position(positionSeq,position,salary)values(6,'매니저',350);
insert into position(positionSeq,position,salary)values(7,'실장',400);
insert into position(positionSeq,position,salary)values(8,'팀장',440);
insert into position(positionSeq,position,salary)values(9,'점장',580);
insert into position(positionSeq,position,salary)values(10,'이사',600);


alter table reservation drop CONSTRAINT FK_payment_TO_reservation_1;

commit;