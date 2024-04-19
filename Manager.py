from DBConnector import DBConnector
from datetime import datetime, timedelta

class Manager (DBConnector):
    """
    Focuses on handling operations within the system.
    
    Methods:
        user_sign_up:  Adds new user information to the User table in the database.
        upload_photo: Allows a specified user to upload a photo, which is then stored in the Photos table in the database.
        comment: Allows valid users to comment on other users' photos, which is then stored in the Comments table in the database.
        rate_photo: Allows user to rate a given photo, which is then stored in the Ratings table in the database.
        tags: Allows a user to add tag(s) to their photo, which is then stored in the Tags table in the database.
        update_user_avg_ratings: Updates average rating for all users in User table.
        update_photo_avg_ratings: Updates average rating for all photos in Photos table.
        rate: Allows any web viewer to rate a photo.
    """
    def __init__(self, user, password, host):
        super().__init__(user, password, host)
    
    def user_sign_up(self, username, email, fname, lname):
        self.open_connection()
        # insert into database.
        try:
            query = ("INSERT INTO BluespotUser" "(Username, Email, FirstName, LastName)" "VALUES(%s, %s, %s, %s)")
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
            query = ("INSERT INTO Photo" "(PID, Username, Title, PhotoDescription, DateUploaded, Image, Location)" "VALUES(%s, %s, %s, %s, %s, %s, %s)")    
            query_data = (pid, username, title, description, date_uploaded, image, location)
            self.cursor.execute(query, query_data)
            self.cnx.commit()
        
        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()
            
    def comment(self, pid, daytime, username, content):
        self.open_connection()
        
        try:
            query = ("INSERT INTO Comments" "(PID, DayTime, Username, Content)" "VALUES(%s, %s, %s, %s)")
            query_data = (pid, daytime, username, content)
            self.cursor.execute(query, query_data)
            self.cnx.commit()
            
        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()
    
    def rate_photo(self, pid, rating, daytime):
        #assert 0 <= rating <= 5
        self.open_connection()
        
        # insert into database.
        try:
            query = ("INSERT INTO Ratings" "(PID, Rating, DayTime)" "VALUES(%s, %s, %s)")    
            query_data = (pid, rating, daytime)
            self.cursor.execute(query, query_data)
            self.cnx.commit() 
        
        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()
    
    def tags(self, pid, tag):
        self.open_connection()
        
        try:
            query = ("INSERT INTO Tags" "(PID, Tag)" "VALUES(%s, %s)")
            query_data = (pid, tag)
            self.cursor.execute(query, query_data)
            self.cnx.commit()
        
        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()
    
    def update_user_avg_ratings(self):
        self.open_connection()

        try:
            query = """
                UPDATE BluespotUser u
                SET AvgRating = (
                    SELECT AVG(r.Rating)
                    FROM Ratings r
                    JOIN Photo p ON r.PID = p.PID
                    WHERE p.Username = u.Username
                )
            """
            self.cursor.execute(query)
            self.cnx.commit()

        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()


    
    def update_photo_avg_ratings(self):
        self.open_connection()

        try:
            query = """
                UPDATE Photo p
                SET AvgRating = (
                    SELECT AVG(r.Rating)
                    FROM Ratings r
                    WHERE r.PID = p.PID
                )
            """
            self.cursor.execute(query)
            self.cnx.commit()

        except Exception as e:
            print(f"Error!!: {e}")

        finally:
            self.close_connection()


def main():
    m = Manager("root", "!WhitmanMemo08?", "127.0.0.1")
    # creating fake data.
    m.user_sign_up("shahad", "shah.gmail.com", "shaha", "dehoti")
    m.upload_photo(1, "shahad", "pic", "example of uploaded pic", datetime.now().strftime("%Y-%m-%d %H:%M:%S"), "neural-network.jpg", "walla walla")
    m.comment(1, datetime.now().strftime("%Y-%m-%d %H:%M:%S"), "shahad", "amazing photo!")
    m.rate_photo(1, 4.5, datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
    m.rate_photo(1, 3.5, (datetime.now() + timedelta(hours=2)).strftime("%Y-%m-%d %H:%M:%S"))
    m.rate_photo(1, 2, (datetime.now() + timedelta(hours=3)).strftime("%Y-%m-%d %H:%M:%S"))
    m.tags(1, "#neural")
    m.tags(1, "#network")
    m.tags(1, "#kumar the goat")
    
    m.user_sign_up("gomezc", "gomezc@gmail.com", "Chris", "Gomez")
    # photo 1
    m.upload_photo(2, "gomezc", "Dog", "this is a selfie with my dog", datetime.now().strftime("%Y-%m-%d %H:%M:%S"), "pic_example.jpg", "couv")
    m.comment(2, (datetime.now() + timedelta(hours=5)).strftime("%Y-%m-%d %H:%M:%S"), "gomezc", "cute dog")
    m.comment(2, (datetime.now() + timedelta(hours=12)).strftime("%Y-%m-%d %H:%M:%S"), "gomezc", "nice pic!")
    m.rate_photo(2, 3, (datetime.now() + timedelta(hours=5)).strftime("%Y-%m-%d %H:%M:%S"))
    m.rate_photo(2, 4, (datetime.now() + timedelta(hours=6)).strftime("%Y-%m-%d %H:%M:%S"))
    m.tags(2, "#dog")
    m.tags(2, "#couver")
    # photo 2
    m.upload_photo(3, "gomezc", "window", "symbol for feminity", datetime.now().strftime("%Y-%m-%d %H:%M:%S"), "window.jpeg", "walla walla")
    m.comment(3, (datetime.now() + timedelta(hours=15)).strftime("%Y-%m-%d %H:%M:%S"), "gomezc", "woah")
    m.rate_photo(3, 3, (datetime.now() + timedelta(hours=17)).strftime("%Y-%m-%d %H:%M:%S"))
    m.rate_photo(3, 4, (datetime.now() + timedelta(hours=18)).strftime("%Y-%m-%d %H:%M:%S"))
    m.rate_photo(3, 5, (datetime.now() + timedelta(hours=19)).strftime("%Y-%m-%d %H:%M:%S"))
    m.tags(3, "#window")
    m.tags(3, "#art")

    m.update_photo_avg_ratings()
    m.update_user_avg_ratings()
    
main()