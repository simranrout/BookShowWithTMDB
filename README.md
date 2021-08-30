# BookShowWithTMDB

# OverView
Objective :- 
    The developed application shows fetched list of movies from TMDB API . User can select a particular movie and check its details (which consist of Movie name , release date , genre , Approval rate , Movie Description , Cast , Crew and similar kind of movies) . User can search particular movie as well and get the details by clicking on that movie . Application consist of 2 tab movie tab and profile tab . 
    Here i have followed MVVM architecture and tried using some best practises and coding standards.
  
  
# Screen Details :- 
  1. SignIn Screen :- Here those who have already have an account can log in . (In progress...)
  2. SignUp Screen :-  Here new users can create their account.  (In progress ...)
  3. Movie Tab :- 
        1. Now Playing :-  It shows list of movies fetched from API (which consist of movie poster , Title , Language , Release Date , ) and consist of search bar (Here user can type movie title and search the movie).
        2. Movie Details :-  This screen comes up when user have clicked on any movie , This screen consist of all details regarding the movie and Book Now button which will navigate the user to next screen (payment section).
        3. Payment Screen :-  It consist of user details and movie details and Pay Now button . If user clicks on it user will get generated pdf with all the details. (In progress ...)  
  4. Profile Tab :-  
      1.Settings Screen:- It consist of signout option . If user clicks on signout option this will erase all the cache Data and logout from the current account.


# Reference
refer to Usermanual PDF  (path :- BookShowWithTMDB/Resources/usermanual.pdf)


# Particulars or More Details 

1. Followed architectural pattern :- MVVM
2. Dependecies :- Firebase (Auth , Firestore , Storage) 
3. Language :- Swift version (5.4)
4. IDE :- Xcode 
5. Framework Used :- UIKIT , Fondation , Combine 
6. API used :- TMDB API (reference :- https://developers.themoviedb.org/3/getting-started/introduction )

