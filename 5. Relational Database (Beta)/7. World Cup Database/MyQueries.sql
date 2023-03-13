-- bash
-- psql -U freecodecamp postgres

CREATE DATABASE worldcup;
\c worldcup
CREATE TABLE teams(team_id SERIAL PRIMARY KEY, name VARCHAR(15) UNIQUE);
CREATE TABLE games(game_id SERIAL PRIMARY KEY, year INT, round VARCHAR(15), winner_id INT, FOREIGN KEY (winner_id) REFERENCES teams(team_id), opponent_id INT, FOREIGN KEY (opponent_id) REFERENCES teams(team_id), winner_goals INT, opponent_goals INT);

-- set NOT NULL to all columns from a table at once
--SELECT 'ALTER TABLE ' || table_name || ' ALTER COLUMN ' || column_name || ' SET NOT NULL;' FROM information_schema.columns WHERE table_name IN ('teams', 'games') AND is_nullable = 'YES';
---- table_name IN ('teams', 'games') --same as:-- (table_name = 'teams' OR table_name = 'games')
-- The previous query generated the necessary command, but you need to execute them:
DO $$ 
DECLARE 
    stmt text;
BEGIN 
    FOR stmt IN 
        SELECT 'ALTER TABLE ' || table_name || ' ALTER COLUMN ' || column_name || ' SET NOT NULL;' 
        FROM information_schema.columns 
        WHERE table_name IN ('teams', 'games') 
        AND is_nullable = 'YES' 
    LOOP 
        EXECUTE stmt; 
    END LOOP; 
END $$;
-- check if all columns are *Nullable: not null* with `\d teams` and `\d games`
