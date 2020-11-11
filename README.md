# makersbnb

## Setup Instructions

* Clone this repo to your local machine
* `$ bundle install`
* Run all SQL files in `db/migrations` using `$ psql -f 'file_name'` to set up databases
* `$ shotgun` to start up the server

## The Team
* Zoe Thomas - [zoecode26](https://github.com/zoecode26)
* Hatairy Dos Santos - [hdsmakers](https://github.com/hdsmakers)
* Melissa Kneale - [mkneale](https://github.com/mkneale)
* Oliver Kennedy - [olliekennedy](https://github.com/olliekennedy)

## Our Approach
### Day 1

* Created team Trello board with some user stories.
* Defined fundamental components of the application - file structure, database design and gem installation.
* Created ERD and database - good for everyone to have a solid, agreed understanding.
* Defined Day 2's pairs, assigned `space` to one pair and `customer` to the other.

### Day 2
> Lesson learned: Be careful of merging too early, especially with failing tests.
#### Space
* Created `/add_a_listing` route along with a `Space#add` method and simple views
* Created `/book_a_space` route and `Space#all` to list spaces
* Lots of roadblocks after merging at lunchtime

#### Customer
* Blah
* Blah
* Blah

### Day 2
> Lesson learned: Don't `git add .` in a merge in the command line before committing. Only the files that had conflicts!
#### Space
* Added functionality for listing spaces within a time range
#### Customer
* Blah
#### After Lunch
* Attempted a merge of the two branches, `user_reg` and `space` onto the main branch
* Slip up halfway through the merge conflict where we added all files to the commit rather than just the manually resolved conflicted ones
* Eddie and Leo guided us through restoring the `space` branch that we deleted after the initial merge, resetting our main branch back to what it was before lunch, then attempting another merge of the two branches one by one. There were many hurdles that we got over so lots was learned.

## Entity Relationship Diagram
![ERD](https://github.com/olliekennedy/makersbnb/blob/main/db/entity_relationship_diagram.png?raw=true)
