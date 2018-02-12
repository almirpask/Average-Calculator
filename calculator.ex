defmodule Calculator do
    @moduledoc """
        Define a Calculator module and functions to execute it.
    """
    @doc """
        Start the system to process some results.
    """
    def start() do
        almir = %Student{name: "Almir Santos", results: build_subjects([5.2, 9.4, 6.1, 8.8])}
        patric = %Student{name: "Patric Pauluc", results: build_subjects([7.2, 4.4, 5.1, 4.5])}
        ruan = %Student{name: "Ruan Gomes", results: build_subjects([7.5, 5.6, 9.4, 7.7])}
        paulo = %Student{name: "Paulo Diniz", results: build_subjects([5.2, 4.4, 9.4, 7.8])}

        result = calculate([almir, patric, ruan, paulo])
        best = best_result(result)
        {result, best}
    end

    @doc """
        Get all students with their averages.

        ## Parameters

        - 'students' - A list of Students structs.
    """

    defp calculate(students) do
        students 
        |> Enum.map(&(
            %{
            first_name: Student.first_name(&1),
            last_name: Student.last_name(&1),
            average: average(&1)
            }
        ))
    end

    @doc """
        Calculate the average a student.

        ## Paramenters

        - 'student' - A Student struct.
    """

    defp average(student) do
        total = Enum.count(student.results)

        result = student.results
        |> Enum.map(&(&1.result))
        |> Enum.reduce(&(&1 + &2))

        Float.ceil(result / total, 2)
    end

    @doc """
        Get the greter average.

        ## Parameters

        - 'students' - A list of students with their averages.
    """

    defp best_result(students) do
        best = students
        |> Enum.map(&(&1.average))
        |> Enum.max

        students
        |> Enum.filter(&(&1.average === best))
    end

    @doc """
        Build some subjects and some random results.

        ## Parameters

        - 'results' - A list of results
    """
    defp build_subjects(results) do
        subjects = ["Matematica", "Geografia", "História", "Português"]

        subjects 
        |> Enum.map(&(%Subject{name: &1, result: Enum.random(results)}))
    end
end