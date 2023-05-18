package org.zerock.guestbook.entity;

import lombok.Getter;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import java.time.LocalDateTime;

@MappedSuperclass // GuestbookEntity를 BaseEntity 상속받아서 만들기 위해 입력 필요한 annotation (입력 필수)
@EntityListeners(value = { AuditingEntityListener.class }) // 수정되면 바로 반응하게 해주는 annotation(리스너)(입력 필수)
@Getter
abstract class BaseEntity { // 추상클래스
    @CreatedDate // 최초 등록 시간 자동 저장 annotation
    @Column(name = "regdate", updatable = false)
    private LocalDateTime regDate; // 등록일

    @LastModifiedDate // 조회한 Entity 값 변경 시간 자동 저장 annotation
    @Column(name = "moddate")
    private LocalDateTime modDate; // 수정일
}
