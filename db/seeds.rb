# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'

    # 크롤링 할 페이지의 URL
    url = "http://www.mju.ac.kr/user/introduction_mju/professor/professor_list.jsp?deptCd=12755&id=mjukr_020206110200"
    data = Nokogiri::HTML(open url)
    
    data_list = data.css('ul.profsList')
    
    size = data_list.search('li').size
    
    i = 0
    while i < size  do
        source = data_list.css('span.pic img')[i]
        profname = source.attr('alt')
        profimgUrl = source.attr('src')
        # name : 교수 이름
        # imgUrl : 교수 이미지
        # like : 좋아요수 default 0
        # dept : 학과 (일일히 타이핑)
        Prof.create(name: profname, imgUrl: profimgUrl, like: 0, dept: '산업경영공학과')
        i+=1
    end
    
    #prof.save
    