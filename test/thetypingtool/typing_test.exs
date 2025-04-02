defmodule Thetypingtool.TypingTest do
  use Thetypingtool.DataCase

  alias Thetypingtool.Typing

  describe "typing_practices" do
    alias Thetypingtool.Typing.Practice

    import Thetypingtool.TypingFixtures

    @invalid_attrs %{}

    test "list_typing_practices/0 returns all typing_practices" do
      practice = practice_fixture()
      assert Typing.list_typing_practices() == [practice]
    end

    test "get_practice!/1 returns the practice with given id" do
      practice = practice_fixture()
      assert Typing.get_practice!(practice.id) == practice
    end

    test "create_practice/1 with valid data creates a practice" do
      valid_attrs = %{}

      assert {:ok, %Practice{} = practice} = Typing.create_practice(valid_attrs)
    end

    test "create_practice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Typing.create_practice(@invalid_attrs)
    end

    test "update_practice/2 with valid data updates the practice" do
      practice = practice_fixture()
      update_attrs = %{}

      assert {:ok, %Practice{} = practice} = Typing.update_practice(practice, update_attrs)
    end

    test "update_practice/2 with invalid data returns error changeset" do
      practice = practice_fixture()
      assert {:error, %Ecto.Changeset{}} = Typing.update_practice(practice, @invalid_attrs)
      assert practice == Typing.get_practice!(practice.id)
    end

    test "delete_practice/1 deletes the practice" do
      practice = practice_fixture()
      assert {:ok, %Practice{}} = Typing.delete_practice(practice)
      assert_raise Ecto.NoResultsError, fn -> Typing.get_practice!(practice.id) end
    end

    test "change_practice/1 returns a practice changeset" do
      practice = practice_fixture()
      assert %Ecto.Changeset{} = Typing.change_practice(practice)
    end
  end
end
