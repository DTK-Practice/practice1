##Hireology Software Engineer Homework

###Programming Problems

1) Write a program using regular expressions to parse a file where each line is of the following format:

`$4.99 TXT MESSAGING – 250 09/29 – 10/28 4.99`

For each line in the input file, the program should output three pieces of information parsed from the line in the following JSON format (using the above example line):

```
{
  “feature” : “TXT MESSAGING – 250”,
  “date_range” : “09/29 – 10/28”,
  “price” : 4.99 // use the last dollar amount in the line
}
```

2) Please complete a set of classes for the problem described in [this blog post](http://www.adomokos.com/2012/10/the-organizations-users-roles-kata.html). Please do not create a database backend for this. Test doubles should work fine.

