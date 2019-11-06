# Geeky Exchange

## Identification of the problem you are trying to solve by building this particular marketplace app / Why is it a problem that needs solving?
This marketplace is aiming to solve the problem of when searching for pop culture goods, there are many places to look. The websites that sell these goods are usually new goods in the case of businesses or places like the Facebook Marketplace were second hand/pre-owned goods are found. By using my marketplace app (Geeky Exchange) the new goods sold by businesses and the second hand goods can be combined into one place. This makes the search easier and payments are processed in one place. 

## URL
https://secure-fortress-69572.herokuapp.com/

## GitHub repository
https://github.com/reneenilsen/shopper

## Description of your marketplace app (website), including:
- Purpose
- Functionality / features
- Sitemap
- Screenshots
- Target audience
- Tech stack (e.g. html, css, deployment platform, etc)

The purpose of Geeky Exchange is to combine businesses and general users the ability post pop culture goods for sale on a single platform. 

Features include:
-	Sign in with authentication
-	Sign up with authentication
-	Product authorisation
    * Add product (condition “new” for admin and condition “pre-owned” for general users)
    * Full CRUD method for self-posted products and all products as an admin
    * Full CRUD method for categories if an admin 
-	Search products
-	Shopping cart functionality when signed in with authentication
-	Stripe check out when signed in with authentication (This 3rd party app is use so Geeky Exchange does not need to record the customers payment details or their shopping address making the app more secure)
-	Images uploaded to Cloudinary
-	View within a category/fandom through single view of product

Possible extra features

-	Top navigation bar to list products by category/fandom
-	Implement split payments through stripe to assign money to individual sellers
-	As an admin assign users to admin roles if needed (currently done through rails console)
-	Buyer reviews on products
-	Implement product recommendations based on bought before products

The app will allow users to view all available products, as a list and as individual product, view list of products by fandom and use the search feature. The user however will need to log in to use the shopping cart. The cart can be, viewed updated and emptied by the user. Users then can check out their cart and pay by using Stripe as third party payment system. 

Signed in users are able to create products then are able to view, edit and destroy their products. The creation of a product includes a title, description, price, image, quantity and selection of a category. Users with an admin authorisation when a product is created, a condition of ‘New’ is assigned where as a general user’s product is created with a condition of ‘Pre-Owned’.  An admin is also authorised to edit and destroy general user’s products if deemed inappropriate.  Admin also have the ability to create and destroy categories.

Signed in users can also just purchase without creating any products of their own. The footer is a copyright symbol and the name of the creator as well as year created.

![sitemap](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/Untitled%20Document.png "Sitemap")

## Home Page
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/1.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/2.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/3.png "screenshot")

## Admin Home Page
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/4.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/5.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/6.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/7.png "screenshot")

## General User Home Page
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/8.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/9.png "screenshot")

## Product View
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/10.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/11.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/12.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/13.png "screenshot")

## Add New Product
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/14.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/15.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/16.png "screenshot")

## Shopping Cart
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/17.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/18.png "screenshot")
![screenshot](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/19.png "screenshot")

The target audience for Geeky Exchange are those wishing to view a range of new and second hand pop culture products in the one platform and using one system to check out and pay.

The tech stack used for Geeky Exchange are:
-	HTML, SCSS and Ruby through Visual Studio Code
-	Ruby on Rails framework
-	Database through PostgreSQL
-	GitHub version control
-	Heroku for deployment
-	Gems
    * Devise
    * Rolify
    * Clouldinary
    * Stripe

## User Stories
![user stories](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/user_stories.png "user stories")

Order of importance

Red – High / Yellow – Medium / Green – Low / Blue – Optional extras/extended features

## Wireframes

## ERD/Provide your database schema design

![ERD](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/Database%20ER%20Diagram%20(Crow's%20Foot)%20(2).png "ERD")

## Explain the different high-level components (abstractions) in your app

Models
-	User
    * The user model contains the personal information of an email and the encrypted password of a user. 
-	Role
    * The role model contains the names of the roles assigned to the users (user and admin)
-	Product
    * The product model contains the title, description, price, quantity, condition (“new” if admin and “Pre-owned” if general user) as well as the user_id and the category_id as a foreign key.
-	Cart
    * Cart model contains the user_id so the cart can be matched with the current user.
-	Category
    * The category model contains the name of the category as well as the user_id of the user who created it. This is added so that we can see which admin has made which categories.
-	Cart_product
    * The cart_product model is the joining table between cart and product. The model contains the product_id that has been added and the quantity of that product that has been added. 

Controllers
-	Cart_products
    * This controller sets up the cart. If a user doesn’t have a cart, it will create one. The products are added and the notice messages are displayed when an item is added or there is an error. The controller will add the product that product_id to the cart if it doesn’t already exist else it will increment the quantity. The destroy action will destroy the instance of that product in cart_product. 
-	Carts
    * The cart destroy action will clear all product instances in the cart_product. 
-	Categories
    * The controller for categories is the full CRUD method available only to admin. The creation of a category assigns the current user_id to the category
-	Products
    * Products controller has the full CRUD method for authenticated users who own the product or are an admin. The creation of a product assigns the current user_id to the product. The controller also has a search to the products for an exact, down cased or like search of the inputted data. 

Views
-	Carts
    * The view of cart is all the products contained within the cart_products. The buttons include removing a product which will destroy the instance in cart_products, empty cart button will destroy all product instances in the cart_product and keep shopping redirect to the products index.
-	Categories
    * Categories index can be viewed only by admins and are in a list view with edit and destroy methods. Admins are also able to create through a button on the categories view and from the navigation bar. 
-	Products
    * The products are displayed in a list on the index page and edit and destroy buttons are available if the current user is the owner or has the role of admin. Clicking on the image or the ‘… show more’ link on the description redirects to the products individual listing. The buttons for edit and destroy are also available to the authorised user. The page also contains a button for adding the product to the cart. This will add an instance of the product to the cart_product model and increment if there is already an instance else will just add an instance. Under the description there is a link to the products category, on click it redirects to all products with that category. 

## Detail any third party services that your app will use

Github was used for version control throughout the time of creating the marketplace app.

Heroku for testing and deployment of the app to the public.

Gems used:
-	Devise for creating the users and authenticating users 
-	Rolify for creating roles of the users and authorising their actions on the app
-	Clouldinary for cloud based storage of uploaded product images
-	Stripe for check out and secure payment

## Describe your projects models in terms of the relationships (active record associations) they have with each other / Discuss the database relations to be implemented in your application

User Model
-	Devise works within the User model in order to register and authenticate users
-	has_many :products, dependent: :destroy
    * A user is able to have many products but is able to exist without having any products. A user can just buy and never sell if wanted. If the user is destroyed all of their products will also be destroyed
-	has_many :categories
    * An admin user can have many categories, a general user cannot have categories
-	has_one :cart, dependent: :destroy
    * A user can only have one cart. This cart references the current users id, when a user is destroyed so is their cart.

Role Model
-	has_and_belongs_to_many :users, :join_table => :users_roles
    * Through Rolify the join table holds data for authorising actions on the users. This includes the admin role for CRUD method on all products. 

Product Model
-	belongs_to :category
    * A product must belong to a category. This ensures that the individual product view category and the product listings category link is useful.
-	belongs_to :user
    * Makes sure a product has a user, a product cannot be user identity-less. Payment would be processed on the app and a user-less product would cause many issues. 
-	has_one_attached :image
    * Informs the model to expect an image 
-	has_many :cart_products, dependent: :destroy
    * A product can appear in many user’s carts through the cart_product model. When a product is destroyed, all of that products in other user’s carts are destroyed.
-	before_commit :add_default_image
    * This checks if an image has been attached to the product and if not before committing a default image will be attached

![add_default_img_code](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/add_default_img_code.png "add_default_img_code")

Category Model
-	belongs_to :user 
    * The category belongs to a user with an admin role
-	has_many :products, dependent: :destroy
    * A category can have many products associated with it. When the category is destroyed, the products associated with it are also destroyed. 

Cart Model
-	belongs_to :user
    * A cart can only belong to one user with the user id associated with it.
-	has_many :cart_products, dependent: :destroy
    * A cart can have many cart_products. The cart when destroyed, destroy the cart_products.
-	has_many :products
    * The cart has many products using the cart_products join table. 

Cart_Product Model
-	belongs_to :cart
    * The cart_product can only belong to the user’s cart it is assigned to.
-	belongs_to :product
    * The cart_product can only belong to the product it is assigned to.

## Describe the way tasks are allocated and tracked in your project

Tasks for the Geeky Exchange were tracked through Trello. Tasks like identifying a problem for the marketplace app and base functionality were started and completed before base functions of the app were started. This allows for a clear view of the task and Trello allows the cards to be moved to a Completed column on completion. 

![before_coding](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/before_coding.png "before_coding")

After the initial task were completed the tasks were assigned an order of importance from high to low as well as option extras that could be implemented in the future. 

![user_stories](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/user_stories.png "user_stories")

Order of importance

Red – High / Yellow – Medium / Green – Low / Blue – Optional extras/extended features

During and after coding was complete the various pre-coding elements were updated and changed such as the ERD and the wireframes when the project deviated slightly. Models were also updated with addition fields as needed.  



