# Systematic Program Design

## What is this repo?
s7oev/spd is my proof that I have finished the courses **Systematic Program Design - Part 1 (SPD1x)**, **Systematic Program Design - Part 2 (SPD2x)** and **Systematic Program Design - Part 3 (SPD3x)**. All three are available on edX: [SPD1x](https://courses.edx.org/courses/course-v1:UBCx+SPD1x+2T2015/course/) / [SPD2x](https://courses.edx.org/courses/course-v1:UBCx+SPD2x+2T2015/course/) / [SPD3x](https://courses.edx.org/courses/course-v1:UBCx+SPD3x+3T2015/course/), however, were offered as MOOCs in 2015 so they are currently archived, meaning all material can be accessed but the staff is not available for support and no official certificates can be granted.

So, this repo shows all my work in the courses, including solutions to the recommended problems, as well as the quizzes. The latter can be design quizzes - in which case my code is shown, or multiple choice - in which case a PDF is attached. Keep in mind that the functional programming language used in this course is Racket-based (which itself is a dialect of Lisp). Because of this, DrRacket is necessary to preview properly the code. I have made exports of my solutions, yet they may have some missing data sometimes - because DrRacket allows the direct input of images, which cannot obviously be achieved in the text-only export. Yet, obviously, the actual code will be perfectly readable from the exports.

Most folders will have the following structure:  
**_1\. (problem name)-starter.rkt_** :: problem statement  
**_2\. (problem name)-solution (mine) export.txt_** :: my solution exported to txt  
**_2\. (problem name)-solution (mine).rkt_** :: my solution  
**_2\. (problem name)-solution (mine).rkt~_** :: DrRacket temporary file (ignore)  
**_3\. (problem name)-solution.rkt_** :: official (from course staff) solution  

## Syllabus Part 1

<table>
  <tr>
    <th>Week</th>
    <th width=25%>Module Name</th>
    <th>Lectures</th>  
    <th>Time to complete</th>  
    <th>Practice Problems</th>  
    <th width=14%>Quiz</th>
  </tr>
  <tr>
  <th colspan="1">
  </th> 
  <th colspan="5">Overall learning goal</th> 
  </tr>

  <tr>
    <td rowspan="2">1</td>
    <td><strong>Beginning Student Language</strong></td>
    <td>8</td>
    <td>5-8 Hours</td>
    <td>4</td>
    <td><i>none</i></td>
  </tr>

  <tr>
  
  <td colspan="5">Learn to program with the core of the programming language used throughout the course.</td>
  </tr>




  <tr>
    <td rowspan="2">2</td>
    <td><strong>How to Design Functions (HtDF) Recipe</strong></td>
    <td>6</td>
    <td>4-7 Hours</td>
    <td>3</td>
    <td>Self-Assessed Design Quiz</td>
  </tr>
  
  <tr>
  <td colspan="5">Learn to use the HtDF recipe to design functions that consume simple primitive data.</td>
    
  
  <tr>
    <td rowspan="2">3</td>
    <td><strong>How to Design Data (HtDD) Recipe</strong></td>
    <td>12</td>
    <td>5-8 Hours</td>
    <td>3</td>
    <td>Self-Assessed Design Quiz</td>
  </tr>
  
  <tr>	
  <td colspan="5">Learn to use the HtDD recipe to design data definitions for atomic data.</td>
    
 
  <tr>
    <td rowspan="3">4</td>
    <td><strong>How to Design Worlds (HtDW) Recipe</strong></td>
    <td>7</td>
    <td>3-5 Hours</td>
    <td>1</td>
    <td><i>none</i></td>
  </tr>
  
  <tr>
    <td><strong>Compound Data</strong></td>
    <td>3</td>
    <td>4-6 Hours</td>
    <td>3</td>
    <td>Peer-Assessed Final Project</td>
  </tr>
  
  <tr>		
  <td colspan="5">Learn to use the HtDW recipe to design interactive programs with atomic and then compound world state.</td>
  </tr>
</table>

## Syllabus Part 2

<table>
<tbody>
<tr>
  <th rowspan="2">Week</th>
  <th width="25%">Module Name</th>
  <th>Lectures</th>
  <th>Time to complete</th>
  <th>Practice Problems</th>
  <th rowspan="2" width="14%">Quiz</th>
</tr>
<tr>
  <th colspan="4">Overall learning goal</th>
</tr>

<tr>
  <td rowspan="4">5</td>
  <td><strong>Self-Reference</strong></td>
  <td>7</td>
  <td>5-7 Hours</td>
  <td>4</td>
  <td rowspan ="4"><i>Multiple Choice Quiz</i></td>
</tr>
<tr>
  <td colspan="4">Learn how to use well-formed self-referential data definitions to represent arbitrary sized data.</td>
</tr>
<tr>
  <td><strong>Reference</strong></td>
  <td>3</td>
  <td>4-6 Hours</td>
  <td>2</td>
</tr>
<tr>
 <td colspan="4">Learn to predict and identify the correspondence between references in a data definition and helper function calls in functions that operate on the data.</td>
</tr>

<tr>
  <td rowspan="4">6</td>
  <td><strong>Naturals</strong></td>
  <td>2</td>
  <td>3-4 Hours</td>
  <td>2</td>
  <td rowspan ="4"><i>Self-Assessed Design Quiz</i></td>
</tr>
<tr>
  <td colspan="4">Design an alternate data definition for the natural numbers, and learn to write functions using this new data definition.</td>
</tr>
<tr>
  <td><strong>Helpers</strong></td>
  <td>6</td>
  <td>6-9 Hours</td>
  <td>1</td>
</tr>
<tr>
  <td colspan="4">Learn a set of rules for designing functions with helper functions.</td>
</tr>

<tr>
  <td rowspan="4">7</td>
  <td><strong>Binary Search Trees</strong></td>
  <td>6</td>
  <td>5-6 Hours</td>
  <td>3</td>
  <td rowspan ="4"><i>Multiple Choice Quiz</i></td>
</tr>
<tr>
  <td colspan="4">Design a data defintion for Binary Search Trees, and learn to write functions operating on BSTs.</td>
</tr>
<tr>
  <td><strong>Mutual Reference</strong></td>
  <td>5</td>
  <td>6-7 Hours</td>
  <td>1</td>
</tr>
<tr>
  <td colspan="4">Learn to design with mutually referential data.</td>
</tr>

<tr>
  <td rowspan="4">8</td>
  <td><strong>Two One-Of Types</strong></td>
  <td>2</td>
  <td>3-5 Hours</td>
  <td>2</td>
  <td rowspan ="4"><i>Self-Assessd Design Quiz</i></td>
</tr>
<tr>
  <td colspan="4">Learn to use a cross-product of type templates table to design functions operating on two complex pieces of data.</td>
</tr>
<tr>
  <td><strong>Local</strong></td>
  <td>6</td>
  <td>8-10 Hours</td>
  <td>4</td>
</tr>
<tr>
  <td colspan="4">Learn to use local expressions in your function designs.</td>
</tr>

</tbody>
</table>

## Syllabus Part 3

<table>
<tbody>
<tr>
  <th rowspan="2">Week</th>
  <th width="25%">Module Name</th>
  <th>Lectures</th>
  <th>Time to complete</th>
  <th>Practice Problems</th>
  <th rowspan="2" width="14%">Quiz</th>
</tr>
<tr>
  <th colspan="4">Overall learning goal</th>
</tr>
<tr>
  <td rowspan="2">9</td>
  <td><strong>Abstraction</strong></td>
  <td>7</td>
  <td>8-12 Hours</td>
  <td>3</td>
  <td rowspan ="2"><i>Multiple Choice Design Quiz</i></td>
</tr>
<tr>
  <td colspan="4">Learn how to design functions that are more general and versatile using abstraction.</td>
</tr>
<tr>
  <td rowspan="4">10</td>
  <td><strong>Generative Recursion</strong></td>
  <td>3</td>
  <td>5-6 Hours</td>
  <td>2</td>
  <td rowspan ="4"><i>Multiple Choice Design Quiz</i></td>
</tr>
<tr>
  <td colspan="4">Learn how to use generative recursion to create fractals.</td>
</tr>
<tr>
  <td><strong>Search</strong></td>
  <td>9</td>
  <td>8-9 Hours</td>
  <td>0</td>
</tr>
<tr>
  <td colspan="4">Expand on generative recursion to solve search problems, such as Sudoku.</td>
</tr>
<tr>
  <td rowspan="2">11</td>
  <td><strong>Accumulators</strong></td>
  <td>5</td>
  <td>9-10 Hours</td>
  <td>3</td>
  <td rowspan ="2"><i>Multiple Choice Design Quiz</i></td>
</tr>
<tr>
  <td colspan="4">Learn how and when to use accumulators in several ways.</td>
</tr>
<tr>
  <td rowspan="2">12</td>
  <td><strong>Graphs</strong></td>
  <td>4</td>
  <td>7-8 Hours</td>
  <td>3</td>
  <td rowspan ="2"><i>Multiple Choice Design Quiz</i></td>
</tr>
<tr>
  <td colspan="4">Learn to identify when information naturally forms a graph, and learn to write functions operatingon such data.</td>
</tr>
</tbody>
</table>

</div>

    </div>
</div>
