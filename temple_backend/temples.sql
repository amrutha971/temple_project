CREATE TABLE temples (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    district VARCHAR(255) NOT NULL
);

CREATE TABLE poojas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    temple_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (temple_id) REFERENCES temples(id) ON DELETE CASCADE
);

INSERT INTO temples (name, location, district) VALUES
('Sree Krishna Temple', 'Guruvayoor', 'Thrissur'),
('Vadakkunnathan Temple', 'Thrissur', 'Thrissur');

INSERT INTO poojas (temple_id, name, price) VALUES
(1, 'Usha Pooja', 150),
(1, 'Noon Pooja', 200),
(1, 'Athazha Pooja', 250),
(2, 'Morning Pooja', 100),
(2, 'Evening Pooja', 150),
(2, 'Special Pooja', 300);
