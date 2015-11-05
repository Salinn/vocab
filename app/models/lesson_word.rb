class LessonWord < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :word

  has_many :lesson_word_definitions
  has_many :definitions, through: :lesson_word_definitions

  has_many :lesson_word_videos
  has_many :word_videos, through: :lesson_word_videos

  has_many :lesson_word_sentences
  has_many :sentences, through: :lesson_word_sentences

  has_many :lesson_word_forms
  has_many :word_forms, through: :lesson_word_forms

  has_many :lesson_word_synonyms
  has_many :synonyms, through: :lesson_word_synonyms

  accepts_nested_attributes_for :lesson_word_definitions
  accepts_nested_attributes_for :lesson_word_videos
  accepts_nested_attributes_for :lesson_word_sentences
  accepts_nested_attributes_for :lesson_word_forms
  accepts_nested_attributes_for :lesson_word_synonyms


  #This method returns all non associated definitions in the lesson word
  def not_word_definitions
    definitions = []
    word.definitions.each do |definition|
      unless lesson_word_definitions.map(&:definition_id).compact.include? definition.id
        definitions.push definition
      end
    end

    definitions
  end

  #This method returns all non associated word_videos in the lesson word
  def not_word_videos
    word_videos = []
    word.word_videos.each do |word_video|
      unless lesson_word_videos.map(&:word_video_id).compact.include? word_video.id
        word_videos.push word_video
      end
    end

    word_videos
  end

  #This method returns all non associated word_sentences in the lesson word
  def not_word_sentences
    sentences = []
    word.sentences.each do |sentence|
      unless lesson_word_sentences.map(&:sentence_id).compact.include? sentence.id
        sentences.push sentence
      end
    end

    sentences
  end

  #This method returns all non associated word_forms in the lesson word
  def not_word_forms
    word_forms = []
    word.word_forms.each do |word_form|
      unless lesson_word_forms.map(&:word_form_id).compact.include? word_form.id
        word_forms.push word_form
      end
    end

    word_forms
  end

  #This method returns all non associated synonyms in the lesson word
  def not_word_synonyms
    synonyms = []
    word.synonyms.each do |synonym|
      unless lesson_word_synonyms.map(&:synonym_id).compact.include? synonym.id
        synonyms.push synonym
      end
    end

    synonyms
  end
end
