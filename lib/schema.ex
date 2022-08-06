defmodule Todoapp.Schema do
    use Absinthe.Schema
    alias Todoapp.Resolver

    object :hello do
      field :name, non_null(:id)
    end

    query do
      @desc "Hello world"
      field :world, non_null(list_of(non_null(:hello)))
    end
end
