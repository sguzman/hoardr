deno eval 'console.log(JSON.stringify(eval(Deno.readTextFileSync("reports.js")), null, 2))'
