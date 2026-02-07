deno eval 'console.log(JSON.stringify(eval(Deno.readTextFileSync("articles.js")), null, 2))'
