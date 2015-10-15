courses = [
    {
        class_name: 'Class 1',
        start_date: Date.today ,
        end_date: Date.today + 5.months
    },
    {
        class_name: 'Class 2',
        start_date: Date.today ,
        end_date: Date.today + 4.months
    },
    {
        class_name: 'Class 3',
        start_date: Date.today ,
        end_date: Date.today + 3.months
    },
    {
        class_name: 'Class 4',
        start_date: Date.today ,
        end_date: Date.today + 7.months
    },
    {
        class_name: 'Class 5',
        start_date: Date.today ,
        end_date: Date.today + 6.months
    },
    {
        class_name: 'Class 6',
        start_date: Date.today ,
        end_date: Date.today + 5.months
    },
    {
        class_name: 'Class 7',
        start_date: Date.today ,
        end_date: Date.today + 8.months
    }
]

Course.delete_all
Course.create!(courses)

