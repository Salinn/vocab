words = %w[Cognizant Acquaint Diagnosis Incognito Metacognition Prognosis Agnostic Recognizance Cognoscente Ignorant Prognosticate]
definitions = [
    'knowledgeable or understanding of something; fully informed.',
    'to know someone or something; to become familiar with someone or something',
    'the investigation or analysis of the cause of a situation or problem',
    'concealing or disguising your own identity',
    "knowledge or awareness about one's (or your) own thinking or learning process",
    'a judgement about the future based on information or experience; also a medical opinion about how a disease will develop',
    'someone who believes that people cannot know if God exists or not',
    'the obligation of a person to appear before court action or be liable to a fine',
    'a person who knows a lot or is especially knowledgeable about fine arts, or fashion, or food',
    'a lack of knowledge, having no comprehension of something',
    'to foretell from signs or symptoms; ',
    ''
]

synonyms = [
    %w[aware mindful knowing],
    %w[familiarize],
    %w[finding discovery],
    %w[disguise undercover],
    %w[self-knowledge self-awareness],
    %w[prediction foreknowledge],
    %w[non-believer],
    ['pledge of responsibility', 'word of honor'],
    %w[connoisseur],
    %w[unaware uninformed],
    %w[forecast predict]
]

word_form = [
    %w[cognizance cognize cognizable],
    %w[acquaintance acquainted],
    %w[diagnoses diagnose diagnostic diagnostically],
    %w[incognitos incognito],
    %w[metacognitive metacognitively],
    %w[prognoses],
    %w[agnosticism agnostic],
    %w[recognizant],
    %w[cognoscenti],
    %w[ignorance ignorantly],
    %w[prognostication prognosticator prognosticative],
]

sentances = [
    'The buyer for the department store was COGNIZANT of her responsibility to balance style and price.',
    'When you come to our new staff orientation, I will ACQUAINT you with all the rules for our company.',
    'The doctor made a DIAGNOSIS of diabetes so Mary had to change her eating and exercise habits.',
    'Brad Pitt and other famous movie stars often travel INCOGNITO because they want to keep their privacy.',
    'Students who use their METACOGNITION perform better on exams because they know more about their thinking processes and that helps them a lot.',
    'Although he was very sick, his PROGNOSIS for a full recovery was good according to the doctor.',
    'My friend Tom gave up his former religion and became an AGNOSTIC who did not know whether God existed.',
    'The man was released in his own RECOGNIZANCE at the bail hearing because he had no prior criminal record, so the judge thought he would not run away from his responsibility.',
    'Mary collects fine art and has many beautiful paintings in oil and water color; she is considered a COGNOSCENTE by her friends and community.',
    'Because John was IGNORANT of the facts, her made a bad decision that he was sorry for later.',
    'The circus fortune teller would PROGNOSTICATE future events for all the customers who came to her booth; unfortunately, her information was often incorrect.'
]

word_videos = [
    'https://www.youtube.com/watch?v=ac3HkriqdGQ',
    'https://www.youtube.com/watch?v=tPnK39ax_AM',
    'https://www.youtube.com/watch?v=X9fLbfzCqWw',
    'https://www.youtube.com/watch?v=7a9wJIhq2J8',
    'https://www.youtube.com/watch?v=6DRh1EyvPHw',
    'https://www.youtube.com/watch?v=Qf9S4N3jJNE',
    'https://www.youtube.com/watch?v=q3JjlkfX5Gk',
    'https://www.youtube.com/watch?v=PVFtRq81Ku8',
    'https://www.youtube.com/watch?v=NjKmCxyKmas',
    'https://www.youtube.com/watch?v=pOHPWUFsc9U',
    'https://www.youtube.com/watch?v=-z5FWlUN1go'
]

roots = [
    %w[cogni],
    %w[ac cogni],
    %w[dia gnos],
    %w[in cogni],
    %w[meta cogni],
    %w[pro gnos],
    %w[a gnos],
    %w[re cogni],
    %w[gnos],
    %w[gnos],
    %w[pro gnos],
]
words.each_with_index do |word_string, index|
  word = Word.create!(name: word_string)

  puts "index is: #{index}"
  puts "word is: #{word.name}"
  puts "definition is #{definitions[index]}"
  Definition.create!(word_definition: definitions[index], word: word)

  puts "sentances is: #{sentances[index]}"
  Sentence.create!(word_sentence: sentances[index], word: word)

  synonyms[index].each do |synonym|
    puts "synonm is: #{synonym}"
    Synonym.create!(word_synonym: synonym, word: word)
  end

  word_form[index].each do |word_form|
    puts "word_form is: #{word_form}"
    WordForm.create!(associated_word: word_form, word: word)
  end

  puts "word_video is: #{word_form}"
  WordVideo.create!(video_link: word_videos[index], video_description: word.name, word: word)
end