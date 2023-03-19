# Bash

# SQL
**Export database**  
`pg_dump -U username -h localhost databasename > fileName.sql`

**Import database from fileName.sql**  
first create a database with myDBName  
`psql -U username myDBName < fileName.sql`


UNDONE LAST COMMIT
git reset HEAD^
REVERT CHANGES
git log --oneline
git checkout abc123 -- filename.txt



It's a common convention to use specific prefixes in Git commit messages to indicate the nature of the changes made in the commit:

- `fix:` - for commits that fix bugs or issues in the code
- `feat:` - for commits that add new features or functionality to the code
- `refactor:` - for commits that make changes to the code structure or organization without changing its behavior
- `chore:` - for commits that make changes to the build process, dependencies, or other non-code-related tasks
- `test:` - for commits that add or modify test cases or testing-related code
