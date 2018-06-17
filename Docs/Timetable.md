## Timetable

This is used to setup your daily schedules and the busses you want to take. You will fill in [this](https://github.com/LauraAubin/Traveller/blob/master/My%20Timetable/my-timetable.rb) empty timetable.

The best way to read this is as, "this is the place I want to go to, how much time I will spend there, and what bus I will take to get there."

### Formatting:

```ruby
def day
   [
      ['destination', start_time, end_time, bus_route, stop_number]
   ]
end
```

Note: You can add as many bus routes and stop number pairs as you need. i.e,<br>`['work', '9.00', '17.00', 5, 1234, 14, 4242]` is accepted.

### Step 1: Setup

You can only use days of the week. Please only use their full name and lowercase i.e "monday".

You must write the day as a method containing an array:

```ruby
def monday
  [
  ]
end
```

If you do not have a schedule for a particular day, you do not have to include that method.

### Step 2: Fill in the array

You must write the day as an array of destinations. lets say that on Tuesday's, I am at work from 9:30am to 2pm. Then I am at school from 4pm to 5:30pm. I would write this as:

```ruby
def tuesday
   [
      ['work', 9.30, 14.00, nil, nil],
      ['school', 16.00, 17.30, nil, nil]
   ]
end
```

You'll notice the time formatting. You will need to write time in the 24 hour format, and use periods instead of colons. i.e, 6pm should be written as `18.00`.

### Step 3: Bus info

After creating your schedules, you'll want to also add the busses that you take **to get to that destination**. From the previous example, lets say that I go to work on the bus route 5 and I catch it from stop 1234. This is written as:

```ruby
def tuesday
   [
      ['work', 9.30, 14.00, 5, 1234],
      ['school', 16.00, 17.30, 7, 9876]
   ]
end
```

### Example timetable:

Notes:

- Bus routes/stop numbers should never be blank.
- You can use `nil` instead of a start/end time. This means that you are at this place for the rest of your day, i.e, like when you are at home.

Tip: You should use variables to avoid duplication.

<details>
<summary>👋 Expand me to see an example</summary>

```ruby
module MyTimetable
  extend self

  HOME_TO_WORK = ['work', 9.30, 18.00, 5, 1234]
  SCHOOL_TO_HOME = ['home', nil, nil, 4, 2222, 7, 9876, 2, 4242]
  WORK_TO_HOME = ['home', nil, nil, 5, 4321]

  def monday
    [
      HOME_TO_WORK,
      ['school', 17.00, 19.30, 7, 8080],
      SCHOOL_TO_HOME
    ]
  end

  def tuesday
    [
      HOME_TO_WORK,
      WORK_TO_HOME
    ]
  end

  def wednesday
    [
      HOME_TO_WORK,
      ['school', 18.00, 19.30, 7, 9876],
      SCHOOL_TO_HOME
    ]
  end

  def thursday
    [
      HOME_TO_WORK,
      WORK_TO_HOME
    ]
  end

  def friday
    [
      HOME_TO_WORK,
      WORK_TO_HOME
    ]
  end

  def method_missing(*args)
    nil
  end
end
```

</details>
