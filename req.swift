//
//  req.swift
//  tester_tester
//
//  Created by Bennett Somerville on 1/5/18.
//  Copyright © 2018 Techurify. All rights reserved.
//

import Foundation

/**
Sends a request to a specified URL.
- parameters:
	- method: the request method to use, ex. `GET` or `POST`.
	- url: the URL to send the request to, ex. `example.com`.
	- body: The data sent as the message body of the request, such as for an HTTP POST request.
	- headers: A dictionary containing all the HTTP header fields of the receiver.
	- completionHandler: Called when the request is complete. The arguments are as follows:
		- data: The data that was sent by the server.
		- error: An error that occured.
*/
public func req(method: String, url: URL, body: Data?, headers: [String: String]?, completionHandler: ((Data?, Error?) -> Void)?) {
	var urlRequest = URLRequest(url: url)
	urlRequest.httpMethod = method
	urlRequest.allHTTPHeaderFields = headers
	urlRequest.httpBody = body
	if (completionHandler == nil) {
		let task = URLSession.shared.dataTask(with: urlRequest)
		task.resume()
	} else {
		print("sending req")
		let task = URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
			let completionHandlerUnwrapped = completionHandler!
			print("calling cb")
			if (error == nil) {
				completionHandlerUnwrapped(data, nil)
			} else {
				completionHandlerUnwrapped(nil, error)
			}
		}
		task.resume()
	}
}

/**
Sends a request to a specified URL.
- parameters:
	- method: the request method to use, ex. `GET` or `POST`.
	- url: the URL to send the request to, ex. `example.com`.
	- body: The data sent as the message body of the request, such as for an HTTP POST request.
	- headers: A dictionary containing all the HTTP header fields of the receiver.
*/
public func req(method: String, url: URL, body: Data?, headers: [String: String]?) {
	req(method: method, url: url, body: body, headers: headers, completionHandler: nil)
}

/**
Sends a request to a specified URL.
- parameters:
	- method: the request method to use, ex. `GET` or `POST`.
	- url: the URL to send the request to, ex. `example.com`.
	- body: The data sent as the message body of the request, such as for an HTTP POST request.
*/
public func req(method: String, url: URL, body: Data?) {
	req(method: method, url: url, body: body, headers: nil, completionHandler: nil)
}

/**
Sends a request to a specified URL.
- parameters:
	- method: the request method to use, ex. `GET` or `POST`.
	- url: the URL to send the request to, ex. `example.com`.
*/
public func req(method: String, url: URL) {
	req(method: method, url: url, body: nil, headers: nil, completionHandler: nil)
}

/**
Sends a request to a specified URL.
- parameters:
	- method: the request method to use, ex. `GET` or `POST`.
	- url: the URL to send the request to, ex. `example.com`.
	- body: The data sent as the message body of the request, such as for an HTTP POST request.
	- completionHandler: Called when the request is complete. The arguments are as follows:
		- data: The data that was sent by the server.
		- error: An error that occured.
*/
public func req(method: String, url: URL, body: Data?, completionHandler: ((Data?, Error?) -> Void)?) {
	req(method: method, url: url, body: body, headers: nil, completionHandler: completionHandler)
}

/**
Sends a request to a specified URL.
- parameters:
	- method: the request method to use, ex. `GET` or `POST`.
	- url: the URL to send the request to, ex. `example.com`.
	- completionHandler: Called when the request is complete. The arguments are as follows:
		- data: The data that was sent by the server.
		- error: An error that occured.
*/
public func req(method: String, url: URL, completionHandler: ((Data?, Error?) -> Void)?) {
	req(method: method, url: url, body: nil, headers: nil, completionHandler: completionHandler)
}

