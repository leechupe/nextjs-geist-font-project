import 'package:intl/intl.dart';

enum MessageType {
  text,
  image,
  voice,
  link,
  callEnd,
  sticker,
}

class Message {
  final String id;
  final String chatId;
  final String senderId;
  final String senderName;
  final MessageType type;
  final String content;
  final DateTime timestamp;
  final bool isPinned;
  final List<String> reactions;
  final String? voiceDuration;
  final String? imageUrl;
  final String? linkTitle;
  final String? linkDescription;
  final String? linkImage;

  Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.senderName,
    required this.type,
    required this.content,
    required this.timestamp,
    this.isPinned = false,
    this.reactions = const [],
    this.voiceDuration,
    this.imageUrl,
    this.linkTitle,
    this.linkDescription,
    this.linkImage,
  });

  String get formattedTime => DateFormat('HH:mm').format(timestamp);
  String get formattedDate => DateFormat('MMM dd, yyyy').format(timestamp);
  bool get isToday => DateUtils.isSameDay(timestamp, DateTime.now());
  bool get isYesterday => DateUtils.isSameDay(timestamp, DateTime.now().subtract(const Duration(days: 1)));

  Message copyWith({
    String? id,
    String? chatId,
    String? senderId,
    String? senderName,
    MessageType? type,
    String? content,
    DateTime? timestamp,
    bool? isPinned,
    List<String>? reactions,
    String? voiceDuration,
    String? imageUrl,
    String? linkTitle,
    String? linkDescription,
    String? linkImage,
  }) {
    return Message(
      id: id ?? this.id,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      type: type ?? this.type,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isPinned: isPinned ?? this.isPinned,
      reactions: reactions ?? this.reactions,
      voiceDuration: voiceDuration ?? this.voiceDuration,
      imageUrl: imageUrl ?? this.imageUrl,
      linkTitle: linkTitle ?? this.linkTitle,
      linkDescription: linkDescription ?? this.linkDescription,
      linkImage: linkImage ?? this.linkImage,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      chatId: json['chatId'],
      senderId: json['senderId'],
      senderName: json['senderName'],
      type: MessageType.values[json['type']],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
      isPinned: json['isPinned'] ?? false,
      reactions: List<String>.from(json['reactions'] ?? []),
      voiceDuration: json['voiceDuration'],
      imageUrl: json['imageUrl'],
      linkTitle: json['linkTitle'],
      linkDescription: json['linkDescription'],
      linkImage: json['linkImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chatId': chatId,
      'senderId': senderId,
      'senderName': senderName,
      'type': type.index,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'isPinned': isPinned,
      'reactions': reactions,
   <execute_command>
<command>cd flutter_chat_app && export PATH="$PATH:`pwd`/../flutter/bin" && flutter pub get</command>
</execute_command>
