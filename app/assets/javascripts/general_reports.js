function getRandomColor() {
  var letters = '0123456789ABCDEF';
  var color = '#';
  for (var i = 0; i < 6; i++) {
    color += letters[Math.floor(Math.random() * 16)];
  }
  return color;
}

$(document).on('turbolinks:load', function() {

  var ctx = document.getElementById("sarasa").getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: Object.keys(gon.grouped_general_expenses),
      datasets: [{
        backgroundColor: Object.values(gon.grouped_general_expenses).map(function() { return getRandomColor(); }),
        data: Object.values(gon.grouped_general_expenses)
      }]
    },
    options: {
      legend: {
        labels: {
          fontColor: 'white'
        }
      },
      responsive: true
    }
  });

});
