1- Create bus-booking database
2- Create .nev and add the database config
3- Run command php artisan key:generate
4- Composer install
5- Import dump.sql from database folder
APIs
1- URL/api/seats?start_city_id=1&end_city_id=4
    this GET url to get the available seats between two stations
2- URL/api/seats/book
    This is POST url to book seat
    Data to be sent
seat_id:2
start_city_id:1
end_city_id:3
