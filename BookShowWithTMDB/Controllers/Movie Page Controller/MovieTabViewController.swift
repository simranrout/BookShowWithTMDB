//
//  MainViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit

class MovieTabViewController: UIViewController , UITableViewDelegate , UITableViewDataSource  {
    @IBOutlet weak var TableView: UITableView!
    
    var movieSearch = UISearchController(searchResultsController: nil)
    var page = 1
    var results = [MovieModel]()
    var movieListVM = MoviesListViewModel()
    var genreId = GenreParsing()
    var filterMovieList = [MovieModel]()
    var isSearching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making itself as a datasource and delegate of tableview
        TableView.dataSource = self
        TableView.delegate = self
        movieListVM.delegate = self
        configureSearchBar()
        //Adding Loadmore cell
        TableView.register(LoadMoreTableViewCell.nib(), forCellReuseIdentifier: LoadMoreTableViewCell.LoadMorePrototypeCellID)
        movieListVM.movieDataFetch(page)
        genreId.genreJSONParse()
        
      
    }
    
    //Passing the data (Movie Model for specific row ) to Movie Details View controller through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          guard TableView.indexPathForSelectedRow != nil else {
              return
          }
        if isSearching{
            let updatedResult = filterMovieList[TableView.indexPathForSelectedRow!.row]
            let movieDetailsVC =  segue.destination as! MovieDetailsViewController
            movieDetailsVC.updateMovieDetails = updatedResult
        }
        else{
            let updatedResult = results[TableView.indexPathForSelectedRow!.row]
            let movieDetailsVC =  segue.destination as! MovieDetailsViewController
            movieDetailsVC.updateMovieDetails = updatedResult
        }
        
    }
    
    //MARK:- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            print("print here", filterMovieList.count)
            return filterMovieList.count
        }
        else{
            return results.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = TableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.moviePrototypeCellID, for: indexPath) as! MovieTableViewCell
        if isSearching {
            cell.displayingDataOnCell(filterMovieList[indexPath.row])
            return cell
        }
        else{
            if indexPath.row == results.count{
                let loadCell = TableView.dequeueReusableCell(withIdentifier: LoadMoreTableViewCell.LoadMorePrototypeCellID, for: indexPath) as! LoadMoreTableViewCell
                //return cell
                if results.count > 0 {
                    loadMore()
                }
                return loadCell
            }
            
            let cell = TableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.moviePrototypeCellID, for: indexPath) as! MovieTableViewCell
            cell.displayingDataOnCell(self.results[indexPath.row])
            return cell
        }
        
        
    }
    
    func loadMore(){
        page += 1
        movieListVM.movieDataFetch(page)
    }
    
    private func searchTextFromMovieList(_ searchText: String){
        guard searchText.trimmingCharacters(in: .whitespaces).isEmpty else {
            let text = searchText
            filterMovieList = []
            for i in 0...self.results.count-1{
                if self.results[i].original_title.components(separatedBy: .whitespaces).joined().lowercased().contains(text){
                    filterMovieList.append(self.results[i])
                    TableView.separatorStyle = .singleLine
                    TableView.reloadData()
                    print("search text result" , self.results[i].original_title , i  , filterMovieList , filterMovieList.count)
                    
                }
            }
            if filterMovieList.count == 0 {
                isSearching = false
                filterMovieList = []
                TableView.separatorStyle = .none
                TableView.reloadData()
            }
            return
        }
        
    }
    

  
}

extension MovieTabViewController: MoviesListFetchprotocol {

    func fetchMovieList(_ results: [MovieModel]) {
        self.results.append(contentsOf: results)
        TableView.separatorStyle = .singleLine
        TableView.reloadData()
    }
    
}

extension MovieTabViewController: UISearchResultsUpdating , UISearchBarDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        guard  searchText != "" else {
            isSearching = false
            filterMovieList.removeAll()
            TableView.reloadData()
            return
        }
        isSearching = true
        let filteredText = searchText!.components(separatedBy: .whitespaces).joined().lowercased()
        searchTextFromMovieList(filteredText)
    }
    
    
    
    func configureSearchBar(){
        navigationItem.searchController = movieSearch
        movieSearch.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        movieSearch.searchBar.placeholder = "Type Movie Name Here..."
        movieSearch.obscuresBackgroundDuringPresentation = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        movieSearch.searchBar.text = ""
        isSearching = false
        filterMovieList = []
        TableView.reloadData()
    }
    
    
}
 
