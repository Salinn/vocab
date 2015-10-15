word_roots = [
    {
        root_name: 'ANA',
        root_definition: ''
    },
    {
        root_name: 'CHRON',
        root_definition: ''
    },
    {
        root_name: 'SYN',
        root_definition: ''
    },
    {
        root_name: 'CIRCUM',
        root_definition: ''
    },
    {
        root_name: 'FER',
        root_definition: ''
    },
    {
        root_name: 'VEN',
        root_definition: ''
    },
    {
        root_name: 'LOC',
        root_definition: ''
    },
    {
        root_name: 'SPECT',
        root_definition: ''
    },
    {
        root_name: 'LOGY',
        root_definition: ''
    }
]

WordRoot.delete_all
WordRoot.create!(word_roots)