 /** 
 *Day: Monday
 *Date: 27th
 *Possible Months: January, July, June
 *Birthday is eight years after anniversay
 *365 days in non leap year, 366 days in leap year
 *365/7= remainder of 1, dates move forward by one day of the *week after every non-leap year
 *366/7= remainder of 2, dates move forward by two days of the *week after every leap year
 *Since the wedding is on a Monday, within the next eight years 
 *there were seven non-leap years and one leap year.
 *The year of the wedding was 1900, because it is divisible by *four and not a leap year.
 *After February 28th,1900 there would be two leap days within *the next eight years, therefore the wedding must be in *January.*/ 
 
 
 /*Program to find years where January 27th is a Monday*/
 year() :-
    days_falling_on_monday(1900, 1999, MondayList),
    writeln(MondayList).
 
days_falling_on_monday(StartYear, EndYear, MondayList) :-
    numlist(StartYear, EndYear, YearRangeList),
    include(is_birthday_a_monday, YearRangeList, MondayList).
 
is_birthday_a_monday(Year) :-
    Date = date(Year, 1, 27),
    day_of_the_week(Date, DayOfTheWeek),
    DayOfTheWeek == 1.
 