defmodule Phitter.Repo.Migrations.CreatePheet do
  use Ecto.Migration

  def change do
    create table(:pheets) do
      add :body, :string

      timestamps
    end

  end
end
