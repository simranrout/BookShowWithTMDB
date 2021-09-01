//
//  MainViewController.swift
//  BookShowWithTMDB
//
//  Created by Simran Rout on 12/08/21.
//

import UIKit
import Combine

class MovieTabViewController: UIViewController   {
    @IBOutlet weak var tableView: UITableView!
    
    var movieSearch = UISearchController(searchResultsController: nil)
    var page = 1
    var results = [MovieModel]()
    var movieListVM = MoviesListViewModel()
    var filterMovieList = [MovieModel]()
    var isSearching: Bool = false
    var stateObserver :  AnyCancellable?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureSearchBar()
        configureMovieViewModel()
    }
    
    private func configureMovieViewModel(){
        movieListVM.delegate = self
        movieListVM.movieDataFetch(page)
        stateObserver = movieListVM.$state.sink(receiveValue: { (state) in
            switch state{
            case .loading:
                break
            case .loadingCompleted:
                break
            case .errorOccured(let error) :
                self.singleMessageAlertView(titleText: "Warning !!!", message: error?.description ?? "N/A", preferredStyle: .alert)
            }
        })
        
    }
    //Passing the data (Movie Model for specific row ) to Movie Details View controller through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        if isSearching{
            let updatedResult = filterMovieList[tableView.indexPathForSelectedRow!.row]
            let movieDetailsVC =  segue.destination as! MovieDetailsViewController
            movieDetailsVC.updateMovieDetails = updatedResult
        }
        else{
            let updatedResult = results[tableView.indexPathForSelectedRow!.row]
            let movieDetailsVC =  segue.destination as! MovieDetailsViewController
            movieDetailsVC.updateMovieDetails = updatedResult
        }
        
    }
    
    
   private func loadMore(){
        page += 1
        movieListVM.movieDataFetch(page)
    }
    
    private func searchTextFromMovieList(_ searchText: String){
        guard searchText.trimmingCharacters(in: .whitespaces).isEmpty || self.results.count == 0 else {
            print("here", self.results.count)
            let text = searchText
            filterMovieList = []
            for i in 0...self.results.count-1{
                if self.results[i].original_title.components(separatedBy: .whitespaces).joined().lowercased().contains(text){
                    filterMovieList.append(self.results[i])
                    tableView.reloadData()
                }
            }
            if filterMovieList.count == 0 {
                filterMovieList = []
                tableView.reloadData()
            }
            return
        }
    }
}



extension MovieTabViewController :  UITableViewDelegate , UITableViewDataSource {
    //Configure tableView and register custom cell
    private func configureTableView(){
        // Making itself as a datasource and delegate of tableview
        tableView.dataSource = self
        tableView.delegate = self
        //Adding Loadmore cell
        tableView.register(LoadMoreTableViewCell.nib(), forCellReuseIdentifier: LoadMoreTableViewCell.loadMorePrototypeCellID)
    }
    
    //MARK:- TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return filterMovieList.count
        }
        else{
            return results.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.moviePrototypeCellID, for: indexPath) as! MovieTableViewCell
        if isSearching {
            cell.displayingDataOnCell(filterMovieList[indexPath.row])
            return cell
        }
        else{
            if indexPath.row == results.count{
                let loadCell = tableView.dequeueReusableCell(withIdentifier: LoadMoreTableViewCell.loadMorePrototypeCellID,
                                                             for: indexPath) as! LoadMoreTableViewCell
                if results.count > 0 {
                    loadMore()
                }
                return loadCell
            }

            cell.displayingDataOnCell(self.results[indexPath.row])
            return cell
        }
    }
}

extension MovieTabViewController: MoviesListFetchprotocol {

    func fetchMovieList(_ results: [MovieModel]) {
        self.results.append(contentsOf: results)
        tableView.separatorStyle = .singleLine
        tableView.reloadData()
    }
    
}

extension MovieTabViewController: UISearchResultsUpdating , UISearchBarDelegate{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        guard  searchText != "" else {
            isSearching = false
            filterMovieList.removeAll()
            tableView.reloadData()
            return
        }
        isSearching = true
        let filteredText = searchText!.components(separatedBy: .whitespaces).joined().lowercased()
        searchTextFromMovieList(filteredText)
    }
    
   private func configureSearchBar(){
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
        tableView.reloadData()
    }
    
    
}
 
