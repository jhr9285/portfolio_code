package org.zerock.guestbook.repository;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.dsl.BooleanExpression;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.zerock.guestbook.entity.Guestbook;
import org.zerock.guestbook.entity.QGuestbook;

import java.util.Optional;
import java.util.stream.IntStream;

@SpringBootTest
public class GuestbookRepositoryTests {
    @Autowired
    private GuestbookRepository guestbookRepository;

    @Test
    public void insertDummies() { // 더미데이터 300개 입력 (좌측 화살표 눌러서 실행)
        IntStream.rangeClosed(1, 300).forEach(i -> {
            Guestbook guestbook = Guestbook.builder()
                                        .title("Title...." + i)
                                        .content("Content...." + i)
                                        .writer("user" + (i % 10))
                                        .build();
            System.out.println(guestbookRepository.save(guestbook));
        });
    }

    @Test
    public void updateTest() { // update test
        Optional<Guestbook> result = guestbookRepository.findById(300L); //존재하는 번호로 테스트
        if(result.isPresent()) {
            Guestbook guestbook = result.get();

            guestbook.changeTitle("Changed Title....");
            guestbook.changeContent("Changed Content....");

            guestbookRepository.save(guestbook); // save = update ==> ★중요!! moddate가 바뀐다!!
        }
    }

    @Test
    public void testQuery2() { // querydsl 이용한 페이징 처리 + 다중 항목 검색
        Pageable pageable = PageRequest.of(0, 10, Sort.by("gno").descending());
        QGuestbook qGuestbook = QGuestbook.guestbook; // querydsl이 동적쿼리 처리를 위해 생성한 QGuestbook 사용
        String keyword = "1";
        BooleanBuilder builder = new BooleanBuilder();
        BooleanExpression exTitle = qGuestbook.title.contains(keyword); // = title LIKE ? ==> 1을 포함하는 title
        BooleanExpression exContent = qGuestbook.content.contains(keyword); // = content LIKE ? ==> 1을 포함하는 content
        BooleanExpression exAll = exTitle.or(exContent); // ==> 위 두 조건을 or로 붙여서 하나로 만듦
        builder.and(exAll); // WHERE절에 위에서 하나로 합친 조건 and로 기재 (첫 번째 조건이라 AND 안 붙음)
        builder.and(qGuestbook.gno.gt(0L)); // 두 번째 조건 and로 붙임 (gno > ?) , gt : 더 크다

        Page<Guestbook> result = guestbookRepository.findAll(builder, pageable); // 페이징 처리

        result.stream().forEach(guestbook -> {
            System.out.println(guestbook);
            System.out.println("--------------------------------------------------------------------------");
        });
    }

}
