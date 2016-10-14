# Scheduler using ActiveRecord

## Objectives

Create a scheduler app using my old job as a studio manager as an example domain
    
(I've used the <a href="https://github.com/learn-co-students/playlister-on-activerecord-web-0916">Learn.co Playlister</a> lab as the basis for the file structure, etc) 


How to Use: 

Employee Runner
  
  Asks for your name

    1) points name to an Employee Object / row in table employees

  Asks if you're giving availability or looking for a schedule

    1) takes availability, stores it to employee_shifts_no_good 
    
    2) displays full schedule in a nice clean format 

       a) will soon be able to display just your (named employee's) shifts 


BossRunner

  Asks if you're making a schedule or viewing a schedule

    1) creating a schedule 

      a) displays employee_shifts_no_good in a nice clean format 
      
      b) will soon drop/clear previous week schedule
      
      c) will soon be able to assign people to shifts 

        i) will assign, then check out the schedule-so-far
            
        ii) will allow the boss to un-assign a shift if she decides she needs to rearrange 

          ?? should the app warn about clopenings / overtime or is that the boss's job manually?

      d) will soon: offer to finalize schedule once all 14 shifts are filled 

        i) will displays complete_schedule

        ii) if she confirms, will display complete_schedule & employee_shifts_no_good (for email)

        iii) will clear employee_shifts_no_good, for next week's use 
  
    2) displays full schedule in a nice clean format 

      a) will soon be able to display each employee's schedule sorted out, for timesheets
 



stretch goals:

    if someone worked 3 shifts last week, they work 4 this week unless they can't for availability reasons 

    ideally, nobody clopens (works monday pm then tuesday am, or so forth)

    nobody gets more than 40 hours total

        weekday_evening shifts are worth 6.5 

        weekend_evening shifts are worth 4-5 

    the boss can hire and fire people (remove and add to employees table)

    the boss can update the schedule if someone trades shifts??? 