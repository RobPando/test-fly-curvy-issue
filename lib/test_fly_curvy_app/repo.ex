defmodule TestFlyCurvyApp.Repo do
  use Ecto.Repo,
    otp_app: :test_fly_curvy_app,
    adapter: Ecto.Adapters.Postgres
end
