# Project3_Pennywise

The project was to create a money management app to help the user track his/her spending and be more frugal. The app’s main page shows a table of all transactions and the transaction details. Using the app, the user had to be able to create new Transactions which should have a merchant name e.g. Tesco, a value, and an associated Tag (e.g. ‘food’). The app also had to track and display the total and show the total by tag.

Running the app:
1. Use the following terminal commands to install postgres and ruby:
      - brew install postgresql
      - brew install ruby
2. Install the necessary gems using the following commands:
      - gem install sinatra sinatra-contrib
      - gem install pg
      - gem install pry pry-byebug pry-doc
3. Create the SQL database with the following command in terminal:
      createdb penny_wise
      
4. In the folder "db" enter the following commands in terminal:
      - psql -d penny_wise -f penny_wise.sql
      - Ruby seeds.rb
5. In the top level run the app using the following command:
      - ruby app.rb
6. In the address bar type http://localhost:4567/transactions - this will take you to the Apps homepage.
