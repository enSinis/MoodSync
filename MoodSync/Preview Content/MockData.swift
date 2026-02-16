import Foundation
import SwiftUI

struct MockData {
    static let resources = [
        ResourceItem(title: "5-min Breathing", description: "Quick relief to center your mind and body.", category: "Meditation", iconName: "wind", imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDWY9kC5EhxqIbpCBUsl7-jB-k5TxVJtwXN2f_9LOKL-RQ3QMuCPdMVTUIrohlHzisp3ucM1I4zCxHxW8c84n71iFAy4g_CPgrgS1uIES2AK1b4552y3yomQCZKm-UCsKyRHM-4UutzQtffxzgeWbbbCDzQ59NpnUiZ1NhlFpDnjrlCwNwxi1YB6QGRIdhYKPl1gnU2Pvkp_APyfFCBaznYglK3t9Q4PLE0SbP3lkPSCHSqRmArjIR6QoD8zrgdcbBpRgpN0LmAlFU"),
        ResourceItem(title: "Managing Stress", description: "Learn tools to navigate pressure with ease.", category: "Anxiety", iconName: "person.fill.checkmark", imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDKaLHoJS9z3Yo2lOz_sxdivV3tRPtzl0MgdmnS9MYj-G54AZ7AopeLRO801ZAxTK-cZFX74ZCx0-iWhH6yCVjptCEoPqAxquvkVYd6O5qZNlOsyRlDuW0ZzsGBtKErnsmpHOJNm2xOfFk7KDhAvCvuo4NzqSFMoCNGcaEUHxT-VEOClf5TxmUcYoshg_aNr37uP-tctG-B8ZYNTIoceQW-ZrgzQrFRn9nNRBJ5g5HFVJopaPqmUcUXloQU_Li2B8FEdPSbHdq-Io8"),
        ResourceItem(title: "Sleep Stories", description: "Gentle narrations to guide you into rest.", category: "Sleep", iconName: "moon.fill", imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAKFCNTOgTjNJSXt8LncXD4prHFkNXQ99x6Tc1GjPrzAXUpFUr2wgqUbhrh1w-i8abSNrGNyhttq22GOYEJVRHA9dZsin82ZydXYZ6ADG3byPuGofuQ6BvCxcTqvJhovvvD8iCiwL1gt0oUH3roL8qTVz_lIHVYYaLdgD63AsY6sUpSenlyu7rusSXH1xjlgfp7j9MGH17CjJEAAcR9Gm6UTUrbtKVBkAzMuGXYzqLfCSIJJS9FNtu6rmNJB4Dwf75CYZrsAxDX6ZI"),
        ResourceItem(title: "Journal Prompts", description: "Reflective questions for daily growth.", category: "Focus", iconName: "square.and.pencil", imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuDZvni7EKnpbf2Dwm8Ug68ppou81SVHY9fVID77XcdTALn-9VlXNAibxVbEseU-lpi5HpRuPcATjDBwdlkWxEXwf_0tKFHQ2HLmwIy-Vd1KSsJgXv_QNvUefCzWh-ZxkQmVzB20FCtZDRC4UTGFnHm3NBwwTkAfOhHhT0YzFO5uzTxLVqYVrmcjG_hk7DjSxDsVYtbNNWREVfwFTo6bOrkozX7-LdYz0jr1LMvFD5vET1j8ycqGUM3p8tZ7zfkAdYPvgjSXTMEeIlI")
    ]

    static let triggers = [
        Trigger(name: "Work", iconName: "briefcase", count: "12", label: "Sessions logged", impact: "High Impact"),
        Trigger(name: "Yoga", iconName: "figure.yoga", count: "8", label: "Sessions logged", impact: "Mood Booster"),
        Trigger(name: "Sleep", iconName: "moon", count: "7h", label: "Avg Duration", impact: "Stable"),
        Trigger(name: "Diet", iconName: "fork.knife", count: "Good", label: "Consistency", impact: "Healthy")
    ]

    static let friends = [
        FriendMood(name: "Sarah", moodEmoji: "😊", status: "Peaceful", imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAWVVDDoSZYev8rHmUTcHw69vn2XPsBzjx5qBx-3yodUahTWAhvzpeVBTS4ugQGrJbaIu_63vynM9PyqfTX6v82wRG3n5zCjGsuYfCca8SAKDoiuJ5JsG349tp_R-Cw9BmUZ3jbtpGWu4id9MLmMjonw1W2uKxXCquz4CBDvVKmqNAviV5X_JYEYo-tp6cimsKiR-gF8Z_n1Ci-crbHrk24-jqUkpXrr9XxfQFdq1_Q4_3jE8GGYVW0oLT8Jgpn3JbB_7Jqq5jkzdM", color: .green),
        FriendMood(name: "Alex", moodEmoji: "🌊", status: "Contemplative", imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuAsg-S8hmFVjptTwpDw8zY4st1I7yQOj7BhSBGlyIK3aIp3ebsaZAFi7HgxbNHTI8eyc2TJUAfHZ2GySqY8LkOgMUdergBMQjfDnFCt_wxDW2kkhKdVzUc_f20AA4YyqMG8Hbf_HrTVdyHId5Q0NRgqnWSS_5wEKaXkK2VlXadnZBg7Mqul4Nnzp0N53GWcY68aYprM-euUmPIn-UK4SlPxbpsh0DgYj0nq0lLUgN7PVimW2AmlzyLSNSlZScGtPK4JaOXFbu1CKlQ", color: .blue),
        FriendMood(name: "Jordan", moodEmoji: "🔥", status: "Energetic", imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCdS_GcdGRZ4h1WjqZDQoGW9Ype04AfNyvwSUBJsh2BfAJREloL9uF8wdTasK378HGWH2e1OwoACwIAigjhmdNetJWHbZtHMrDjB0N4eXjbpeULdsRR2ZiIMmwSOLkRaxlvP0Ew4SScPk-t0X7e_k8QI4ajil0CNU2CmBU0AWttXfv7r7JMXqkfsoE_I1of1aWhEMhm_uUbdZfpb46WveDq8zh5d2a0lTNNEufr08ND-_xRgY6KQ4yd5D68W4U_GBtNgOs-94vcbxk", color: .orange),
        FriendMood(name: "Mia", moodEmoji: "✨", status: "Artistic", imageUrl: "https://lh3.googleusercontent.com/aida-public/AB6AXuCUdAhIFAKgi5dCALCa0PO7RZiLfOmeeb-vBkYObjWarCAXwm-MPNzUAVKX5IBEZMixE293zN-MzkU4KiLRM2xWgKHPiymkwt5Jf7Eg5QXL1u0MbKd4U327AZHkFtRSiyK1M65HgB46IKshEj1fpwfBj8vBBTIh4ozBP31Q6-QC60pa2cxI4CtWBxqzGZ4S5X6bfkDHeGD0oH81LGPgm98q5ARRzyFRpAjmuQFqLphxs47ToXduUyU912vL5VvIjz7RtLG0O1JUwDY", color: .purple)
    ]
}
