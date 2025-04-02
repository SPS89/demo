defmodule Thetypingtool.TypingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Thetypingtool.Typing` context.
  """

  @doc """
  Generate a practice.
  """
  def practice_fixture(attrs \\ %{}) do
    {:ok, practice} =
      attrs
      |> Enum.into(%{

      })
      |> Thetypingtool.Typing.create_practice()

    practice
  end
end
