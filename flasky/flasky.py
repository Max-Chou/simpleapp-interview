import os
import click
from app import create_app, db
from app.models import User, Role, Permission
from flask_migrate import Migrate


app = create_app(os.getenv('FLASK_CONFIG') or 'default')
migrate = Migrate(app, db)


@app.shell_context_processor
def make_shell_context():
    return dict(db=db, User=User, Role=Role, Permission=Permission)


@app.cli.command()
@click.argument('test_names', nargs=-1)
def test(test_names):
    """Run the unit tests."""
    import unittest
    if test_names:
        tests = unittest.TestLoader().loadTestsFromNames(test_names)
    else:
        tests = unittest.TestLoader().discover('tests')
    unittest.TextTestRunner(verbosity=2).run(tests)

@app.cli.command()
def init():
    """Create initial roles and admin user"""
    Role.insert_roles()
    if User.query.filter_by(email=app.config['ADMIN_EMAIL']) is None:
        admin_role = Role.query.filter_by(name="Administrator").first()
        admin_user = User(email=app.config['ADMIN_EMAIL'], 
                          password=app.config['ADMIN_PASSWORD'], 
                          username="admin",
                          confirmed=True)
        admin_user.role = admin_role
        db.session.add(admin_user)
        db.session.commit()

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
