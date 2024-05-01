import pandas as pd

restaurants_data = {
    'restaurant_id': [1, 2, 3],
    'restaurant_name': ['McDonalds', 'ShakeShack', 'Chick Fil A']
}

restaurants_df = pd.DataFrame(restaurants_data)

menu_data = {
    'food_id': [1, 2, 3, 4, 5],
    'food_name': ['Big Mac', 'McChicken', 'ShackBurger', 'SmokeShack', 'Chick-fil-A Deluxe Sandwich'],
    'food_price': [7.99, 3.89, 7.39, 8.99, 6.69],
    'restaurant_id': [1, 1, 2, 2, 3]
}
menu_df = pd.DataFrame(menu_data)

all_data = pd.merge(restaurants_df, menu_df, on='restaurant_id')
print(all_data)