class AddImageToTablescapes < ActiveRecord::Migration[5.2]
  def change
    change_table :tablescapes do |t|
      t.string :image, null: false, default: "https://images.unsplash.com/photo-1550826679-1b8ba79f1c18?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80"
    end
  end
end
