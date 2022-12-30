defmodule FlappyBird.ScoresTest do
  use FlappyBird.DataCase

  alias FlappyBird.Scores

  describe "scores" do
    alias FlappyBird.Scores.Score

    import FlappyBird.ScoresFixtures

    @invalid_attrs %{value: nil}

    test "list_scores/0 returns all scores" do
      score = score_fixture()
      assert Scores.list_scores() == [score]
    end

    test "get_score!/1 returns the score with given id" do
      score = score_fixture()
      assert Scores.get_score!(score.id) == score
    end

    test "create_score/1 with valid data creates a score" do
      valid_attrs = %{value: "some value"}

      assert {:ok, %Score{} = score} = Scores.create_score(valid_attrs)
      assert score.value == "some value"
    end

    test "create_score/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Scores.create_score(@invalid_attrs)
    end

    test "update_score/2 with valid data updates the score" do
      score = score_fixture()
      update_attrs = %{value: "some updated value"}

      assert {:ok, %Score{} = score} = Scores.update_score(score, update_attrs)
      assert score.value == "some updated value"
    end

    test "update_score/2 with invalid data returns error changeset" do
      score = score_fixture()
      assert {:error, %Ecto.Changeset{}} = Scores.update_score(score, @invalid_attrs)
      assert score == Scores.get_score!(score.id)
    end

    test "delete_score/1 deletes the score" do
      score = score_fixture()
      assert {:ok, %Score{}} = Scores.delete_score(score)
      assert_raise Ecto.NoResultsError, fn -> Scores.get_score!(score.id) end
    end

    test "change_score/1 returns a score changeset" do
      score = score_fixture()
      assert %Ecto.Changeset{} = Scores.change_score(score)
    end
  end
end
