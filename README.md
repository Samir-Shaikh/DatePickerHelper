# DatePickerHelper

Pick Date from UIDatePicker very easily. No need to do lot of code. Using this just a single line of code give you selected date.

## ==> USAGE
Just Drag & Drop DatePickerHelper file in your swift project.
Write below code..

###### Defination :
`DatePickerHelper.shared.openDatePicker(datePickerMode: <UIDatePicker.Mode>, selectedDate: <Date>, minDate: <Date>, maxDate: <Date>, completion: <((Date) -> ())((Date) -> ())(Date) -> ()>)`
  
###### Params Description:
1. datePickerMode : This is UIDatePicker mode. Their are 4 different modes available (You can get full details here: https://developer.apple.com/documentation/uikit/uidatepicker/mode)
- time
- date
- dateAndTime
- countDownTimer

2. selectedDate : Pass Date object you want as default selected.

3. minDate : Pass Date object you want as minimum date.

4. maxDate : Pass Date object you want as maximum date.

###### Get Selected Date:
```DatePickerHelper.shared.openDatePicker(datePickerMode: .date, selectedDate: Date(), minDate: Date(), maxDate: Date()) { (selectedDate) in

       print(selectedDate)
 }```
 
 ## Thanks & Enjoy!
 
 # Author

Samir Shaikh samir.shaikh0620@gmail.com
