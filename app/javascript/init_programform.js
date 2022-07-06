const initProgramform = () => {
  var rollingPrompt = document.getElementById("program_rolling");
  var firstEssayPrompt = document.getElementById("program_essay_one_needed");
  var secondEssayPrompt = document.getElementById("program_essay_two_needed");
  var thirdEssayPrompt = document.getElementById("program_essay_three_needed");
  var salaryPrompt = document.getElementById("program_salary");
  var visaPrompt = document.getElementById("program_nationals_only");
  var startingDayPrompt = document.getElementById("program_first_day");
  var prerequisitesPrompt = document.getElementById("program_prerequisites");

  if (rollingPrompt) {
    rollingPrompt.addEventListener("change", function () {
      if (rollingPrompt.checked) {
        document.getElementById("rolling_prompt").style.display = "block";
      } else {
        document.getElementById("rolling_prompt").style.display = "none";
      }
    });
  }

  if (firstEssayPrompt) {
    firstEssayPrompt.addEventListener("change", function () {
      if (firstEssayPrompt.checked) {
        document.getElementById("first_essay_prompt").style.display = "block";
      } else {
        document.getElementById("first_essay_prompt").style.display = "none";
      }
    });
  }

  if (secondEssayPrompt) {
    secondEssayPrompt.addEventListener("change", function () {
      if (secondEssayPrompt.checked) {
        document.getElementById("second_essay_prompt").style.display = "block";
      } else {
        document.getElementById("second_essay_prompt").style.display = "none";
      }
    });
  }

  if (thirdEssayPrompt) {
    thirdEssayPrompt.addEventListener("change", function () {
      if (thirdEssayPrompt.checked) {
        document.getElementById("third_essay_prompt").style.display = "block";
      } else {
        document.getElementById("third_essay_prompt").style.display = "none";
      }
    });
  }

  if (salaryPrompt) {
    salaryPrompt.addEventListener("change", function () {
      if (salaryPrompt.checked) {
        document.getElementById("salary_prompt").style.display = "block";
      } else {
        document.getElementById("salary_prompt").style.display = "none";
      }
    });
  }

  if (visaPrompt) {
    visaPrompt.addEventListener("change", function () {
      if (visaPrompt.checked) {
        document.getElementById("visa_prompt").style.display = "block";
      } else {
        document.getElementById("visa_prompt").style.display = "none";
      }
    });
  }

  if (startingDayPrompt) {
    startingDayPrompt.addEventListener("change", function () {
      if (startingDayPrompt.checked) {
        document.getElementById("first_day_prompt").style.display = "block";
      } else {
        document.getElementById("first_day_prompt").style.display = "none";
      }
    });
  }

  if (prerequisitesPrompt) {
    prerequisitesPrompt.addEventListener("change", function () {
      if (prerequisitesPrompt.checked) {
        document.getElementById("prequisites_prompt").style.display = "block";
      } else {
        document.getElementById("prequisites_prompt").style.display = "none";
      }
    });
  }
};

export { initProgramform };
