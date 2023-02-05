def add_time(start, duration, weekday=''):
    startL = start.split()
    sT = startL[0].split(':')

    
    addT = duration.split(':')
    for i in range(len(addT)):
        addT[i] = int(addT[i])
    
    daysP = 0
    if addT[0] >= 24:
        daysP = addT[0]//24
        addT[0] = addT[0]%24

    newT = [int(sT[0])+addT[0], int(sT[1])+addT[1], startL[1]]


    if newT[1] > 60:
        newT[1] = newT[1] % 60
        newT[0] += 1
    
    if (newT[0] > 12):
        if newT[2] == 'PM':
            newT[2] = 'AM'
            daysP += (newT[0]+12+int(addT[0]))//24
        elif newT[2] == 'AM':
            newT[2] = 'PM'
        newT[0] = newT[0] % 12
    elif (newT[0] == 12):
        if newT[2] == 'PM':
            newT[2] = 'AM'
            daysP += 1
        elif newT[2] == 'AM':
            newT[2] = 'PM'
    
    # minutes must have 2 digits: hh:08 instead of hh:8
    if len(str(newT[1])) == 1:
        newT[1] = '0' + str(newT[1])


    new_time = f'{newT[0]}:{newT[1]} {newT[2]}'
    

    # Weekdays
    if weekday != '':
        wd = weekday.capitalize()
        weekdays = {'Monday': 1, 'Tuesday': 2, 'Wednesday': 3, 'Thursday': 4, 'Friday': 5, 'Saturday': 6, 'Sunday': 0}
        newD = (weekdays[wd] + daysP)%7
        def getKey(value):
            for k,v in weekdays.items():
                if value == v:
                    return k
        newD = getKey(newD)
        new_time += f', {newD}'


    # Count days
    if daysP != 0:
        if (daysP == 1):
            new_time += f' (next day)'
        elif (daysP > 1):
            new_time += f' ({daysP} days later)'
    

    return new_time