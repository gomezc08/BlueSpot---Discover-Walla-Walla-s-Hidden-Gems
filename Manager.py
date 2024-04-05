from DBConnector import DBConnector
from datetime import datetime

class Manager (DBConnector):
    """
    Focuses on handling operations within the system.

    
    """
    def __init__(self):
        super().__init__()
    
    def user_sign_up(self, username, email, fname, lname):
        self.open_connection()
        # insert into database.
        try:
            query = ("INSERT INTO User" "(Username, Email, FirstName, LastName)" "VALUES(%s, %s, %s, %s)")
            query_data = (username, email, fname, lname)
            self.cursor.execute(query, query_data)
            self.cnx.commit()
        
        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()
    
    def upload_photo(self, pid, username, title, description, date_uploaded, image, location):
        self.open_connection()
        
        # insert into database.
        query = ("INSERT INTO Photo" "(PID, Username, Title, Description, DateUploaded, Image, Location)" "VALUES(%s, %s, %s, %s, %s, %s, %s)")    
        query_data = (pid, username, title, description, date_uploaded, image, location)
        self.cursor.execute(query, query_data)
        self.cnx.commit()
    
    
        self.close_connection()
    
    def comment(self, pid, daytime, username, content):
        self.open_connection()
        
        query = ("INSERT INTO Comments" "(PID, DayTime, Username, Content)" "VALUES(%s, %s, %s, %s)")
        query_data = (pid, daytime, username, content)
        self.cursor.execute(query, query_data)
        self.cnx.commit()
        
        self.close_connection()
    
    def rate(self, avgRating, pid):
        self.open_connection()
        
        query = ("UPDATE Photo SET AvgRating = %s WHERE PID = %s")
        query_data = (avgRating, pid)
        self.cursor.execute(query, query_data)
        self.cnx.commit()
        
        self.close_connection()
    
    def tags(self, pid, tag):
        self.open_connection()
        
        query = ("INSERT INTO Tags" "(PID, Tag)" "VALUES(%s, %s)")
        query_data = (pid, tag)
        self.cursor.execute(query, query_data)
        self.cnx.commit()
        
        self.close_connection()

def main():
    m = Manager()
    # m.user_sign_up("shahad", "shah.gmail.com", "shaha", "dehoti")
    # m.upload_photo(1, "shahad", "pic", "example of uploaded pic", datetime.now().strftime("%Y-%m-%d %H:%M:%S"), "neural-network.jpg", "walla walla")
    # m.comment(1, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), "shahad", "amazing photo!")
    # m.rate(4.5, 1)
    # m.tags(1, "#dog")
    # m.tags(1, "#chris")
    
main()