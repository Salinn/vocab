sentences = [
    {
        word_sentence: Faker::Lorem.sentence,
        word_id: 1
    },
    {
        word_sentence: Faker::Lorem.sentence,
        word_id: 1
    },
    {
        word_sentence: Faker::Lorem.sentence,
        word_id: 1
    }
]

Sentence.create!(sentences)