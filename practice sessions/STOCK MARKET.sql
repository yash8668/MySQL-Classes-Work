-- single comment ---
/* 
multi
line 
comment 
*/

create database stockdb;
use stockdb;
-- --------------------------------------- Database Analysis --------------------------------------------
/*
t1: exchange(exchange_id, name, mic, country_code, currency_code, website, established_year, status, contact_email, contact_phone)
t2: company(company_id, name, isin, sector, industry, exchange_id, currency_code, market_cap_usd, status, ticker)
t3: security(security_id, company_id, ticker, security_type, currency_code, listing_date, shares_outstanding, par_value, status, exchange_id)
t4: trader(trader_id, first_name, last_name, user_name, email, country_code, preferred_currency, date_registered, status, risk_limit_usd)
t5: account(account_id, trader_id, account_type, balance_usd, available_usd, margin_enabled, created_date, status, broker_code, account_level)
t6: order_book(order_id, account_id, security_id, order_type, side, quantity, price, time_placed, time_executed, status)
t7: trade(trade_id, order_id, counter_order_id, security_id, quantity, price, executed_time, buyer_account_id, seller_account_id, currency_code)
t8: price_tick(tick_id, security_id, tick_time, bid_price, bid_size, ask_price, ask_size, last_price, last_size, currency_code)
t9: daily_price(dp_id, security_id, trade_date, open, high, low, close, volume, adjusted_close, currency_code)
t10: corporate_action(action_id, security_id, action_type, effective_date, record_date, dividend_amount, split_factor, description, status, currency_code)

*/ 
-- 1 exchange
create table exchange (
  exchange_id int primary key,
  name varchar(100),
  mic  varchar(4),
  country_code char(3),
  currency_code char(3),
  website  varchar(200),
  established_year int,
  status varchar(20),
  contact_email  varchar(100),
  contact_phone  varchar(20)
);
insert into exchange values
  (1,'new york stock exchange','xnys','usa','usd','www.nyse.com',1792,'active','info@nyse.com','2125551234'),
  (2,'nasdaq','xnas','usa','usd','www.nasdaq.com',1971,'active','info@nasdaq.com','2125555678'),
  (3,'london stock exchange','xlse','gbr','gbp','www.lse.co.uk',1801,'active','info@lse.co.uk','02073787900'),
  (4,'bombay stock exchange','xbom','ind','inr','www.bseindia.com',1875,'active','info@bseindia.com','02222721233'),
  (5,'national stock exchange','xnse','ind','inr','www.nseindia.com',1992,'active','info@bseindia.com','02226598100'),
  (6,'tokyo stock exchange','xtky','jpn','jpy','www.jpx.co.jp',1878,'active','info@tse.or.jp','0336661111'),
  (7,'shanghai exchange','xshg','chn','cny','www.sse.com.cn',1990,'active','info@sse.com.cn','02112345678'),
  (8,'hong kong exchange','xhkx','hkg','hkd','www.hkex.com.hk',1891,'active','info@hkex.com.hk','85225223888'),
  (9,'euronext','xeun','bel','eur','www.euronext.com',2000,'active','info@euronext.com','3223550808'),
  (10,'deutsche boerse','xfra','deu','eur','www.deutsche‑boerse.com',1992,'active','info@deutsche‑boerse.com','4969112312');

select * from exchange;
drop table exchange;
truncate table exchange;

-- 2 company
create table company (
  company_id int primary key,
  name  varchar(150),
  isin   varchar(12),
  sector  varchar(50),
  industry  varchar(50),
  exchange_id   int,
  currency_code  char(3),
  market_cap_usd decimal(20,2),
  status  varchar(20),
  ticker varchar(10),
  foreign key (exchange_id) references exchange(exchange_id)
);
insert into company values
  (1,'apple inc','us0378331005','technology','electronics',2,'usd',2600000000000.00,'active','aapl'),
  (2,'microsoft corp','us5949181045','technology','software',2,'usd',2200000000000.00,'active','msft'),
  (3,'alphabet inc','us02079k3059','communication services','internet',2,'usd',1500000000000.00,'active','googl'),
  (4,'reliance industries ltd','ine002a01018','energy','oil and gas',5,'inr',180000000000.00,'active','reliance'),
  (5,'tata consultancy services ltd','ine467b01029','technology','it services',5,'inr',150000000000.00,'active','tcs'),
  (6,'hdfc bank ltd','ine040a01026','financials','banking',5,'inr',120000000000.00,'active','hdfcbank'),
  (7,'toyota motor corp','jp3633400001','consumer discretionary','automobiles',6,'jpy',250000000000000.00,'active','7203'),
  (8,'santander sa','es0113900j37','financials','banking',9,'eur',60000000000.00,'active','san'),
  (9,'bmw ag','de0005190003','consumer discretionary','automobiles',10,'eur',50000000000.00,'active','bmw'),
  (10,'tesla inc','us88160r1014','consumer discretionary','automobiles',2,'usd',800000000000.00,'active','tsla');

select * from company;
drop table company;
truncate table company;

-- 3 security
create table security (
  security_id  int primary key,
  company_id  int,
  ticker  varchar(10),
  security_type varchar(20),
  currency_code  char(3),
  listing_date   date,
  shares_outstanding   int,
  par_value  decimal(10,2),
  status   varchar(20),
  exchange_id   int,
  foreign key (company_id) references company(company_id),
  foreign key (exchange_id) references exchange(exchange_id)
);
insert into security values
  (1,1,'aapl','common stock','usd','1980-12-12',16700000000,0.00001,'active',2),
  (2,2,'msft','common stock','usd','1986-03-13',7590000000,0.00001,'active',2),
  (3,3,'googl','common stock','usd','2004-08‑19',660000000,0.00001,'active',2),
  (4,4,'reliance','common stock','inr','1977-03‑20',1325000000,1.00,'active',5),
  (5,5,'tcs','common stock','inr','2004-08‑25',3180000000,1.00,'active',5),
  (6,6,'hdfcbank','common stock','inr','1995-08‑23',5680000000,1.00,'active',5),
  (7,7,'7203','common stock','jpy','1949-05‑01',3120000000000,50.00,'active',6),
  (8,8,'san','common stock','eur','1999-11‑10',83000000000,1.00,'active',9),
  (9,9,'bmw','common stock','eur','1969‑10‑01',6080000000,1.00,'active',10),
  (10,10,'tsla','common stock','usd','2010‑06‑29',1000000000,0.001,'active',2);

select * from security;
drop table security;
truncate table security;


-- 4 trader
create table trader (
  trader_id  int  primary key,
  first_name  varchar(50),
  last_name  varchar(50),
  user_name  varchar(50),
  email  varchar(100),
  country_code  char(3),
  preferred_currency char(3),
  date_registered  date,
  status  varchar(20),
  risk_limit_usd   decimal(20,2)
);
insert into trader values
  (1,'alice','smith','asmith','alice@example.com','usa','usd','2021-01-10','active',1000000.00),
  (2,'bob','jones','bjones','bob@example.com','usa','usd','2020-05-20','active',500000.00),
  (3,'carla','garcia','cgarcia','carla@example.com','esp','eur','2022-07-15','active',750000.00),
  (4,'dinesh','patel','dpatel','dinesh@example.com','ind','inr','2021-11-01','active',20000000.00),
  (5,'emma','chen','echen','emma@example.com','chn','cny','2020-09-05','active',8000000.00),
  (6,'frank','muller','fmuller','frank@example.com','deu','eur','2023-03-18','active',600000.00),
  (7,'gina','rossi','grossi','gina@example.com','ita','eur','2019-12-12','active',300000.00),
  (8,'haruto','suzuki','hsuzuki','haruto@example.com','jpn','jpy','2022-01-25','active',120000000.00),
  (9,'indra','verma','iverma','indra@example.com','ind','inr','2023-05-30','active',15000000.00),
  (10,'jose','rodriguez','jrodriguez','jose@example.com','mex','mxn','2021-06-10','active',3000000.00);

select * from trader;
drop table trader;
truncate table trader;

-- 5 account
create table account (
  account_id   int  primary key,
  trader_id int,
  account_type varchar(20),
  balance_usd decimal(20,2),
  available_usd decimal(20,2),
  margin_enabled boolean,
  created_date  date,
  status varchar(20),
  broker_code varchar(10),
  account_level varchar(20),
  foreign key (trader_id) references trader(trader_id)
);
insert into account values
  (101,1,'cash',100000.00,95000.00,false,'2021-01-10','active','brk01','silver'),
  (102,2,'margin',200000.00,150000.00,true,'2020-05-20','active','brk02','gold'),
  (103,3,'cash',50000.00,50000.00,false,'2022-07-15','active','brk03','basic'),
  (104,4,'margin',2000000.00,1500000.00,true,'2021-11-01','active','brk04','platinum'),
  (105,5,'cash',80000.00,80000.00,false,'2020-09-05','active','brk05','basic'),
  (106,6,'cash',600000.00,600000.00,false,'2023-03-18','active','brk06','gold'),
  (107,7,'margin',300000.00,250000.00,true,'2019-12-12','active','brk07','gold'),
  (108,8,'cash',120000000.00,119000000.00,false,'2022-01-25','active','brk08','diamond'),
  (109,9,'cash',15000000.00,15000000.00,false,'2023-05-30','active','brk09','basic'),
  (110,10,'margin',3000000.00,2500000.00,true,'2021-06-10','active','brk10','silver');

select * from account;
drop table account;
truncate table account;

-- 6 order_book
create table order_book (
  order_id int primary key,
  account_id int,
  security_id int,
  order_type varchar(20),
  side varchar(4),
  quantity int,
  price decimal(20,4),
  time_placed datetime,
  time_executed datetime,
  status varchar(20),
  foreign key (account_id) references account(account_id),
  foreign key (security_id) references security(security_id)
);
insert into order_book values
  (1001,101,1,'market','buy',100,0.0000,'2025-07-25 09:30:10','2025-07-25 09:30:10','filled'),
  (1002,102,2,'limit','sell',50,320.5000,'2025-07-25 09:35:00','2025-07-25 09:35:05','filled'),
  (1003,103,3,'limit','buy',20,2700.0000,'2025-07-25 09:40:00',null,'open'),
  (1004,104,4,'market','buy',200,0.0000,'2025-07-25 09:45:10','2025-07-25 09:45:10','filled'),
  (1005,105,5,'limit','sell',150,2500.0000,'2025-07-25 09:50:00',null,'open'),
  (1006,106,6,'market','sell',100,0.0000,'2025-07-25 10:00:00','2025-07-25 10:00:00','filled'),
  (1007,107,7,'limit','buy',500,1900.0000,'2025-07-25 10:05:00',null,'open'),
  (1008,108,8,'market','sell',10000,0.0000,'2025-07-25 10:10:00','2025-07-25 10:10:00','filled'),
  (1009,109,9,'limit','buy',800,85.5000,'2025-07-25 10:15:00',null,'open'),
  (1010,110,10,'market','sell',300,0.0000,'2025-07-25 10:20:00','2025-07-25 10:20:00','filled');

select * from order_book;
drop table order_book;
truncate table order_book;

-- 7 trade
create table trade (
  trade_id bigint primary key,
  order_id bigint,
  counter_order_id bigint,
  security_id int,
  quantity bigint,
  price decimal(20,4),
  executed_time datetime,
  buyer_account_id int,
  seller_account_id int,
  currency_code char(3),
  foreign key (order_id) references order_book(order_id),
  foreign key (counter_order_id) references order_book(order_id),
  foreign key (security_id) references security(security_id),
  foreign key (buyer_account_id) references account(account_id),
  foreign key (seller_account_id) references account(account_id)
);
insert into trade values
  (5001,1001,1008,1,100,150.0000,'2025-07-25 09:30:10',101,108,'usd'),
  (5002,1002,1010,2,50,320.5000,'2025-07-25 09:35:05',110,102,'usd'),
  (5003,1004,1006,4,200,2400.0000,'2025-07-25 09:45:10',104,106,'inr'),
  (5004,1006,1004,6,100,1450.0000,'2025-07-25 10:00:00',106,104,'inr'),
  (5005,1008,1001,8,10000,350.0000,'2025-07-25 10:10:00',108,101,'eur'),
  (5006,1010,1002,10,300,650.0000,'2025-07-25 10:20:00',102,110,'usd'),
  (5007,1003,1005,3,20,2700.0000,'2025-07-25 10:30:00',103,105,'usd'),
  (5008,1005,1007,5,150,2800.0000,'2025-07-25 10:35:00',105,107,'inr'),
  (5009,1007,1003,7,500,8500.0000,'2025-07-25 10:45:00',107,103,'jpy'),
  (5010,1009,1010,9,800,110.0000,'2025-07-25 10:50:00',109,110,'eur');

select * from trade;
drop table trade;
truncate table trade;

-- 8 price_tick
create table price_tick (
  tick_id bigint primary key,
  security_id int,
  tick_time datetime,
  bid_price decimal(20,4),
  bid_size bigint,
  ask_price decimal(20,4),
  ask_size bigint,
  last_price decimal(20,4),
  last_size bigint,
  currency_code char(3),
  foreign key (security_id) references security(security_id)
);
insert into price_tick values
  (9001,1,'2025-07-25 09:30:00',149.50,100,150.00,200,150.00,100,'usd'),
  (9002,2,'2025-07-25 09:35:00',320.30,50,320.60,60,320.50,50,'usd'),
  (9003,4,'2025-07-25 09:45:00',2399.00,150,2400.50,200,2400.00,200,'inr'),
  (9004,6,'2025-07-25 10:00:00',1448.00,300,1450.50,200,1450.00,100,'inr'),
  (9005,8,'2025-07-25 10:10:00',349.50,1000,350.50,1000,350.00,500,'eur'),
  (9006,10,'2025-07-25 10:20:00',649.50,200,650.50,300,650.00,100,'usd'),
  (9007,3,'2025-07-25 10:30:00',2698.00,100,2701.00,120,2700.00,20,'usd'),
  (9008,5,'2025-07-25 10:35:00',2799.00,100,2801.00,150,2800.00,50,'inr'),
  (9009,7,'2025-07-25 10:45:00',8499.00,100,8501.00,200,8500.00,500,'jpy'),
  (9010,9,'2025-07-25 10:50:00',109.50,100,110.50,120,110.00,80,'eur');

select * from daily_price;
drop table daily_price;
truncate table daily_price;

-- 9 daily_price
create table daily_price (
  dp_id int primary key,
  security_id int,
  trade_date date,
  open decimal(20,4),
  high decimal(20,4),
  low decimal(20,4),
  close decimal(20,4),
  volume bigint,
  adjusted_close decimal(20,4),
  currency_code char(3),
  foreign key (security_id) references security(security_id)
);
insert into daily_price values
  (3001,1,'2025-07-24',148.00,151.00,147.50,150.00,100000000,150.00,'usd'),
  (3002,2,'2025-07-24',318.00,321.00,317.00,320.50,50000000,320.50,'usd'),
  (3003,4,'2025-07-24',2380.00,2410.00,2375.00,2400.00,800000,2400.00,'inr'),
  (3004,6,'2025-07-24',1440.00,1452.00,1435.00,1450.00,700000,1450.00,'inr'),
  (3005,8,'2025-07-24',345.00,351.00,344.00,350.00,600000,350.00,'eur'),
  (3006,10,'2025-07-24',640.00,652.00,638.00,650.00,12000000,650.00,'usd'),
  (3007,3,'2025-07-24',2680.00,2710.00,2670.00,2700.00,40000000,2700.00,'usd'),
  (3008,5,'2025-07-24',2780.00,2810.00,2775.00,2800.00,900000,2800.00,'inr'),
  (3009,7,'2025-07-24',8450.00,8520.00,8440.00,8500.00,500000,8500.00,'jpy'),
  (3010,9,'2025-07-24',108.00,111.00,107.50,110.00,200000,110.00,'eur');

select * from daily_price;
drop table daily_price;
truncate table daily_price;

-- 10 corporate_action
create table corporate_action (
  action_id int primary key,
  security_id int,
  action_type varchar(20),
  effective_date date,
  record_date date,
  dividend_amount decimal(20,4),
  split_factor decimal(10,4),
  description varchar(200),
  status varchar(20),
  currency_code char(3),
  foreign key (security_id) references security(security_id)
);
insert into corporate_action values
  (8001,1,'dividend','2025-08-01','2025-07-30',0.2300,1.0000,'quarterly dividend','confirmed','usd'),
  (8002,2,'dividend','2025-08-05','2025-08-03',0.6200,1.0000,'q2 dividend','confirmed','usd'),
  (8003,4,'split','2025-09-01','2025-08-30',0.0000,0.5000,'2-for-1 split','announced','inr'),
  (8004,6,'dividend','2025-08-10','2025-08-08',15.0000,1.0000,'annual dividend','confirmed','inr'),
  (8005,3,'dividend','2025-08-15','2025-08-13',0.0000,1.0000,'no dividend declared','declared','usd'),
  (8006,10,'split','2025-10-01','2025-09-29',0.0000,5.0000,'5‑for‑1 split','planned','usd'),
  (8007,8,'dividend','2025-08-20','2025-08-18',0.4500,1.0000,'interim dividend','announced','eur'),
  (8008,9,'dividend','2025-08-25','2025-08-23',1.2000,1.0000,'final dividend','announced','eur'),
  (8009,7,'dividend','2025-08-30','2025-08-28',120.0000,1.0000,'japanese payout','confirmed','jpy'),
  (8010,5,'split','2025-12-01','2025-11-29',0.0000,2.0000,'stock split','planned','inr');

select * from corporate_action;
drop table corporate_action;
truncate table corporate_action;