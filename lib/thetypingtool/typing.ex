defmodule Thetypingtool.Typing do
  @moduledoc """
  The Typing context.
  """

  import Ecto.Query, warn: false
  alias Thetypingtool.Repo

  alias Thetypingtool.Typing.Practice

  @doc """
  Returns the list of typing_practices.

  ## Examples

      iex> list_typing_practices()
      [%Practice{}, ...]

  """
  def list_typing_practices do
    Repo.all(Practice)
  end

  @doc """
  Gets a single practice.

  Raises `Ecto.NoResultsError` if the Practice does not exist.

  ## Examples

      iex> get_practice!(123)
      %Practice{}

      iex> get_practice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_practice!(id), do: Repo.get!(Practice, id)

  @doc """
  Creates a practice.

  ## Examples

      iex> create_practice(%{field: value})
      {:ok, %Practice{}}

      iex> create_practice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_practice(attrs \\ %{}) do
    %Practice{}
    |> Practice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a practice.

  ## Examples

      iex> update_practice(practice, %{field: new_value})
      {:ok, %Practice{}}

      iex> update_practice(practice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_practice(%Practice{} = practice, attrs) do
    practice
    |> Practice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a practice.

  ## Examples

      iex> delete_practice(practice)
      {:ok, %Practice{}}

      iex> delete_practice(practice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_practice(%Practice{} = practice) do
    Repo.delete(practice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking practice changes.

  ## Examples

      iex> change_practice(practice)
      %Ecto.Changeset{data: %Practice{}}

  """
  def change_practice(%Practice{} = practice, attrs \\ %{}) do
    Practice.changeset(practice, attrs)
  end
end
