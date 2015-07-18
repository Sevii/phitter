defmodule Phitter.PheetControllerTest do
  use Phitter.ConnCase

  alias Phitter.Pheet
  @valid_attrs %{body: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pheet_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing pheets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, pheet_path(conn, :new)
    assert html_response(conn, 200) =~ "New pheet"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, pheet_path(conn, :create), pheet: @valid_attrs
    assert redirected_to(conn) == pheet_path(conn, :index)
    assert Repo.get_by(Pheet, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pheet_path(conn, :create), pheet: @invalid_attrs
    assert html_response(conn, 200) =~ "New pheet"
  end

  test "shows chosen resource", %{conn: conn} do
    pheet = Repo.insert! %Pheet{}
    conn = get conn, pheet_path(conn, :show, pheet)
    assert html_response(conn, 200) =~ "Show pheet"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, pheet_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    pheet = Repo.insert! %Pheet{}
    conn = get conn, pheet_path(conn, :edit, pheet)
    assert html_response(conn, 200) =~ "Edit pheet"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    pheet = Repo.insert! %Pheet{}
    conn = put conn, pheet_path(conn, :update, pheet), pheet: @valid_attrs
    assert redirected_to(conn) == pheet_path(conn, :index)
    assert Repo.get_by(Pheet, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pheet = Repo.insert! %Pheet{}
    conn = put conn, pheet_path(conn, :update, pheet), pheet: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit pheet"
  end

  test "deletes chosen resource", %{conn: conn} do
    pheet = Repo.insert! %Pheet{}
    conn = delete conn, pheet_path(conn, :delete, pheet)
    assert redirected_to(conn) == pheet_path(conn, :index)
    refute Repo.get(Pheet, pheet.id)
  end
end
