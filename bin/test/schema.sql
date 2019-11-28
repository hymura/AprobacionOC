  create table IF NOT EXISTS PO_HEADER(
  po_header_id  INT AUTO_INCREMENT PRIMARY KEY,
  approved_date DATETIME ,
  buyer_id      INT NOT NULL,
  creation_date DATETIME,
  order_number  VARCHAR(50),
  status        VARCHAR(150),
  total_amount  INT
);

create table IF NOT EXISTS PO_APPOVER_AMOUNT
(
  user_id             int not null AUTO_INCREMENT PRIMARY KEY,
  appoval_amount_init int not null,
  appoval_amount_end  int not null,
  status              VARCHAR(150),
  user_name           VARCHAR(150)
 );

create table IF NOT EXISTS PO_APPROVAL_ORDER
(
  approval_id  INT AUTO_INCREMENT PRIMARY KEY,
  appoval_amount INT NOT NULL,
  approval_date DATETIME ,
  motivo  VARCHAR(255),
  user_id        INT REFERENCES PO_APPOVER_AMOUNT (user_id),
  po_header_id   INT REFERENCES PO_HEADER(po_header_id)
);


insert into PO_HEADER (APPROVED_DATE, BUYER_ID, CREATION_DATE, ORDER_NUMBER, STATUS, TOTAL_AMOUNT)
values (null, 1, PARSEDATETIME('22-11-2019 13:55:44', 'DD-MM-YYYY hh:mm:ss'), '1', 'REQ_APPROVAL', 300000);

insert into PO_HEADER (APPROVED_DATE, BUYER_ID, CREATION_DATE, ORDER_NUMBER, STATUS, TOTAL_AMOUNT)
values (null, 1, PARSEDATETIME('07-11-2019', 'DD-MM-YYYY'), '2', 'REQ_APPROVAL', 30000);

insert into PO_HEADER (APPROVED_DATE, BUYER_ID, CREATION_DATE, ORDER_NUMBER, STATUS, TOTAL_AMOUNT)
values (null, 1, PARSEDATETIME('07-11-2019', 'DD-MM-YYYY'), '3', 'REQ_APPROVAL', 500000);

insert into PO_HEADER (APPROVED_DATE, BUYER_ID, CREATION_DATE, ORDER_NUMBER, STATUS, TOTAL_AMOUNT)
values (null, 1, PARSEDATETIME('14-11-2019 08:38:00', 'DD-MM-YYYY hh:mm:ss'), '2485', 'REQ_APPROVAL', 1500);


insert into PO_APPOVER_AMOUNT ( APPOVAL_AMOUNT_END, APPOVAL_AMOUNT_INIT, STATUS, USER_NAME)
values (500000, 2000, 'ACTIVO', 'ALEX.GOMEZ');

insert into PO_APPOVER_AMOUNT ( APPOVAL_AMOUNT_END, APPOVAL_AMOUNT_INIT, STATUS, USER_NAME)
values (1000000, 500001, 'ACTIVO', 'KATY.PERRIS');

insert into PO_APPOVER_AMOUNT (APPOVAL_AMOUNT_END, APPOVAL_AMOUNT_INIT, STATUS, USER_NAME)
values (5000000, 1000001, 'ACTIVO', 'AMERICA.EUROPA');

insert into PO_APPOVER_AMOUNT (APPOVAL_AMOUNT_END, APPOVAL_AMOUNT_INIT, STATUS, USER_NAME)
values (10000000, 5000001, 'ACTIVO', 'HYMURA');


insert into PO_APPROVAL_ORDER (APPOVAL_AMOUNT, APPROVAL_DATE, MOTIVO, USER_ID, PO_HEADER_ID)
values (300000, null, null,  1, 1);

insert into PO_APPROVAL_ORDER (APPOVAL_AMOUNT, APPROVAL_DATE, MOTIVO, USER_ID, PO_HEADER_ID)
values (500000, null, null, 3, 3);

insert into PO_APPROVAL_ORDER (APPOVAL_AMOUNT, APPROVAL_DATE, MOTIVO, USER_ID, PO_HEADER_ID)
values (300000, null, 'Enviar para para aprobacion', 1, 2);
