word_roots = [
    {
        root_name: 'ANA',
        root_definition: 'Test Definition 1'
    },
    {
        root_name: 'CHRON',
        root_definition: 'Test Definition 2'
    },
    {
        root_name: 'SYN',
        root_definition: 'Test Definition 3'
    },
    {
        root_name: 'CIRCUM',
        root_definition: 'Test Definition 4'
    },
    {
        root_name: 'FER',
        root_definition: 'Test Definition 5'
    },
    {
        root_name: 'VEN',
        root_definition: 'Test Definition 6'
    },
    {
        root_name: 'LOC',
        root_definition: 'Test Definition 7'
    },
    {
        root_name: 'SPECT',
        root_definition: 'Test Definition 8'
    },
    {
        root_name: 'LOGY',
        root_definition: 'Test Definition 9'
    }
]

WordRoot.delete_all
WordRoot.create!(word_roots)