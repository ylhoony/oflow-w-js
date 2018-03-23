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





order_statuses = OrderStatus.create([{ name: "Ordered"}, { name: "Received"}, {name: "Shipped"} ])
