# Take a Ten Minutes Walk

# Create a function that will return ture if the walk is exactly ten minutes and returns you to your starting point.

def is_valid_walk(walk):
    return walk.count('n') == walk.count('s') and walk.count('e') == walk.count('w') and len(walk) == 10