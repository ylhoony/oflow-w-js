# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ first_name: "Test", last_name: "User", email: "test@test.com", password: "nononono", password_confirmation: "nononono" },
                     {first_name: "John", last_name: "Doe", email: "jd@jd.com", password: "nononono", password_confirmation: "nononono"},
                     {first_name: "Paul", last_name: "Parker", email: "pp@pp.com", password: "nononono", password_confirmation: "nononono"}])

currencies = Currency.create([{ name: "US Dollar", code_alpha: "USD", code_numeric: "840", active: true },
                              { name: "Australian Dollar", code_alpha: "AUD", code_numeric: "036", active: true }, 
                              { name: "Canadian Dollar", code_alpha: "CAD", code_numeric: "124", active: true },     
                              { name: "French franc", code_alpha: "FRF", code_numeric: "250", active: false },
                              { name: "South Korean Won", code_alpha: "KRW", code_numeric: "410", active: true }])

countries = Country.create([{ name: "United States", alpha_2_code: "US", alpha_3_code: "USA", numeric_code: "840", active: true},
                            { name: "Korea, Republic of", alpha_2_code: "KR", alpha_3_code: "KOR", numeric_code: "410", active: true },
                            { name: "Germany", alpha_2_code: "DE", alpha_3_code: "DEU", numeric_code: "276", active: true },
                            { name: "Canada", alpha_2_code: "CA", alpha_3_code: "CAN", numeric_code: "124", active: true },
                            { name: "Australia", alpha_2_code: "AU", alpha_3_code: "AUS", numeric_code: "036", active: true }])

payment_options = PaymentOption.create([{ name: "day(s) after invoice date", active: true },
                                        { name: "of the month following invoice date", active: true },
                                        { name: "end of month", active: true },
                                        { name: "of the current month", active: true },
                                        { name: "day(s) after the end of the invoice month", active: true }])

company = Company.create(name: "Test Company", currency_id: 1, country_id: 1, active: true)
company.employees.create(user_id: 1, job_title: "Director", admin: true, active: true)
User.first.current_company = company

Company.first.company_addresses.create([{ name: "Test Company", attention: "Joe Brown", address_line_1: "4321 Marine Drive", address_line_2: "", city: "Blaine", state: "WA", country_id: 1, postal_code: "943834", phone: "854843843843", email: "sales@test.com", fax: "548329843284", active: true }])
Company.first.company_contacts.create([{ first_name: "Galileo", last_name: "Nightmare", job_title: "Sales", email: "gn@test.com", phone: "328432843822", comment: "", active: true }])

order_statuses = OrderStatus.create([{ name: "Ordered"}, { name: "Received"}, {name: "Shipped"} ])


payment_terms = PaymentTerm.create([{ name: "Net 30", company_id: 1, trade_credit_percent: 0, trade_credit_days: 0, date_days: 30, payment_option_id: 1, active: true}])

product_categories = ProductCategory.create([{ company_id: 1, name: "Toys", active: true },
                                             { company_id: 1, name: "Cars", active: true },
                                             { company_id: 1, name: "Airplane", active: false }])

product_groups = ProductGroup.create([{ product_category_id: 1, name: "Lego", active: true },
                                      { product_category_id: 1, name: "Barbie", active: true },
                                      { product_category_id: 1, name: "Disney", active: false },
                                      { product_category_id: 2, name: "Sedan", active: true },
                                      { product_category_id: 2, name: "SUV", active: true }])

freight_terms = FreightTerm.create([{ company_id: 1, name: "FOB", active: true },
                                    { company_id: 1, name: "EXW", active: true },
                                    { company_id: 1, name: "DDP", active: false },])



tags = Tag.create([{ company_id: 1, name: "Kids" }, { company_id: 1, name: "Angry Birds" }, { company_id: 1, name: "City" }, { company_id: 1, name: "Movies" }, { company_id: 1, name: "Science Fiction"} ])

warehouses = Warehouse.create([{ company_id: 1, name: "Warehouse WA", attention: "Johnn Doe", address_line_1: "123 Broadway", address_line_2: "Unit 1", city: "Seattle", state: "WA", country_id: 1, postal_code: "12345", email: "wa@whse.co", phone: "123445223", fax: "21343112", active: true },
                               { company_id: 1, name: "Warehouse NY", attention: "Laura Jane", address_line_1: "4379 Broadway", address_line_2: "2135", city: "New York", state: "NY", country_id: 1, postal_code: "12345", email: "ny@whse.co", phone: "9873428532", fax: "624332532", active: true }])


customers = Customer.create([{ company_id: 1 , name: "Toy Story", tax_id_number: "R321393-4232", comment: "Big one", payment_term_id: 1, currency_id: 1, warehouse_id: 1, active: true },
                             { company_id: 1 , name: "Fun Toys", tax_id_number: "32433-23293-4232", comment: "", payment_term_id: 1, currency_id: 1, warehouse_id: 2, active: true },])

Customer.first.account_addresses.create([{ company_name: "Toy Story HQ", attention: "Max", address_line_1: "423 Main St.", address_line_2: "Unit 123", city: "Seattle", state: "WA", country_id: 1, postal_code: "93283", email: "store@toystory.com", phone: "329488239232", fax: "586938343", comment: "", active: true }])
Customer.last.account_addresses.create([{ company_name: "Fun Toys Texas", attention: "Emily", address_line_1: "194 6th Ave.", address_line_2: "B-1023", city: "Houston", state: "TX", country_id: 1, postal_code: "87483", email: "store@funtoys.com", phone: "535343432", fax: "856564453", comment: "A class", active: true }])


suppliers = Supplier.create([{ company_id: 1 , name: "Brick & Mortar Inc.", tax_id_number: "KLP-43434252", comment: "", payment_term_id: 1, currency_id: 1, warehouse_id: 1, active: true },
                             { company_id: 1 , name: "Cool Gadgets Company", tax_id_number: "OPP-3232424", comment: "Low Quality", payment_term_id: 1, currency_id: 1, warehouse_id: 2, active: true },])

Supplier.first.account_addresses.create([{ company_name: "B&M Factory", attention: "Gio", address_line_1: "53414 Broadway", address_line_2: "Unit 123", city: "San Diego", state: "CA", country_id: 1, postal_code: "93283", email: "order@bnm.co", phone: "532474453", fax: "6357346345", comment: "", active: true }])
Supplier.last.account_addresses.create([{ company_name: "Cool Material", attention: "Vix", address_line_1: "2384 10th Ave.", address_line_2: "B-1023", city: "New York", state: "NY", country_id: 1, postal_code: "53243", email: "order@cm.com", phone: "746453453", fax: "635344536", comment: "", active: true }])

uoms = UnitOfMeasure.create([{ company_id: 1, name: "Each", active: true }, { company_id: 1, name: "Case", active: true }, { company_id: 1, name: "Unit", active: false } ])



products = Product.create([{ company_id: 1, product_group_id: 1, sku: "75823", name: "Bird Island Egg Heist", price: 39.99, unit_of_measure_id: 1 },
                          { company_id: 1, product_group_id: 1, sku: "75822", name: "Piggy Plane Attack", price: 24.99, unit_of_measure_id: 1 },
                          { company_id: 1, product_group_id: 1, sku: "75202", name: "Defense of Crait™", price: 99.99, unit_of_measure_id: 1 },
                          { company_id: 1, product_group_id: 1, sku: "75201", name: "First Order AT-ST™", price: 49.99, unit_of_measure_id: 1 },
                          { company_id: 1, product_group_id: 2, sku: "136985876", name: "Barbie Fashionistas Dolls - Cheerful Check", price: 14.99, unit_of_measure_id: 1 },
                          { company_id: 1, product_group_id: 3, sku: "3640544", name: "Toy Story Collection - Buzz Lightyear", price: 74.99, unit_of_measure_id: 1 }])


product_tags = ProductTag.create([{ product_id: 1, tag_id: 2}, { product_id: 1, tag_id: 1}, { product_id: 1, tag_id: 2}, { product_id: 3, tag_id: 4}, { product_id: 3, tag_id: 5} ])









