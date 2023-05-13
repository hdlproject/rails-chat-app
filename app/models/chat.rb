class Chat < ApplicationRecord
  enum receiver_type: { person: "person", group: "group" }
end
