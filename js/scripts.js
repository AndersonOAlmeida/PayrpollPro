const data = new Date()

const dia = String(data.getDate()).padStart(2, '0');
const mes = String(data.getMonth() + 1).padStart(2, '0');
const ano = data.getFullYear();

const horas = document.getElementById('horas');
const minutos = document.getElementById('minutos');

const relogio = setInterval(function time(){
    let dateToday = new Date();
    let hr = dateToday.getHours();
    let min = dateToday.getMinutes();

    if (hr < 10) hr = '0' + hr;
    
    if (min < 10) min = '0' + min;

    horas.textContent = hr;
    minutos.textContent = min;
})

const dataAtual = `${dia}/${mes}/${ano} as ${horas}:${minutos}`

console.log(dataAtual)