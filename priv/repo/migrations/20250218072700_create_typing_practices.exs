defmodule Thetypingtool.Repo.Migrations.CreateTypingPractices do
  use Ecto.Migration

  def change do
    create table(:typing_practices) do

      timestamps(type: :utc_datetime)
    end
  end
end
