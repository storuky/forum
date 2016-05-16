config =  {
            :with => :active_record,
            :delta => true
          }

ThinkingSphinx::Index.define :post, config do
  indexes title
  indexes content

  has created_at
end