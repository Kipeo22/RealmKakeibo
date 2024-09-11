import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {

    
    
//    テーブルビューの宣言
    @IBOutlet var tableView: UITableView!
    
//    データの保存や読み取り
    let realm = try! Realm()
    
//    読み取ったデータを入れる用の配列
    var items: [ShoppingItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        DataSourceを継承したら書くやつ
        tableView.dataSource = self
//        カスタムセルをTableViewに登録
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        
//        readItem関数で読み取ったデータをitemsに代入
        items = readItems()
    }
    
//    viewWillAppearは画面が表示される時に実行されるメソッド(戻ってきた時にも実行される)
    override func viewWillAppear(_ animated: Bool) {
        items = readItems()
        tableView.reloadData()
    }
    
//    表示するセルの数を指定するメソッド
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
//    セルの内容を指定すrメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
        
        return cell
    }
    
//    Realmにアクセスしてデータの読み取り
    func readItems() -> [ShoppingItem] {
        return Array(realm.objects(ShoppingItem.self))
    }

}

