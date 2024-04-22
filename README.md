# vocab_card

A Demo application shows vocabularies on **Flutter** application from Google Sheets and create new vocabulary into Google Sheets using [**Google Apps Script**](https://developers.google.com/apps-script/overview).


[Web App Demo](https://shaynec25.github.io/demos/vocabulary-card/#/)


## Code on Apps Scripts
    function doGet() {
      var sheet = SpreadsheetApp.getActiveSheet();
      var data = sheet.getDataRange().getValues();
      if (!data) {
        Logger.log('No data found.');
      } else {
        var dataList = [];
        for (var i = 1; i < data.length; i++) {
          var row = data[i];
          var vocab = {};
          vocab['index'] = row[0];
          vocab['english'] = row[1];
          vocab['wordClass'] = row[2];
          vocab['description'] = row[3];
          vocab['chinese'] = row[4];
          vocab['example'] = row[5];
          vocab['russian'] = row[6];
          dataList.push(vocab);
        }
      }
      var myJSON = JSON.stringify(dataList);
      Logger.log(myJSON);
      return ContentService.createTextOutput(myJSON).setMimeType(ContentService.MimeType.JSON);
    }
    
    function doPost(request) {
      var result = {"status": "SUCCESS"};
      var sheet = SpreadsheetApp.getActiveSheet();
      var data = sheet.getDataRange().getValues();
      if (!data) {
        Logger.log('No data found. ');
      } else {
        Logger.log('last index');
        var lastIndex = data.length - 1;
        var newRowIndex = data[lastIndex][0] + 1;
        Logger.log(data[lastIndex][0]);
      }
      try {
        var english = request.parameter.english;
        var wordClass = request.parameter.wordClass;
        var description = request.parameter.description;
        var chinese = request.parameter.chinese;
        var example = request.parameter.example;
        var russian = request.parameter.russian;
        var rowData = sheet.appendRow([newRowIndex, english, wordClass, description, chinese, example, russian]);
      } catch(e) {
        result = {"status": "FAILED", "message": e};
      }
      return ContentService.createTextOutput(JSON.stringify(result)).setMimeType(ContentService.MimeType.JSON);
    }

