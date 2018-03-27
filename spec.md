# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project => Used Rails 5.1.5 
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) => Most association is has_many/belongs_to
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User) => Most association is has_many/belongs_to
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients) => product vs. tag (through product_tag), and company vs. user (through employee)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity) => done with product_tag
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) => set the basic validation on most model
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) => reports/sales_by_products
- [x] Include signup (how e.g. Devise) => done
- [x] Include login (how e.g. Devise) => done
- [x] Include logout (how e.g. Devise) => done
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) => done / google_oauth2
- [x] Include nested resource show or index (URL e.g. users/2/recipes) => customers/1/account_addresses
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients) => customers/1/account_addresses/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) => most can do this. 

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
