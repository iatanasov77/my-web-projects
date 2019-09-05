

const Routing = require('../../../vendor/friendsofsymfony/jsrouting-bundle/Resources/public/js/router.min.js');
module.exports = window.Routing;

class RepLogApp {
    loadRepLogs() {
        $.ajax({
            url: Routing.generate('rep_log_list'),
        })
    }
}

module.exports = Routing;
