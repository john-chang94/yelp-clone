CREATE DATABASE munch;

CREATE TABLE restaurants (
    restaurant_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price_range VARCHAR(1) NOT NULL
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    restaurant_id INT NOT NULL,
    user_id INT NOT NULL,
    rating INT NOT NULL check(rating >= 1 AND rating <= 5),
    details VARCHAR(1000) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE review_images (
    review_images_id SERIAL PRIMARY KEY,
    restaurant_id INT NOT NULL,
    user_id INT NOT NULL,
    review_id INT NOT NULL,
    url VARCHAR(500) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (review_id) REFERENCES reviews(review_id)
);

CREATE TABLE images_thumb (
    images_thumb_id SERIAL PRIMARY KEY,
    review_images_id INT NOT NULL,
    thumbUrl VARCHAR(500) NOT NULL
);

CREATE TABLE suggestions (
    suggestions_id SERIAL PRIMARY KEY,
    param VARCHAR(255) NOT NULL,
    query VARCHAR(50) NOT NULL
);

INSERT INTO restaurants (name, location, category, price_range)
VALUES ('Dennys', 'Pomona', 'Diners', '2'),
('Burger King', 'Chino Hills', 'Fast Food', '1'),
('Yard House', 'Costa Mesa', 'American', '2'),
('Pick Up Stix', 'Chino Hills', 'Chinese', '1'),
('Waba Grill', 'West Covina', 'Fast Food', '1'),
('Pho Ha', 'Diamond Bar', 'Vietnamese', '2'),
('Cheesecake Factory', 'Brea', 'American', '2'),
('Summit House', 'Fullerton', 'Steakhouses', '3'),
('Subway', 'El Monte', 'Sandwiches', '1'),
('Thaitwist', 'Chino Hills', 'Thai', '2'),
('Noodology', 'Chino Hills', 'Chinese', '2'),
('Coco Palm Restaurant', 'Pomona', 'Cuban', '3'),
('Rolling Spicy Kimchi', 'Diamond Bar', 'Korean', '2'),
('Eureka!', 'Claremont', 'American', '2'),
('Black Bear Diner', 'Chino', 'Diners', '2'),
('Taiko', 'Irvine', 'Japanese', '2'),
('Hacienda La Joya', 'Mission Viejo', 'Mexican', '1'),
('Taqeuria De Anda', 'Pomona', 'Mexican', '1'),
('Taco Bell', 'Gardena', 'Fast Food', '1');

INSERT INTO suggestions (param, query)
VALUES ('Dennys', 'name'),
('Burger King', 'name'),
('Yard House', 'name'),
('Pick Up Stix', 'name'),
('Waba Grill', 'name'),
('Pho Ha', 'name'),
('Cheesecake Factory', 'name'),
('Summit House', 'name'),
('Subway', 'name'),
('Thaitwist', 'name'),
('Noodology', 'name'),
('Coco Palm Restaurant', 'name'),
('Rolling Spicy Kimchi', 'name'),
('Eureka!', 'name'),
('Black Bear Diner', 'name'),
('Taiko', 'name'),
('Hacienda La Joya', 'name'),
('Taqueria De Anda', 'name'),
('Diners', 'category'),
('Fast Food', 'category'),
('American', 'category'),
('Chinese', 'category'),
('Vietnamese', 'category'),
('Steakhouses', 'category'),
('Sandwiches', 'category'),
('Thai', 'category'),
('Cuban', 'category'),
('Korean', 'category'),
('Japanese', 'category'),
('Mexican', 'category');


INSERT INTO images_thumb (review_images_id, thumbUrl)
VALUES (2, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(3, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(4, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcheese.jpg?alt=media&token=ef1a9c6e-a3c9-40be-9008-ef5eabfae586'),
(5, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcurry.jpg?alt=media&token=23f7ab2f-dc17-4583-b2db-f8dd65b04457'),
(6, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(7, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fmacarons.jpg?alt=media&token=1c41506e-17fb-4565-90e6-06ef5d7b59d5'),
(8, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fnoodles.jpg?alt=media&token=35b089ed-19db-4613-9740-fe565cad1d51'),
(9, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpancakes.jpg?alt=media&token=a8a3e032-0f7c-4362-b8a7-e5a448001288'),
(10, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpasta.jpg?alt=media&token=2b3d2ee6-86e1-4ecc-a0d8-bae1fee438e6'),
(12, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpumpkin-soup.jpg?alt=media&token=4e42c7d5-efd7-4cfa-9202-426aee9cbd02'),
(13, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsalmon.jpg?alt=media&token=0583f665-c658-47b7-82ae-c48cbff9d138'),
(14, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsoup.jpg?alt=media&token=21f44e08-0631-4cad-bfae-77f9f01e6586'),
(15, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi-combo.jpg?alt=media&token=30d053da-3558-47f8-b47f-77a5df5a2c8f'),
(16, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi.jpg?alt=media&token=4da43aea-4f95-460b-8b09-d007860a05af'),
(17, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(18, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(19, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(20, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcheese.jpg?alt=media&token=ef1a9c6e-a3c9-40be-9008-ef5eabfae586'),
(21, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcurry.jpg?alt=media&token=23f7ab2f-dc17-4583-b2db-f8dd65b04457'),
(22, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(24, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fnoodles.jpg?alt=media&token=35b089ed-19db-4613-9740-fe565cad1d51'),
(25, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpancakes.jpg?alt=media&token=a8a3e032-0f7c-4362-b8a7-e5a448001288'),
(26, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpasta.jpg?alt=media&token=2b3d2ee6-86e1-4ecc-a0d8-bae1fee438e6'),
(27, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpizza.jpg?alt=media&token=e497d49f-6d47-44c9-accc-25416357a0f6'),
(28, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpumpkin-soup.jpg?alt=media&token=4e42c7d5-efd7-4cfa-9202-426aee9cbd02'),
(29, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsalmon.jpg?alt=media&token=0583f665-c658-47b7-82ae-c48cbff9d138'),
(30, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsoup.jpg?alt=media&token=21f44e08-0631-4cad-bfae-77f9f01e6586'),
(31, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi-combo.jpg?alt=media&token=30d053da-3558-47f8-b47f-77a5df5a2c8f'),
(32, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi.jpg?alt=media&token=4da43aea-4f95-460b-8b09-d007860a05af'),
(33, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(34, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(35, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(36, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fmacarons.jpg?alt=media&token=1c41506e-17fb-4565-90e6-06ef5d7b59d5'),
(37, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(38, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpasta.jpg?alt=media&token=2b3d2ee6-86e1-4ecc-a0d8-bae1fee438e6'),
(39, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsoup.jpg?alt=media&token=21f44e08-0631-4cad-bfae-77f9f01e6586'),
(41, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpizza.jpg?alt=media&token=e497d49f-6d47-44c9-accc-25416357a0f6'),
(1, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(11, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpizza.jpg?alt=media&token=e497d49f-6d47-44c9-accc-25416357a0f6'),
(42, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(43, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(44, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi-combo.jpg?alt=media&token=30d053da-3558-47f8-b47f-77a5df5a2c8f'),
(45, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsoup.jpg?alt=media&token=21f44e08-0631-4cad-bfae-77f9f01e6586'),
(46, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsalmon.jpg?alt=media&token=0583f665-c658-47b7-82ae-c48cbff9d138'),
(47, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpumpkin-soup.jpg?alt=media&token=4e42c7d5-efd7-4cfa-9202-426aee9cbd02'),
(48, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpizza.jpg?alt=media&token=e497d49f-6d47-44c9-accc-25416357a0f6'),
(49, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpasta.jpg?alt=media&token=2b3d2ee6-86e1-4ecc-a0d8-bae1fee438e6'),
(50, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpancakes.jpg?alt=media&token=a8a3e032-0f7c-4362-b8a7-e5a448001288'),
(52, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fmacarons.jpg?alt=media&token=1c41506e-17fb-4565-90e6-06ef5d7b59d5'),
(53, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(54, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcurry.jpg?alt=media&token=23f7ab2f-dc17-4583-b2db-f8dd65b04457'),
(55, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcheese.jpg?alt=media&token=ef1a9c6e-a3c9-40be-9008-ef5eabfae586'),
(56, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(57, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(58, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(59, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(60, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi-combo.jpg?alt=media&token=30d053da-3558-47f8-b47f-77a5df5a2c8f'),
(61, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsoup.jpg?alt=media&token=21f44e08-0631-4cad-bfae-77f9f01e6586'),
(62, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsalmon.jpg?alt=media&token=0583f665-c658-47b7-82ae-c48cbff9d138'),
(63, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpumpkin-soup.jpg?alt=media&token=4e42c7d5-efd7-4cfa-9202-426aee9cbd02'),
(64, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpizza.jpg?alt=media&token=e497d49f-6d47-44c9-accc-25416357a0f6'),
(65, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpasta.jpg?alt=media&token=2b3d2ee6-86e1-4ecc-a0d8-bae1fee438e6'),
(66, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpancakes.jpg?alt=media&token=a8a3e032-0f7c-4362-b8a7-e5a448001288'),
(67, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fnoodles.jpg?alt=media&token=35b089ed-19db-4613-9740-fe565cad1d51'),
(68, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fmacarons.jpg?alt=media&token=1c41506e-17fb-4565-90e6-06ef5d7b59d5'),
(69, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(70, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcurry.jpg?alt=media&token=23f7ab2f-dc17-4583-b2db-f8dd65b04457'),
(71, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcheese.jpg?alt=media&token=ef1a9c6e-a3c9-40be-9008-ef5eabfae586'),
(72, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(73, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(74, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(75, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(76, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fmacarons.jpg?alt=media&token=1c41506e-17fb-4565-90e6-06ef5d7b59d5'),
(77, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(78, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpancakes.jpg?alt=media&token=a8a3e032-0f7c-4362-b8a7-e5a448001288'),
(79, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcurry.jpg?alt=media&token=23f7ab2f-dc17-4583-b2db-f8dd65b04457'),
(80, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpumpkin-soup.jpg?alt=media&token=4e42c7d5-efd7-4cfa-9202-426aee9cbd02'),
(81, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fnoodles.jpg?alt=media&token=35b089ed-19db-4613-9740-fe565cad1d51'),
(82, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(83, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(84, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcheese.jpg?alt=media&token=ef1a9c6e-a3c9-40be-9008-ef5eabfae586'),
(85, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcurry.jpg?alt=media&token=23f7ab2f-dc17-4583-b2db-f8dd65b04457'),
(86, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(87, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fmacarons.jpg?alt=media&token=1c41506e-17fb-4565-90e6-06ef5d7b59d5'),
(88, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fnoodles.jpg?alt=media&token=35b089ed-19db-4613-9740-fe565cad1d51'),
(89, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpancakes.jpg?alt=media&token=a8a3e032-0f7c-4362-b8a7-e5a448001288'),
(90, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpasta.jpg?alt=media&token=2b3d2ee6-86e1-4ecc-a0d8-bae1fee438e6'),
(92, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpumpkin-soup.jpg?alt=media&token=4e42c7d5-efd7-4cfa-9202-426aee9cbd02'),
(93, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsalmon.jpg?alt=media&token=0583f665-c658-47b7-82ae-c48cbff9d138'),
(94, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsoup.jpg?alt=media&token=21f44e08-0631-4cad-bfae-77f9f01e6586'),
(95, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi-combo.jpg?alt=media&token=30d053da-3558-47f8-b47f-77a5df5a2c8f'),
(96, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi.jpg?alt=media&token=4da43aea-4f95-460b-8b09-d007860a05af'),
(97, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(98, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(99, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(100, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcheese.jpg?alt=media&token=ef1a9c6e-a3c9-40be-9008-ef5eabfae586'),
(101, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcurry.jpg?alt=media&token=23f7ab2f-dc17-4583-b2db-f8dd65b04457'),
(102, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(104, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fnoodles.jpg?alt=media&token=35b089ed-19db-4613-9740-fe565cad1d51'),
(105, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpancakes.jpg?alt=media&token=a8a3e032-0f7c-4362-b8a7-e5a448001288'),
(106, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpasta.jpg?alt=media&token=2b3d2ee6-86e1-4ecc-a0d8-bae1fee438e6'),
(107, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpizza.jpg?alt=media&token=e497d49f-6d47-44c9-accc-25416357a0f6'),
(108, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpumpkin-soup.jpg?alt=media&token=4e42c7d5-efd7-4cfa-9202-426aee9cbd02'),
(109, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsalmon.jpg?alt=media&token=0583f665-c658-47b7-82ae-c48cbff9d138'),
(110, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsoup.jpg?alt=media&token=21f44e08-0631-4cad-bfae-77f9f01e6586'),
(111, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi-combo.jpg?alt=media&token=30d053da-3558-47f8-b47f-77a5df5a2c8f'),
(112, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsushi.jpg?alt=media&token=4da43aea-4f95-460b-8b09-d007860a05af'),
(113, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=91e81fb3-e84e-4550-b21f-4ab2dd152c99'),
(114, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(115, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fcake-cappuccino.jpg?alt=media&token=c5aa070b-63e3-4eb5-b158-94a3b1b71c12'),
(116, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fmacarons.jpg?alt=media&token=1c41506e-17fb-4565-90e6-06ef5d7b59d5'),
(117, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fgrilled-pineapple-pork-burrito.jpg?alt=media&token=b056df3d-4e46-4c50-9b01-4aa2c63e0a80'),
(118, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpasta.jpg?alt=media&token=2b3d2ee6-86e1-4ecc-a0d8-bae1fee438e6'),
(119, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsoup.jpg?alt=media&token=21f44e08-0631-4cad-bfae-77f9f01e6586'),
(121, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpizza.jpg?alt=media&token=e497d49f-6d47-44c9-accc-25416357a0f6'),
(23, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fburger-fries.jpg?alt=media&token=66b137b1-14dc-41e0-8ca4-fff40eb5d478'),
(51, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fnoodles.jpg?alt=media&token=35b089ed-19db-4613-9740-fe565cad1d51'),
(91, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fpizza.jpg?alt=media&token=e497d49f-6d47-44c9-accc-25416357a0f6'),
(122, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fnoodles.jpg?alt=media&token=0863d4af-24be-401c-a07d-1cc993923dbc'),
(123, 'https://firebasestorage.googleapis.com/v0/b/munch-41699.appspot.com/o/images%2Fsweet-and-sour-pork.jpg?alt=media&token=7e8dae70-1014-402e-aad4-8a5f02868d00')