from flask import Flask
app = Flask(__name__)

from flask import render_template

@app.route('/')
def hello_world():
    return render_template('main.html')
    return '''<a href="https://plus.google.com/hangouts/_/event/cog0s64cjs9bptp7niojnf525bk?authuser=0&hl=en-GB" target="_blank">foo</a>'''

    return '''<script type="text/javascript" src="https://apis.google.com/js/platform.js"></script>
    <div class="g-hangout" data-render="createhangout"></div>'''

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
