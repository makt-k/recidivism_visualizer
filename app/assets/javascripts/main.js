$(document).ready(function(){

    var getDatamap,
        remoteData = {},
        remoteSuccessHandler,
        popupHandler;

    // Invoked after 'successfully' getting remote data
    remoteSuccessHandler = function(data){
        var entry;
        console.log("success");

        // Xform data for the Datamap
        data.forEach(function(el){
            entry = {};
            entry['fillKey'] = el.fill_color;
            entry['reincarcerated'] = el.returned_to_jail;
            entry['popAtRisk'] = el.pop_at_risk;
            entry['percent'] = el.percent;
            remoteData[el.state_abbr] = entry;
        });

        // draw the map
        getDatamap(remoteData);
    };

    // Triggered by a mouse over each state.
    popupHandler = function(geo, data) {
        // Markup for the popup
        return ['<div class="hoverinfo"><strong> ',
                geo.properties.name,
                '<br> At Risk Population',
                ': ' + data.popAtRisk,
                '<br> Number Re-Incarcerated: ',
                ': ' + data.reincarcerated,
                '<br> Percent: ',
                ': ' + data.percent,
                '</strong></div>'].join('');
    };


    // Draw the map
    getDatamap = function(data){
        var map = new Datamap({
            element: document.getElementById('container'),
            fills: {
                HIGH: 'red',
                LOW: 'green',
                MEDIUM: 'yellow',
                UNKNOWN: 'orange',
                defaultFill: 'gray'
            },
            scope: 'usa',
            data: data,
            geographyConfig: {
                // TODO: reformat the data coming back from the server
                // to conform to Datamap format.
                // Currently is an Object with and an array of state objects.
                // Shb an object with entries for each state, were keys are the 2 char state code.
                // dataUrl: '/state_recividisms/index.json',

                popupTemplate: popupHandler
            }
        });
    };

    // remote request to get data.
    $.get('/state_recividisms/index.json')
        .success(remoteSuccessHandler.bind(this));

});
