class Event < Crecto::Model
  schema "events" do
    field :oetsv_report_id, Int32
    field :name, String
    field :description, String
  end
end
