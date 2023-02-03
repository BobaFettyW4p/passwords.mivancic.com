import sqlite3

conn = sqlite3.connect('database.db')

cursor = conn.cursor()

cursor.execute('''CREATE TABLE visits (
    website TEXT,
    total_visitors INTEGER,
    button_presses INTEGER
);
'''
)

conn.commit()

initial_values = [('test.mivancic.com', 0, 0)]

cursor.executemany("INSERT INTO visits VALUES (?,?,?)", initial_values)
conn.commit()