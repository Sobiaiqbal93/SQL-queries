              # Total records Transaction
SELECT count(*) FROM sales.transactions;  #  it's 150283
              #Total records  from Customers
SELECT count(*) FROM sales.customers;    # Total records it's 38
               #Select all Transaction data 
SELECT * FROM sales.transactions;  
			   #Total records for chanai
SELECT * FROM sales.transactions where market_code='Mark001';       
               #total Transaction made from chanai 1035
SELECT count(*) FROM sales.transactions where market_code='mark001';   
               #How many transaction made in USD 
SELECT count(*) FROM sales.transactions where currency='USD';  #only 2 transaction made in USD
               
SELECT * FROM sales.transactions limit 5;
               #Join Transactions and Date tables
SELECT sales.transactions.*,sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date;
               #how many transactions are perform in 2020
SELECT sales.transactions.*,sales.date.* FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020;   
               #--------------Count of transactions are perform in 2020
SELECT sum(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020;   #Total transaction "142235559"
              #---------------Chanai total transaction in 2020
SELECT sum(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date 
where sales.date.year=2020 and sales.transactions.market_code='Mark001';   #2463024.  
              # ----------Chanai Distnict Product 
SELECT distinct product_code FROM sales.transactions where market_code='Mark001';  # Chanai Distict Product 
              # chanai sales Quantity through the whole period
SELECT sales.transactions.sales_qty FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date
where sales.transactions.market_code='Mark001';   
              #------# total of sales Quantity through the  2020 for Chani 
SELECT sum(sales.transactions.sales_qty) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date
where sales.transactions.market_code='Mark001' and sales.date.year=2020;   # total of sales Quantity through the whole period is "51210" and in 2020 it was 7262
            # Revenue in 2020 From Chanai
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and transactions.currency="INR";
             # Sale in 2020 in Chanai
SELECT SUM(transactions.sales_qty) FROM sales.transactions INNER JOIN sales.date ON sales.transactions.order_date=sales.date.date where sales.date.year=2020 and sales.transactions.market_code="Mark001";
              #Total Sale from 2017-2020
SELECT SUM(sales_qty) FROM sales.transactions;
              #One of the Top Five Customers
SELECT SUM(sales.transactions.sales_amount) FROM sales.transactions INNER JOIN sales.customers ON sales.transactions.customer_code=sales.customers.customer_code where sales.customers.customer_code="Cus006";
              #Top Product by Revenue
SELECT SUM(sales_amount) FROM sales.transactions where product_code="Prod318";
              # Top 5 Revenue by Product 
SELECT product_code, SUM(sales_amount) FROM sales.transactions GROUP BY product_code ORDER BY SUM(sales_amount) DESC;

