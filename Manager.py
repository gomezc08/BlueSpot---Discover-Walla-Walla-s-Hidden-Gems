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
        try:
            # open the image.
            with open(image, "rb") as image_file:
                image_blob = image_file.read()
                
            query = ("INSERT INTO Photo" "(PID, Username, Title, Description, DateUploaded, Image, Location)" "VALUES(%s, %s, %s, %s, %s, %s, %s)")    
            query_data = (pid, username, title, description, date_uploaded, image_blob, location)
            self.cursor.execute(query, query_data)
            self.cnx.commit()
        
        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()
    
    def comment(self):
        pass
    
    def rate(self):
        pass
    
    def tags(self):
        pass

def main():
    m = Manager()
    m.user_sign_up("shahad", "shah.gmail.com", "shaha", "dehoti")
    m.upload_photo(1, "shahad", "pic", "example of uploaded pic",datetime.now().strftime("%Y-%m-%d %H:%M:%S"), './pic_example.jpg', "walla walla")
    
main()