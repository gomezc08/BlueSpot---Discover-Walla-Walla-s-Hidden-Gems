import mysql.connector

class DBConnector:
    """
    Provides a streamlined interface for connecting to the MySQL Workbench/database.

    Attributes:

    Methods:
        open_connection: Opens the connection to Saturn's SQL database.
        close_connection: Closes the connection to Saturn's SQL database.
    """

    def __init__(self, user, password, host):
        self.cnx = None
        self.cursor = None
        self.user = user
        self.password = password
        self.host = host

    def open_connection(self):
        print("<<OPENING>> connection to MySQL")
        config = {
            "user": self.user,
            "password": self.password,
            "host": self.host,
            "port": 3307,
            "database": "bluespot",
            "raise_on_warnings": True,
        }
        try:
            self.cnx = mysql.connector.connect(**config)
            self.cursor = self.cnx.cursor()
            print("Connected to MySQL")
        except mysql.connector.Error as err:
            if err.errno == mysql.connector.errorcode.ER_ACCESS_DENIED_ERROR:
                print("Something is wrong with your user name or password")
            elif err.errno == mysql.connector.errorcode.ER_BAD_DB_ERROR:
                print("Database does not exist")
            else:
                print("Could not connect to MySQL:", err)

    def close_connection(self):
        print("<<CLOSING>> connection to MySQL\n\n\n\n")
        self.cnx.close()
        self.cursor.close()

def main():
    db = DBConnector("root", "!WhitmanMemo08?", "127.0.0.1")
    db.open_connection()
    db.close_connection()

main()