defmodule Student do
    @moduledoc """ Define a struct and functions to handle a student. """
    defstruct name: nil, results: []

    @doc """ 
        Get the first name of a Student. 
        ## Parameters
        - 'student' - A Student struct.
        ## Examples
        * joao = %Student{name: "Joao Joaquin"}
        Student.first_name(joao)
        "Joaão"
    """
    def fisrt_name(student) do
        student.name
        |> String.split
        |> List.first
    end
end