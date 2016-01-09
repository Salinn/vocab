users = [
    {
        first_name: 'Admin',
        last_name: 'Admin',
        email: 'team.vocabulary@gmail.com',
        password: 'topsecret',
        password_confirmation: 'topsecret'
    },
    {
        first_name: 'Paul',
        last_name: 'Darragh',
        email: 'pmd6624@rit.edu',
        password: 'topsecret',
        password_confirmation: 'topsecret'
    },
    {
        first_name: 'Richard',
        last_name: 'Ngo',
        email: 'rnn7726@rit.edu',
        password: 'topsecret',
        password_confirmation: 'topsecret'
    },
    {
        first_name: 'Nate',
        last_name: 'Perry',
        email: 'nbp8557@rit.edu',
        password: 'topsecret',
        password_confirmation: 'topsecret'
    },
    {
        first_name: 'Damas',
        last_name: 'Mlabwa',
        email: 'dam6660@rit.edu',
        password: 'topsecret',
        password_confirmation: 'topsecret'
    }
]

User.delete_all
User.create!(users)

User.first.add_role :admin