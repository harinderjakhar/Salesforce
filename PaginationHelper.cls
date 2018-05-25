/*
*Description: This is helper class for pagination
*/
global Class PaginationHelper{
    /*
    * Description: This function used to get ceiling value for total page number. 
    */
    global static Integer getNumberOfPages(Integer totalListSize, Integer itemsPerPage){
        return (integer)Math.ceil(Decimal.valueOf(totalListSize).divide(itemsPerPage,3));
    }
    
    /*
    * Description: This function used to check next button status true = disabled false = enabled.
    */
    global static boolean nextButtonDisabled(Integer lastPage, Integer currentPage){
        return lastPage == currentPage;
    }
    
    /*
    * Description: This function used to check previous button status true = disabled false = enabled.
    */
    global static boolean previousButtonDisabled(Integer currentPage){
        return currentPage == 1;
    }
    
    /*
    * Description: This function is used to populate list on basis of size .
    *
    *@params pageNum			:	Current page number
    *@params itemsPerPage		:	Items to be displayed on page
    *@params wholeRecordList	:	Whole list of records
    *
    *@Return  List of records as List<Sobject>
    */
    global static List<sobject> getRecordsForSinglePage(Integer pageNum, Integer itemsPerPage, List<sobject> wholeRecordList) {
        List<sobject> recordsToShow = new List<sobject>();
        
        Transient Integer firstShownRecordIndex = 0;
        Transient Integer lastShownRecordIndex = 0;
        
        // Get the index of the first item that'll apper on the page
        firstShownRecordIndex = ((pageNum - 1) * itemsPerPage);
        
        // Get the index of the last item on the page (last item in the whole list if this is the last page)
        lastShownRecordIndex = Math.min(firstShownRecordIndex + itemsPerPage - 1, wholeRecordList.size() - 1);        
       
        // Iterate through the display range and grab the relevant records from the whole record list
        for (Integer i = firstShownRecordIndex; i <= lastShownRecordIndex; i++) {         
        	recordsToShow.add(wholeRecordList[i]); 
        }
        
        return recordsToShow;
    }
}