using Dash, DashHtmlComponents, DashCoreComponents


app = dash(external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"])

markdown_text = "
### Dash and Markdown

Dash apps can be written in Markdown.
Dash uses the [CommonMark](http://commonmark.org/)
specification of Markdown.
Check out their [60 Second Markdown Tutorial](http://commonmark.org/help/)
if this is your first introduction to Markdown!
"

app.layout = html_div() do
    html_h1("Hello Dash", hidden=false),
    html_h2("Dash: A web application framework for Julia"),
    dcc_graph(
        id = "example-graph-1",
        figure = (
            data = [
                (x = ["giraffes", "orangutans", "monitos"], y = [20, 14, 23], type = "bar", name = "SF"),
                (x = ["giraffes", "orangutans", "monitos"], y = [12, 18, 29], type = "bar", name = "Montreal"),
            ],
            layout = (title = "Dash Data Visualization", barmode="group")
        )
    ),
    html_h2("Otra seccion"),
    dcc_graph(
        id = "example-graph-2",
        figure = (
            data = [
                (x = [1, 2, 3], y = [4, 1, 2], type = "bar", name = "SF"),
                (x = [1, 2, 3], y = [2, 4, 5], type = "bar", name = "Montréal"),
            ],
            layout = (title = "Dash Data Visualization 2",)
        )
    ),
    dcc_markdown(markdown_text)
end

run_server(app, "0.0.0.0", debug=true)
