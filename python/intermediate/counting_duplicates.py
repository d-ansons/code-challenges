# Return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once.

# Whiteboarding:
# abcdeaa - abcde / aa
# abcdeaB

def duplicate_count(text):
    counter = set()
    seen = []
    for i in text.lower():
        if i in seen:
            counter.add(i)
        else:
            seen.append(i)
    return len(counter)