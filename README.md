# Project3_Pennywise

The project was to create a money management app to help the user track his/her spending and be more frugal. The app’s main page shows a table of all transactions and the transaction details. Using the app, the user had to be able to create new Transactions which should have a merchant name e.g. Tesco, a value, and an associated Tag (e.g. ‘food’). The app also had to track and display the total and show the total by tag.

Running the app:
1. Use the following terminal commands to install the necessary :
      - brew install postgresql
2. In the folder Project1_Pennwise (top level) install the following gems:
      - gem install sinatra sinatra-contrib
      - gem install pg
      gem install pry pry-byebug pry-doc
      createdb penny_wise
      
3. In the folder "db"
      psql -d penny_wise -f penny_wise.sql
4. Ruby seeds.rb
5. In the top level run ruby app.rb
6. In the address bar type http://localhost:4567/transactions - this will take you to the Apps homepage.
