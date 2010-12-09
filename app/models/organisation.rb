class Organisation < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string ,:required, :unique, :null=>false, :index=>true
    timestamps
  end


  # --- Permissions --- #

  def create_permitted?
#     puts "create_permitted? #{acting_user.administrator?}"
#    debugger
#    this IS THE LINE TO ADD TO INVOKE DEBUGGER

    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
