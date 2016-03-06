/*
* Copyright (C) 2015 - 2016, Daniel Dahan and CosmicMind, Inc. <http://cosmicmind.io>.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
*	*	Redistributions of source code must retain the above copyright notice, this
*		list of conditions and the following disclaimer.
*
*	*	Redistributions in binary form must reproduce the above copyright notice,
*		this list of conditions and the following disclaimer in the documentation
*		and/or other materials provided with the distribution.
*
*	*	Neither the name of Material nor the names of its
*		contributors may be used to endorse or promote products derived from
*		this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import UIKit
import Material

class FeedViewController: UIViewController {
	/// Menu button at the top left of the navigation bar.
	private lazy var menuButton: FlatButton = FlatButton()
	
	/// Search button at the top left of the navigation bar.
	private lazy var searchButton: FlatButton = FlatButton()
	
	/// MaterialCollectionView.
	private lazy var collectionView: MaterialCollectionView = MaterialCollectionView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		prepareView()
		prepareCollectionView()
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		sideNavigationViewController?.enabled = true
	}
	
	override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
		collectionView.reloadData()
	}
	
	internal func handleMenuButton() {
		sideNavigationViewController?.toggleLeftView()
	}
	
	internal func handleSearchButton() {
		print("handled")
	}
	
	/// Prepares view.
	private func prepareView() {
		view.backgroundColor = MaterialColor.grey.lighten4
		
		prepareMenuButton()
		prepareSearchButton()
		
//		navigationItem.title = "Feed"
		
		var label: UILabel = UILabel()
		label.text = "Daniel"

		navigationItem.titleView?.addSubview(label)

		navigationController?.navigationBar.leftControls = [menuButton]
		navigationController?.navigationBar.rightControls = [searchButton]
		navigationController?.navigationBar.statusBarStyle = .LightContent
		navigationController?.navigationBar.tintColor = MaterialColor.white
		navigationController?.navigationBar.backgroundColor = MaterialColor.blue.base
	}
	
	/// Prepares the menuButton.
	private func prepareMenuButton() {
		let image: UIImage? = UIImage(named: "ic_menu_white")
		menuButton.pulseScale = false
		menuButton.pulseColor = MaterialColor.white
		menuButton.setImage(image, forState: .Normal)
		menuButton.setImage(image, forState: .Highlighted)
		menuButton.addTarget(self, action: "handleMenuButton", forControlEvents: .TouchUpInside)
	}
	
	/// Prepares the searchButton.
	private func prepareSearchButton() {
		// Search button.
		let image: UIImage? = UIImage(named: "ic_search_white")
		searchButton.pulseScale = false
		searchButton.pulseColor = MaterialColor.white
		searchButton.setImage(image, forState: .Normal)
		searchButton.setImage(image, forState: .Highlighted)
		searchButton.addTarget(self, action: "handleSearchButton", forControlEvents: .TouchUpInside)
	}
	
	/// Prepares the collectionView
	private func prepareCollectionView() {
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.spacingPreset = .Spacing1
		collectionView.registerClass(MaterialCollectionViewCell.self, forCellWithReuseIdentifier: "MaterialCollectionViewCell")
		
		view.addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		MaterialLayout.alignToParent(view, child: collectionView)
	}
}

extension FeedViewController: MaterialCollectionViewDataSource {
	/// Retrieves the items for the collectionView.
	func items() -> Array<MaterialDataSourceItem> {
		return [
			MaterialDataSourceItem(
				data: [
					"title": "Summer BBQ",
					"detail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
					"date": "February 26, 2016"
				],
				height: 158
			),
			MaterialDataSourceItem(
				data: [
					"title": "Birthday gift",
					"detail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
					"date": "February 26, 2016"
				],
				height: 158
			),
			MaterialDataSourceItem(
				data: [
					"title": "Brunch this weekend?",
					"detail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
					"date": "February 26, 2016"
				],
				height: 158
			),
			MaterialDataSourceItem(
				data: [
					"title": "Giants game",
					"detail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
					"date": "February 26, 2016"
				],
				height: 158
			),
			MaterialDataSourceItem(
				data: [
					"title": "Recipe to try",
					"detail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
					"date": "February 26, 2016"
				],
				height: 158
			),
			MaterialDataSourceItem(
				data: [
					"title": "Interview",
					"detail": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
					"date": "February 26, 2016"
				],
				height: 158
			)
		]
	}
	
	/// Number of sections.
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	/// Number of cells in each section.
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return items().count
	}
	
	/// Retrieves a UICollectionViewCell.
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let c: MaterialCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MaterialCollectionViewCell", forIndexPath: indexPath) as! MaterialCollectionViewCell
		
		let item: MaterialDataSourceItem = items()[indexPath.item]
		
		if let data: Dictionary<String, AnyObject> =  item.data as? Dictionary<String, AnyObject> {
			
			var cardView: CardView? = c.contentView.subviews.first as? CardView
			
			// Only build the template if the CardView doesn't exist.
			if nil == cardView {
				cardView = CardView()
				
				c.backgroundColor = nil
				c.pulseColor = nil
				c.contentView.addSubview(cardView!)
				
				cardView!.pulseScale = false
				cardView!.divider = false
				cardView!.depth = .None
				cardView!.contentInsetPreset = .Square3
				cardView!.contentInset.bottom /= 2
				cardView!.cornerRadiusPreset = .None
				cardView!.rightButtonsInset.right = -8
				
				let titleLabel: UILabel = UILabel()
				titleLabel.textColor = MaterialColor.grey.darken4
				titleLabel.font = RobotoFont.regularWithSize(18)
				titleLabel.text = data["title"] as? String
				cardView!.titleLabel = titleLabel
				
				let detailLabel: UILabel = UILabel()
				detailLabel.numberOfLines = 2
				detailLabel.textColor = MaterialColor.grey.darken2
				detailLabel.font = RobotoFont.regular
				detailLabel.text = data["detail"] as? String
				cardView!.detailView = detailLabel
				
				let image: UIImage? =  UIImage(named: "ic_share_white_18pt")?.imageWithRenderingMode(.AlwaysTemplate)
				
				let shareButton: FlatButton = FlatButton()
				shareButton.pulseScale = false
				shareButton.pulseColor = MaterialColor.grey.base
				shareButton.tintColor = MaterialColor.grey.base
				shareButton.setImage(image, forState: .Normal)
				shareButton.setImage(image, forState: .Highlighted)
				cardView!.rightButtons = [shareButton]
				
				c.contentView.addSubview(cardView!)
			} else {
				cardView?.titleLabel?.text = data["title"] as? String
				(cardView?.detailView as? UILabel)?.text = data["detail"] as? String
			}
			
			cardView!.frame = c.bounds
		}
		
		return c
	}
}

/// MaterialCollectionViewDelegate methods.
extension FeedViewController: MaterialCollectionViewDelegate {
	/// Executed when an item is selected.
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		navigationController?.pushViewController(InboxViewController(), animated: true)
	}
}