import BhonePyaeSoneHtut_solution as sol;

# Test studentname function
print(sol.studentname("Name", "email@example.com", "BBUsername"))

# Test calAverage function
print(sol.calAverage([2, 6, 8, 3, 4, 6]))  # Should print 4.83

# Test countCharacter function
print(sol.countCharacter("Hell0 WorlD!!!4567"))  # Should print [9, 3, 6, 5, 4]

# Test excludeItem function
print(sol.excludeItem([1, 2, 3, 4, 2, 1], [2, 4, 4, 2]))  # Should print [2, 4]

# Test secondLarge function
print(sol.secondLarge([1, 2, 3, 4, 5, 6]))  # Should print 5
print(sol.secondLarge([6, 8, 3, 4, 6]))  # Should print 6
print(sol.secondLarge([53, 23]))  # Should print 23
print(sol.secondLarge([13]))  # Should print 13
print(sol.secondLarge([12, 'not number', 23]))  # Should print -999

# Test isValidPassword function
print(sol.isValidPassword("Abc123!@# "))  # Should print True
print(sol.isValidPassword("Abc123"))  # Should print False
