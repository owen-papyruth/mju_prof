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
    # 학과별 URL
    list = Array["12913&id=mjukr_020206070200",
                "12900&id=mjukr_020206010200",
                "12901&id=mjukr_020206030200",
                "12250&id=mjukr_020206040200",
                "12908&id=mjukr_020206020200",
                "12361&id=mjukr_020206050200",
                "12370&id=mjukr_020206060200",
                "12450&id=mjukr_020206080200",
                "12500&id=mjukr_020206090200",
                "12701&id=mjukr_020206100200",
                "12755&id=mjukr_020206110200"]

    # 학과
    major = Array["컴퓨터공학과",
                  "전기공학과",
                  "전자공학과",
                  "정보통신학과",
                  "화학공학과",
                  "신소재공학과",
                  "환경에너지공학과",
                  "토목환경공학과",
                  "교통공학과",
                  "기계공학과",
                  "산업경영공학과"]

    j = 0
    while j < list.size do

        url = "http://www.mju.ac.kr/user/introduction_mju/professor/professor_list.jsp?deptCd=" + list[j]
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
        Prof.create(name: profname, imgUrl: profimgUrl, like: 0, dept: major[j])
        i+=1
      end
      j += 1
   end
