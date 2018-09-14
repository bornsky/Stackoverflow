# StackOverflow iOS Project
Create an iOS application in Swift that displays returns a list of questions from the StackOverflow Search endpoint:
(https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=swift&site=stackoverflow)

##Base:
Display a list of questions showing:
- title
- owner display name
- owner profile image
- number of answers

Support Pagination

Clicking on a Question should Push you to a new ViewController which displays a list of answers
- API Reference: https://api.stackexchange.com/docs/answers-on-questions
- Show Question Title, Owner Display Name, Owner Profile Image, Number of Answers (same UI as the first screen)
- Show Body of Question. Use `body_markdown` to display body text. (We don't expect you to parse the markdown)
- Show Answers. For each answer show: Owner's profile image, Owner's display name, the answer using `body_markdown` to display text of answer

Use Swift
Use whatever UI methods you would like (StoryBoard / Xib, programatic etc...).
Use whatever dependencies you would like - though the fewer the better

Bonus points:
Error Handling
Empty State / Loading Handing
Local Storage

##API Reference:
https://api.stackexchange.com/docs
https://api.stackexchange.com/docs/search#order=desc&sort=activity&intitle=swift&filter=default&site=stackoverflow
https://api.stackexchange.com/docs/answers-on-questions

##Evaluation:
We understand that your time is valuable and thank you for taking the time to work on this project. After the completion on this project we will set up a call to do a code review and talk through your code and architecture decisions.
We will be looking at:
- Data structure choices
- Code organization and architecture
- Swift language features
