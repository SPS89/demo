defmodule ThetypingtoolWeb.PageController do
  use ThetypingtoolWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
  def results(conn, _params) do
    render(conn, :results)  # Ensure this line is correct
  end

  def lesson1(conn, _params) do
    render(conn, :lesson1, layout: false)
  end
  def lesson2(conn, _params) do
    render(conn, :lesson2, layout: false)
  end
  def lesson3(conn, _params) do
    render(conn, :lesson3, layout: false)
  end
  def practice(conn, _params) do
    render(conn, :practice, layout: false)
  end
end
