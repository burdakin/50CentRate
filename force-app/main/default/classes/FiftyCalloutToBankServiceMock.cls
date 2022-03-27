global class FiftyCalloutToBankServiceMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"success":true,"timestamp":1647685084,"base":"EUR","date":"2022-03-19","rates":{"USD":1.106255,"RUB":118.922567}}');
        res.setStatusCode(200);
        return res;
    }
}
