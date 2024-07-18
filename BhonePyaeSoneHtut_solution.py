# Profile Setup
def studentname(myName, myEmail, myBBUsername):
    myName = "Bhone Pyae Sone Htut"
    myEmail = "htutbhone589@gmail.com"
    myBBUsername = "2089YNMQ"
    return myName, myEmail, myBBUsername

# Task 3: Define Functions

# Question 1: Calculate Average
def calAverage(numbers):
    if not numbers:
        return 0.00
    result = sum(numbers) / len(numbers)
    return round(result, 2)

# Question 2: Count Characters
def countCharacter(sentence):
    total_letters = sum(c.isalpha() for c in sentence)
    total_uppercase = sum(c.isupper() for c in sentence)
    total_lowercase = sum(c.islower() for c in sentence)
    total_digits = sum(c.isdigit() for c in sentence)
    total_others = len(sentence) - total_letters - total_digits
    return [total_letters, total_uppercase, total_lowercase, total_digits, total_others]

# Question 3: Exclude Item
def excludeItem(item1, item2):
    result = list(set(item1) & set(item2))
    return result

# Question 4: Second Largest
def secondLarge(numbers):
    if not all(isinstance(n, int) for n in numbers):
        return -999
    unique_numbers = list(set(numbers))
    if len(unique_numbers) == 1:
        return unique_numbers[0]
    elif len(unique_numbers) == 2:
        return min(unique_numbers)
    unique_numbers.sort()
    return unique_numbers[-2]

# Question 5: Is Valid Password
def isValidPassword(password):
    if len(password) < 10:
        return False
    has_upper = any(c.isupper() for c in password)
    has_lower = any(c.islower() for c in password)
    digit_count = sum(c.isdigit() for c in password)
    special_count = sum(not c.isalnum() for c in password)
    return has_upper and has_lower and digit_count >= 3 and special_count >= 2


