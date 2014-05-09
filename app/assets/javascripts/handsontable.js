var data = [
    ["Days", "Anna", "Mario", "Toby", "Mikhail", "Natascia"],
    ["Last Tuesday", 23, 32, 23, 43, 21],
    ["5th of May", 5, 14, 13, 28, 31],
    ["yesterday", 15, 23, 85, 23, 25],
    ["9 may 2014", 20, 25, 23, 22, 15]
];
var csvContent = "";

$(document).ready(function() {
    if($('#example').length) {
        $('#example').handsontable({
            data: data,
            minSpareRows: 0,
            startCols: 10,
            colWidths: [80, 80, 80, 80, 80, 80],
            colHeaders: true,
            contextMenu: false
        });
        
        $('#example table').addClass('table');
        $('#example table').addClass('table-bordered');
        $('#example table').addClass('table-striped');
        $('#example table').addClass('table-hover');
        $('#example table').addClass('table-condensed');
    }

    function bindDumpButton() {
        $('body').on('click', 'button[name=dump]', function() {
            var dump = $(this).data('dump');
            var $container = $(dump);
            // console.log('data of ' + dump, $container.handsontable('getData'));
        });
    }
    bindDumpButton();
    
    


    $('#download').on('click', function() {
        data.forEach(function(infoArray, index) {

        dataString = infoArray.join(",");
        csvContent += index < infoArray.length ? dataString + "\n" : dataString;

    });
        $(".hidden-field").val(csvContent)
        $('#first-next').click()
    });
});