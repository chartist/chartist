var data = [
    ["Year", "Maserati", "Mazda", "Mercedes", "Mini", "Mitsubishi"],
    ["2009", 0, 2941, 4303, 354, 5814],
    ["2010", 5, 2905, 2867, 412, 5284],
    ["2011", 4, 2517, 4822, 552, 6127],
    ["2012", 2, 2422, 5399, 776, 4151]
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