defmodule ESpec.Phoenix.Extend do
  def model do
    quote do
      alias TestingWithPhoenix.Repo
    end
  end

  def controller do
    quote do
      alias TestingWithPhoenix
      import TestingWithPhoenix.Router.Helpers

      @endpoint TestingWithPhoenix.Endpoint
    end
  end

  def view do
    quote do
      import TestingWithPhoenix.Router.Helpers
    end
  end

  def channel do
    quote do
      alias TestingWithPhoenix.Repo

      @endpoint TestingWithPhoenix.Endpoint
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
