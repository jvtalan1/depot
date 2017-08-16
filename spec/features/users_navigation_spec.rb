require 'rails_helper'

describe 'Users Navigation', type: :feature do
  describe 'Creating Users' do
    before do
      visit '/users/new'
    end

    context 'when the form is valid' do
      before do
        fill_in 'Name', with: 'Test User'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
      end
      it 'creates the user' do
        print page.html
        expect(page).to have_content 'User Test User was successfully created.'
      end
    end

    context 'when the form is invalid' do
      context 'and the form is blank' do
        before do
          click_button 'Save'
        end

        it 'returns an error page' do
          expect(page).to have_content "Name can't be blank"
          expect(page).to have_content "Password can't be blank" 
        end
      end

      context 'and the password does not match password confirmation' do
        before do
          fill_in 'Name', with: 'testuser'
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password2'
          click_button 'Save'
        end

        it 'returns an error page' do
          expect(page).to have_content "Password confirmation doesn't match password"
        end
      end

      context 'and the username chosen already exists' do
        let!(:user) { factoryGirl.create(:user, name: 'testuser') }

        before do
          fill_in 'Name', with: 'testuser'
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'
          click_button 'Save'
        end

        it 'returns an error page' do
          expect(page).to have_content 'Name already exists'
        end
      end
    end
  end
end
