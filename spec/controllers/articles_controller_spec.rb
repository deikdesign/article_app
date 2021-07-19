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
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe ArticlesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # article. As you add validations to article, be sure to
  # adjust the attributes here as well.
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let!(:article) { create(:article, user_id: user.id, category_id: category.id) }

  # rubocop:disable Metrics/BlockLength
  context 'when user is logged in' do
    before do
      sign_in(user)
    end
    # rubocop:enable Metrics/BlockLength

    describe 'GET #index' do
      it 'shows the timeline index page' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'shows the article page' do
        get :show, params: { id: article.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'article #create' do
      # rubocop:disable Layout/LineLength
      # describe 'when new article info is valid' do
      #   it 'creates the new article' do
      #     expect{article :create, params: { article: { title: 'This is a new article!', description: 'This is a new article description!', category_id: category.id} }}.to change{Article.count}.by(1)
      #     expect(article.first.title).to eq 'This is a new article!'
      #     expect(response).to redirect_to(root_url)
      #   end
      # end
      # rubocop:enable Layout/LineLength
    end

    describe 'GET #edit' do
      it 'shows the edit article page' do
        get :edit, params: { id: article.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'PATCH #update' do
      describe 'when edited article does not have any title' do
        it 'does NOT edit the article' do
          patch :update, params: { id: article.id, article: { title: '' } }
          expect(user.articles.first.title).to_not eq ''
        end
      end
    end

    describe 'DELETE #destroy' do
      it 'deletes the article' do
        expect { delete :destroy, params: { id: article.id } }.to change { Article.count }.by(-1)
        expect(response).to redirect_to(root_url)
      end
    end
  end

  context 'when user is not logged in' do
    describe 'GET #new' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #edit' do
      it 'redirects to login page' do
        get :edit, params: { id: article.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    # describe 'article #create' do
    #   it 'does not create article and redirects to login' do
    # rubocop:disable Layout/LineLength
    #       expect{article :create, params: { article: { title: 'I am trying to make a article!'} }}.to change{Article.count}.by(0)
    # rubocop:enable Layout/LineLength
    #       expect(response).to redirect_to(new_user_session_path)
    #   end
    # end

    describe 'GET #edit' do
      it 'redirects to login page' do
        get :edit, params: { id: article.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #update' do
      it 'does not edit the article and redirects to login' do
        patch :update, params: { id: article.id, article: { title: 'Editing my first article!' } }
        expect(user.articles.first.title).to_not eq 'Editing my first article!'
      end
    end

    describe 'DELETE #destroy' do
      it 'does NOT delete the article and redirects to login' do
        expect { delete :destroy, params: { id: article.id } }.to change { Article.count }.by(0)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
