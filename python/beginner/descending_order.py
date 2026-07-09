# Take any non-negative integer as an argument and return it with its digits in descending order.

# Whiteboarding
# 1st I need to conver the number to a list and sort it in reverse order.
# Then I need to join the list back into a string and convert the output to an int.

def descending_order(nums):
    return int("".join(sorted([x for x in str(nums)], reverse=True)))
