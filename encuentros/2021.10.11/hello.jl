using Dash
using DashHtmlComponents
using DashCoreComponents

using StructuralDynamicsODESolvers
using LazySets
using Plots

app = dash(external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"])
plotly()

include("springmass.jl")

#plt = Plots.plot(rand(Zonotope))
plt = springmass()

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
    dcc_graph(id = "masa-resorte"),
    dcc_input(id="constante-elastica", value=2.0),
    dcc_markdown(markdown_text)
end

# Output --> use "figure" instead?
callback!(app, Output("masa-resorte", "figure"), Input("constante-elastica", "value")) do input_value
    plt = springmass(; k=input_value * 1.0) # parse(Float64, input_value))
    figure = (data=Plots.plotly_series(plt), layout=Plots.plotly_layout(plt))
end

run_server(app, "0.0.0.0", debug=true)
