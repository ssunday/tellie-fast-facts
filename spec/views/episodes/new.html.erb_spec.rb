require 'rails_helper'

RSpec.describe 'episodes/new', type: :view do
  before(:each) do
    assign(:episode, Episode.new(
                       name: 'MyString'
                     ))
  end

  it 'renders new episode form' do
    render

    assert_select 'form[action=?][method=?]', episodes_path, 'post' do
      assert_select 'input[name=?]', 'episode[name]'
    end
  end
end
