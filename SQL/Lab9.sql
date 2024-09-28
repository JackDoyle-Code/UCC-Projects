SELECT *
FROM hotels;

SELECT *
FROM rooms;

SELECT * 
FROM bookings;

SELECT *
FROM guests;

--- Question 1 ---
SELECT *
FROM hotels JOIN rooms JOIN bookings JOIN guests
    ON hotels.hotel_num = rooms.hotel_num
    AND rooms.hotel_num = bookings.hotel_num
    AND bookings.guest_num = guests.guest_num
WHERE city = 'Cork';

--- Question 2 ---
SELECT guest_address, guest_name
FROM guests JOIN bookings JOIN hotels
    ON guests.guest_num = bookings.guest_num
    AND bookings.hotel_num = hotels.hotel_num
WHERE city = 'Cork';

--- Question 3 ---
SELECT room_num, price
FROM rooms
WHERE price < 70
ORDER BY price;

--- Question 4 ---
SELECT *
FROM bookings
WHERE dep_date ISNULL;

--- Question 5 ---
SELECT COUNT(DISTINCT hotel_num)
FROM hotels;

--- Question 6 ---
SELECT hotel_num, room_num, price
FROM rooms
WHERE price < 70
ORDER BY price;

--- Question 7 ---
SELECT hotel_name, room_num, price
FROM rooms JOIN hotels
    ON rooms.hotel_num = hotels.hotel_num
WHERE price < 70
ORDER BY price;

--- Question 8 ---
SELECT COUNT(room_num)
FROM rooms
WHERE price < 70
    AND room_type = 'double';

--- Question 9 ---
SELECT AVG(price)
FROM rooms;

--- Question 10 ---
SELECT AVG(price)
FROM rooms
WHERE hotel_num = (SELECT hotel_num FROM hotels WHERE city = 'Cork');

--- Question 11 ---
SELECT AVG(price)
FROM rooms
WHERE hotel_num = (SELECT hotel_num FROM hotels WHERE city = 'Cork')
    AND room_type = 'double';

--- Question 12 ---
SELECT COUNT(guest_num), hotel_num
FROM bookings
WHERE arr_date BETWEEN '2002-11-01' AND '2002-11-31'
GROUP BY hotel_num;

--- Question 13 ---
SELECT price, room_type
FROM rooms
WHERE hotel_num = (SELECT hotel_num FROM hotels WHERE hotel_name = 'Hotel Splendide');

--- Question 14 ---
SELECT hotel_name, COUNT(room_num)
FROM rooms JOIN hotels
    ON rooms.hotel_num = hotels.hotel_num
WHERE city = 'Galway'
GROUP BY hotel_name;

--- Question 15 ---
SELECT guest_num
FROM bookings
WHERE hotel_num = (SELECT hotel_num FROM hotels WHERE hotel_name = 'Hotel Splendide')
    AND arr_date BETWEEN '2002-01-01' AND '2002-01-31';

--- Question 16 ---
SELECT h1.hotel_name, h2.hotel_name
FROM hotels AS h1 JOIN hotels AS h2
    ON h1.hotel_num < h2.hotel_num
WHERE h1.hotel_name = h2.hotel_name;

--- Question 17 ---
SELECT guest_name
FROM guests
WHERE guest_num IN 
    (SELECT guest_num FROM bookings WHERE hotel_num = 
    (SELECT hotel_num FROM hotels WHERE hotel_name = 'Hotel Splendide') ORDER BY arr_date);

--- Subquery doesn't work because of order ---

SELECT guest_name, arr_date
FROM guests JOIN bookings JOIN hotels
    ON guests.guest_num = bookings.guest_num
    AND bookings.hotel_num = hotels.hotel_num
ORDER BY arr_date;

--- Question 18 ---
SELECT *
FROM bookings JOIN hotels
    ON bookings.hotel_num < hotels.hotel_num;
