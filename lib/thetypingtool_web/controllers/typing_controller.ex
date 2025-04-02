
defmodule ThetypingtoolWeb.TypingController do
  use ThetypingtoolWeb, :controller
  alias Thetypingtool.ResultStore  # Import ResultStore for storing results

  def submit(conn, %{"wpm" => wpm, "accuracy" => accuracy, "errors" => errors, "time" => time}) do
    result = %{wpm: wpm, accuracy: accuracy, errors: errors, time: time, date: NaiveDateTime.utc_now()}
    
    ResultStore.save_result(result)  # Save result using Agent

    redirect(conn, to: "/results")  # Redirect to results page
  end

  def results(conn, _params) do
    results = ResultStore.get_results()  # Fetch stored results
    render(conn, "results.html", results: results)  # Render results page
  end
end
