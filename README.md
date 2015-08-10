#Multi-Path Story Creator

### Overview
The aim of this project was to produce a small web app that allowed a user to
write a story. After each line of the story, the user can write 4 optional
lines to follow it. There is currently no fixed limit on the number of lines
that can be written. However, there is no database on that backend, so the
story does not persist.

### Knowledge Aims
This project aimed to test my knowledge of OOP, BDD and TDD. 

### Design Considerations
I felt that there were two classes in the domain, Stories and Lines. However,
given that I was taking a shortcut to only allow one Story, I combined the two.

I took a traditional BDD approach, by starting with Cucumber to write my
feature tests, during my second scenario, I had to complete some of the model
developement in order to get it to pass. This led me to my TDD unit testing
with Rspec. I continued in this cycle, until all the features of the app were
complete. At which point, I tidied up some of the naming that I felt was
inconsistent, and refactored the codebase.

### Shortcuts
Currently the story writer suits users who want to take the "Happy Path". For
example if you choose not to write the first line of the story in the center
box, it will be lost as soon as you do write in the center box. I have also not
implemented any error handling into the app.

### Takeaways
Using shotgun to automatically reset the server led to a small time sink, since
it was reinitialising my Story object, and as such, lines were being lost when
I tested it. Using rackup and manually restarting the server solved this. 

###Usage
Move to your projects directory using `cd`.

```
$ git clone https://github.com/nickbdyer/story_writer.git
$ cd story_writer/
```

Start the Server
```
$ rackup -p 3000
```

Navigate to `localhost:3000` in your browser to see the app running.

###Testing
Run the following commands in your terminal.

```
$ cd story_writer/
$ cucumber && rspec
```
