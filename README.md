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
-	Stripe check out when signed in with authentication 
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

Signed in users can also just purchase without creating any products of their own. The footer includes link adding a new product and view/create categories as an admin. 

![sitemap](https://github.com/reneenilsen/shopper/blob/master/app/assets/images/Untitled%20Document.png "Sitemap")


