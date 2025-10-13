### Bandit - Level 8

Objecktive
The password for the next level is stored in the file `data.txt` and is the **only line that occurs exactly once**.

My path to a solution 
The goal was to identify the unique line in a large data file. Instead of manually checking or using multiple commands separately, I used **pipelines**, which let you pass the output of one command directly as input to another. This makes it easier to process data step by step in a single command.

Here’s the solution I used:

```bash
cat data.txt | sort | uniq -u
```

**Explanation:**

* `cat data.txt` – displays the contents of the file.
* `sort` – sorts the lines alphabetically so that identical lines are placed next to each other.
* `uniq -u` – filters the output and displays **only the line that appears once** in the file.

This approach efficiently found the unique line, which contained the password. From this level, I learned how powerful combining commands with pipelines can be and how `sort` and `uniq` can be used together for text analysis.
