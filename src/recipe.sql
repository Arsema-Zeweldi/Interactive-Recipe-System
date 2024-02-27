CREATE DATABASE RecipeSystem;
USE RecipeSystem;

CREATE TABLE User(
	UserID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    LastName VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telNo VARCHAR(15) NOT NULL,
    password VARCHAR(10) NOT NULL,
    PRIMARY KEY(UserID)
);
DROP TABLE User;
DROP TABLE Category;
CREATE TABLE Category(
	CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL UNIQUE,
    Description TEXT NOT NULL
);
Drop table Recipe;
CREATE TABLE Recipe(
	RecipeID INT PRIMARY KEY AUTO_INCREMENT,
    RecipeName VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT,
    Instructions TEXT,
    PrepTime INT,
    CookTime INT,
    TotalTime INT,
    Servings INT
);
DROP TABLE Ingredient;
CREATE TABLE Ingredient(
	IngredientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100)
);
DROP TABLE RecipeIngredient;
-- Create the RecipeIngredient junction table
CREATE TABLE RecipeIngredient (
    RecipeID INT,
    IngredientID INT,
    Quantity DECIMAL(10, 2),
    Unit VARCHAR(50),
    PRIMARY KEY (RecipeID, IngredientID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);
Drop table UserRecipe;
CREATE TABLE UserRecipe(
	UserID INT,
    RecipeID INT,
    favorite BOOLEAN,
    Rating INT,
    PRIMARY KEY(UserID, RecipeID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID) ON UPDATE CASCADE ON DELETE NO ACTION,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON UPDATE CASCADE ON DELETE NO ACTION
);
Drop table RecipeCategory;
CREATE TABLE RecipeCategory(
	RecipeID INT,
    RecipeName VARCHAR(100),
    CategoryID INT,
    CategoryName VARCHAR(50),
    PRIMARY KEY(RecipeID, CategoryID),
    FOREIGN KEY (RecipeName) REFERENCES Recipe(RecipeName),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (CategoryName) REFERENCES Category(CategoryName)
);


INSERT INTO Category (CategoryName, Description)
VALUES
    ('Meat-based Dishes', 'Recipes that primarily feature meat as the main ingredient.'),
    ('Seafood Dishes', 'Recipes centered around various types of seafood.'),
    ('Vegetarian & Vegan', 'Recipes that exclude meat and may also exclude other animal products.'),
    ('Poultry', 'Recipes focused on poultry, such as chicken or turkey.'),
    ('Pasta & Rice', 'Recipes based on pasta or rice as the main component.'),
    ('International Main Dishes', 'Recipes inspired by various international cuisines.'),
    ('Grain & Legume Based Dishes', 'Recipes that prominently feature grains and legumes.'),
    ('Breakfast', 'Recipes suitable for breakfast or brunch.'),
    ('Dessert', 'Sweet dishes typically served at the end of a meal.');
    
-- Insert data into the Ingredient table
INSERT INTO Ingredient (Name)
VALUES
    ('Chicken Breast'),
    ('Salmon Fillet'),
    ('Tofu'),
    ('Beef Steak'),
    ('Shrimp'),
    ('Broccoli'),
    ('Quinoa'),
    ('Eggs'),
    ('Pasta'),
    ('Rice'),
    ('Cilantro'),
    ('Tomato'),
    ('Garlic'),
    ('Olive Oil'),
    ('Onion'),
    ('Bell Pepper'),
    ('Cucumber'),
    ('Lentils'),
    ('Bacon'),
    ('Avocado'),
	('Flour'),
    ('Sugar'),
    ('Eggs'),
    ('Milk'),
    ('Butter'),
    ('Salt'),
    ('Baking Powder'),
    ('Chocolate Chips'),
    ('Vanilla Extract'),
    ('Olive Oil'),
	('Cucumbers'),
    ('Red Onion'),
    ('Kalamata Olives'),
    ('Feta Cheese'),
    ('Soy Sauce'),
    ('Oregano'),
    ('Linguine'),
    ('Blueberries'),
    ('Bananas'),
    ('Apples'),
    ('Cheddar Cheese'),
    ('Parmesan Cheese');

INSERT INTO Ingredient (Name)
VALUES
	('Smoked paprika'),
    ('Lettuce'),
    ('Spinach'),
    ('Arugula'),
    ('Chicken Broth'),
    ('Heavy Cream'),
    ('Zest'),
    ('Lemon Juice'),
    ('Capers'),
    ('Red Peppers'),
    ('Parsley'),
    ('Cumin'),
    ('Chickpeas'),
    ('Sunflower Seeds'),
    ('Nutmeg'),
    ('Sesame Oil'),
    ('Vegetable Oil'),
    ('Ginger'),
    ('Carrot'),
    ('Zucchini'),
    ('Snap Peas'),
    ('Green Onion'),
    ('Hoisin Sauce'),
    ('Rice Vinegar'),
    ('Corn Starch'),
    ('Cocoa Powder'),
    ('Baking Soda'),
    ('Cherry Tomato'),
    ('Red Wine Vinegar'),
    ('White wine'),
    ('Buttermilk'),
    ('Cinammon'),
	('Pepper'),
    ('Dijon Mustard'),
    ('Mushroom'),
    ('Butter'),
	('Beef Broth'),
	('Worcestershire Sauce'),
	('Sour Cream'),
    ('Coriander'),
    ('Water'),
    ('Bread'),
    ('Brown Sugar'),
    ('Watermelon'),
	('Pineapple'),
	('Strawberries'),
	('Grapes'),
	('Kiwi'),
	('Banana'),
	('Orange'),
	('Honey'),
    ('Coconut Milk'),
	('Curry Powder'),
	('tumeric');

INSERT INTO Recipe (RecipeName, Description, Instructions, PrepTime, CookTime, TotalTime, Servings)
VALUES
    ('Grilled Chicken Salad', 'A healthy and delicious salad with grilled chicken breast.', '1. Marinate chicken with olive oil, garlic, and herbs.\n2. Grill chicken until fully cooked.\n3. Mix grilled chicken with fresh vegetables and serve.', 15, 20, 35, 4),
    ('Salmon Pasta with Lemon Sauce', 'A flavorful pasta dish with pan-seared salmon and a zesty lemon sauce.', '1. Cook pasta according to package instructions.\n2. Sear salmon fillet in a pan with olive oil.\n3. Prepare lemon sauce and toss with cooked pasta and salmon.', 20, 15, 35, 2),
    ('Vegetarian Stir-Fry', 'A quick and nutritious stir-fry with tofu and assorted vegetables.', '1. Press tofu to remove excess water and cut into cubes.\n2. Stir-fry tofu and vegetables in a wok.\n3. Season with soy sauce and serve over rice.', 15, 10, 25, 3),
    ('Classic Beef Stroganoff', 'A comforting and creamy beef stroganoff served over egg noodles.', '1. Sauté beef strips with onions and garlic.\n2. Add mushrooms and cook until tender.\n3. Stir in sour cream and serve over cooked egg noodles.', 20, 25, 45, 4),
    ('Garlic Butter Shrimp', 'Juicy shrimp cooked in a garlic-infused butter sauce.', '1. Saute shrimp in a pan with garlic and butter.\n2. Season with herbs and lemon juice.\n3. Serve hot as an appetizer or over rice as a main dish.', 10, 10, 20, 2),
    ('Broccoli and Quinoa Bowl', 'A wholesome bowl featuring quinoa, broccoli, and a variety of fresh ingredients.', '1. Cook quinoa according to package instructions.\n2. Steam broccoli until tender.\n3. Combine quinoa, broccoli, and other ingredients in a bowl.', 15, 15, 30, 2),
	('Chicken Alfredo Pasta', 'Creamy pasta with grilled chicken', '1. Cook pasta. 2. Grill chicken. 3. Mix with Alfredo sauce.', 15, 20, 35, 4),
    ('Chocolate Cake', 'Decadent chocolate cake recipe', '1. Mix dry ingredients. 2. Combine wet ingredients. 3. Bake in preheated oven.', 20, 30, 50, 8),
    ('Greek Salad', 'Classic Greek salad with feta cheese', '1. Chop vegetables. 2. Toss with olives and feta. 3. Drizzle with olive oil.', 15, 0, 15, 2),
    ('Shrimp Scampi', 'Garlicky shrimp with linguine', '1. Cook linguine. 2. Sauté shrimp in garlic butter. 3. Combine with pasta.', 10, 15, 25, 4),
	('Classic Pancakes', 'Simple and fluffy pancakes for breakfast.', '1. Mix dry ingredients. 2. Add wet ingredients. 3. Cook on a griddle.', 10, 15, 25, 4),
    ('Blueberry Muffins', 'Delicious muffins bursting with blueberries.', '1. Combine dry ingredients. 2. Fold in blueberries. 3. Bake in muffin cups.', 15, 20, 35, 12),
    ('French Toast', 'Traditional French toast with syrup and powdered sugar.', '1. Dip bread in egg mixture. 2. Cook on a griddle. 3. Serve with syrup.', 12, 15, 27, 4),
    ('Chocolate Chip Cookies', 'Classic chocolate chip cookies for dessert.', '1. Cream butter and sugar. 2. Mix in dry ingredients and chocolate chips. 3. Bake until golden.', 20, 10, 30, 24),
    ('Fruit Salad', 'A refreshing fruit salad with assorted fruits.', '1. Chop fruits. 2. Toss together. 3. Chill before serving.', 15, 0, 15, 6),
    ('Apple Pie', 'Homemade apple pie with a flaky crust.', '1. Prepare pie crust. 2. Fill with apple filling. 3. Bake until golden brown.', 30, 40, 70, 8);

select * from RecipeCategory;
INSERT INTO RecipeCategory (RecipeID, RecipeName, CategoryID, CategoryName)
VALUES
(19,'Grilled Steak with Chimichurri Sauce',1,'Meat-based Dishes'),
    (20,'Spaghetti Bolognese',5,'Pasta & Rice'),
    (21,'Grilled Chicken Skewers',4,'Poultry'),
    (22,'BBQ Pulled Pork',1,'Meat-based Dishes'),
    (23,'Baked Salmon with Dill Sauce',2,'Seafood Dishes'),
    (24,'Grilled Lemon Garlic Butter Lobster Tails',2,'Seafood Dishes'),
    (25,'Baked Lemon Garlic Butter Shrimp',2,'Seafood Dishes'),
    (26,'Coconut Shrimp Curry',2,'Seafood Dishes'),
    (27,'Spinach and Chickpea Curry',3,'Vegetarian & Vegan'),
    (28,'Quinoa-Stuffed Bell Peppers',3,'Vegetarian & Vegan'),
    (29,'Lentil and Vegetable Stew',3,'Vegetarian & Vegan'),
    (30,'Vegan Chickpea and Sweet Potato Curry',3,'Vegetarian & Vegan'),
    (31,'Baked Lemon Herb Chicken',4,'Poultry'),
    (32,'Grilled Honey Mustard Chicken',4,'Poultry'),
    (33,'Teriyaki Chicken Stir-Fry',4,'Poultry'),
    (34,'Lemon Garlic Roast Chicken',4,'Poultry'),
    (35,'Vegetable Fried Rice',3,'Vegetarian & Vegan'),
    (36,'Chicken Alfredo Tortellini',4,'Poultry'),
    (37,'Shrimp Fried Rice',2,'Seafood Dishes'),
    (38,'Chicken Tikka Masala',4,'Poultry'),
    (39,'Beef Stir-Fry with Broccoli',1,'Meat-based Dishes'),
    (40,'Italian Margherita Pizza',1,'Meat-based Dishes'),
    (40,'Italian Margherita Pizza',6,'International Main Dishes'),
    (41,'Japanese Chicken Teriyaki',4,'Poultry'),
     (41,'Japanese Chicken Teriyaki',6,'International Main Dishes'),
    (42,'Quinoa Salad with Chickpeas',3,'Vegetarian & Vegan'),
    (43,'Brown Rice and Black Bean Burrito Bowl',3,'Vegetarian & Vegan'),
    (43,'Brown Rice and Black Bean Burrito Bowl',5,'Pasta & Rice'),
    (44,'Couscous with Roasted Vegetables',3,'Vegetarian & Vegan'),
    (45,'Classic Omelette',8,'Breakfast'),
    (46,'Blueberry Pancakes',8,'Breakfast'),
	(46,'Blueberry Pancakes',9,'Dessert'),
    (47,'Avocado Toast with Poached Eggs',8,'Breakfast'),
    (48,'Banana Walnut Muffins',8,'Breakfast'),
    (49,'Chocolate Fondue',9,'Dessert'),
    (50,'Strawberry Shortcake',9,'Dessert'),
    (51,'Tiramisu',9,'Dessert'),
    (52,'Cheesecake with Berry Compote',9,'Dessert');
    (1, 'Grilled Chicken Salad', 1, 'Meat-based Dishes'),
    (2, 'Salmon Pasta with Lemon Sauce', 2, 'Seafood Dishes'),
    (3, 'Vegetarian Stir-Fry', 3, 'Vegetarian & Vegan'),
	(4, 'Classic Beef Stroganoff', 1, 'Meat-based Dishes'),
    (5, 'Garlic Butter Shrimp', 2, 'Seafood Dishes'),
    (6, 'Broccoli and Quinoa Bowl', 3, 'Vegetarian & Vegan'),
    (1, 'Grilled Chicken Salad', 6, 'International Main Dishes'),
    (2, 'Salmon Pasta with Lemon Sauce', 6, 'International Main Dishes'),
	(7, 'Chicken Alfredo Pasta', 4, 'Poultry'),   -- Chicken Alfredo Pasta is in the Poultry category
    (7, 'Chicken Alfredo Pasta', 5, 'Pasta & Rice'),  -- Chicken Alfredo Pasta is also in the Pasta & Rice category
    (8, 'Chocolate Cake', 9, 'Dessert'),   -- Chocolate Cake is in the Dessert category
    (9, 'Greek Salad', 5, 'Pasta & Rice'),   -- Greek Salad is in the Pasta & Rice category
    (9, 'Greek Salad', 3, 'Vegetarian & Vegan'),   -- Greek Salad is also in the Salad category
    (10, 'Shrimp Scampi', 4, 'Poultry'),   -- Shrimp Scampi is in the Poultry category
    (10, 'Shrimp Scampi', 5, 'Pasta & Rice'),  -- Shrimp Scampi is also in the Pasta & Rice category
	(11, 'Classic Pancakes', 8, 'Breakfast'),
    (12, 'Blueberry Muffins', 8, 'Breakfast'),
    (13, 'French Toast', 8, 'Breakfast'),
    (14, 'Chocolate Chip Cookies', 9, 'Dessert'),
    (15, 'Fruit Salad', 9, 'Dessert'),
    (16, 'Apple Pie', 8, 'Breakfast'),
    (17, 'Quinoa Salad', 7, 'Grain & Legume Based Dishes'),
    (18, 'Lentil Curry',  7, 'Grain & Legume Based Dishes'),
    
    
    
    
    
    
Drop table RecipeIngredient;
-- Grilled Chicken Salad
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
    (1, 1, 1, 'lb'),
    (1, 14, 5, 'tablespoons'),
    (1, 36, 1, 'tablespoons'),
    (1, 26, 1, 'pinch'),
    (1, 75, 1, 'pinch'),
    (1, 76, 1, 'teaspoon'),
    (1, 13, 1, 'clove'),
    (1, 43, 1, 'tablespoon'),
    (1, 44, 2, 'cups'),
    (1, 45, 2, 'cups'),
    (1, 46, 2, 'cups');

-- Salmon Pasta with Lemon Sauce    
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(2, 2, 8, 'oz'),
    (2, 9, 8, 'oz'),
    (2, 13, 2, 'cloves'),
    (2, 14, 2, 'tablespoons'),
    (2, 26, 1, 'pinch'),
    (2, 75, 1, 'pinch'),
    (2, 47, 240, 'ml'),
    (2, 48, 240, 'ml'),
    (2, 49, 1, 'lemon'),
    (2, 50, 1, 'lemon'),
    (2, 51, 2, 'tablespoons');

-- Vegitarian Stir fry
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(3, 3, 8, 'oz'),
    (3, 35, 2, 'tablespoons'),
    (3, 13, 3, 'cloves'),
    (3, 16, 1, 'bell pepper'),
    (3, 6, 1, 'cup'),
    (3, 77, 1, 'cup'),
    (3, 22, 1, 'tablespoon'),
    (3, 58, 1, 'tablespoon'),
    (3, 59, 1, 'tablespoon'),
    (3, 60, 1, 'tablespoon'),
    (3, 61, 1, 'carrot'),
    (3, 62, 1, 'zucchini'),
    (3, 63, 1, 'cup'),
    (3, 64, 2, 'onions'),
    (3, 65, 2, 'tablespoons'),
    (3, 66, 1, 'tablespoon'),
    (3, 67, 1, 'tablespoon');

-- Classic Beef Strogsnoff
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(4, 77, 8, 'oz'),
    (4, 78, 2, 'tablespoons'),
    (4, 79, 1, 'cup'),
    (4, 80, 2, 'tablespoons'),
    (4, 81, 120, 'ml'),
    (4, 76, 2, 'tablespoons'),
    (4, 26, 1, 'pinch'),
    (4, 75, 1, 'pinch'),
    (4, 15, 1, 'onion'),
    (4, 13, 2, 'cloves'),
    (4, 14, 2, 'tablespoon');
    
-- Garlic Butter Shrimp
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(5, 52, 0.5, 'teaspoon'),
    (5, 53, 2, 'tablespoons'),
    (5, 5, 1, 'lb'),
    (5, 78, 3, 'tablespoon'),
    (5, 13, 4, 'cloves'),
    (5, 43, 1, 'teaspoon'),
    (5, 26, 1, 'pinch'),
    (5, 75, 1, 'pinch'),
    (5, 50, 1, 'tablespoon');
    
-- Broccoli and Quinoa Bowl
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(6, 54, 1, 'teaspoon'),
    (6, 55, 15, 'oz'),
    (6, 56, 0.25, 'cup'),
    (6, 7, 1, 'cup'),
    (6, 6, 2, 'cups'),
    (6, 14, 1, 'tablespoon'),
    (6, 13, 3, 'cloves'),
    (6, 43, 1, 'teaspoon'),
    (6, 26, 1, 'pinch'),
    (6, 75, 1, 'pinch'),
    (6, 20, 1, 'avocado');
    
-- Chicken Alfredo Pasta
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(7, 57, 0.5, 'teaspoon'),
    (7, 9, 8, 'oz'),
    (7, 1, 1, 'lb'),
    (7, 17, 2, 'tablespoons'),
    (7, 13, 4, 'cloves'),
    (7, 48, 1, 'cup'),
    (7, 24, 1, 'cup'),
    (7, 42, 1, 'cup');
    
-- Chocolate Cake
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(8, 21, 220, 'g'),
    (8, 68, 126, 'g'),
    (8, 27, 2, 'teaspoon'),
    (8, 69, 1.2, 'teaspoon'),
    (8, 26, 1.5, 'teaspoon'),
    (8, 22, 315, 'g'),
    (8, 23, 2, 'eggs'),
    (8, 24,1.25, 'cup'),
    (8, 59, 0.5, 'cup'),
    (8, 29, 3, 'teaspoon'),
    (8, 83, 1, 'cup'),
    (8, 25, 1, 'cup');
    
-- Greeek Salad
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(9, 44, 4, 'cups'),
    (9, 17, 1, 'cucumber'),
    (9, 70, 1, 'cup'),
    (9, 15, 0.5, 'cup'),
    (9, 33, 0.5, 'cup'),
    (9, 34, 0.5, 'cup'),
    (9, 30, 0.25, 'cup'),
    (9, 71, 2, 'tablespoon'),
    (9, 36, 1, 'teaspoon'),
    (9, 26, 1, 'pinch'),
    (9, 75, 1, 'pinch');
    
-- Shrimp Scampi
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(10, 5, 1, 'lb'),
    (10, 37, 8, 'oz'),
    (10, 25, 3, 'tablespoon'),
    (10, 13, 4, 'cloves'),
    (10, 52, 0.5, 'teaspoon'),
    (10, 72, 0.5, 'cup'),
    (10, 50, 1, 'lemon'),
    (10, 49, 1, 'lemon'),
    (10, 26, 1, 'pinch'),
    (10, 75, 1, 'pinch');
    
-- Classic Pancakes
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(11, 21, 1, 'cup'),
    (11, 22, 2, 'tablespoon'),
    (11, 27, 1, 'teaspoon'),
    (11, 69, 1, 'teaspoon'),
    (11, 73, 180, 'ml'),
    (11, 24, 0.25, 'cup'),
    (11, 23, 1, 'egg'),
    (11, 25, 2, 'tablespoon'),
    (11, 29, 1, 'teaspoon'),
	(11, 26, 0.25, 'teaspoon');
    
-- Blueberry Muffins
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	 (12, 21, 1.5, 'cup'),
     (12, 22, 0.5, 'cup'),
     (12, 27, 2, 'teaspoon'),
     (12, 69, 0.25, 'teaspoon'),
     (12, 26, 0.25, 'teaspoon'),
     (12, 25, 0.5, 'cup'),
     (12, 73, 160, 'ml'),
     (12, 23, 2, 'eggs'),
     (12, 29, 1, 'teaspoon'),
     (12, 38, 1.5, 'cups');
     
-- French Toast
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(13, 84, 4, 'Slices'),
    (13, 23, 2, 'eggs'),
    (13, 24, 0.5, 'cup'),
    (13, 29, 1, 'teaspoon'),
    (13, 74, 0.5, 'teaspoon');
    
-- Chocolate chip cookies
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(14, 25, 1, 'cup'),
    (14, 22, 150, 'g'),
    (14, 85, 150, 'g'),
    (14, 29, 1, 'teaspoon'),
    (14, 21, 280, 'g'),
    (14, 69, 1, 'teaspoon'),
    (14, 26, 0.5, 'teaspoon'),
    (14, 28, 2, 'cups');
    
-- Fruit Salad
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(15, 86, 2, 'cups'),
    (15, 87, 2, 'cups'),
    (15, 88, 2, 'cups'),
    (15, 89, 1, 'cup'),
    (15, 38, 1, 'cup'),
    (15, 90, 1, 'cup'),
    (15, 91, 1, 'cup'),
    (15, 92, 1, 'cup'),
    (15, 93, 2, 'tablespoons');
    
-- Apple Pie
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(16, 21, 2.75, 'cups'),
    (16, 25, 1, 'cup'),
    (16, 26, 160, 'g'),
    (16, 22, 1.25, 'tablespoon'),
    (16, 83, 7, 'tablespoon'),
    (16, 40, 6, 'apples'),
    (16, 85, 0.25, 'cup'),
    (16, 74, 1, 'teaspoon'),
    (16, 57, 0.25, 'teaspoon'),
    (16, 50, 1, 'tablespoon'),
    (16, 23, 1, 'egg'),
    (16, 24, 1, 'tablespoon');
    
-- Quinoa Salad
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(17, 7, 1, 'cup'),
    (17, 85, 2, 'cups'),
    (17, 70, 1, 'cup'),
    (17, 17, 1, 'cucumber'),
    (17, 15, 0.5, 'onion'),
    (17, 34, 0.25, 'cup'),
    (17, 30, 3, 'tablespoon'),
    (17, 50, 2, 'tablespoon'),
	(17, 26, 1, 'pinch'),
    (17, 75, 1, 'pinch'),
    (17, 53, 0.25, 'cup');
    
-- Lentil Curry
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(18, 18, 1, 'cup'),
    (18, 85, 3, 'cups'),
    (18, 14, 1, 'tablespoon'),
    (18, 15, 1, 'onion'),
    (18, 13, 3, 'cloves'),
    (18, 60, 1, 'tablespoon'),
    (18, 12, 14, 'oz'),
    (18, 94, 14, 'oz'),
    (18, 95, 2, 'tablespoons'),
    (18, 54, 1, 'teaspoon'),
    (18, 82, 1, 'teaspoon'),
    (18, 96, 0.5, 'teaspoon'),
    (18, 26, 1, 'pinch'),
    (18, 75, 1, 'pinch');


-- Quinoa Salad Recipe
INSERT INTO Recipe (RecipeName, Description, Instructions, PrepTime, CookTime, TotalTime, Servings)
VALUES (
    'Quinoa Salad',
    'A refreshing and nutritious quinoa salad with vegetables and feta cheese.',
    '1. Cook quinoa according to package instructions and let it cool.\n2. Mix quinoa with tomatoes, cucumber, red onion, parsley, and feta cheese.\n3. Whisk together olive oil, lemon juice, salt, and pepper.\n4. Toss the salad with the dressing.\n5. Serve chilled.',
    15,
    20,
    35,
    4
);

-- Lentil Curry Recipe
INSERT INTO Recipe (RecipeName, Description, Instructions, PrepTime, CookTime, TotalTime, Servings)
VALUES (
    'Lentil Curry',
    'A flavorful and hearty lentil curry with tomatoes and coconut milk.',
    '1. Cook lentils in vegetable broth or water until tender.\n2. Sauté onion, garlic, and ginger in olive oil until softened.\n3. Add curry powder, cumin, coriander, and turmeric; cook for 2 minutes.\n4. Add diced tomatoes and cook for 5 minutes.\n5. Pour in coconut milk and cooked lentils; simmer for 15-20 minutes.\n6. Season with salt and pepper.\n7. Serve over rice and garnish with cilantro.',
    20,
    40,
    1,
    4
);


delete from recipe where RecipeID=8;
delete from RecipeCategory where RecipeID=8;

 
select RecipeID, RecipeName from recipe order by RecipeID;
select RecipeName from Recipe;
delete from user where UserID=1;

-- Assuming Recipe, Ingredients, and RecipeIngredient are the table names
SELECT i.Name, r.RecipeName
FROM Recipe r
JOIN RecipeIngredient ri ON r.RecipeID = ri.RecipeID
JOIN Ingredient i ON ri.IngredientID = i.IngredientID;
select * from Ingredient;
select * from Recipe;

update Ingredient set Name='Cinnamon' where IngredientID=74;

INSERT INTO Recipe (RecipeName, Description, Instructions, PrepTime, CookTime, TotalTime, Servings)
VALUES
('Grilled Steak with Chimichurri Sauce',
    'Juicy grilled steak topped with a vibrant chimichurri sauce.',
    '1. Season steak with salt and pepper.\n2. Preheat grill to high heat.\n3. Grill steak to desired doneness, about 4-5 minutes per side.\n4. Let steak rest for a few minutes before slicing.\n5. Prepare chimichurri sauce by blending parsley, garlic, red wine vinegar, olive oil, salt, and pepper.\n6. Drizzle chimichurri sauce over sliced steak and serve.',
    15,
	10,
    25,
    2
),
 (
    'Spaghetti Bolognese',
    'Classic Italian pasta dish with a rich and savory meat sauce.',
    '1. In a pan, sauté onions, carrots, and celery until softened.\n2. Add ground beef and cook until browned.\n3. Stir in tomato paste, crushed tomatoes, oregano, basil, and red wine.\n4. Simmer for at least 30 minutes.\n5. Cook spaghetti according to package instructions.\n6. Serve Bolognese sauce over cooked spaghetti and garnish with grated Parmesan.',
    20 ,
    40 ,
    1 ,
    4 
),
(
    'Grilled Chicken Skewers',
    'Delicious and flavorful grilled chicken skewers perfect for any barbecue.',
    '1. Marinate chicken chunks in your favorite marinade for at least 30 minutes.\n2. Thread chicken onto skewers.\n3. Preheat grill to medium-high heat.\n4. Grill skewers for 12-15 minutes, turning occasionally.\n5. Serve hot and enjoy!',
    30 ,
    15 ,
    45 ,
    4 
),
(
    'BBQ Pulled Pork',
    'Slow-cooked pulled pork with smoky barbecue flavor, perfect for sandwiches or sliders.',
    '1. Rub pork shoulder with a mix of brown sugar, paprika, garlic powder, salt, and pepper.\n2. Place pork in a slow cooker and pour barbecue sauce over it.\n3. Cook on low for 8 hours until pork is tender and easily shredded.\n4. Shred the pork using forks and mix with the barbecue sauce.\n5. Serve pulled pork on buns or sliders with coleslaw.',
    15 ,
    8 ,
    8 ,
    6 
),
(
    'Baked Salmon with Dill Sauce',
    'Flaky baked salmon fillets topped with a creamy dill sauce.',
    '1. Preheat the oven and line a baking sheet with parchment paper.\n2. Season salmon fillets with salt, pepper, and a drizzle of olive oil.\n3. Bake the salmon until it flakes easily with a fork.\n4. In a small bowl, mix together Greek yogurt, fresh dill, lemon juice, salt, and pepper to create the dill sauce.\n5. Spoon the dill sauce over the baked salmon fillets before serving.\n6. Garnish with additional fresh dill.',
    10 ,
    15 ,
    25 ,
    4 
),
(
    'Grilled Lemon Garlic Butter Lobster Tails',
    'Delicious lobster tails grilled to perfection with a lemon garlic butter sauce.',
    '1. Preheat grill to medium-high heat.\n2. Cut lobster tails in half lengthwise.\n3. Mix melted butter, minced garlic, lemon juice, and chopped parsley.\n4. Brush lobster tails with the butter mixture.\n5. Grill lobster tails for 5-7 minutes until the meat is opaque.\n6. Serve with additional lemon wedges and butter sauce.',
    15 ,
    7 ,
    22 ,
    4 
),
(
    'Baked Lemon Garlic Butter Shrimp',
    'Tender shrimp baked in a flavorful lemon garlic butter sauce.',
    '1. Preheat the oven to 400°F (200°C).\n2. In a baking dish, combine shrimp, melted butter, minced garlic, lemon juice, and paprika.\n3. Bake for 12-15 minutes or until the shrimp is cooked through.\n4. Garnish with chopped parsley before serving.',
    10 ,
    12,
    25 ,
    4 
),
(
    'Coconut Shrimp Curry',
    'A flavorful shrimp curry with coconut milk, spices, and fresh herbs.',
    '1. In a pan, sauté onions, garlic, and ginger until fragrant.\n2. Add curry powder, turmeric, and cayenne pepper. Cook for a minute.\n3. Pour in coconut milk and simmer.\n4. Add shrimp and cook until they turn pink.\n5. Season with salt, pepper, and cilantro.\n6. Serve over rice.',
    15 ,
    15 ,
    30 ,
    4 
),
(
    'Spinach and Chickpea Curry',
    'A flavorful curry with spinach, chickpeas, and aromatic spices.',
    '1. In a pan, sauté onions, garlic, and ginger until softened.\n2. Add curry powder, cumin, coriander, and turmeric. Cook for a minute.\n3. Add chickpeas, diced tomatoes, and coconut milk. Simmer for 15-20 minutes.\n4. Stir in fresh spinach and cook until wilted.\n5. Season with salt and pepper.\n6. Serve over rice or with naan bread.',
    15 ,
    20 ,
    35 ,
    4 
),
 (
    'Quinoa-Stuffed Bell Peppers',
    'Colorful bell peppers stuffed with quinoa, black beans, corn, and vegetables.',
    '1. Preheat oven to 375°F (190°C).\n2. Cook quinoa according to package instructions.\n3. In a bowl, mix cooked quinoa with black beans, corn, diced tomatoes, and spices.\n4. Cut bell peppers in half and remove seeds. Stuff with quinoa mixture.\n5. Place stuffed peppers in a baking dish and bake for 25-30 minutes.\n6. Garnish with fresh cilantro before serving.',
    20,
    30 ,
    50 ,
    4 
),
(
    'Lentil and Vegetable Stew',
    'A hearty stew with lentils, assorted vegetables, and aromatic herbs.',
    '1. In a large pot, sauté onions, carrots, and celery until softened.\n2. Add lentils, vegetable broth, diced tomatoes, and herbs. Simmer for 30-40 minutes.\n3. Add chopped vegetables such as potatoes, bell peppers, and zucchini.\n4. Continue simmering until all vegetables are tender.\n5. Season with salt and pepper.\n6. Serve hot with crusty bread.',
    15 ,
    40 ,
    55 ,
    6 
),
(
    'Vegan Chickpea and Sweet Potato Curry',
    'A delicious and nutritious curry with chickpeas, sweet potatoes, and coconut milk.',
    '1. In a pan, sauté onions, garlic, and ginger until fragrant.\n2. Add curry powder, cumin, and paprika. Cook for a minute.\n3. Stir in diced sweet potatoes, chickpeas, and coconut milk. Simmer until sweet potatoes are tender.\n4. Season with salt and pepper.\n5. Garnish with fresh cilantro before serving.\n6. Serve over rice or quinoa.',
    20,
    25 ,
    45 ,
    4 
),
(
    'Baked Lemon Herb Chicken',
    'Juicy chicken breasts baked with a flavorful lemon herb marinade.',
    '1. Preheat oven to 375°F (190°C).\n2. Mix olive oil, lemon juice, minced garlic, chopped herbs, salt, and pepper to create the marinade.\n3. Coat chicken breasts with the marinade and let them marinate for at least 30 minutes.\n4. Place chicken in a baking dish and bake for 25-30 minutes or until cooked through.\n5. Garnish with additional herbs and lemon slices before serving.',
    15 ,
    25 ,
    45,
    4 
),
(
    'Grilled Honey Mustard Chicken',
    'Tender chicken thighs grilled to perfection with a sweet and tangy honey mustard glaze.',
    '1. Preheat grill to medium-high heat.\n2. Mix honey, Dijon mustard, soy sauce, and minced garlic to create the marinade.\n3. Coat chicken thighs with the marinade and let them marinate for at least 30 minutes.\n4. Grill chicken for 5-6 minutes per side or until fully cooked.\n5. Baste with additional honey mustard glaze while grilling.\n6. Serve with your favorite side dishes.',
    15 ,
    12 ,
    27 ,
    4 
),
(
    'Teriyaki Chicken Stir-Fry',
    'A quick and flavorful stir-fry featuring teriyaki-marinated chicken and fresh vegetables.',
    '1. Slice chicken breast into strips and marinate in teriyaki sauce for at least 15 minutes.\n2. In a wok or skillet, stir-fry marinated chicken until cooked through.\n3. Add sliced bell peppers, broccoli, and snap peas. Stir-fry until vegetables are tender-crisp.\n4. Pour in additional teriyaki sauce and toss to coat.\n5. Serve over steamed rice or noodles.',
    20,
    15 ,
    35 ,
    4 
),
(
    'Lemon Garlic Roast Chicken',
    'A classic roast chicken infused with zesty lemon and aromatic garlic.',
    '1. Preheat oven to 375°F (190°C).\n2. Rub chicken with a mixture of minced garlic, lemon zest, lemon juice, olive oil, and herbs.\n3. Place the seasoned chicken in a roasting pan and roast for 1 to 1.5 hours or until golden brown and fully cooked.\n4. Baste with pan juices during roasting.\n5. Let the chicken rest before carving.\n6. Serve with roasted vegetables or your favorite sides.',
    20 ,
    1 ,
    1,
    4
),
(
    'Vegetable Fried Rice',
    'A delicious and colorful fried rice with mixed vegetables and soy sauce.',
    '1. Cook rice according to package instructions and let it cool.\n2. In a wok or skillet, heat oil and sauté diced vegetables (carrots, peas, corn, and green onions).\n3. Push the vegetables to one side and scramble eggs in the other side of the wok.\n4. Mix cooked rice into the wok with vegetables and eggs.\n5. Add soy sauce and stir-fry until everything is well combined.\n6. Garnish with additional green onions before serving.',
    20 ,
    15 ,
    35 ,
    4 
),
(
    'Chicken Alfredo Tortellini',
    'Creamy Alfredo sauce with cheese-filled tortellini and tender chicken.',
    '1. Cook cheese tortellini according to package instructions.\n2. In a pan, sauté diced chicken until cooked through.\n3. Prepare Alfredo sauce by combining butter, heavy cream, and Parmesan cheese. Stir until smooth.\n4. Mix cooked tortellini and chicken into the Alfredo sauce.\n5. Garnish with chopped parsley and additional Parmesan before serving.',
    15 ,
    20,
    35 ,
    4
),
(
    'Shrimp Fried Rice',
    'A tasty fried rice dish with succulent shrimp, vegetables, and soy sauce.',
    '1. In a wok or skillet, sauté diced vegetables (bell peppers, peas, carrots, and onions) until tender.\n2. Add peeled and deveined shrimp to the wok and cook until pink.\n3. Push the vegetables and shrimp to one side, and scramble eggs in the other side.\n4. Mix cooked rice into the wok with vegetables, shrimp, and eggs.\n5. Pour soy sauce over the mixture and stir-fry until well combined.\n6. Garnish with sliced green onions before serving.',
    20 ,
    15 ,
    35 ,
    4 
),
 (
    'Chicken Tikka Masala',
    'A popular Indian dish with grilled chicken in a rich and creamy tomato sauce.',
    '1. Marinate chicken pieces in yogurt, ginger, garlic, and spices for at least 1 hour.\n2. Grill or bake the marinated chicken until fully cooked.\n3. In a pan, sauté onions, tomatoes, and spices until a thick sauce forms.\n4. Add grilled chicken to the sauce and simmer for 15-20 minutes.\n5. Stir in heavy cream and garnish with fresh cilantro.\n6. Serve over basmati rice or with naan bread.',
    1 ,
    20 ,
    1 ,
    4 
),
(
    'Beef Stir-Fry with Broccoli',
    'A savory Chinese stir-fry with thinly sliced beef and crisp broccoli.',
    '1. Slice beef into thin strips and marinate with soy sauce, garlic, and ginger.\n2. In a wok or skillet, stir-fry marinated beef until browned. Set aside.\n3. Stir-fry broccoli, bell peppers, and onions until tender-crisp.\n4. Combine cooked beef with the vegetables in the wok.\n5. Pour in a mixture of soy sauce, oyster sauce, and sesame oil. Toss to coat.\n6. Serve over steamed rice.',
    30 ,
    15,
    45 ,
    4
),
(
    'Italian Margherita Pizza',
    'A classic Italian pizza topped with fresh tomatoes, mozzarella, and basil.',
    '1. Preheat your oven and pizza stone to the highest temperature.\n2. Roll out pizza dough and place it on a floured surface.\n3. Spread tomato sauce on the dough, add sliced fresh tomatoes, mozzarella, and fresh basil leaves.\n4. Transfer the pizza to the preheated stone and bake until the crust is golden and the cheese is melted.\n5. Remove from the oven, drizzle with olive oil, and sprinkle with salt.\n6. Slice and enjoy!',
    20 ,
    10 ,
    30 ,
    2 
),
(
    'Japanese Chicken Teriyaki',
    'A flavorful Japanese dish featuring grilled chicken glazed with teriyaki sauce.',
    '1. Marinate chicken thighs in a mixture of soy sauce, sake, mirin, and sugar.\n2. Grill or pan-fry marinated chicken until fully cooked.\n3. In a saucepan, simmer the remaining marinade until it thickens into a teriyaki glaze.\n4. Brush the teriyaki glaze over the grilled chicken.\n5. Serve the teriyaki chicken over steamed rice.\n6. Garnish with sesame seeds and chopped green onions.',
    1 ,
    15 ,
    1 ,
    4
),
 (
    'Quinoa Salad with Chickpeas',
    'A refreshing and nutritious salad featuring quinoa, chickpeas, and colorful vegetables.',
    '1. Rinse quinoa thoroughly and cook it according to package instructions.\n2. In a large bowl, combine cooked quinoa, canned chickpeas, cherry tomatoes, cucumber, red onion, and fresh parsley.\n3. In a small bowl, whisk together olive oil, lemon juice, salt, and pepper to create the dressing.\n4. Pour the dressing over the salad and toss to combine.\n5. Chill in the refrigerator before serving.\n6. Garnish with feta cheese before serving if desired.',
    15 ,
    15 ,
    30 ,
    4 
),


 
(
    'Brown Rice and Black Bean Burrito Bowl',
    'A satisfying and nutritious burrito bowl with brown rice, black beans, and fresh toppings.',
    '1. Cook brown rice according to package instructions.\n2. In a bowl, combine cooked brown rice, canned black beans (rinsed and drained), corn, diced tomatoes, avocado slices, and cilantro.\n3. Drizzle with lime juice and season with cumin, chili powder, and salt.\n4. Toss everything together until well combined.\n5. Serve the burrito bowl with your favorite salsa or hot sauce.',
    20 ,
    15 ,
    35,
    4 
),
(
    'Couscous with Roasted Vegetables',
    'A flavorful dish featuring couscous with roasted vegetables like bell peppers, zucchini, and cherry tomatoes.',
    '1. Prepare couscous according to package instructions.\n2. Toss diced bell peppers, zucchini, and cherry tomatoes with olive oil, salt, and pepper.\n3. Roast the vegetables in the oven until they are tender and slightly charred.\n4. Mix the roasted vegetables with cooked couscous.\n5. Drizzle with balsamic glaze or vinaigrette for added flavor.\n6. Garnish with fresh herbs before serving.',
    15 ,
    20 ,
    35 ,
    4 
),
(
    'Classic Omelette',
    'A simple and versatile omelette with eggs, cheese, and your favorite fillings.',
    '1. Beat eggs in a bowl and season with salt and pepper.\n2. Heat a non-stick skillet over medium heat and add a knob of butter.\n3. Pour beaten eggs into the skillet and let them set slightly.\n4. Add cheese and desired fillings (e.g., diced vegetables, ham, or herbs) to one half of the omelette.\n5. Fold the other half over the fillings and cook until the eggs are fully cooked.\n6. Slide the omelette onto a plate and serve hot.',
    10 ,
    5 ,
    15 ,
    1
),
(
    'Blueberry Pancakes',
    'Delicious and fluffy pancakes studded with fresh blueberries.',
    '1. In a bowl, mix together flour, baking powder, sugar, and a pinch of salt.\n2. In a separate bowl, whisk together milk, eggs, and melted butter.\n3. Pour the wet ingredients into the dry ingredients and stir until just combined.\n4. Gently fold in fresh blueberries.\n5. Heat a griddle or non-stick pan and ladle batter to make pancakes.\n6. Cook until bubbles form on the surface, then flip and cook until golden brown.\n7. Serve with maple syrup and extra blueberries.',
    15,
    15 ,
    30 ,
    4 
),
(
    'Avocado Toast with Poached Eggs',
    'A trendy and nutritious breakfast featuring creamy avocado and perfectly poached eggs on toasted bread.',
    '1. Toast slices of your favorite bread.\n2. Mash ripe avocados and spread them onto the toasted bread.\n3. Poach eggs until the whites are set but the yolks are still runny.\n4. Place the poached eggs on top of the avocado toast.\n5. Season with salt, pepper, and optional toppings like chili flakes or fresh herbs.\n6. Serve immediately for a delicious and satisfying breakfast.',
    10 ,
    5 ,
    15,
    2
),
 (
    'Banana Walnut Muffins',
    'Moist and flavorful muffins made with ripe bananas and crunchy walnuts.',
    '1. Preheat your oven and line a muffin tin with paper liners.\n2. In a bowl, mash ripe bananas and mix with melted butter, sugar, and beaten eggs.\n3. In a separate bowl, combine flour, baking soda, baking powder, and chopped walnuts.\n4. Fold the dry ingredients into the banana mixture until just combined.\n5. Divide the batter into the muffin cups and bake until golden brown.\n6. Allow the muffins to cool before serving.',
    15 ,
    20 ,
    35 ,
    12
),
(
    'Chocolate Fondue',
    'A decadent and fun dessert featuring melted chocolate for dipping various fruits and treats.',
    '1. In a double boiler or microwave, melt a combination of dark and milk chocolate.\n2. Stir in a splash of heavy cream to achieve a smooth and creamy consistency.\n3. Prepare a variety of dipping items like strawberries, banana slices, marshmallows, and pretzels.\n4. Set up a fondue pot and keep the melted chocolate warm.\n5. Dip and enjoy the delicious treats in the melted chocolate.',
    10 ,
    5,
    15 ,
    4 
),
 (
    'Strawberry Shortcake',
    'A classic dessert with layers of sweet biscuits, fresh strawberries, and whipped cream.',
    '1. Prepare sweet biscuits by mixing flour, sugar, baking powder, and butter. Form into rounds and bake until golden.\n2. Slice fresh strawberries and toss them with sugar to create a juicy strawberry compote.\n3. Whip heavy cream until stiff peaks form.\n4. Assemble the shortcakes by layering biscuits, strawberry compote, and whipped cream.\n5. Garnish with additional strawberries on top.\n6. Serve immediately for a delightful dessert.',
    20 ,
    15 ,
    35,
    4
),
(
    'Tiramisu',
    'An elegant and classic Italian dessert made with layers of coffee-soaked ladyfingers and mascarpone cream.',
    '1. Brew strong coffee and let it cool.\n2. In a bowl, combine mascarpone cheese, sugar, and vanilla extract to make the cream filling.\n3. Dip ladyfingers into the cooled coffee and layer them in a dish.\n4. Spread a layer of mascarpone cream over the ladyfingers.\n5. Repeat the layers, finishing with a dusting of cocoa powder on top.\n6. Refrigerate for a few hours before serving to allow flavors to meld.',
    30,
    0 ,
    4 ,
    6 
),

(
    'Cheesecake with Berry Compote',
    'A rich and creamy cheesecake topped with a vibrant berry compote.',
    '1. Prepare a graham cracker crust and press it into the base of a springform pan.\n2. In a mixing bowl, beat cream cheese, sugar, and vanilla until smooth.\n3. Add eggs one at a time, mixing well after each addition.\n4. Pour the cream cheese mixture over the crust and bake until set.\n5. While the cheesecake cools, prepare a compote by simmering mixed berries with sugar.\n6. Once the cheesecake is cooled, top it with the berry compote.\n7. Chill in the refrigerator before serving.',
    20 ,
    45 ,
    1 ,
    8
);
select * from ingredient;
insert into ingredient(Name)
values
	('Ground Beef'),
    ('Celery '),
    ('Tomato paste'),
   ('Pork'),
   ('Chili powder'),
   ('Dill'),
   ('Lobester '),
   ('Red Curry Paste'),
   ('Garam Masala'),
   ('Sweet Potato'),
   ('Rosemary'),
   ('Mirin'),
   ('Thyme'),
   ('Yogurt'),
   ('Yeast'),
   ('Mint'),
   ('Couscous');
   
INSERT INTO RecipeIngredient (RecipeID, IngredientID, Quantity, Unit)
VALUES
	(20, 97, 1, 'lbs'),
    (20,98 , 1, 'stalk'),
    (20, 99, 1, 'teaspoon'),
    (22, 100, 3, 'lbs'),
    (22, 101, 1, 'teaspoon'),
    (23, 102, 1, 'teaspoon'),
    (24, 103, 4, 'tail'),
    (26, 104, 2, 'tablespoon'),
    (27, 105, 1, 'teaspoon'),
    (30, 106, 2, 'piece'),
    (31, 107, 1, 'teaspoon'),
    (33, 108, 0.25, 'cup'),
    (34, 109, 2, 'tablespoon'),
    (38, 110, 1, 'cup'),
    (40, 111, 1, 'tablespoon'),
    (42, 112, 0.25, 'cup'),
    (44, 113, 1, 'cup');
    