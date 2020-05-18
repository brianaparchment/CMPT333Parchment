%date1([Y,M1,D1],N):-
%    N is (((Y*1461)/4)+((M1*153)/5)+D1).
%date2([Y,M2,D2],X):-
%    X is (((Y*1461)/4)+((M1*153)/5)+D1).
%interval(date1[Y,M1,D1],date2[Y,M2,D2],N,X):-
%    abs(X - N).

interval(DayFrom-MonthFrom, DayTo-MonthTo,Days):-
    month(MonthFrom,MonthFromNumber,MonthFromDays),
    month(MonthTo,MonthToNumber,_),
    MonthFromNumber < MonthToNumber,
    DaysTemp is MonthFromDays - DayFrom,
    Month1 is MonthFromNumber + 1,
    month(NewMonthFrom,Month1,_),
    interval(0-NewMonthFrom,DayTo-MonthTo,DaysTemp2),
    Days is DaysTemp + DaysTemp2.
interval(DayFrom-MonthFrom, DayTo-MonthTo,Days):-
    month(MonthFrom,MonthFromNumber,_),
    month(MonthTo,MonthToNumber,_),
    MonthFromNumber > MonthToNumber,
    interval(DayTo-MonthTo,DayFrom-MonthFrom,Days).
interval(DayFrom-MonthFrom, DayTo-MonthTo,Days):-
    month(MonthFrom,MonthFromNumber,_),
    month(MonthTo,MonthToNumber,_),
    MonthFromNumber == MonthToNumber,
    Days is abs(DayTo - DayFrom).

month(january,1,31).
month(february,2,28).
month(march,3,31).
month(april,4,30).
month(may,5,31).
month(june,6,30).
month(july,7,31).
month(august,8,31).
month(september,9,30).
month(october,10,31).
month(november,11,30).
month(december,12,31).

