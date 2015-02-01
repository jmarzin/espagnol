# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

unless User.exists?
  User.create!({:email => "jmarzin@gmail.com", :admin => true, :password => "51julie2", :password_confirmation => "51julie2" })
end

liste = [
    []]

liste.each do |c|
  @c = Category.find_by(numero: c[0])
  if @c
    @c.description = c[1]
    @c.save!
  else
    @c = Category.create(numero: c[0], description: c[1])
  end
end

liste = [
    []]

liste.each do |m|
  @m = Mot.find_by(francais: m[2])
  if @m
    @m.category_id = m[0]
    @m.mot_directeur = m[1]
    @m.italien = m[4]
    @m.save!
    User.all.each do |u|
      sc = u.scores_mots.find_by(mot_id: @m.id)
      sc.category_id = m[0]
      sc.save!
    end
  else
    @m = Mot.create(category_id: m[0], mot_directeur: m[1], francais: m[2], espagnol: m[4])
    User.all.each do |u|
      u.scores_mots.create(mot_id: @m.id, category_id: m[0], compteur: m[3])
    end
  end
end

liste = [
    [[[]]]]

liste.each do |verbe|
  @verbe = Verbe.find_by(infinitif: verbe[0])
  unless @verbe
    @verbe = Verbe.create(infinitif: verbe[0])
  end
  verbe[1].each do |forme|
    @forme = @verbe.formes.find_by(rang_forme: forme[0])
    if @forme
      @forme.italien = forme[1]
      @forme.save!
      User.all.each do |user|
        sf = user.scores_formes.find_by(forme_id: @forme.id)
        if sf
          sf.rang_forme = forme[0]
          sf.save!
        end
      end
    else
      @forme = @verbe.formes.create(rang_forme: forme[0], espagnol: forme[1])
      User.all.each do |user|
        if user.admin or forme[1] != ''
          user.scores_formes.create(rang_forme: forme[0], forme_id: @forme.id, compteur: forme[2])
        end
      end
    end
  end
end