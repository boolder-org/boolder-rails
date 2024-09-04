class SetupPgSearch < ActiveRecord::Migration[7.1]
  def up
    say_with_time("Enabling pg_trgm extension") do
      enable_extension 'pg_trgm'
    end

    say_with_time("Enabling unaccent extension") do
      enable_extension 'unaccent'
    end
  end

  def down
    say_with_time("Disabling pg_trgm extension") do
      disable_extension 'pg_trgm'
    end

    say_with_time("Disabling unaccent extension") do
      disable_extension 'unaccent'
    end
  end
end
