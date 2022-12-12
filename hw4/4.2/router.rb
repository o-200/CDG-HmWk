module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'

      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end


      action.nil? ? routes[verb].call : routes[verb][action].call
    end
  end
end

class PostsController
  extend Resource

  def initialize
    @posts = [{name: "postname1", description: "This is a descrtiption"}]
  end

  def index
    puts @posts
  end

  def show
    puts 'Choose the ID of post (beginning with zero)'
    idpost = gets.chomp.to_i

    if !@posts[idpost].nil?
      puts @posts[idpost]
    else
      puts 'You are choosed a wrong id post'
    end
  end

  def create
    puts 'Enter the name of post'
    postname = gets.chomp

    puts 'Enter the description for a post'
    description = gets.chomp

    @posts.append(name: postname, description: description)

    puts "your post with name #{postname} was created!"
  end

  def update
    puts 'Enter a ID of post (beginning from zero)'
    idpost = gets.chomp.to_i

    if !@posts[idpost].nil?
      puts @posts[idpost]

      puts 'Puts a new name of post (enter nothing if you dont want to change it)'
      postname = gets.chomp
      postname.nil? ? 'okay' : postname

      puts 'Puts a new description of post (enter nothing if you dont want to change it)'
      description = gets.chomp
      description.nil? ? 'okay' : description

      @posts[idpost][:name] = postname unless postname.empty?
      @posts[idpost][:description] = description unless description.empty?

      puts @posts[idpost]
    else
      puts 'You are choosed a wrong id post'
    end
  end

  def destroy
    puts 'Enter a ID of post (beginning from zero)'
    idpost = gets.chomp.to_i

    if !@posts[idpost].nil?
      @posts.delete_at(idpost)
      puts @posts
      puts 'completed'
    else
      puts 'You are choosed a wrong id post'
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'
    end

    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
