require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe QuestionsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Question. As you add validations to Question, be sure to
  # adjust the attributes here as well.
  let (:lesson_module){ FactoryGirl.create(:lesson_module) }
  let (:lesson_word){ FactoryGirl.create(:lesson_word) }
  let(:valid_attributes) {
    {
        lesson_module_id: lesson_module.id,
        lesson_word_id: lesson_word.id
    }
  }

  let(:invalid_attributes) {
    {
        lesson_module_id: nil,
        lesson_word_id: nil
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QuestionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all questions as @questions" do
      question = Question.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:questions)).to eq([question])
    end
  end

  describe "GET #show" do
    it "assigns the requested question as @question" do
      question = Question.create! valid_attributes
      get :show, {:id => question.to_param}, valid_session
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "GET #new" do
    it "assigns a new question as @question" do
      get :new, {}, valid_session
      expect(assigns(:question)).to be_a_new(Question)
    end
  end

  describe "GET #edit" do
    it "assigns the requested question as @question" do
      question = Question.create! valid_attributes
      get :edit, {:id => question.to_param}, valid_session
      expect(assigns(:question)).to eq(question)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, {:question => valid_attributes}, valid_session
        }.to change(Question, :count).by(1)
      end

      it "assigns a newly created question as @question" do
        post :create, {:question => valid_attributes}, valid_session
        expect(assigns(:question)).to be_a(Question)
        expect(assigns(:question)).to be_persisted
      end

      it "redirects to the created question" do
        post :create, {:question => valid_attributes}, valid_session
        expect(response).to redirect_to(Question.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        post :create, {:question => invalid_attributes}, valid_session
        expect(assigns(:question)).to be_a_new(Question)
      end

      it "re-renders the 'new' template" do
        post :create, {:question => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "assigns the requested question as @question" do
        question = Question.create! valid_attributes
        put :update, {:id => question.to_param, :question => valid_attributes}, valid_session
        expect(assigns(:question)).to eq(question)
      end

      it "redirects to the question" do
        question = Question.create! valid_attributes
        put :update, {:id => question.to_param, :question => valid_attributes}, valid_session
        expect(response).to redirect_to(question)
      end
    end

    context "with invalid params" do
      it "assigns the question as @question" do
        question = Question.create! valid_attributes
        put :update, {:id => question.to_param, :question => invalid_attributes}, valid_session
        expect(assigns(:question)).to eq(question)
      end

      it "re-renders the 'edit' template" do
        question = Question.create! valid_attributes
        put :update, {:id => question.to_param, :question => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested question" do
      question = Question.create! valid_attributes
      expect {
        delete :destroy, {:id => question.to_param}, valid_session
      }.to change(Question, :count).by(-1)
    end

    it "redirects to the questions list" do
      question = Question.create! valid_attributes
      delete :destroy, {:id => question.to_param}, valid_session
      expect(response).to redirect_to(questions_url)
    end
  end

end
