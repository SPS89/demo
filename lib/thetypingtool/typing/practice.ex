defmodule Thetypingtool.Typing.Practice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "typing_practices" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(practice, attrs) do
    practice
    |> cast(attrs, [])
    |> validate_required([])
  end
end
