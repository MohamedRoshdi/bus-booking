1- Create bus-booking database
<br/>
2- Create .nev and add the database config
<br/>
3- Run command php artisan key:generate
<br/>
4- Composer install
<br/>
5- Import dump.sql from database folder
<br/>
APIs
<br/>
1- URL/api/seats?start_city_id=1&end_city_id=4
<br/>
    this GET url to get the available seats between two stations
<br/>
2- URL/api/seats/book
<br/>
    This is POST url to book seat
<br/>
    Data to be sent
<br/>
seat_id:2
<br/>
start_city_id:1
<br/>
end_city_id:3
<br/>
