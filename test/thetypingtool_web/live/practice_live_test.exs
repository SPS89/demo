defmodule ThetypingtoolWeb.PracticeLiveTest do
  use ThetypingtoolWeb.ConnCase

  import Phoenix.LiveViewTest
  import Thetypingtool.TypingFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_practice(_) do
    practice = practice_fixture()
    %{practice: practice}
  end

  describe "Index" do
    setup [:create_practice]

    test "lists all typing_practices", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/typing_practices")

      assert html =~ "Listing Typing practices"
    end

    test "saves new practice", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/typing_practices")

      assert index_live |> element("a", "New Practice") |> render_click() =~
               "New Practice"

      assert_patch(index_live, ~p"/typing_practices/new")

      assert index_live
             |> form("#practice-form", practice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#practice-form", practice: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/typing_practices")

      html = render(index_live)
      assert html =~ "Practice created successfully"
    end

    test "updates practice in listing", %{conn: conn, practice: practice} do
      {:ok, index_live, _html} = live(conn, ~p"/typing_practices")

      assert index_live |> element("#typing_practices-#{practice.id} a", "Edit") |> render_click() =~
               "Edit Practice"

      assert_patch(index_live, ~p"/typing_practices/#{practice}/edit")

      assert index_live
             |> form("#practice-form", practice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#practice-form", practice: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/typing_practices")

      html = render(index_live)
      assert html =~ "Practice updated successfully"
    end

    test "deletes practice in listing", %{conn: conn, practice: practice} do
      {:ok, index_live, _html} = live(conn, ~p"/typing_practices")

      assert index_live |> element("#typing_practices-#{practice.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#typing_practices-#{practice.id}")
    end
  end

  describe "Show" do
    setup [:create_practice]

    test "displays practice", %{conn: conn, practice: practice} do
      {:ok, _show_live, html} = live(conn, ~p"/typing_practices/#{practice}")

      assert html =~ "Show Practice"
    end

    test "updates practice within modal", %{conn: conn, practice: practice} do
      {:ok, show_live, _html} = live(conn, ~p"/typing_practices/#{practice}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Practice"

      assert_patch(show_live, ~p"/typing_practices/#{practice}/show/edit")

      assert show_live
             |> form("#practice-form", practice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#practice-form", practice: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/typing_practices/#{practice}")

      html = render(show_live)
      assert html =~ "Practice updated successfully"
    end
  end
end
