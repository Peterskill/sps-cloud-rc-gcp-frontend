

fetch('https://j3v9fd4skd.execute-api.us-east-1.amazonaws.com/default').then(reponse=>reponse.json()).then(data=>{
    document.getElementById('visitor-count').innerText=data.count
})