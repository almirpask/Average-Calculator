defmodule Student do
    @moduledoc """ 
        Define a struct and functions to handle a student. 
    """
    defstruct name: nil, results: []

    @doc """ 
        Get the first name of a Student. 
        ## Parameters
        - 'student' - A Student struct.
        ## Examples
        * joao = %Student{name: 'Joao Joaquin'}
        Student.first_name(joao)
        "João"
    """
    def first_name(student) do
        student.name
        |> String.split
        |> List.first
    end

    @doc """ 
        Get the last name of a student
        ### Parameters
         - 'student' - A Student struct.
        ## Examples
        * joao = %Student{name: 'Joao Joaquin'}
        Student.last_name(joao)
        'Joaquin'
    """
    def last_name(student) do
        student.name
        |> String.split
        |> List.last
    end
end