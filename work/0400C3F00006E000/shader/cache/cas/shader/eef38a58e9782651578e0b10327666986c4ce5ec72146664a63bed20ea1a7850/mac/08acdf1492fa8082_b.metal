#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5013 = false;
    bool _4995 = false;
    bool _4851 = false;
    bool _4833 = false;
    bool _4689 = false;
    bool _4671 = false;
    bool _4527 = false;
    bool _4509 = false;
    bool _4365 = false;
    bool _4347 = false;
    bool _4203 = false;
    bool _4185 = false;
    bool _4041 = false;
    bool _4023 = false;
    bool _3879 = false;
    bool _3861 = false;
    bool _3717 = false;
    bool _3699 = false;
    bool _3555 = false;
    bool _3537 = false;
    bool _3393 = false;
    bool _3375 = false;
    bool _3231 = false;
    bool _3213 = false;
    bool _3069 = false;
    bool _3051 = false;
    bool _2907 = false;
    bool _2889 = false;
    bool _2745 = false;
    bool _2727 = false;
    bool _2617 = false;
    bool _2583 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _6085 = float3(_63, _65, float(int(_74)));
    float3 _6089 = select(_6085, float3(0.0), isnan(_6085));
    float3 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6089.xy, uint(rint(_6089.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6089.xy, uint(rint(_6089.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float3 _6107 = float3(_63, _65, float(int(_74)));
    float3 _6109 = select(_6107, float3(0.0), isnan(_6107));
    float3 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6109.xy, uint(rint(_6109.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6109.xy, uint(rint(_6109.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xyz;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float3 _6128 = float3(_63, _65, float(int(_74)));
    float3 _6130 = select(_6128, float3(0.0), isnan(_6128));
    float3 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6130.xy, uint(rint(_6130.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6130.xy, uint(rint(_6130.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xyz;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float3 _6148 = float3(_63, _65, float(int(_74)));
    float3 _6150 = select(_6148, float3(0.0), isnan(_6148));
    float3 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6150.xy, uint(rint(_6150.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6150.xy, uint(rint(_6150.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xyz;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float3 _6168 = float3(_63, _65, float(int(_74)));
    float3 _6170 = select(_6168, float3(0.0), isnan(_6168));
    float3 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6170.xy, uint(rint(_6170.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6170.xy, uint(rint(_6170.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xyz;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float3 _6188 = float3(_63, _65, float(int(_74)));
    float3 _6190 = select(_6188, float3(0.0), isnan(_6188));
    float3 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6190.xy, uint(rint(_6190.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6190.xy, uint(rint(_6190.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xyz;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float3 _6208 = float3(_63, _65, float(int(_74)));
    float3 _6210 = select(_6208, float3(0.0), isnan(_6208));
    float3 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6210.xy, uint(rint(_6210.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6210.xy, uint(rint(_6210.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xyz;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float3 _6228 = float3(_63, _65, float(int(_74)));
    float3 _6230 = select(_6228, float3(0.0), isnan(_6228));
    float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6230.xy, uint(rint(_6230.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6230.xy, uint(rint(_6230.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xyz;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float3 _6248 = float3(_63, _65, float(int(_74)));
    float3 _6250 = select(_6248, float3(0.0), isnan(_6248));
    float3 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6250.xy, uint(rint(_6250.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6250.xy, uint(rint(_6250.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xyz;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float3 _6268 = float3(_63, _65, float(int(_74)));
    float3 _6270 = select(_6268, float3(0.0), isnan(_6268));
    float3 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6270.xy, uint(rint(_6270.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6270.xy, uint(rint(_6270.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xyz;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float3 _6288 = float3(_63, _65, float(int(_74)));
    float3 _6290 = select(_6288, float3(0.0), isnan(_6288));
    float3 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6290.xy, uint(rint(_6290.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6290.xy, uint(rint(_6290.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xyz;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float3 _6308 = float3(_63, _65, float(int(_74)));
    float3 _6310 = select(_6308, float3(0.0), isnan(_6308));
    float3 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6310.xy, uint(rint(_6310.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6310.xy, uint(rint(_6310.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xyz;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float3 _6328 = float3(_63, _65, float(int(_74)));
    float3 _6330 = select(_6328, float3(0.0), isnan(_6328));
    float3 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6330.xy, uint(rint(_6330.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6330.xy, uint(rint(_6330.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xyz;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float3 _6348 = float3(_63, _65, float(int(_74)));
    float3 _6350 = select(_6348, float3(0.0), isnan(_6348));
    float3 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6350.xy, uint(rint(_6350.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6350.xy, uint(rint(_6350.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xyz;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float3 _6368 = float3(_63, _65, float(int(_74)));
    float3 _6370 = select(_6368, float3(0.0), isnan(_6368));
    float3 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6370.xy, uint(rint(_6370.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6370.xy, uint(rint(_6370.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float3 _6388 = float3(_63, _65, float(int(_74)));
    float3 _6390 = select(_6388, float3(0.0), isnan(_6388));
    float3 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6390.xy, uint(rint(_6390.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6390.xy, uint(rint(_6390.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xyz;
    float _200 = _198.x;
    float _202 = _198.y;
    float _204 = _198.z;
    float _206 = _82 + _90;
    float _208 = _80 + _88;
    float _210 = _84 + _92;
    float _212 = _98 + _206;
    float _214 = _96 + _208;
    float _216 = _100 + _210;
    float _218 = _106 + _212;
    float _220 = _104 + _214;
    float _222 = _108 + _216;
    float _224 = _114 + _218;
    float _226 = _112 + _220;
    float _228 = _116 + _222;
    float _230 = _122 + _224;
    float _232 = _120 + _226;
    float _234 = _124 + _228;
    float _236 = _130 + _230;
    float _238 = _128 + _232;
    float _240 = _132 + _234;
    float _242 = _138 + _236;
    float _244 = _136 + _238;
    float _246 = _140 + _240;
    float _248 = _146 + _242;
    float _250 = _144 + _244;
    float _252 = _148 + _246;
    float _254 = _154 + _248;
    float _256 = _152 + _250;
    float _258 = _156 + _252;
    float _260 = _162 + _254;
    float _262 = _160 + _256;
    float _264 = _164 + _258;
    float _266 = _170 + _260;
    float _268 = _168 + _262;
    float _270 = _172 + _264;
    float _272 = _178 + _266;
    float _274 = _176 + _268;
    float _276 = _180 + _270;
    float _278 = _186 + _272;
    float _280 = _184 + _274;
    float _282 = _188 + _276;
    float _284 = _194 + _278;
    float _286 = _192 + _280;
    float _288 = _196 + _282;
    float _290 = _202 + _284;
    float _292 = _200 + _286;
    float _294 = _204 + _288;
    float _296 = fma(_290, -0.0625, _90);
    float _298 = fma(_292, -0.0625, _88);
    float _300 = fma(_294, -0.0625, _92);
    float _302 = fma(_290, -0.0625, _82);
    float _304 = fma(_292, -0.0625, _80);
    float _306 = _298 * _296;
    float _308 = _298 * _298;
    float _310 = fma(_294, -0.0625, _84);
    float _312 = _296 * _296;
    float _314 = _296 * _300;
    float _316 = _298 * _300;
    float _318 = fma(_304, _302, _306);
    float _320 = fma(_302, _302, _312);
    float _322 = fma(_302, _310, _314);
    float _324 = fma(_304, _304, _308);
    float _326 = fma(_304, _310, _316);
    float _328 = _300 * _300;
    float _330 = fma(_290, -0.0625, _98);
    float _332 = fma(_292, -0.0625, _96);
    float _334 = fma(_294, -0.0625, _100);
    float _336 = fma(_310, _310, _328);
    float _338 = fma(_330, _330, _320);
    float _340 = fma(_332, _330, _318);
    float _342 = fma(_330, _334, _322);
    float _344 = fma(_332, _332, _324);
    float _346 = fma(_332, _334, _326);
    float _348 = fma(_290, -0.0625, _106);
    float _350 = fma(_292, -0.0625, _104);
    float _352 = fma(_294, -0.0625, _108);
    float _354 = fma(_334, _334, _336);
    float _356 = fma(_348, _348, _338);
    float _358 = fma(_350, _348, _340);
    float _360 = fma(_348, _352, _342);
    float _362 = fma(_350, _350, _344);
    float _364 = fma(_350, _352, _346);
    float _366 = fma(_290, -0.0625, _114);
    float _368 = fma(_292, -0.0625, _112);
    float _370 = fma(_294, -0.0625, _116);
    float _372 = fma(_352, _352, _354);
    float _374 = fma(_366, _366, _356);
    float _376 = fma(_368, _366, _358);
    float _378 = fma(_366, _370, _360);
    float _380 = fma(_368, _368, _362);
    float _382 = fma(_368, _370, _364);
    float _384 = fma(_290, -0.0625, _122);
    float _386 = fma(_292, -0.0625, _120);
    float _388 = fma(_294, -0.0625, _124);
    float _390 = fma(_370, _370, _372);
    float _392 = fma(_384, _384, _374);
    float _394 = fma(_386, _384, _376);
    float _396 = fma(_384, _388, _378);
    float _398 = fma(_386, _386, _380);
    float _400 = fma(_386, _388, _382);
    float _402 = fma(_290, -0.0625, _130);
    float _404 = fma(_292, -0.0625, _128);
    float _406 = fma(_294, -0.0625, _132);
    float _408 = fma(_388, _388, _390);
    float _410 = fma(_402, _402, _392);
    float _412 = fma(_404, _402, _394);
    float _414 = fma(_402, _406, _396);
    float _416 = fma(_404, _404, _398);
    float _418 = fma(_404, _406, _400);
    float _420 = fma(_290, -0.0625, _138);
    float _422 = fma(_292, -0.0625, _136);
    float _424 = fma(_294, -0.0625, _140);
    float _426 = fma(_406, _406, _408);
    float _428 = fma(_420, _420, _410);
    float _430 = fma(_422, _420, _412);
    float _432 = fma(_420, _424, _414);
    float _434 = fma(_422, _422, _416);
    float _436 = fma(_422, _424, _418);
    float _438 = fma(_290, -0.0625, _146);
    float _440 = fma(_292, -0.0625, _144);
    float _442 = fma(_294, -0.0625, _148);
    float _444 = fma(_424, _424, _426);
    float _446 = fma(_438, _438, _428);
    float _448 = fma(_440, _438, _430);
    float _450 = fma(_438, _442, _432);
    float _452 = fma(_440, _440, _434);
    float _454 = fma(_440, _442, _436);
    float _456 = fma(_290, -0.0625, _154);
    float _458 = fma(_292, -0.0625, _152);
    float _460 = fma(_294, -0.0625, _156);
    float _462 = fma(_442, _442, _444);
    float _464 = fma(_456, _456, _446);
    float _466 = fma(_458, _456, _448);
    float _468 = fma(_456, _460, _450);
    float _470 = fma(_458, _458, _452);
    float _472 = fma(_458, _460, _454);
    float _474 = fma(_290, -0.0625, _162);
    float _476 = fma(_292, -0.0625, _160);
    float _478 = fma(_294, -0.0625, _164);
    float _480 = fma(_460, _460, _462);
    float _482 = fma(_474, _474, _464);
    float _484 = fma(_476, _474, _466);
    float _486 = fma(_474, _478, _468);
    float _488 = fma(_476, _476, _470);
    float _490 = fma(_476, _478, _472);
    float _492 = fma(_290, -0.0625, _170);
    float _494 = fma(_292, -0.0625, _168);
    float _496 = fma(_294, -0.0625, _172);
    float _498 = fma(_478, _478, _480);
    float _500 = fma(_492, _492, _482);
    float _502 = fma(_494, _492, _484);
    float _504 = fma(_492, _496, _486);
    float _506 = fma(_494, _494, _488);
    float _508 = fma(_494, _496, _490);
    float _510 = fma(_290, -0.0625, _178);
    float _512 = fma(_292, -0.0625, _176);
    float _514 = fma(_294, -0.0625, _180);
    float _516 = fma(_496, _496, _498);
    float _518 = fma(_510, _510, _500);
    float _520 = fma(_512, _510, _502);
    float _522 = fma(_510, _514, _504);
    float _524 = fma(_512, _512, _506);
    float _526 = fma(_512, _514, _508);
    float _528 = fma(_290, -0.0625, _186);
    float _530 = fma(_292, -0.0625, _184);
    float _532 = fma(_294, -0.0625, _188);
    float _534 = fma(_514, _514, _516);
    float _536 = fma(_528, _528, _518);
    float _538 = fma(_530, _528, _520);
    float _540 = fma(_528, _532, _522);
    float _542 = fma(_530, _530, _524);
    float _544 = fma(_530, _532, _526);
    float _546 = fma(_290, -0.0625, _194);
    float _548 = fma(_292, -0.0625, _192);
    float _550 = fma(_294, -0.0625, _196);
    float _552 = fma(_290, -0.0625, _202);
    float _554 = fma(_546, _546, _536);
    float _556 = fma(_548, _546, _538);
    float _558 = fma(_292, -0.0625, _200);
    float _560 = fma(_546, _550, _540);
    float _562 = fma(_294, -0.0625, _204);
    float _564 = fma(_548, _548, _542);
    float _566 = fma(_552, _552, _554);
    float _568 = fma(_558, _552, _556);
    float _570 = fma(_532, _532, _534);
    float _572 = fma(_548, _550, _544);
    float _574 = fma(_552, _562, _560);
    float _576 = fma(_558, _558, _564);
    float _578 = _566 + _568;
    float _580 = fma(_550, _550, _570);
    float _582 = fma(_558, _562, _572);
    float _584 = _576 + _568;
    float _586 = _574 + _578;
    float _588 = fma(_562, _562, _580);
    float _590 = _574 + _582;
    float _592 = _582 + _584;
    float _594 = _586 * _586;
    float _596 = _588 + _590;
    float _598 = fma(_592, _592, _594);
    float _600 = fma(_596, _596, _598);
    float _602 = rsqrt(_600);
    float _604 = _586 * _602;
    float _606 = _592 * _602;
    float _608 = _596 * _602;
    float _610 = _566 * _604;
    float _612 = _568 * _604;
    float _614 = fma(_568, _606, _610);
    float _616 = _574 * _604;
    float _618 = fma(_576, _606, _612);
    float _620 = fma(_574, _608, _614);
    float _622 = fma(_582, _606, _616);
    float _624 = fma(_582, _608, _618);
    float _626 = _620 * _620;
    float _628 = fma(_588, _608, _622);
    float _630 = fma(_624, _624, _626);
    float _632 = fma(_628, _628, _630);
    float _634 = rsqrt(_632);
    float _636 = _620 * _634;
    float _638 = _624 * _634;
    float _640 = _628 * _634;
    float _642 = _566 * _636;
    float _644 = _568 * _636;
    float _646 = _574 * _636;
    float _648 = fma(_568, _638, _642);
    float _650 = fma(_576, _638, _644);
    float _652 = fma(_582, _638, _646);
    float _654 = fma(_574, _640, _648);
    float _656 = fma(_582, _640, _650);
    float _658 = fma(_588, _640, _652);
    float _660 = _654 * _654;
    float _662 = fma(_656, _656, _660);
    float _664 = fma(_658, _658, _662);
    float _666 = rsqrt(_664);
    float _668 = _654 * _666;
    float _670 = _656 * _666;
    float _672 = _658 * _666;
    float _674 = _566 * _668;
    float _676 = _568 * _668;
    float _678 = _574 * _668;
    float _680 = fma(_568, _670, _674);
    float _682 = fma(_576, _670, _676);
    float _684 = fma(_582, _670, _678);
    float _686 = fma(_574, _672, _680);
    float _688 = fma(_582, _672, _682);
    float _690 = fma(_588, _672, _684);
    float _692 = _686 * _686;
    float _694 = fma(_688, _688, _692);
    float _696 = fma(_690, _690, _694);
    float _698 = rsqrt(_696);
    float _700 = _686 * _698;
    float _702 = _688 * _698;
    float _704 = _690 * _698;
    float _706 = _566 * _700;
    float _708 = _568 * _700;
    float _710 = _574 * _700;
    float _712 = fma(_568, _702, _706);
    float _714 = fma(_576, _702, _708);
    float _716 = fma(_582, _702, _710);
    float _718 = fma(_574, _704, _712);
    float _720 = fma(_582, _704, _714);
    float _722 = fma(_588, _704, _716);
    float _724 = _718 * _718;
    float _726 = fma(_720, _720, _724);
    float _728 = fma(_722, _722, _726);
    float _730 = rsqrt(_728);
    float _732 = _718 * _730;
    float _734 = _720 * _730;
    float _736 = _722 * _730;
    float _738 = _566 * _732;
    float _740 = _568 * _732;
    float _742 = _574 * _732;
    float _744 = fma(_568, _734, _738);
    float _746 = fma(_576, _734, _740);
    float _748 = fma(_582, _734, _742);
    float _750 = fma(_574, _736, _744);
    float _752 = fma(_582, _736, _746);
    float _754 = fma(_588, _736, _748);
    float _756 = _750 * _750;
    float _758 = fma(_752, _752, _756);
    float _760 = fma(_754, _754, _758);
    float _762 = rsqrt(_760);
    float _764 = _750 * _762;
    float _766 = _752 * _762;
    float _768 = _754 * _762;
    float _770 = _566 * _764;
    float _772 = _568 * _764;
    float _774 = _574 * _764;
    float _776 = fma(_568, _766, _770);
    float _778 = fma(_576, _766, _772);
    float _780 = fma(_582, _766, _774);
    float _782 = fma(_574, _768, _776);
    float _784 = fma(_582, _768, _778);
    float _786 = fma(_588, _768, _780);
    float _788 = _782 * _782;
    float _790 = fma(_784, _784, _788);
    float _792 = fma(_786, _786, _790);
    float _794 = rsqrt(_792);
    float _796 = _782 * _794;
    float _798 = _784 * _794;
    float _800 = _786 * _794;
    float _802 = _566 * _796;
    float _804 = _568 * _796;
    float _806 = fma(_568, _798, _802);
    float _808 = _574 * _796;
    float _810 = fma(_576, _798, _804);
    float _812 = fma(_574, _800, _806);
    float _814 = fma(_582, _798, _808);
    float _816 = fma(_582, _800, _810);
    float _818 = _812 * _812;
    float _820 = fma(_588, _800, _814);
    float _822 = fma(_816, _816, _818);
    float _824 = fma(_820, _820, _822);
    float _826 = rsqrt(_824);
    float _828 = _812 * _826;
    float _830 = _816 * _826;
    float _832 = _820 * _826;
    float _834 = _82 * _828;
    float _836 = _90 * _828;
    float _838 = _98 * _828;
    float _840 = fma(_80, _830, _834);
    float _842 = fma(_88, _830, _836);
    float _844 = fma(_96, _830, _838);
    float _846 = fma(_84, _832, _840);
    float _848 = fma(_92, _832, _842);
    float _850 = fma(_100, _832, _844);
    bool _854 = _846 >= _848;
    bool _856 = isnan(_846);
    bool _858 = _854 || _856;
    bool _860 = isnan(_848);
    bool _862 = _858 || _860;
    float _864 = _560;
    float _866 = _842;
    float _868 = _838;
    float _870 = _792;
    float _872 = _844;
    float _874 = _836;
    float _876 = _786;
    float _878 = _770;
    float _880 = _848;
    float _882 = _796;
    float _884 = _850;
    float _886 = _850;
    float _888 = _828;
    float _890 = _830;
    float _892 = 2.6624670822171524347550862082508e-44;
    float _894 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    if (!_862)
    {
        _864 = _88;
    }
    float _896 = _864;
    float _898 = _896;
    float _900 = _896;
    if (!_862)
    {
        _866 = _90;
    }
    float _902 = _866;
    float _904 = _902;
    float _906 = _902;
    if (!_862)
    {
        _868 = _92;
    }
    float _908 = _868;
    float _910 = _908;
    float _912 = _908;
    if (!_862)
    {
        _870 = _846;
    }
    float _914 = _870;
    float _916 = _914;
    float _918 = _914;
    if (!_862)
    {
        _872 = _848;
    }
    float _920 = _872;
    float _922 = _920;
    float _924 = _920;
    if (!_862)
    {
        _874 = _80;
    }
    float _926 = _874;
    float _928 = _926;
    float _930 = _926;
    if (!_862)
    {
        _876 = _82;
    }
    float _932 = _876;
    float _934 = _932;
    float _936 = _932;
    if (!_862)
    {
        _878 = _84;
    }
    float _938 = _878;
    bool _940 = !_862;
    float _942 = _938;
    float _944 = _938;
    if (!_940)
    {
        bool _946 = _846 > _848;
        if (!_946)
        {
            _916 = _846;
        }
        float _948 = _916;
        float _950 = _948;
        if (!_946)
        {
            _922 = _846;
        }
        float _952 = _922;
        float _954 = _952;
        if (!_946)
        {
            _928 = _80;
        }
        float _956 = _928;
        float _958 = _956;
        if (!_946)
        {
            _934 = _82;
        }
        float _960 = _934;
        float _962 = _960;
        if (!_946)
        {
            _942 = _84;
        }
        float _964 = _942;
        float _966 = _964;
        if (!_946)
        {
            _898 = _80;
        }
        float _968 = _898;
        float _970 = _968;
        if (!_946)
        {
            _904 = _82;
        }
        float _972 = _904;
        float _974 = _972;
        if (!_946)
        {
            _910 = _84;
        }
        float _976 = _910;
        _912 = _976;
        if (_946)
        {
            _950 = _848;
        }
        float _978 = _950;
        _918 = _978;
        if (_946)
        {
            _954 = _846;
        }
        float _980 = _954;
        _924 = _980;
        if (_946)
        {
            _958 = _88;
        }
        float _982 = _958;
        _930 = _982;
        if (_946)
        {
            _962 = _90;
        }
        float _984 = _962;
        _936 = _984;
        if (_946)
        {
            _966 = _92;
        }
        float _986 = _966;
        _944 = _986;
        if (_946)
        {
            _970 = _80;
        }
        float _988 = _970;
        _900 = _988;
        if (_946)
        {
            _974 = _82;
        }
        float _990 = _974;
        _906 = _990;
        if (_946)
        {
            _912 = _84;
        }
    }
    float _992 = _924;
    float _994 = _918;
    float _996 = _900;
    float _998 = _906;
    float _1000 = _912;
    float _1002 = _930;
    float _1004 = _936;
    float _1006 = _944;
    bool _1008 = _992 >= _850;
    bool _1010 = isnan(_992);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(_850);
    bool _1016 = _1012 || _1014;
    float _1018 = _106 * _828;
    float _1020 = fma(_104, _830, _1018);
    float _1022 = fma(_108, _832, _1020);
    float _1024 = _1020;
    float _1026 = _994;
    float _1028 = _1002;
    float _1030 = _1004;
    float _1032 = _994;
    float _1034 = _1002;
    float _1036 = _1004;
    float _1038 = _1006;
    float _1040 = _998;
    float _1042 = _1022;
    float _1044 = _1022;
    if (!_1016)
    {
        _1024 = _96;
    }
    float _1046 = _1024;
    float _1048 = _1046;
    float _1050 = _1046;
    if (!_1016)
    {
        _880 = _98;
    }
    float _1052 = _880;
    float _1054 = _1052;
    float _1056 = _1052;
    if (!_1016)
    {
        _882 = _100;
    }
    float _1058 = _882;
    bool _1060 = !_1016;
    float _1062 = _1058;
    float _1064 = _1058;
    if (!_1060)
    {
        bool _1066 = _994 > _850;
        if (_1066)
        {
            _1026 = _850;
        }
        float _1068 = _1026;
        _1032 = _1068;
        if (!_1066)
        {
            _1048 = _996;
        }
        float _1070 = _1048;
        float _1072 = _1070;
        if (!_1066)
        {
            _1054 = _998;
        }
        float _1074 = _1054;
        float _1076 = _1074;
        if (!_1066)
        {
            _1062 = _1000;
        }
        float _1078 = _1062;
        float _1080 = _1078;
        if (!_1066)
        {
            _884 = _992;
        }
        float _1082 = _884;
        float _1084 = _1082;
        if (_1066)
        {
            _1072 = _996;
        }
        float _1086 = _1072;
        _1050 = _1086;
        if (_1066)
        {
            _1076 = _998;
        }
        float _1088 = _1076;
        _1056 = _1088;
        if (_1066)
        {
            _1080 = _1000;
        }
        float _1090 = _1080;
        _1064 = _1090;
        if (_1066)
        {
            _1084 = _992;
        }
        float _1092 = _1084;
        _886 = _1092;
        if (_1066)
        {
            _1028 = _96;
        }
        float _1094 = _1028;
        _1034 = _1094;
        if (_1066)
        {
            _1030 = _98;
        }
        float _1096 = _1030;
        _1036 = _1096;
        if (_1066)
        {
            _1038 = _100;
        }
    }
    float _1098 = _886;
    float _1100 = _1032;
    float _1102 = _1050;
    float _1104 = _1056;
    float _1106 = _1064;
    float _1108 = _1034;
    float _1110 = _1036;
    float _1112 = _1038;
    bool _1114 = _1098 >= _1022;
    bool _1116 = isnan(_1098);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(_1022);
    bool _1122 = _1118 || _1120;
    float _1124 = _114 * _828;
    float _1126 = fma(_112, _830, _1124);
    float _1128 = fma(_116, _832, _1126);
    float _1130 = _1126;
    float _1132 = _1124;
    float _1134 = _1100;
    float _1136 = _1108;
    float _1138 = _1110;
    float _1140 = _1100;
    float _1142 = _1108;
    float _1144 = _1110;
    float _1146 = _1112;
    float _1148 = _1104;
    float _1150 = _1106;
    float _1152 = _1128;
    float _1154 = _1128;
    if (!_1122)
    {
        _1130 = _104;
    }
    float _1156 = _1130;
    float _1158 = _1156;
    float _1160 = _1156;
    if (!_1122)
    {
        _1132 = _106;
    }
    float _1162 = _1132;
    float _1164 = _1162;
    float _1166 = _1162;
    if (!_1122)
    {
        _1040 = _108;
    }
    float _1168 = _1040;
    bool _1170 = !_1122;
    float _1172 = _1168;
    float _1174 = _1168;
    if (!_1170)
    {
        bool _1176 = _1100 > _1022;
        if (_1176)
        {
            _1134 = _1022;
        }
        float _1178 = _1134;
        _1140 = _1178;
        if (!_1176)
        {
            _1158 = _1102;
        }
        float _1180 = _1158;
        float _1182 = _1180;
        if (!_1176)
        {
            _1164 = _1104;
        }
        float _1184 = _1164;
        float _1186 = _1184;
        if (!_1176)
        {
            _1172 = _1106;
        }
        float _1188 = _1172;
        float _1190 = _1188;
        if (!_1176)
        {
            _1042 = _1098;
        }
        float _1192 = _1042;
        float _1194 = _1192;
        if (_1176)
        {
            _1182 = _1102;
        }
        float _1196 = _1182;
        _1160 = _1196;
        if (_1176)
        {
            _1186 = _1104;
        }
        float _1198 = _1186;
        _1166 = _1198;
        if (_1176)
        {
            _1190 = _1106;
        }
        float _1200 = _1190;
        _1174 = _1200;
        if (_1176)
        {
            _1194 = _1098;
        }
        float _1202 = _1194;
        _1044 = _1202;
        if (_1176)
        {
            _1136 = _104;
        }
        float _1204 = _1136;
        _1142 = _1204;
        if (_1176)
        {
            _1138 = _106;
        }
        float _1206 = _1138;
        _1144 = _1206;
        if (_1176)
        {
            _1146 = _108;
        }
    }
    float _1208 = _1044;
    float _1210 = _1140;
    float _1212 = _1160;
    float _1214 = _1166;
    float _1216 = _1174;
    float _1218 = _1142;
    float _1220 = _1144;
    float _1222 = _1146;
    bool _1224 = _1208 >= _1128;
    bool _1226 = isnan(_1208);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(_1128);
    bool _1232 = _1228 || _1230;
    float _1234 = _122 * _828;
    float _1236 = fma(_120, _830, _1234);
    float _1238 = fma(_124, _832, _1236);
    float _1240 = _1236;
    float _1242 = _1210;
    float _1244 = _1218;
    float _1246 = _1220;
    float _1248 = _1210;
    float _1250 = _1218;
    float _1252 = _1220;
    float _1254 = _1222;
    float _1256 = _1216;
    float _1258 = _1238;
    float _1260 = _1238;
    float _1262 = _1208;
    if (!_1232)
    {
        _1240 = _112;
    }
    float _1264 = _1240;
    float _1266 = _1264;
    float _1268 = _1264;
    if (!_1232)
    {
        _1148 = _114;
    }
    float _1270 = _1148;
    float _1272 = _1270;
    float _1274 = _1270;
    if (!_1232)
    {
        _1150 = _116;
    }
    float _1276 = _1150;
    bool _1278 = !_1232;
    float _1280 = _1276;
    float _1282 = _1276;
    if (!_1278)
    {
        bool _1284 = _1210 > _1128;
        if (_1284)
        {
            _1242 = _1128;
        }
        float _1286 = _1242;
        _1248 = _1286;
        if (!_1284)
        {
            _1266 = _1212;
        }
        float _1288 = _1266;
        float _1290 = _1288;
        if (!_1284)
        {
            _1272 = _1214;
        }
        float _1292 = _1272;
        float _1294 = _1292;
        if (!_1284)
        {
            _1280 = _1216;
        }
        float _1296 = _1280;
        float _1298 = _1296;
        if (!_1284)
        {
            _1152 = _1208;
        }
        float _1300 = _1152;
        float _1302 = _1300;
        if (_1284)
        {
            _1290 = _1212;
        }
        float _1304 = _1290;
        _1268 = _1304;
        if (_1284)
        {
            _1294 = _1214;
        }
        float _1306 = _1294;
        _1274 = _1306;
        if (_1284)
        {
            _1298 = _1216;
        }
        float _1308 = _1298;
        _1282 = _1308;
        if (_1284)
        {
            _1302 = _1208;
        }
        float _1310 = _1302;
        _1154 = _1310;
        if (_1284)
        {
            _1244 = _112;
        }
        float _1312 = _1244;
        _1250 = _1312;
        if (_1284)
        {
            _1246 = _114;
        }
        float _1314 = _1246;
        _1252 = _1314;
        if (_1284)
        {
            _1254 = _116;
        }
    }
    float _1316 = _1154;
    float _1318 = _1248;
    float _1320 = _1268;
    float _1322 = _1274;
    float _1324 = _1282;
    float _1326 = _1250;
    float _1328 = _1252;
    float _1330 = _1254;
    bool _1332 = _1316 >= _1238;
    bool _1334 = isnan(_1316);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(_1238);
    bool _1340 = _1336 || _1338;
    float _1342 = _130 * _828;
    float _1344 = fma(_128, _830, _1342);
    float _1346 = fma(_132, _832, _1344);
    float _1348 = _1344;
    float _1350 = _1342;
    float _1352 = _1318;
    float _1354 = _1326;
    float _1356 = _1328;
    float _1358 = _1318;
    float _1360 = _1326;
    float _1362 = _1328;
    float _1364 = _1330;
    float _1366 = _1324;
    float _1368 = _1316;
    float _1370 = _1346;
    float _1372 = _1346;
    if (!_1340)
    {
        _1348 = _120;
    }
    float _1374 = _1348;
    float _1376 = _1374;
    float _1378 = _1374;
    if (!_1340)
    {
        _1350 = _122;
    }
    float _1380 = _1350;
    float _1382 = _1380;
    float _1384 = _1380;
    if (!_1340)
    {
        _1256 = _124;
    }
    float _1386 = _1256;
    bool _1388 = !_1340;
    float _1390 = _1386;
    float _1392 = _1386;
    if (!_1388)
    {
        bool _1394 = _1318 > _1238;
        if (_1394)
        {
            _1352 = _1238;
        }
        float _1396 = _1352;
        _1358 = _1396;
        if (!_1394)
        {
            _1376 = _1320;
        }
        float _1398 = _1376;
        float _1400 = _1398;
        if (!_1394)
        {
            _1382 = _1322;
        }
        float _1402 = _1382;
        float _1404 = _1402;
        if (!_1394)
        {
            _1390 = _1324;
        }
        float _1406 = _1390;
        float _1408 = _1406;
        if (!_1394)
        {
            _1258 = _1316;
        }
        float _1410 = _1258;
        float _1412 = _1410;
        if (_1394)
        {
            _1400 = _1320;
        }
        float _1414 = _1400;
        _1378 = _1414;
        if (_1394)
        {
            _1404 = _1322;
        }
        float _1416 = _1404;
        _1384 = _1416;
        if (_1394)
        {
            _1408 = _1324;
        }
        float _1418 = _1408;
        _1392 = _1418;
        if (_1394)
        {
            _1412 = _1316;
        }
        float _1420 = _1412;
        _1260 = _1420;
        if (_1394)
        {
            _1354 = _120;
        }
        float _1422 = _1354;
        _1360 = _1422;
        if (_1394)
        {
            _1356 = _122;
        }
        float _1424 = _1356;
        _1362 = _1424;
        if (_1394)
        {
            _1364 = _124;
        }
    }
    float _1426 = _1260;
    float _1428 = _1358;
    float _1430 = _1378;
    float _1432 = _1384;
    float _1434 = _1392;
    float _1436 = _1360;
    float _1438 = _1362;
    float _1440 = _1364;
    bool _1442 = _1426 >= _1346;
    bool _1444 = isnan(_1426);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(_1346);
    bool _1450 = _1446 || _1448;
    float _1452 = _138 * _828;
    float _1454 = fma(_136, _830, _1452);
    float _1456 = fma(_140, _832, _1454);
    float _1458 = _1428;
    float _1460 = _1436;
    float _1462 = _1438;
    float _1464 = _1428;
    float _1466 = _1436;
    float _1468 = _1438;
    float _1470 = _1440;
    float _1472 = _1434;
    float _1474 = _1456;
    float _1476 = _1456;
    if (!_1450)
    {
        _1366 = _128;
    }
    float _1478 = _1366;
    float _1480 = _1478;
    float _1482 = _1478;
    if (!_1450)
    {
        _1368 = _130;
    }
    float _1484 = _1368;
    float _1486 = _1484;
    float _1488 = _1484;
    if (!_1450)
    {
        _1262 = _132;
    }
    float _1490 = _1262;
    bool _1492 = !_1450;
    float _1494 = _1490;
    float _1496 = _1490;
    if (!_1492)
    {
        bool _1498 = _1428 > _1346;
        if (_1498)
        {
            _1458 = _1346;
        }
        float _1500 = _1458;
        _1464 = _1500;
        if (!_1498)
        {
            _1480 = _1430;
        }
        float _1502 = _1480;
        float _1504 = _1502;
        if (!_1498)
        {
            _1486 = _1432;
        }
        float _1506 = _1486;
        float _1508 = _1506;
        if (!_1498)
        {
            _1494 = _1434;
        }
        float _1510 = _1494;
        float _1512 = _1510;
        if (!_1498)
        {
            _1370 = _1426;
        }
        float _1514 = _1370;
        float _1516 = _1514;
        if (_1498)
        {
            _1504 = _1430;
        }
        float _1518 = _1504;
        _1482 = _1518;
        if (_1498)
        {
            _1508 = _1432;
        }
        float _1520 = _1508;
        _1488 = _1520;
        if (_1498)
        {
            _1512 = _1434;
        }
        float _1522 = _1512;
        _1496 = _1522;
        if (_1498)
        {
            _1516 = _1426;
        }
        float _1524 = _1516;
        _1372 = _1524;
        if (_1498)
        {
            _1460 = _128;
        }
        float _1526 = _1460;
        _1466 = _1526;
        if (_1498)
        {
            _1462 = _130;
        }
        float _1528 = _1462;
        _1468 = _1528;
        if (_1498)
        {
            _1470 = _132;
        }
    }
    float _1530 = _1372;
    float _1532 = _1464;
    float _1534 = _1482;
    float _1536 = _1488;
    float _1538 = _1496;
    float _1540 = _1466;
    float _1542 = _1468;
    float _1544 = _1470;
    bool _1546 = _1530 >= _1456;
    bool _1548 = isnan(_1530);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(_1456);
    bool _1554 = _1550 || _1552;
    float _1556 = _146 * _828;
    float _1558 = fma(_144, _830, _1556);
    float _1560 = fma(_148, _832, _1558);
    float _1562 = _1558;
    float _1564 = _1556;
    float _1566 = _1532;
    float _1568 = _1540;
    float _1570 = _1542;
    float _1572 = _1532;
    float _1574 = _1540;
    float _1576 = _1542;
    float _1578 = _1544;
    float _1580 = _1538;
    float _1582 = _1534;
    float _1584 = _1560;
    float _1586 = _1560;
    if (!_1554)
    {
        _1562 = _136;
    }
    float _1588 = _1562;
    float _1590 = _1588;
    float _1592 = _1588;
    if (!_1554)
    {
        _1564 = _138;
    }
    float _1594 = _1564;
    float _1596 = _1594;
    float _1598 = _1594;
    if (!_1554)
    {
        _1472 = _140;
    }
    float _1600 = _1472;
    bool _1602 = !_1554;
    float _1604 = _1600;
    float _1606 = _1600;
    if (!_1602)
    {
        bool _1608 = _1532 > _1456;
        if (_1608)
        {
            _1566 = _1456;
        }
        float _1610 = _1566;
        _1572 = _1610;
        if (!_1608)
        {
            _1590 = _1534;
        }
        float _1612 = _1590;
        float _1614 = _1612;
        if (!_1608)
        {
            _1596 = _1536;
        }
        float _1616 = _1596;
        float _1618 = _1616;
        if (!_1608)
        {
            _1604 = _1538;
        }
        float _1620 = _1604;
        float _1622 = _1620;
        if (!_1608)
        {
            _1474 = _1530;
        }
        float _1624 = _1474;
        float _1626 = _1624;
        if (_1608)
        {
            _1614 = _1534;
        }
        float _1628 = _1614;
        _1592 = _1628;
        if (_1608)
        {
            _1618 = _1536;
        }
        float _1630 = _1618;
        _1598 = _1630;
        if (_1608)
        {
            _1622 = _1538;
        }
        float _1632 = _1622;
        _1606 = _1632;
        if (_1608)
        {
            _1626 = _1530;
        }
        float _1634 = _1626;
        _1476 = _1634;
        if (_1608)
        {
            _1568 = _136;
        }
        float _1636 = _1568;
        _1574 = _1636;
        if (_1608)
        {
            _1570 = _138;
        }
        float _1638 = _1570;
        _1576 = _1638;
        if (_1608)
        {
            _1578 = _140;
        }
    }
    float _1640 = _1476;
    float _1642 = _1572;
    float _1644 = _1592;
    float _1646 = _1598;
    float _1648 = _1606;
    float _1650 = _1574;
    float _1652 = _1576;
    float _1654 = _1578;
    bool _1656 = _1640 >= _1560;
    bool _1658 = isnan(_1640);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(_1560);
    bool _1664 = _1660 || _1662;
    float _1666 = _154 * _828;
    float _1668 = fma(_152, _830, _1666);
    float _1670 = fma(_156, _832, _1668);
    float _1672 = _1668;
    float _1674 = _1642;
    float _1676 = _1650;
    float _1678 = _1652;
    float _1680 = _1642;
    float _1682 = _1650;
    float _1684 = _1652;
    float _1686 = _1654;
    float _1688 = _1648;
    float _1690 = _1670;
    float _1692 = _1670;
    float _1694 = _1640;
    if (!_1664)
    {
        _1580 = _144;
    }
    float _1696 = _1580;
    float _1698 = _1696;
    float _1700 = _1696;
    if (!_1664)
    {
        _1672 = _146;
    }
    float _1702 = _1672;
    float _1704 = _1702;
    float _1706 = _1702;
    if (!_1664)
    {
        _1582 = _148;
    }
    float _1708 = _1582;
    bool _1710 = !_1664;
    float _1712 = _1708;
    float _1714 = _1708;
    if (!_1710)
    {
        bool _1716 = _1642 > _1560;
        if (_1716)
        {
            _1674 = _1560;
        }
        float _1718 = _1674;
        _1680 = _1718;
        if (!_1716)
        {
            _1698 = _1644;
        }
        float _1720 = _1698;
        float _1722 = _1720;
        if (!_1716)
        {
            _1704 = _1646;
        }
        float _1724 = _1704;
        float _1726 = _1724;
        if (!_1716)
        {
            _1712 = _1648;
        }
        float _1728 = _1712;
        float _1730 = _1728;
        if (!_1716)
        {
            _1584 = _1640;
        }
        float _1732 = _1584;
        float _1734 = _1732;
        if (_1716)
        {
            _1722 = _1644;
        }
        float _1736 = _1722;
        _1700 = _1736;
        if (_1716)
        {
            _1726 = _1646;
        }
        float _1738 = _1726;
        _1706 = _1738;
        if (_1716)
        {
            _1730 = _1648;
        }
        float _1740 = _1730;
        _1714 = _1740;
        if (_1716)
        {
            _1734 = _1640;
        }
        float _1742 = _1734;
        _1586 = _1742;
        if (_1716)
        {
            _1676 = _144;
        }
        float _1744 = _1676;
        _1682 = _1744;
        if (_1716)
        {
            _1678 = _146;
        }
        float _1746 = _1678;
        _1684 = _1746;
        if (_1716)
        {
            _1686 = _148;
        }
    }
    float _1748 = _1586;
    float _1750 = _1680;
    float _1752 = _1700;
    float _1754 = _1706;
    float _1756 = _1714;
    float _1758 = _1682;
    float _1760 = _1684;
    float _1762 = _1686;
    bool _1764 = _1748 >= _1670;
    bool _1766 = isnan(_1748);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(_1670);
    bool _1772 = _1768 || _1770;
    float _1774 = _162 * _828;
    float _1776 = fma(_160, _830, _1774);
    float _1778 = fma(_164, _832, _1776);
    float _1780 = _1774;
    float _1782 = _1776;
    float _1784 = _1750;
    float _1786 = _1758;
    float _1788 = _1760;
    float _1790 = _1750;
    float _1792 = _1758;
    float _1794 = _1760;
    float _1796 = _1762;
    float _1798 = _1756;
    float _1800 = _1778;
    float _1802 = _1778;
    if (!_1772)
    {
        _1688 = _152;
    }
    float _1804 = _1688;
    float _1806 = _1804;
    float _1808 = _1804;
    if (!_1772)
    {
        _1780 = _154;
    }
    float _1810 = _1780;
    float _1812 = _1810;
    float _1814 = _1810;
    if (!_1772)
    {
        _1782 = _156;
    }
    float _1816 = _1782;
    bool _1818 = !_1772;
    float _1820 = _1816;
    float _1822 = _1816;
    if (!_1818)
    {
        bool _1824 = _1750 > _1670;
        if (_1824)
        {
            _1784 = _1670;
        }
        float _1826 = _1784;
        _1790 = _1826;
        if (!_1824)
        {
            _1806 = _1752;
        }
        float _1828 = _1806;
        float _1830 = _1828;
        if (!_1824)
        {
            _1812 = _1754;
        }
        float _1832 = _1812;
        float _1834 = _1832;
        if (!_1824)
        {
            _1820 = _1756;
        }
        float _1836 = _1820;
        float _1838 = _1836;
        if (!_1824)
        {
            _1690 = _1748;
        }
        float _1840 = _1690;
        float _1842 = _1840;
        if (_1824)
        {
            _1830 = _1752;
        }
        float _1844 = _1830;
        _1808 = _1844;
        if (_1824)
        {
            _1834 = _1754;
        }
        float _1846 = _1834;
        _1814 = _1846;
        if (_1824)
        {
            _1838 = _1756;
        }
        float _1848 = _1838;
        _1822 = _1848;
        if (_1824)
        {
            _1842 = _1748;
        }
        float _1850 = _1842;
        _1692 = _1850;
        if (_1824)
        {
            _1786 = _152;
        }
        float _1852 = _1786;
        _1792 = _1852;
        if (_1824)
        {
            _1788 = _154;
        }
        float _1854 = _1788;
        _1794 = _1854;
        if (_1824)
        {
            _1796 = _156;
        }
    }
    float _1856 = _1692;
    float _1858 = _1790;
    float _1860 = _1808;
    float _1862 = _1814;
    float _1864 = _1822;
    float _1866 = _1792;
    float _1868 = _1794;
    float _1870 = _1796;
    bool _1872 = _1856 >= _1778;
    bool _1874 = isnan(_1856);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan(_1778);
    bool _1880 = _1876 || _1878;
    float _1882 = _170 * _828;
    float _1884 = fma(_168, _830, _1882);
    float _1886 = fma(_172, _832, _1884);
    float _1888 = _1884;
    float _1890 = _1858;
    float _1892 = _1866;
    float _1894 = _1868;
    float _1896 = _1858;
    float _1898 = _1866;
    float _1900 = _1868;
    float _1902 = _1870;
    float _1904 = _1860;
    float _1906 = _1864;
    float _1908 = _1886;
    float _1910 = _1886;
    if (!_1880)
    {
        _1798 = _160;
    }
    float _1912 = _1798;
    float _1914 = _1912;
    float _1916 = _1912;
    if (!_1880)
    {
        _1694 = _162;
    }
    float _1918 = _1694;
    float _1920 = _1918;
    float _1922 = _1918;
    if (!_1880)
    {
        _1888 = _164;
    }
    float _1924 = _1888;
    bool _1926 = !_1880;
    float _1928 = _1924;
    float _1930 = _1924;
    if (!_1926)
    {
        bool _1932 = _1858 > _1778;
        if (_1932)
        {
            _1890 = _1778;
        }
        float _1934 = _1890;
        _1896 = _1934;
        if (!_1932)
        {
            _1914 = _1860;
        }
        float _1936 = _1914;
        float _1938 = _1936;
        if (!_1932)
        {
            _1920 = _1862;
        }
        float _1940 = _1920;
        float _1942 = _1940;
        if (!_1932)
        {
            _1928 = _1864;
        }
        float _1944 = _1928;
        float _1946 = _1944;
        if (!_1932)
        {
            _1800 = _1856;
        }
        float _1948 = _1800;
        float _1950 = _1948;
        if (_1932)
        {
            _1938 = _1860;
        }
        float _1952 = _1938;
        _1916 = _1952;
        if (_1932)
        {
            _1942 = _1862;
        }
        float _1954 = _1942;
        _1922 = _1954;
        if (_1932)
        {
            _1946 = _1864;
        }
        float _1956 = _1946;
        _1930 = _1956;
        if (_1932)
        {
            _1950 = _1856;
        }
        float _1958 = _1950;
        _1802 = _1958;
        if (_1932)
        {
            _1892 = _160;
        }
        float _1960 = _1892;
        _1898 = _1960;
        if (_1932)
        {
            _1894 = _162;
        }
        float _1962 = _1894;
        _1900 = _1962;
        if (_1932)
        {
            _1902 = _164;
        }
    }
    float _1964 = _1802;
    float _1966 = _1896;
    float _1968 = _1916;
    float _1970 = _1922;
    float _1972 = _1930;
    float _1974 = _1898;
    float _1976 = _1900;
    float _1978 = _1902;
    bool _1980 = _1964 >= _1886;
    bool _1982 = isnan(_1964);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan(_1886);
    bool _1988 = _1984 || _1986;
    float _1990 = _178 * _828;
    float _1992 = fma(_176, _830, _1990);
    float _1994 = fma(_180, _832, _1992);
    float _1996 = _1992;
    float _1998 = _1966;
    float _2000 = _1974;
    float _2002 = _1976;
    float _2004 = _1966;
    float _2006 = _1974;
    float _2008 = _1976;
    float _2010 = _1978;
    float _2012 = _1968;
    float _2014 = _1970;
    float _2016 = _1994;
    float _2018 = _1994;
    if (!_1988)
    {
        _1904 = _168;
    }
    float _2020 = _1904;
    float _2022 = _2020;
    float _2024 = _2020;
    if (!_1988)
    {
        _1996 = _170;
    }
    float _2026 = _1996;
    float _2028 = _2026;
    float _2030 = _2026;
    if (!_1988)
    {
        _1906 = _172;
    }
    float _2032 = _1906;
    bool _2034 = !_1988;
    float _2036 = _2032;
    float _2038 = _2032;
    if (!_2034)
    {
        bool _2040 = _1966 > _1886;
        if (_2040)
        {
            _1998 = _1886;
        }
        float _2042 = _1998;
        _2004 = _2042;
        if (!_2040)
        {
            _2022 = _1968;
        }
        float _2044 = _2022;
        float _2046 = _2044;
        if (!_2040)
        {
            _2028 = _1970;
        }
        float _2048 = _2028;
        float _2050 = _2048;
        if (!_2040)
        {
            _2036 = _1972;
        }
        float _2052 = _2036;
        float _2054 = _2052;
        if (!_2040)
        {
            _1908 = _1964;
        }
        float _2056 = _1908;
        float _2058 = _2056;
        if (_2040)
        {
            _2046 = _1968;
        }
        float _2060 = _2046;
        _2024 = _2060;
        if (_2040)
        {
            _2050 = _1970;
        }
        float _2062 = _2050;
        _2030 = _2062;
        if (_2040)
        {
            _2054 = _1972;
        }
        float _2064 = _2054;
        _2038 = _2064;
        if (_2040)
        {
            _2058 = _1964;
        }
        float _2066 = _2058;
        _1910 = _2066;
        if (_2040)
        {
            _2000 = _168;
        }
        float _2068 = _2000;
        _2006 = _2068;
        if (_2040)
        {
            _2002 = _170;
        }
        float _2070 = _2002;
        _2008 = _2070;
        if (_2040)
        {
            _2010 = _172;
        }
    }
    float _2072 = _1910;
    float _2074 = _2004;
    float _2076 = _2024;
    float _2078 = _2030;
    float _2080 = _2038;
    float _2082 = _2006;
    float _2084 = _2008;
    float _2086 = _2010;
    bool _2088 = _2072 >= _1994;
    bool _2090 = isnan(_2072);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan(_1994);
    bool _2096 = _2092 || _2094;
    float _2098 = _186 * _828;
    float _2100 = fma(_184, _830, _2098);
    float _2102 = fma(_188, _832, _2100);
    float _2104 = _2098;
    float _2106 = _2074;
    float _2108 = _2082;
    float _2110 = _2084;
    float _2112 = _2074;
    float _2114 = _2082;
    float _2116 = _2084;
    float _2118 = _2086;
    float _2120 = _2076;
    float _2122 = _2080;
    float _2124 = _2102;
    float _2126 = _2102;
    if (!_2096)
    {
        _2012 = _176;
    }
    float _2128 = _2012;
    float _2130 = _2128;
    float _2132 = _2128;
    if (!_2096)
    {
        _2014 = _178;
    }
    float _2134 = _2014;
    float _2136 = _2134;
    float _2138 = _2134;
    if (!_2096)
    {
        _2104 = _180;
    }
    float _2140 = _2104;
    bool _2142 = !_2096;
    float _2144 = _2140;
    float _2146 = _2140;
    if (!_2142)
    {
        bool _2148 = _2074 > _1994;
        if (_2148)
        {
            _2106 = _1994;
        }
        float _2150 = _2106;
        _2112 = _2150;
        if (!_2148)
        {
            _2130 = _2076;
        }
        float _2152 = _2130;
        float _2154 = _2152;
        if (!_2148)
        {
            _2136 = _2078;
        }
        float _2156 = _2136;
        float _2158 = _2156;
        if (!_2148)
        {
            _2144 = _2080;
        }
        float _2160 = _2144;
        float _2162 = _2160;
        if (!_2148)
        {
            _2016 = _2072;
        }
        float _2164 = _2016;
        float _2166 = _2164;
        if (_2148)
        {
            _2154 = _2076;
        }
        float _2168 = _2154;
        _2132 = _2168;
        if (_2148)
        {
            _2158 = _2078;
        }
        float _2170 = _2158;
        _2138 = _2170;
        if (_2148)
        {
            _2162 = _2080;
        }
        float _2172 = _2162;
        _2146 = _2172;
        if (_2148)
        {
            _2166 = _2072;
        }
        float _2174 = _2166;
        _2018 = _2174;
        if (_2148)
        {
            _2108 = _176;
        }
        float _2176 = _2108;
        _2114 = _2176;
        if (_2148)
        {
            _2110 = _178;
        }
        float _2178 = _2110;
        _2116 = _2178;
        if (_2148)
        {
            _2118 = _180;
        }
    }
    float _2180 = _2018;
    float _2182 = _2112;
    float _2184 = _2132;
    float _2186 = _2138;
    float _2188 = _2146;
    float _2190 = _2114;
    float _2192 = _2116;
    float _2194 = _2118;
    bool _2196 = _2180 >= _2102;
    bool _2198 = isnan(_2180);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan(_2102);
    bool _2204 = _2200 || _2202;
    float _2206 = _194 * _828;
    float _2208 = fma(_192, _830, _2206);
    float _2210 = fma(_196, _832, _2208);
    float _2212 = _2208;
    float _2214 = _2182;
    float _2216 = _2190;
    float _2218 = _2192;
    float _2220 = _2190;
    float _2222 = _2182;
    float _2224 = _2192;
    float _2226 = _2194;
    float _2228 = _2186;
    float _2230 = _2210;
    float _2232 = _2210;
    if (!_2204)
    {
        _2120 = _184;
    }
    float _2234 = _2120;
    float _2236 = _2234;
    float _2238 = _2234;
    if (!_2204)
    {
        _2212 = _186;
    }
    float _2240 = _2212;
    float _2242 = _2240;
    float _2244 = _2240;
    if (!_2204)
    {
        _2122 = _188;
    }
    float _2246 = _2122;
    bool _2248 = !_2204;
    float _2250 = _2246;
    float _2252 = _2246;
    if (!_2248)
    {
        bool _2254 = _2182 > _2102;
        if (_2254)
        {
            _2214 = _2102;
        }
        float _2256 = _2214;
        _2222 = _2256;
        if (!_2254)
        {
            _2236 = _2184;
        }
        float _2258 = _2236;
        float _2260 = _2258;
        if (!_2254)
        {
            _2242 = _2186;
        }
        float _2262 = _2242;
        float _2264 = _2262;
        if (!_2254)
        {
            _2250 = _2188;
        }
        float _2266 = _2250;
        float _2268 = _2266;
        if (!_2254)
        {
            _2124 = _2180;
        }
        float _2270 = _2124;
        float _2272 = _2270;
        if (_2254)
        {
            _2260 = _2184;
        }
        float _2274 = _2260;
        _2238 = _2274;
        if (_2254)
        {
            _2264 = _2186;
        }
        float _2276 = _2264;
        _2244 = _2276;
        if (_2254)
        {
            _2268 = _2188;
        }
        float _2278 = _2268;
        _2252 = _2278;
        if (_2254)
        {
            _2272 = _2180;
        }
        float _2280 = _2272;
        _2126 = _2280;
        if (_2254)
        {
            _2216 = _184;
        }
        float _2282 = _2216;
        _2220 = _2282;
        if (_2254)
        {
            _2218 = _186;
        }
        float _2284 = _2218;
        _2224 = _2284;
        if (_2254)
        {
            _2226 = _188;
        }
    }
    float _2286 = _2126;
    float _2288 = _2220;
    float _2290 = _2222;
    float _2292 = _2238;
    float _2294 = _2244;
    float _2296 = _2252;
    float _2298 = _2224;
    float _2300 = _2226;
    bool _2302 = _2286 >= _2210;
    bool _2304 = isnan(_2286);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan(_2210);
    bool _2310 = _2306 || _2308;
    float _2312 = _202 * _828;
    float _2314 = fma(_200, _830, _2312);
    float _2316 = fma(_204, _832, _2314);
    float _2318 = _2314;
    float _2320 = _2290;
    float _2322 = _2298;
    float _2324 = _2298;
    float _2326 = _2300;
    float _2328 = _2290;
    float _2330 = _2292;
    float _2332 = _2294;
    if (!_2310)
    {
        _2318 = _2288;
    }
    float _2334 = _2318;
    float _2336 = _2334;
    float _2338 = _2334;
    if (!_2310)
    {
        _888 = _192;
    }
    float _2340 = _888;
    float _2342 = _2340;
    float _2344 = _2340;
    if (!_2310)
    {
        _890 = _194;
    }
    float _2346 = _890;
    float _2348 = _2346;
    float _2350 = _2346;
    if (!_2310)
    {
        _2228 = _196;
    }
    float _2352 = _2228;
    bool _2354 = !_2310;
    float _2356 = _2352;
    float _2358 = _2352;
    if (!_2354)
    {
        bool _2360 = _2290 > _2210;
        if (_2360)
        {
            _2320 = _2210;
        }
        float _2362 = _2320;
        _2328 = _2362;
        if (!_2360)
        {
            _2342 = _2292;
        }
        float _2364 = _2342;
        float _2366 = _2364;
        if (!_2360)
        {
            _2348 = _2294;
        }
        float _2368 = _2348;
        float _2370 = _2368;
        if (!_2360)
        {
            _2356 = _2296;
        }
        float _2372 = _2356;
        float _2374 = _2372;
        if (!_2360)
        {
            _2230 = _2286;
        }
        float _2376 = _2230;
        float _2378 = _2376;
        if (!_2360)
        {
            _2336 = _2288;
        }
        float _2380 = _2336;
        float _2382 = _2380;
        if (_2360)
        {
            _2366 = _2292;
        }
        float _2384 = _2366;
        _2344 = _2384;
        if (_2360)
        {
            _2370 = _2294;
        }
        float _2386 = _2370;
        _2350 = _2386;
        if (_2360)
        {
            _2374 = _2296;
        }
        float _2388 = _2374;
        _2358 = _2388;
        if (_2360)
        {
            _2378 = _2286;
        }
        float _2390 = _2378;
        _2232 = _2390;
        if (_2360)
        {
            _2382 = _192;
        }
        float _2392 = _2382;
        _2338 = _2392;
        if (_2360)
        {
            _2322 = _194;
        }
        float _2394 = _2322;
        _2324 = _2394;
        if (_2360)
        {
            _2326 = _196;
        }
    }
    float _2396 = _2232;
    float _2398 = _2324;
    float _2400 = _2326;
    float _2402 = _2328;
    float _2404 = _2344;
    float _2406 = _2350;
    float _2408 = _2358;
    float _2410 = _2338;
    bool _2412 = _2396 >= _2316;
    bool _2414 = isnan(_2396);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan(_2316);
    bool _2420 = _2416 || _2418;
    float _2422 = _2410;
    float _2424 = _2410;
    if (!_2420)
    {
        _2330 = _2398;
    }
    float _2426 = _2330;
    float _2428 = _2426;
    float _2430 = _2426;
    if (!_2420)
    {
        _2332 = _2400;
    }
    float _2432 = _2332;
    float _2434 = _2432;
    float _2436 = _2432;
    if (!_2420)
    {
        _892 = _200;
    }
    float _2438 = _892;
    float _2440 = _2438;
    float _2442 = _2438;
    if (!_2420)
    {
        _894 = _202;
    }
    float _2444 = _894;
    float _2446 = 0.0;
    float _2448 = _2444;
    float _2450 = _2444;
    if (!_2420)
    {
        _2446 = _204;
    }
    float _2452 = _2446;
    bool _2454 = !_2420;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2454)
    {
        bool _2460 = _2402 > _2316;
        if (!_2460)
        {
            _2440 = _2404;
        }
        float _2462 = _2440;
        float _2464 = _2462;
        if (!_2460)
        {
            _2448 = _2406;
        }
        float _2466 = _2448;
        float _2468 = _2466;
        if (!_2460)
        {
            _2456 = _2408;
        }
        float _2470 = _2456;
        float _2472 = _2470;
        if (!_2460)
        {
            _2428 = _2398;
        }
        float _2474 = _2428;
        float _2476 = _2474;
        if (!_2460)
        {
            _2434 = _2400;
        }
        float _2478 = _2434;
        _2436 = _2478;
        if (_2460)
        {
            _2464 = _2404;
        }
        float _2480 = _2464;
        _2442 = _2480;
        if (_2460)
        {
            _2468 = _2406;
        }
        float _2482 = _2468;
        _2450 = _2482;
        if (_2460)
        {
            _2472 = _2408;
        }
        float _2484 = _2472;
        _2458 = _2484;
        if (_2460)
        {
            _2422 = _200;
        }
        float _2486 = _2422;
        _2424 = _2486;
        if (_2460)
        {
            _2476 = _202;
        }
        float _2488 = _2476;
        _2430 = _2488;
        if (_2460)
        {
            _2436 = _204;
        }
    }
    float _2490 = _2430;
    float _2492 = _2450;
    float _2494 = _2424;
    float _2496 = _2442;
    float _2498 = _2436;
    float _2500 = _2458;
    float _2502 = -_2490;
    float _2504 = _2492 + _2502;
    float _2506 = -_2494;
    float _2508 = _2496 + _2506;
    float _2510 = -_2498;
    float _2512 = _2500 + _2510;
    float _2514 = _2504 * _2504;
    float _2516 = fma(_2508, _2508, _2514);
    float _2518 = -_2494;
    float _2520 = _80 + _2518;
    float _2522 = fma(_2512, _2512, _2516);
    float _2524 = -_2490;
    float _2526 = _82 + _2524;
    float _2528 = _2504 * _2526;
    float _2530 = 1.0 / _2522;
    float _2532 = -_2498;
    float _2534 = _84 + _2532;
    float _2536 = fma(_2508, _2520, _2528);
    float _2538 = fma(_2512, _2534, _2536);
    float _2540 = _2530 * 3.0;
    float _2542 = _2540 * _2538;
    float _2544 = rint(_2542);
    float _2546 = precise::max(0.0, _2544);
    float _2548 = precise::min(_2546, 3.0);
    float _2550 = trunc(_2548);
    int _2553 = int(_2550);
    bool _2555 = _2553 >= 2;
    bool _2557 = !_2555;
    float _2559 = _2508;
    float _2561 = _2504;
    float _2563 = _2512;
    float _2565 = _2494;
    float _2567 = _2496;
    float _2569 = _2490;
    float _2571 = _2492;
    float _2573 = _2500;
    float _2575 = _2498;
    float _2585;
    float _2587;
    float _2589;
    float _2591;
    float _2593;
    float _2595;
    float _2597;
    float _2599;
    float _2601;
    float _2603;
    float _2605;
    float _2607;
    float _2609;
    float _2611;
    float _2613;
    float _2615;
    if (!_2557)
    {
        bool _2577 = _2553 >= 3;
        bool _2579 = !_2577;
        if (!_2579)
        {
            bool _2581 = _2553 != 3;
            _2583 = _2581;
            if (!_2583)
            {
                _2585 = _80;
                _2587 = _82;
                _2589 = _84;
                _2591 = 1.0;
                _2593 = 0.0;
                _2595 = 0.0;
                _2597 = 0.0;
                _2599 = 0.0;
                _2601 = 0.0;
                _2603 = 0.0;
                _2605 = 0.0;
                _2607 = 0.0;
                _2609 = 0.0;
                _2611 = 0.0;
                _2613 = 0.0;
                _2615 = 0.0;
                _2617 = true;
            }
        }
        else
        {
            _2585 = 0.0;
            _2587 = 0.0;
            _2589 = 0.0;
            _2591 = 0.0;
            _2593 = 0.0;
            _2595 = 0.0;
            _2597 = 0.0;
            _2599 = 0.0;
            _2601 = _80;
            _2603 = _82;
            _2605 = _84;
            _2607 = 1.0;
            _2609 = 0.0;
            _2611 = 0.0;
            _2613 = 0.0;
            _2615 = 0.0;
            _2617 = true;
        }
    }
    if ((!_2617) || _2583)
    {
        bool _2619;
        if (!_2583)
        {
            _2619 = _2553 >= 1;
        }
        if ((!_2619) || _2583)
        {
            bool _2621;
            if (!_2583)
            {
                _2621 = _2553 != 0;
            }
            if ((!_2621) && (!_2583))
            {
                _2585 = 0.0;
                _2587 = 0.0;
                _2589 = 0.0;
                _2591 = 0.0;
                _2593 = _80;
                _2595 = _82;
                _2597 = _84;
                _2599 = 1.0;
                _2601 = 0.0;
                _2603 = 0.0;
                _2605 = 0.0;
                _2607 = 0.0;
                _2609 = 0.0;
                _2611 = 0.0;
                _2613 = 0.0;
                _2615 = 0.0;
                _2617 = true;
            }
            else
            {
                _2583 = false;
                _2585 = 0.0;
                _2587 = 0.0;
                _2589 = 0.0;
                _2591 = 0.0;
                _2593 = 0.0;
                _2595 = 0.0;
                _2597 = 0.0;
                _2599 = 0.0;
                _2601 = 0.0;
                _2603 = 0.0;
                _2605 = 0.0;
                _2607 = 0.0;
                _2609 = 0.0;
                _2611 = 0.0;
                _2613 = 0.0;
                _2615 = 0.0;
                _2617 = true;
            }
        }
        else
        {
            _2585 = 0.0;
            _2587 = 0.0;
            _2589 = 0.0;
            _2591 = 0.0;
            _2593 = 0.0;
            _2595 = 0.0;
            _2597 = 0.0;
            _2599 = 0.0;
            _2601 = 0.0;
            _2603 = 0.0;
            _2605 = 0.0;
            _2607 = 0.0;
            _2609 = _80;
            _2611 = _82;
            _2613 = _84;
            _2615 = 1.0;
        }
    }
    _2617 = false;
    float _2623 = _2585;
    float _2625 = _2587;
    float _2627 = _2589;
    float _2629 = _2591;
    float _2631 = _2593;
    float _2633 = _2595;
    float _2635 = _2597;
    float _2637 = _2599;
    float _2639 = _2601;
    float _2641 = _2603;
    float _2643 = _2605;
    float _2645 = _2607;
    float _2647 = _2609;
    float _2649 = _2611;
    float _2651 = _2613;
    float _2653 = _2615;
    float _2655 = -_2490;
    float _2657 = _90 + _2655;
    float _2659 = -_2494;
    float _2661 = _88 + _2659;
    float _2663 = _2504 * _2657;
    float _2665 = -_2498;
    float _2667 = _92 + _2665;
    float _2669 = fma(_2508, _2661, _2663);
    float _2671 = fma(_2512, _2667, _2669);
    float _2673 = _2540 * _2671;
    float _2675 = rint(_2673);
    float _2677 = precise::max(0.0, _2675);
    float _2679 = precise::min(_2677, 3.0);
    float _2681 = trunc(_2679);
    int _2683 = int(_2681);
    bool _2685 = _2683 >= 2;
    bool _2687 = !_2685;
    float _2689 = as_type<float>(_2683);
    float _2691 = _2675;
    float _2693 = _2669;
    float _2695 = _2663;
    float _2697 = _2623;
    float _2699 = _2625;
    float _2701 = _2627;
    float _2703 = _2629;
    float _2705 = _2639;
    float _2707 = _2641;
    float _2709 = _2643;
    float _2711 = _2645;
    float _2713 = _2647;
    float _2715 = _2649;
    float _2717 = _2651;
    float _2719 = _2653;
    float _2737;
    float _2739;
    float _2741;
    float _2743;
    if (!_2687)
    {
        bool _2721 = _2683 >= 3;
        bool _2723 = !_2721;
        if (!_2723)
        {
            bool _2725 = _2683 != 3;
            _2727 = _2725;
            if (!_2727)
            {
                float _2729 = _88 + _2623;
                float _2731 = _90 + _2625;
                float _2733 = _92 + _2627;
                float _2735 = _2629 + 1.0;
                _2697 = _2729;
                _2699 = _2731;
                _2701 = _2733;
                _2703 = _2735;
                _2737 = _2631;
                _2739 = _2633;
                _2741 = _2635;
                _2743 = _2637;
                _2745 = true;
            }
        }
        else
        {
            float _2747 = _88 + _2639;
            float _2749 = _90 + _2641;
            float _2751 = _92 + _2643;
            float _2753 = _2645 + 1.0;
            _2737 = _2631;
            _2739 = _2633;
            _2741 = _2635;
            _2743 = _2637;
            _2705 = _2747;
            _2707 = _2749;
            _2709 = _2751;
            _2711 = _2753;
            _2745 = true;
        }
    }
    if ((!_2745) || _2727)
    {
        bool _2755;
        if (!_2727)
        {
            _2755 = _2683 >= 1;
        }
        if ((!_2755) || _2727)
        {
            if (!_2727)
            {
                bool _2757 = _2683 != 0;
                if (!_2757)
                {
                    float _2759 = _88 + _2631;
                    _2689 = _2759;
                }
                float _2761 = _2689;
                _2737 = _2761;
                if (!_2757)
                {
                    float _2763 = _90 + _2633;
                    _2691 = _2763;
                }
                float _2765 = _2691;
                _2739 = _2765;
                if (!_2757)
                {
                    float _2767 = _92 + _2635;
                    _2693 = _2767;
                }
                float _2769 = _2693;
                _2741 = _2769;
                if (!_2757)
                {
                    float _2771 = _2637 + 1.0;
                    _2695 = _2771;
                }
                float _2773 = _2695;
                bool _2775 = !_2757;
                _2743 = _2773;
                _2745 = _2775;
            }
            if ((!_2745) || _2727)
            {
                _2727 = false;
                _2737 = _2631;
                _2739 = _2633;
                _2741 = _2635;
                _2743 = _2637;
                _2745 = true;
            }
        }
        else
        {
            float _2777 = _88 + _2647;
            float _2779 = _90 + _2649;
            float _2781 = _92 + _2651;
            float _2783 = _2653 + 1.0;
            _2737 = _2631;
            _2739 = _2633;
            _2741 = _2635;
            _2743 = _2637;
            _2713 = _2777;
            _2715 = _2779;
            _2717 = _2781;
            _2719 = _2783;
        }
    }
    _2745 = false;
    float _2785 = _2697;
    float _2787 = _2699;
    float _2789 = _2701;
    float _2791 = _2703;
    float _2793 = _2737;
    float _2795 = _2739;
    float _2797 = _2741;
    float _2799 = _2743;
    float _2801 = _2705;
    float _2803 = _2707;
    float _2805 = _2709;
    float _2807 = _2711;
    float _2809 = _2713;
    float _2811 = _2715;
    float _2813 = _2717;
    float _2815 = _2719;
    float _2817 = -_2490;
    float _2819 = _98 + _2817;
    float _2821 = -_2494;
    float _2823 = _96 + _2821;
    float _2825 = _2504 * _2819;
    float _2827 = -_2498;
    float _2829 = _100 + _2827;
    float _2831 = fma(_2508, _2823, _2825);
    float _2833 = fma(_2512, _2829, _2831);
    float _2835 = _2540 * _2833;
    float _2837 = rint(_2835);
    float _2839 = precise::max(0.0, _2837);
    float _2841 = precise::min(_2839, 3.0);
    float _2843 = trunc(_2841);
    int _2845 = int(_2843);
    bool _2847 = _2845 >= 2;
    bool _2849 = !_2847;
    float _2851 = as_type<float>(_2845);
    float _2853 = _2837;
    float _2855 = _2831;
    float _2857 = _2825;
    float _2859 = _2785;
    float _2861 = _2787;
    float _2863 = _2789;
    float _2865 = _2791;
    float _2867 = _2801;
    float _2869 = _2803;
    float _2871 = _2805;
    float _2873 = _2807;
    float _2875 = _2809;
    float _2877 = _2811;
    float _2879 = _2813;
    float _2881 = _2815;
    float _2899;
    float _2901;
    float _2903;
    float _2905;
    if (!_2849)
    {
        bool _2883 = _2845 >= 3;
        bool _2885 = !_2883;
        if (!_2885)
        {
            bool _2887 = _2845 != 3;
            _2889 = _2887;
            if (!_2889)
            {
                float _2891 = _96 + _2785;
                float _2893 = _98 + _2787;
                float _2895 = _100 + _2789;
                float _2897 = _2791 + 1.0;
                _2859 = _2891;
                _2861 = _2893;
                _2863 = _2895;
                _2865 = _2897;
                _2899 = _2793;
                _2901 = _2795;
                _2903 = _2797;
                _2905 = _2799;
                _2907 = true;
            }
        }
        else
        {
            float _2909 = _96 + _2801;
            float _2911 = _98 + _2803;
            float _2913 = _100 + _2805;
            float _2915 = _2807 + 1.0;
            _2899 = _2793;
            _2901 = _2795;
            _2903 = _2797;
            _2905 = _2799;
            _2867 = _2909;
            _2869 = _2911;
            _2871 = _2913;
            _2873 = _2915;
            _2907 = true;
        }
    }
    if ((!_2907) || _2889)
    {
        bool _2917;
        if (!_2889)
        {
            _2917 = _2845 >= 1;
        }
        if ((!_2917) || _2889)
        {
            if (!_2889)
            {
                bool _2919 = _2845 != 0;
                if (!_2919)
                {
                    float _2921 = _96 + _2793;
                    _2851 = _2921;
                }
                float _2923 = _2851;
                _2899 = _2923;
                if (!_2919)
                {
                    float _2925 = _98 + _2795;
                    _2853 = _2925;
                }
                float _2927 = _2853;
                _2901 = _2927;
                if (!_2919)
                {
                    float _2929 = _100 + _2797;
                    _2855 = _2929;
                }
                float _2931 = _2855;
                _2903 = _2931;
                if (!_2919)
                {
                    float _2933 = _2799 + 1.0;
                    _2857 = _2933;
                }
                float _2935 = _2857;
                bool _2937 = !_2919;
                _2905 = _2935;
                _2907 = _2937;
            }
            if ((!_2907) || _2889)
            {
                _2889 = false;
                _2899 = _2793;
                _2901 = _2795;
                _2903 = _2797;
                _2905 = _2799;
                _2907 = true;
            }
        }
        else
        {
            float _2939 = _96 + _2809;
            float _2941 = _98 + _2811;
            float _2943 = _100 + _2813;
            float _2945 = _2815 + 1.0;
            _2899 = _2793;
            _2901 = _2795;
            _2903 = _2797;
            _2905 = _2799;
            _2875 = _2939;
            _2877 = _2941;
            _2879 = _2943;
            _2881 = _2945;
        }
    }
    _2907 = false;
    float _2947 = _2859;
    float _2949 = _2861;
    float _2951 = _2863;
    float _2953 = _2865;
    float _2955 = _2899;
    float _2957 = _2901;
    float _2959 = _2903;
    float _2961 = _2905;
    float _2963 = _2867;
    float _2965 = _2869;
    float _2967 = _2871;
    float _2969 = _2873;
    float _2971 = _2875;
    float _2973 = _2877;
    float _2975 = _2879;
    float _2977 = _2881;
    float _2979 = -_2490;
    float _2981 = _106 + _2979;
    float _2983 = -_2494;
    float _2985 = _104 + _2983;
    float _2987 = _2504 * _2981;
    float _2989 = -_2498;
    float _2991 = _108 + _2989;
    float _2993 = fma(_2508, _2985, _2987);
    float _2995 = fma(_2512, _2991, _2993);
    float _2997 = _2540 * _2995;
    float _2999 = rint(_2997);
    float _3001 = precise::max(0.0, _2999);
    float _3003 = precise::min(_3001, 3.0);
    float _3005 = trunc(_3003);
    int _3007 = int(_3005);
    bool _3009 = _3007 >= 2;
    bool _3011 = !_3009;
    float _3013 = as_type<float>(_3007);
    float _3015 = _2999;
    float _3017 = _2993;
    float _3019 = _2987;
    float _3021 = _2947;
    float _3023 = _2949;
    float _3025 = _2951;
    float _3027 = _2953;
    float _3029 = _2963;
    float _3031 = _2965;
    float _3033 = _2967;
    float _3035 = _2969;
    float _3037 = _2971;
    float _3039 = _2973;
    float _3041 = _2975;
    float _3043 = _2977;
    float _3061;
    float _3063;
    float _3065;
    float _3067;
    if (!_3011)
    {
        bool _3045 = _3007 >= 3;
        bool _3047 = !_3045;
        if (!_3047)
        {
            bool _3049 = _3007 != 3;
            _3051 = _3049;
            if (!_3051)
            {
                float _3053 = _104 + _2947;
                float _3055 = _106 + _2949;
                float _3057 = _108 + _2951;
                float _3059 = _2953 + 1.0;
                _3021 = _3053;
                _3023 = _3055;
                _3025 = _3057;
                _3027 = _3059;
                _3061 = _2955;
                _3063 = _2957;
                _3065 = _2959;
                _3067 = _2961;
                _3069 = true;
            }
        }
        else
        {
            float _3071 = _104 + _2963;
            float _3073 = _106 + _2965;
            float _3075 = _108 + _2967;
            float _3077 = _2969 + 1.0;
            _3061 = _2955;
            _3063 = _2957;
            _3065 = _2959;
            _3067 = _2961;
            _3029 = _3071;
            _3031 = _3073;
            _3033 = _3075;
            _3035 = _3077;
            _3069 = true;
        }
    }
    if ((!_3069) || _3051)
    {
        bool _3079;
        if (!_3051)
        {
            _3079 = _3007 >= 1;
        }
        if ((!_3079) || _3051)
        {
            if (!_3051)
            {
                bool _3081 = _3007 != 0;
                if (!_3081)
                {
                    float _3083 = _104 + _2955;
                    _3013 = _3083;
                }
                float _3085 = _3013;
                _3061 = _3085;
                if (!_3081)
                {
                    float _3087 = _106 + _2957;
                    _3015 = _3087;
                }
                float _3089 = _3015;
                _3063 = _3089;
                if (!_3081)
                {
                    float _3091 = _108 + _2959;
                    _3017 = _3091;
                }
                float _3093 = _3017;
                _3065 = _3093;
                if (!_3081)
                {
                    float _3095 = _2961 + 1.0;
                    _3019 = _3095;
                }
                float _3097 = _3019;
                bool _3099 = !_3081;
                _3067 = _3097;
                _3069 = _3099;
            }
            if ((!_3069) || _3051)
            {
                _3051 = false;
                _3061 = _2955;
                _3063 = _2957;
                _3065 = _2959;
                _3067 = _2961;
                _3069 = true;
            }
        }
        else
        {
            float _3101 = _104 + _2971;
            float _3103 = _106 + _2973;
            float _3105 = _108 + _2975;
            float _3107 = _2977 + 1.0;
            _3061 = _2955;
            _3063 = _2957;
            _3065 = _2959;
            _3067 = _2961;
            _3037 = _3101;
            _3039 = _3103;
            _3041 = _3105;
            _3043 = _3107;
        }
    }
    _3069 = false;
    float _3109 = _3021;
    float _3111 = _3023;
    float _3113 = _3025;
    float _3115 = _3027;
    float _3117 = _3061;
    float _3119 = _3063;
    float _3121 = _3065;
    float _3123 = _3067;
    float _3125 = _3029;
    float _3127 = _3031;
    float _3129 = _3033;
    float _3131 = _3035;
    float _3133 = _3037;
    float _3135 = _3039;
    float _3137 = _3041;
    float _3139 = _3043;
    float _3141 = -_2490;
    float _3143 = _114 + _3141;
    float _3145 = -_2494;
    float _3147 = _112 + _3145;
    float _3149 = _2504 * _3143;
    float _3151 = -_2498;
    float _3153 = _116 + _3151;
    float _3155 = fma(_2508, _3147, _3149);
    float _3157 = fma(_2512, _3153, _3155);
    float _3159 = _2540 * _3157;
    float _3161 = rint(_3159);
    float _3163 = precise::max(0.0, _3161);
    float _3165 = precise::min(_3163, 3.0);
    float _3167 = trunc(_3165);
    int _3169 = int(_3167);
    bool _3171 = _3169 >= 2;
    bool _3173 = !_3171;
    float _3175 = as_type<float>(_3169);
    float _3177 = _3161;
    float _3179 = _3155;
    float _3181 = _3149;
    float _3183 = _3109;
    float _3185 = _3111;
    float _3187 = _3113;
    float _3189 = _3115;
    float _3191 = _3125;
    float _3193 = _3127;
    float _3195 = _3129;
    float _3197 = _3131;
    float _3199 = _3133;
    float _3201 = _3135;
    float _3203 = _3137;
    float _3205 = _3139;
    float _3223;
    float _3225;
    float _3227;
    float _3229;
    if (!_3173)
    {
        bool _3207 = _3169 >= 3;
        bool _3209 = !_3207;
        if (!_3209)
        {
            bool _3211 = _3169 != 3;
            _3213 = _3211;
            if (!_3213)
            {
                float _3215 = _112 + _3109;
                float _3217 = _114 + _3111;
                float _3219 = _116 + _3113;
                float _3221 = _3115 + 1.0;
                _3183 = _3215;
                _3185 = _3217;
                _3187 = _3219;
                _3189 = _3221;
                _3223 = _3117;
                _3225 = _3119;
                _3227 = _3121;
                _3229 = _3123;
                _3231 = true;
            }
        }
        else
        {
            float _3233 = _112 + _3125;
            float _3235 = _114 + _3127;
            float _3237 = _116 + _3129;
            float _3239 = _3131 + 1.0;
            _3223 = _3117;
            _3225 = _3119;
            _3227 = _3121;
            _3229 = _3123;
            _3191 = _3233;
            _3193 = _3235;
            _3195 = _3237;
            _3197 = _3239;
            _3231 = true;
        }
    }
    if ((!_3231) || _3213)
    {
        bool _3241;
        if (!_3213)
        {
            _3241 = _3169 >= 1;
        }
        if ((!_3241) || _3213)
        {
            if (!_3213)
            {
                bool _3243 = _3169 != 0;
                if (!_3243)
                {
                    float _3245 = _112 + _3117;
                    _3175 = _3245;
                }
                float _3247 = _3175;
                _3223 = _3247;
                if (!_3243)
                {
                    float _3249 = _114 + _3119;
                    _3177 = _3249;
                }
                float _3251 = _3177;
                _3225 = _3251;
                if (!_3243)
                {
                    float _3253 = _116 + _3121;
                    _3179 = _3253;
                }
                float _3255 = _3179;
                _3227 = _3255;
                if (!_3243)
                {
                    float _3257 = _3123 + 1.0;
                    _3181 = _3257;
                }
                float _3259 = _3181;
                bool _3261 = !_3243;
                _3229 = _3259;
                _3231 = _3261;
            }
            if ((!_3231) || _3213)
            {
                _3213 = false;
                _3223 = _3117;
                _3225 = _3119;
                _3227 = _3121;
                _3229 = _3123;
                _3231 = true;
            }
        }
        else
        {
            float _3263 = _112 + _3133;
            float _3265 = _114 + _3135;
            float _3267 = _116 + _3137;
            float _3269 = _3139 + 1.0;
            _3223 = _3117;
            _3225 = _3119;
            _3227 = _3121;
            _3229 = _3123;
            _3199 = _3263;
            _3201 = _3265;
            _3203 = _3267;
            _3205 = _3269;
        }
    }
    _3231 = false;
    float _3271 = _3183;
    float _3273 = _3185;
    float _3275 = _3187;
    float _3277 = _3189;
    float _3279 = _3223;
    float _3281 = _3225;
    float _3283 = _3227;
    float _3285 = _3229;
    float _3287 = _3191;
    float _3289 = _3193;
    float _3291 = _3195;
    float _3293 = _3197;
    float _3295 = _3199;
    float _3297 = _3201;
    float _3299 = _3203;
    float _3301 = _3205;
    float _3303 = -_2490;
    float _3305 = _122 + _3303;
    float _3307 = -_2494;
    float _3309 = _120 + _3307;
    float _3311 = _2504 * _3305;
    float _3313 = -_2498;
    float _3315 = _124 + _3313;
    float _3317 = fma(_2508, _3309, _3311);
    float _3319 = fma(_2512, _3315, _3317);
    float _3321 = _2540 * _3319;
    float _3323 = rint(_3321);
    float _3325 = precise::max(0.0, _3323);
    float _3327 = precise::min(_3325, 3.0);
    float _3329 = trunc(_3327);
    int _3331 = int(_3329);
    bool _3333 = _3331 >= 2;
    bool _3335 = !_3333;
    float _3337 = as_type<float>(_3331);
    float _3339 = _3323;
    float _3341 = _3317;
    float _3343 = _3311;
    float _3345 = _3271;
    float _3347 = _3273;
    float _3349 = _3275;
    float _3351 = _3277;
    float _3353 = _3287;
    float _3355 = _3289;
    float _3357 = _3291;
    float _3359 = _3293;
    float _3361 = _3295;
    float _3363 = _3297;
    float _3365 = _3299;
    float _3367 = _3301;
    float _3385;
    float _3387;
    float _3389;
    float _3391;
    if (!_3335)
    {
        bool _3369 = _3331 >= 3;
        bool _3371 = !_3369;
        if (!_3371)
        {
            bool _3373 = _3331 != 3;
            _3375 = _3373;
            if (!_3375)
            {
                float _3377 = _120 + _3271;
                float _3379 = _122 + _3273;
                float _3381 = _124 + _3275;
                float _3383 = _3277 + 1.0;
                _3345 = _3377;
                _3347 = _3379;
                _3349 = _3381;
                _3351 = _3383;
                _3385 = _3279;
                _3387 = _3281;
                _3389 = _3283;
                _3391 = _3285;
                _3393 = true;
            }
        }
        else
        {
            float _3395 = _120 + _3287;
            float _3397 = _122 + _3289;
            float _3399 = _124 + _3291;
            float _3401 = _3293 + 1.0;
            _3385 = _3279;
            _3387 = _3281;
            _3389 = _3283;
            _3391 = _3285;
            _3353 = _3395;
            _3355 = _3397;
            _3357 = _3399;
            _3359 = _3401;
            _3393 = true;
        }
    }
    if ((!_3393) || _3375)
    {
        bool _3403;
        if (!_3375)
        {
            _3403 = _3331 >= 1;
        }
        if ((!_3403) || _3375)
        {
            if (!_3375)
            {
                bool _3405 = _3331 != 0;
                if (!_3405)
                {
                    float _3407 = _120 + _3279;
                    _3337 = _3407;
                }
                float _3409 = _3337;
                _3385 = _3409;
                if (!_3405)
                {
                    float _3411 = _122 + _3281;
                    _3339 = _3411;
                }
                float _3413 = _3339;
                _3387 = _3413;
                if (!_3405)
                {
                    float _3415 = _124 + _3283;
                    _3341 = _3415;
                }
                float _3417 = _3341;
                _3389 = _3417;
                if (!_3405)
                {
                    float _3419 = _3285 + 1.0;
                    _3343 = _3419;
                }
                float _3421 = _3343;
                bool _3423 = !_3405;
                _3391 = _3421;
                _3393 = _3423;
            }
            if ((!_3393) || _3375)
            {
                _3375 = false;
                _3385 = _3279;
                _3387 = _3281;
                _3389 = _3283;
                _3391 = _3285;
                _3393 = true;
            }
        }
        else
        {
            float _3425 = _120 + _3295;
            float _3427 = _122 + _3297;
            float _3429 = _124 + _3299;
            float _3431 = _3301 + 1.0;
            _3385 = _3279;
            _3387 = _3281;
            _3389 = _3283;
            _3391 = _3285;
            _3361 = _3425;
            _3363 = _3427;
            _3365 = _3429;
            _3367 = _3431;
        }
    }
    _3393 = false;
    float _3433 = _3345;
    float _3435 = _3347;
    float _3437 = _3349;
    float _3439 = _3351;
    float _3441 = _3385;
    float _3443 = _3387;
    float _3445 = _3389;
    float _3447 = _3391;
    float _3449 = _3353;
    float _3451 = _3355;
    float _3453 = _3357;
    float _3455 = _3359;
    float _3457 = _3361;
    float _3459 = _3363;
    float _3461 = _3365;
    float _3463 = _3367;
    float _3465 = -_2490;
    float _3467 = _130 + _3465;
    float _3469 = -_2494;
    float _3471 = _128 + _3469;
    float _3473 = _2504 * _3467;
    float _3475 = -_2498;
    float _3477 = _132 + _3475;
    float _3479 = fma(_2508, _3471, _3473);
    float _3481 = fma(_2512, _3477, _3479);
    float _3483 = _2540 * _3481;
    float _3485 = rint(_3483);
    float _3487 = precise::max(0.0, _3485);
    float _3489 = precise::min(_3487, 3.0);
    float _3491 = trunc(_3489);
    int _3493 = int(_3491);
    bool _3495 = _3493 >= 2;
    bool _3497 = !_3495;
    float _3499 = as_type<float>(_3493);
    float _3501 = _3485;
    float _3503 = _3479;
    float _3505 = _3473;
    float _3507 = _3433;
    float _3509 = _3435;
    float _3511 = _3437;
    float _3513 = _3439;
    float _3515 = _3449;
    float _3517 = _3451;
    float _3519 = _3453;
    float _3521 = _3455;
    float _3523 = _3457;
    float _3525 = _3459;
    float _3527 = _3461;
    float _3529 = _3463;
    float _3547;
    float _3549;
    float _3551;
    float _3553;
    if (!_3497)
    {
        bool _3531 = _3493 >= 3;
        bool _3533 = !_3531;
        if (!_3533)
        {
            bool _3535 = _3493 != 3;
            _3537 = _3535;
            if (!_3537)
            {
                float _3539 = _128 + _3433;
                float _3541 = _130 + _3435;
                float _3543 = _132 + _3437;
                float _3545 = _3439 + 1.0;
                _3507 = _3539;
                _3509 = _3541;
                _3511 = _3543;
                _3513 = _3545;
                _3547 = _3441;
                _3549 = _3443;
                _3551 = _3445;
                _3553 = _3447;
                _3555 = true;
            }
        }
        else
        {
            float _3557 = _128 + _3449;
            float _3559 = _130 + _3451;
            float _3561 = _132 + _3453;
            float _3563 = _3455 + 1.0;
            _3547 = _3441;
            _3549 = _3443;
            _3551 = _3445;
            _3553 = _3447;
            _3515 = _3557;
            _3517 = _3559;
            _3519 = _3561;
            _3521 = _3563;
            _3555 = true;
        }
    }
    if ((!_3555) || _3537)
    {
        bool _3565;
        if (!_3537)
        {
            _3565 = _3493 >= 1;
        }
        if ((!_3565) || _3537)
        {
            if (!_3537)
            {
                bool _3567 = _3493 != 0;
                if (!_3567)
                {
                    float _3569 = _128 + _3441;
                    _3499 = _3569;
                }
                float _3571 = _3499;
                _3547 = _3571;
                if (!_3567)
                {
                    float _3573 = _130 + _3443;
                    _3501 = _3573;
                }
                float _3575 = _3501;
                _3549 = _3575;
                if (!_3567)
                {
                    float _3577 = _132 + _3445;
                    _3503 = _3577;
                }
                float _3579 = _3503;
                _3551 = _3579;
                if (!_3567)
                {
                    float _3581 = _3447 + 1.0;
                    _3505 = _3581;
                }
                float _3583 = _3505;
                bool _3585 = !_3567;
                _3553 = _3583;
                _3555 = _3585;
            }
            if ((!_3555) || _3537)
            {
                _3537 = false;
                _3547 = _3441;
                _3549 = _3443;
                _3551 = _3445;
                _3553 = _3447;
                _3555 = true;
            }
        }
        else
        {
            float _3587 = _128 + _3457;
            float _3589 = _130 + _3459;
            float _3591 = _132 + _3461;
            float _3593 = _3463 + 1.0;
            _3547 = _3441;
            _3549 = _3443;
            _3551 = _3445;
            _3553 = _3447;
            _3523 = _3587;
            _3525 = _3589;
            _3527 = _3591;
            _3529 = _3593;
        }
    }
    _3555 = false;
    float _3595 = _3507;
    float _3597 = _3509;
    float _3599 = _3511;
    float _3601 = _3513;
    float _3603 = _3547;
    float _3605 = _3549;
    float _3607 = _3551;
    float _3609 = _3553;
    float _3611 = _3515;
    float _3613 = _3517;
    float _3615 = _3519;
    float _3617 = _3521;
    float _3619 = _3523;
    float _3621 = _3525;
    float _3623 = _3527;
    float _3625 = _3529;
    float _3627 = -_2490;
    float _3629 = _138 + _3627;
    float _3631 = -_2494;
    float _3633 = _136 + _3631;
    float _3635 = _2504 * _3629;
    float _3637 = -_2498;
    float _3639 = _140 + _3637;
    float _3641 = fma(_2508, _3633, _3635);
    float _3643 = fma(_2512, _3639, _3641);
    float _3645 = _2540 * _3643;
    float _3647 = rint(_3645);
    float _3649 = precise::max(0.0, _3647);
    float _3651 = precise::min(_3649, 3.0);
    float _3653 = trunc(_3651);
    int _3655 = int(_3653);
    bool _3657 = _3655 >= 2;
    bool _3659 = !_3657;
    float _3661 = as_type<float>(_3655);
    float _3663 = _3647;
    float _3665 = _3641;
    float _3667 = _3635;
    float _3669 = _3595;
    float _3671 = _3597;
    float _3673 = _3599;
    float _3675 = _3601;
    float _3677 = _3611;
    float _3679 = _3613;
    float _3681 = _3615;
    float _3683 = _3617;
    float _3685 = _3619;
    float _3687 = _3621;
    float _3689 = _3623;
    float _3691 = _3625;
    float _3709;
    float _3711;
    float _3713;
    float _3715;
    if (!_3659)
    {
        bool _3693 = _3655 >= 3;
        bool _3695 = !_3693;
        if (!_3695)
        {
            bool _3697 = _3655 != 3;
            _3699 = _3697;
            if (!_3699)
            {
                float _3701 = _136 + _3595;
                float _3703 = _138 + _3597;
                float _3705 = _140 + _3599;
                float _3707 = _3601 + 1.0;
                _3669 = _3701;
                _3671 = _3703;
                _3673 = _3705;
                _3675 = _3707;
                _3709 = _3603;
                _3711 = _3605;
                _3713 = _3607;
                _3715 = _3609;
                _3717 = true;
            }
        }
        else
        {
            float _3719 = _136 + _3611;
            float _3721 = _138 + _3613;
            float _3723 = _140 + _3615;
            float _3725 = _3617 + 1.0;
            _3709 = _3603;
            _3711 = _3605;
            _3713 = _3607;
            _3715 = _3609;
            _3677 = _3719;
            _3679 = _3721;
            _3681 = _3723;
            _3683 = _3725;
            _3717 = true;
        }
    }
    if ((!_3717) || _3699)
    {
        bool _3727;
        if (!_3699)
        {
            _3727 = _3655 >= 1;
        }
        if ((!_3727) || _3699)
        {
            if (!_3699)
            {
                bool _3729 = _3655 != 0;
                if (!_3729)
                {
                    float _3731 = _136 + _3603;
                    _3661 = _3731;
                }
                float _3733 = _3661;
                _3709 = _3733;
                if (!_3729)
                {
                    float _3735 = _138 + _3605;
                    _3663 = _3735;
                }
                float _3737 = _3663;
                _3711 = _3737;
                if (!_3729)
                {
                    float _3739 = _140 + _3607;
                    _3665 = _3739;
                }
                float _3741 = _3665;
                _3713 = _3741;
                if (!_3729)
                {
                    float _3743 = _3609 + 1.0;
                    _3667 = _3743;
                }
                float _3745 = _3667;
                bool _3747 = !_3729;
                _3715 = _3745;
                _3717 = _3747;
            }
            if ((!_3717) || _3699)
            {
                _3699 = false;
                _3709 = _3603;
                _3711 = _3605;
                _3713 = _3607;
                _3715 = _3609;
                _3717 = true;
            }
        }
        else
        {
            float _3749 = _136 + _3619;
            float _3751 = _138 + _3621;
            float _3753 = _140 + _3623;
            float _3755 = _3625 + 1.0;
            _3709 = _3603;
            _3711 = _3605;
            _3713 = _3607;
            _3715 = _3609;
            _3685 = _3749;
            _3687 = _3751;
            _3689 = _3753;
            _3691 = _3755;
        }
    }
    _3717 = false;
    float _3757 = _3669;
    float _3759 = _3671;
    float _3761 = _3673;
    float _3763 = _3675;
    float _3765 = _3709;
    float _3767 = _3711;
    float _3769 = _3713;
    float _3771 = _3715;
    float _3773 = _3677;
    float _3775 = _3679;
    float _3777 = _3681;
    float _3779 = _3683;
    float _3781 = _3685;
    float _3783 = _3687;
    float _3785 = _3689;
    float _3787 = _3691;
    float _3789 = -_2490;
    float _3791 = _146 + _3789;
    float _3793 = -_2494;
    float _3795 = _144 + _3793;
    float _3797 = _2504 * _3791;
    float _3799 = -_2498;
    float _3801 = _148 + _3799;
    float _3803 = fma(_2508, _3795, _3797);
    float _3805 = fma(_2512, _3801, _3803);
    float _3807 = _2540 * _3805;
    float _3809 = rint(_3807);
    float _3811 = precise::max(0.0, _3809);
    float _3813 = precise::min(_3811, 3.0);
    float _3815 = trunc(_3813);
    int _3817 = int(_3815);
    bool _3819 = _3817 >= 2;
    bool _3821 = !_3819;
    float _3823 = as_type<float>(_3817);
    float _3825 = _3809;
    float _3827 = _3803;
    float _3829 = _3797;
    float _3831 = _3757;
    float _3833 = _3759;
    float _3835 = _3761;
    float _3837 = _3763;
    float _3839 = _3773;
    float _3841 = _3775;
    float _3843 = _3777;
    float _3845 = _3779;
    float _3847 = _3781;
    float _3849 = _3783;
    float _3851 = _3785;
    float _3853 = _3787;
    float _3871;
    float _3873;
    float _3875;
    float _3877;
    if (!_3821)
    {
        bool _3855 = _3817 >= 3;
        bool _3857 = !_3855;
        if (!_3857)
        {
            bool _3859 = _3817 != 3;
            _3861 = _3859;
            if (!_3861)
            {
                float _3863 = _144 + _3757;
                float _3865 = _146 + _3759;
                float _3867 = _148 + _3761;
                float _3869 = _3763 + 1.0;
                _3831 = _3863;
                _3833 = _3865;
                _3835 = _3867;
                _3837 = _3869;
                _3871 = _3765;
                _3873 = _3767;
                _3875 = _3769;
                _3877 = _3771;
                _3879 = true;
            }
        }
        else
        {
            float _3881 = _144 + _3773;
            float _3883 = _146 + _3775;
            float _3885 = _148 + _3777;
            float _3887 = _3779 + 1.0;
            _3871 = _3765;
            _3873 = _3767;
            _3875 = _3769;
            _3877 = _3771;
            _3839 = _3881;
            _3841 = _3883;
            _3843 = _3885;
            _3845 = _3887;
            _3879 = true;
        }
    }
    if ((!_3879) || _3861)
    {
        bool _3889;
        if (!_3861)
        {
            _3889 = _3817 >= 1;
        }
        if ((!_3889) || _3861)
        {
            if (!_3861)
            {
                bool _3891 = _3817 != 0;
                if (!_3891)
                {
                    float _3893 = _144 + _3765;
                    _3823 = _3893;
                }
                float _3895 = _3823;
                _3871 = _3895;
                if (!_3891)
                {
                    float _3897 = _146 + _3767;
                    _3825 = _3897;
                }
                float _3899 = _3825;
                _3873 = _3899;
                if (!_3891)
                {
                    float _3901 = _148 + _3769;
                    _3827 = _3901;
                }
                float _3903 = _3827;
                _3875 = _3903;
                if (!_3891)
                {
                    float _3905 = _3771 + 1.0;
                    _3829 = _3905;
                }
                float _3907 = _3829;
                bool _3909 = !_3891;
                _3877 = _3907;
                _3879 = _3909;
            }
            if ((!_3879) || _3861)
            {
                _3861 = false;
                _3871 = _3765;
                _3873 = _3767;
                _3875 = _3769;
                _3877 = _3771;
                _3879 = true;
            }
        }
        else
        {
            float _3911 = _144 + _3781;
            float _3913 = _146 + _3783;
            float _3915 = _148 + _3785;
            float _3917 = _3787 + 1.0;
            _3871 = _3765;
            _3873 = _3767;
            _3875 = _3769;
            _3877 = _3771;
            _3847 = _3911;
            _3849 = _3913;
            _3851 = _3915;
            _3853 = _3917;
        }
    }
    _3879 = false;
    float _3919 = _3831;
    float _3921 = _3833;
    float _3923 = _3835;
    float _3925 = _3837;
    float _3927 = _3871;
    float _3929 = _3873;
    float _3931 = _3875;
    float _3933 = _3877;
    float _3935 = _3839;
    float _3937 = _3841;
    float _3939 = _3843;
    float _3941 = _3845;
    float _3943 = _3847;
    float _3945 = _3849;
    float _3947 = _3851;
    float _3949 = _3853;
    float _3951 = -_2490;
    float _3953 = _154 + _3951;
    float _3955 = -_2494;
    float _3957 = _152 + _3955;
    float _3959 = _2504 * _3953;
    float _3961 = -_2498;
    float _3963 = _156 + _3961;
    float _3965 = fma(_2508, _3957, _3959);
    float _3967 = fma(_2512, _3963, _3965);
    float _3969 = _2540 * _3967;
    float _3971 = rint(_3969);
    float _3973 = precise::max(0.0, _3971);
    float _3975 = precise::min(_3973, 3.0);
    float _3977 = trunc(_3975);
    int _3979 = int(_3977);
    bool _3981 = _3979 >= 2;
    bool _3983 = !_3981;
    float _3985 = as_type<float>(_3979);
    float _3987 = _3971;
    float _3989 = _3965;
    float _3991 = _3959;
    float _3993 = _3919;
    float _3995 = _3921;
    float _3997 = _3923;
    float _3999 = _3925;
    float _4001 = _3935;
    float _4003 = _3937;
    float _4005 = _3939;
    float _4007 = _3941;
    float _4009 = _3943;
    float _4011 = _3945;
    float _4013 = _3947;
    float _4015 = _3949;
    float _4033;
    float _4035;
    float _4037;
    float _4039;
    if (!_3983)
    {
        bool _4017 = _3979 >= 3;
        bool _4019 = !_4017;
        if (!_4019)
        {
            bool _4021 = _3979 != 3;
            _4023 = _4021;
            if (!_4023)
            {
                float _4025 = _152 + _3919;
                float _4027 = _154 + _3921;
                float _4029 = _156 + _3923;
                float _4031 = _3925 + 1.0;
                _3993 = _4025;
                _3995 = _4027;
                _3997 = _4029;
                _3999 = _4031;
                _4033 = _3927;
                _4035 = _3929;
                _4037 = _3931;
                _4039 = _3933;
                _4041 = true;
            }
        }
        else
        {
            float _4043 = _152 + _3935;
            float _4045 = _154 + _3937;
            float _4047 = _156 + _3939;
            float _4049 = _3941 + 1.0;
            _4033 = _3927;
            _4035 = _3929;
            _4037 = _3931;
            _4039 = _3933;
            _4001 = _4043;
            _4003 = _4045;
            _4005 = _4047;
            _4007 = _4049;
            _4041 = true;
        }
    }
    if ((!_4041) || _4023)
    {
        bool _4051;
        if (!_4023)
        {
            _4051 = _3979 >= 1;
        }
        if ((!_4051) || _4023)
        {
            if (!_4023)
            {
                bool _4053 = _3979 != 0;
                if (!_4053)
                {
                    float _4055 = _152 + _3927;
                    _3985 = _4055;
                }
                float _4057 = _3985;
                _4033 = _4057;
                if (!_4053)
                {
                    float _4059 = _154 + _3929;
                    _3987 = _4059;
                }
                float _4061 = _3987;
                _4035 = _4061;
                if (!_4053)
                {
                    float _4063 = _156 + _3931;
                    _3989 = _4063;
                }
                float _4065 = _3989;
                _4037 = _4065;
                if (!_4053)
                {
                    float _4067 = _3933 + 1.0;
                    _3991 = _4067;
                }
                float _4069 = _3991;
                bool _4071 = !_4053;
                _4039 = _4069;
                _4041 = _4071;
            }
            if ((!_4041) || _4023)
            {
                _4023 = false;
                _4033 = _3927;
                _4035 = _3929;
                _4037 = _3931;
                _4039 = _3933;
                _4041 = true;
            }
        }
        else
        {
            float _4073 = _152 + _3943;
            float _4075 = _154 + _3945;
            float _4077 = _156 + _3947;
            float _4079 = _3949 + 1.0;
            _4033 = _3927;
            _4035 = _3929;
            _4037 = _3931;
            _4039 = _3933;
            _4009 = _4073;
            _4011 = _4075;
            _4013 = _4077;
            _4015 = _4079;
        }
    }
    _4041 = false;
    float _4081 = _3993;
    float _4083 = _3995;
    float _4085 = _3997;
    float _4087 = _3999;
    float _4089 = _4033;
    float _4091 = _4035;
    float _4093 = _4037;
    float _4095 = _4039;
    float _4097 = _4001;
    float _4099 = _4003;
    float _4101 = _4005;
    float _4103 = _4007;
    float _4105 = _4009;
    float _4107 = _4011;
    float _4109 = _4013;
    float _4111 = _4015;
    float _4113 = -_2490;
    float _4115 = _162 + _4113;
    float _4117 = -_2494;
    float _4119 = _160 + _4117;
    float _4121 = _2504 * _4115;
    float _4123 = -_2498;
    float _4125 = _164 + _4123;
    float _4127 = fma(_2508, _4119, _4121);
    float _4129 = fma(_2512, _4125, _4127);
    float _4131 = _2540 * _4129;
    float _4133 = rint(_4131);
    float _4135 = precise::max(0.0, _4133);
    float _4137 = precise::min(_4135, 3.0);
    float _4139 = trunc(_4137);
    int _4141 = int(_4139);
    bool _4143 = _4141 >= 2;
    bool _4145 = !_4143;
    float _4147 = as_type<float>(_4141);
    float _4149 = _4133;
    float _4151 = _4127;
    float _4153 = _4121;
    float _4155 = _4081;
    float _4157 = _4083;
    float _4159 = _4085;
    float _4161 = _4087;
    float _4163 = _4097;
    float _4165 = _4099;
    float _4167 = _4101;
    float _4169 = _4103;
    float _4171 = _4105;
    float _4173 = _4107;
    float _4175 = _4109;
    float _4177 = _4111;
    float _4195;
    float _4197;
    float _4199;
    float _4201;
    if (!_4145)
    {
        bool _4179 = _4141 >= 3;
        bool _4181 = !_4179;
        if (!_4181)
        {
            bool _4183 = _4141 != 3;
            _4185 = _4183;
            if (!_4185)
            {
                float _4187 = _160 + _4081;
                float _4189 = _162 + _4083;
                float _4191 = _164 + _4085;
                float _4193 = _4087 + 1.0;
                _4155 = _4187;
                _4157 = _4189;
                _4159 = _4191;
                _4161 = _4193;
                _4195 = _4089;
                _4197 = _4091;
                _4199 = _4093;
                _4201 = _4095;
                _4203 = true;
            }
        }
        else
        {
            float _4205 = _160 + _4097;
            float _4207 = _162 + _4099;
            float _4209 = _164 + _4101;
            float _4211 = _4103 + 1.0;
            _4195 = _4089;
            _4197 = _4091;
            _4199 = _4093;
            _4201 = _4095;
            _4163 = _4205;
            _4165 = _4207;
            _4167 = _4209;
            _4169 = _4211;
            _4203 = true;
        }
    }
    if ((!_4203) || _4185)
    {
        bool _4213;
        if (!_4185)
        {
            _4213 = _4141 >= 1;
        }
        if ((!_4213) || _4185)
        {
            if (!_4185)
            {
                bool _4215 = _4141 != 0;
                if (!_4215)
                {
                    float _4217 = _160 + _4089;
                    _4147 = _4217;
                }
                float _4219 = _4147;
                _4195 = _4219;
                if (!_4215)
                {
                    float _4221 = _162 + _4091;
                    _4149 = _4221;
                }
                float _4223 = _4149;
                _4197 = _4223;
                if (!_4215)
                {
                    float _4225 = _164 + _4093;
                    _4151 = _4225;
                }
                float _4227 = _4151;
                _4199 = _4227;
                if (!_4215)
                {
                    float _4229 = _4095 + 1.0;
                    _4153 = _4229;
                }
                float _4231 = _4153;
                bool _4233 = !_4215;
                _4201 = _4231;
                _4203 = _4233;
            }
            if ((!_4203) || _4185)
            {
                _4185 = false;
                _4195 = _4089;
                _4197 = _4091;
                _4199 = _4093;
                _4201 = _4095;
                _4203 = true;
            }
        }
        else
        {
            float _4235 = _160 + _4105;
            float _4237 = _162 + _4107;
            float _4239 = _164 + _4109;
            float _4241 = _4111 + 1.0;
            _4195 = _4089;
            _4197 = _4091;
            _4199 = _4093;
            _4201 = _4095;
            _4171 = _4235;
            _4173 = _4237;
            _4175 = _4239;
            _4177 = _4241;
        }
    }
    _4203 = false;
    float _4243 = _4155;
    float _4245 = _4157;
    float _4247 = _4159;
    float _4249 = _4161;
    float _4251 = _4195;
    float _4253 = _4197;
    float _4255 = _4199;
    float _4257 = _4201;
    float _4259 = _4163;
    float _4261 = _4165;
    float _4263 = _4167;
    float _4265 = _4169;
    float _4267 = _4171;
    float _4269 = _4173;
    float _4271 = _4175;
    float _4273 = _4177;
    float _4275 = -_2490;
    float _4277 = _170 + _4275;
    float _4279 = -_2494;
    float _4281 = _168 + _4279;
    float _4283 = _2504 * _4277;
    float _4285 = -_2498;
    float _4287 = _172 + _4285;
    float _4289 = fma(_2508, _4281, _4283);
    float _4291 = fma(_2512, _4287, _4289);
    float _4293 = _2540 * _4291;
    float _4295 = rint(_4293);
    float _4297 = precise::max(0.0, _4295);
    float _4299 = precise::min(_4297, 3.0);
    float _4301 = trunc(_4299);
    int _4303 = int(_4301);
    bool _4305 = _4303 >= 2;
    bool _4307 = !_4305;
    float _4309 = as_type<float>(_4303);
    float _4311 = _4295;
    float _4313 = _4289;
    float _4315 = _4283;
    float _4317 = _4243;
    float _4319 = _4245;
    float _4321 = _4247;
    float _4323 = _4249;
    float _4325 = _4259;
    float _4327 = _4261;
    float _4329 = _4263;
    float _4331 = _4265;
    float _4333 = _4267;
    float _4335 = _4269;
    float _4337 = _4271;
    float _4339 = _4273;
    float _4357;
    float _4359;
    float _4361;
    float _4363;
    if (!_4307)
    {
        bool _4341 = _4303 >= 3;
        bool _4343 = !_4341;
        if (!_4343)
        {
            bool _4345 = _4303 != 3;
            _4347 = _4345;
            if (!_4347)
            {
                float _4349 = _168 + _4243;
                float _4351 = _170 + _4245;
                float _4353 = _172 + _4247;
                float _4355 = _4249 + 1.0;
                _4317 = _4349;
                _4319 = _4351;
                _4321 = _4353;
                _4323 = _4355;
                _4357 = _4251;
                _4359 = _4253;
                _4361 = _4255;
                _4363 = _4257;
                _4365 = true;
            }
        }
        else
        {
            float _4367 = _168 + _4259;
            float _4369 = _170 + _4261;
            float _4371 = _172 + _4263;
            float _4373 = _4265 + 1.0;
            _4357 = _4251;
            _4359 = _4253;
            _4361 = _4255;
            _4363 = _4257;
            _4325 = _4367;
            _4327 = _4369;
            _4329 = _4371;
            _4331 = _4373;
            _4365 = true;
        }
    }
    if ((!_4365) || _4347)
    {
        bool _4375;
        if (!_4347)
        {
            _4375 = _4303 >= 1;
        }
        if ((!_4375) || _4347)
        {
            if (!_4347)
            {
                bool _4377 = _4303 != 0;
                if (!_4377)
                {
                    float _4379 = _168 + _4251;
                    _4309 = _4379;
                }
                float _4381 = _4309;
                _4357 = _4381;
                if (!_4377)
                {
                    float _4383 = _170 + _4253;
                    _4311 = _4383;
                }
                float _4385 = _4311;
                _4359 = _4385;
                if (!_4377)
                {
                    float _4387 = _172 + _4255;
                    _4313 = _4387;
                }
                float _4389 = _4313;
                _4361 = _4389;
                if (!_4377)
                {
                    float _4391 = _4257 + 1.0;
                    _4315 = _4391;
                }
                float _4393 = _4315;
                bool _4395 = !_4377;
                _4363 = _4393;
                _4365 = _4395;
            }
            if ((!_4365) || _4347)
            {
                _4347 = false;
                _4357 = _4251;
                _4359 = _4253;
                _4361 = _4255;
                _4363 = _4257;
                _4365 = true;
            }
        }
        else
        {
            float _4397 = _168 + _4267;
            float _4399 = _170 + _4269;
            float _4401 = _172 + _4271;
            float _4403 = _4273 + 1.0;
            _4357 = _4251;
            _4359 = _4253;
            _4361 = _4255;
            _4363 = _4257;
            _4333 = _4397;
            _4335 = _4399;
            _4337 = _4401;
            _4339 = _4403;
        }
    }
    _4365 = false;
    float _4405 = _4317;
    float _4407 = _4319;
    float _4409 = _4321;
    float _4411 = _4323;
    float _4413 = _4357;
    float _4415 = _4359;
    float _4417 = _4361;
    float _4419 = _4363;
    float _4421 = _4325;
    float _4423 = _4327;
    float _4425 = _4329;
    float _4427 = _4331;
    float _4429 = _4333;
    float _4431 = _4335;
    float _4433 = _4337;
    float _4435 = _4339;
    float _4437 = -_2490;
    float _4439 = _178 + _4437;
    float _4441 = -_2494;
    float _4443 = _176 + _4441;
    float _4445 = _2504 * _4439;
    float _4447 = -_2498;
    float _4449 = _180 + _4447;
    float _4451 = fma(_2508, _4443, _4445);
    float _4453 = fma(_2512, _4449, _4451);
    float _4455 = _2540 * _4453;
    float _4457 = rint(_4455);
    float _4459 = precise::max(0.0, _4457);
    float _4461 = precise::min(_4459, 3.0);
    float _4463 = trunc(_4461);
    int _4465 = int(_4463);
    bool _4467 = _4465 >= 2;
    bool _4469 = !_4467;
    float _4471 = as_type<float>(_4465);
    float _4473 = _4457;
    float _4475 = _4451;
    float _4477 = _4445;
    float _4479 = _4405;
    float _4481 = _4407;
    float _4483 = _4409;
    float _4485 = _4411;
    float _4487 = _4421;
    float _4489 = _4423;
    float _4491 = _4425;
    float _4493 = _4427;
    float _4495 = _4429;
    float _4497 = _4431;
    float _4499 = _4433;
    float _4501 = _4435;
    float _4519;
    float _4521;
    float _4523;
    float _4525;
    if (!_4469)
    {
        bool _4503 = _4465 >= 3;
        bool _4505 = !_4503;
        if (!_4505)
        {
            bool _4507 = _4465 != 3;
            _4509 = _4507;
            if (!_4509)
            {
                float _4511 = _176 + _4405;
                float _4513 = _178 + _4407;
                float _4515 = _180 + _4409;
                float _4517 = _4411 + 1.0;
                _4479 = _4511;
                _4481 = _4513;
                _4483 = _4515;
                _4485 = _4517;
                _4519 = _4413;
                _4521 = _4415;
                _4523 = _4417;
                _4525 = _4419;
                _4527 = true;
            }
        }
        else
        {
            float _4529 = _176 + _4421;
            float _4531 = _178 + _4423;
            float _4533 = _180 + _4425;
            float _4535 = _4427 + 1.0;
            _4519 = _4413;
            _4521 = _4415;
            _4523 = _4417;
            _4525 = _4419;
            _4487 = _4529;
            _4489 = _4531;
            _4491 = _4533;
            _4493 = _4535;
            _4527 = true;
        }
    }
    if ((!_4527) || _4509)
    {
        bool _4537;
        if (!_4509)
        {
            _4537 = _4465 >= 1;
        }
        if ((!_4537) || _4509)
        {
            if (!_4509)
            {
                bool _4539 = _4465 != 0;
                if (!_4539)
                {
                    float _4541 = _176 + _4413;
                    _4471 = _4541;
                }
                float _4543 = _4471;
                _4519 = _4543;
                if (!_4539)
                {
                    float _4545 = _178 + _4415;
                    _4473 = _4545;
                }
                float _4547 = _4473;
                _4521 = _4547;
                if (!_4539)
                {
                    float _4549 = _180 + _4417;
                    _4475 = _4549;
                }
                float _4551 = _4475;
                _4523 = _4551;
                if (!_4539)
                {
                    float _4553 = _4419 + 1.0;
                    _4477 = _4553;
                }
                float _4555 = _4477;
                bool _4557 = !_4539;
                _4525 = _4555;
                _4527 = _4557;
            }
            if ((!_4527) || _4509)
            {
                _4509 = false;
                _4519 = _4413;
                _4521 = _4415;
                _4523 = _4417;
                _4525 = _4419;
                _4527 = true;
            }
        }
        else
        {
            float _4559 = _176 + _4429;
            float _4561 = _178 + _4431;
            float _4563 = _180 + _4433;
            float _4565 = _4435 + 1.0;
            _4519 = _4413;
            _4521 = _4415;
            _4523 = _4417;
            _4525 = _4419;
            _4495 = _4559;
            _4497 = _4561;
            _4499 = _4563;
            _4501 = _4565;
        }
    }
    _4527 = false;
    float _4567 = _4479;
    float _4569 = _4481;
    float _4571 = _4483;
    float _4573 = _4485;
    float _4575 = _4519;
    float _4577 = _4521;
    float _4579 = _4523;
    float _4581 = _4525;
    float _4583 = _4487;
    float _4585 = _4489;
    float _4587 = _4491;
    float _4589 = _4493;
    float _4591 = _4495;
    float _4593 = _4497;
    float _4595 = _4499;
    float _4597 = _4501;
    float _4599 = -_2490;
    float _4601 = _186 + _4599;
    float _4603 = -_2494;
    float _4605 = _184 + _4603;
    float _4607 = _2504 * _4601;
    float _4609 = -_2498;
    float _4611 = _188 + _4609;
    float _4613 = fma(_2508, _4605, _4607);
    float _4615 = fma(_2512, _4611, _4613);
    float _4617 = _2540 * _4615;
    float _4619 = rint(_4617);
    float _4621 = precise::max(0.0, _4619);
    float _4623 = precise::min(_4621, 3.0);
    float _4625 = trunc(_4623);
    int _4627 = int(_4625);
    bool _4629 = _4627 >= 2;
    bool _4631 = !_4629;
    float _4633 = as_type<float>(_4627);
    float _4635 = _4619;
    float _4637 = _4613;
    float _4639 = _4607;
    float _4641 = _4567;
    float _4643 = _4569;
    float _4645 = _4571;
    float _4647 = _4573;
    float _4649 = _4583;
    float _4651 = _4585;
    float _4653 = _4587;
    float _4655 = _4589;
    float _4657 = _4591;
    float _4659 = _4593;
    float _4661 = _4595;
    float _4663 = _4597;
    float _4681;
    float _4683;
    float _4685;
    float _4687;
    if (!_4631)
    {
        bool _4665 = _4627 >= 3;
        bool _4667 = !_4665;
        if (!_4667)
        {
            bool _4669 = _4627 != 3;
            _4671 = _4669;
            if (!_4671)
            {
                float _4673 = _184 + _4567;
                float _4675 = _186 + _4569;
                float _4677 = _188 + _4571;
                float _4679 = _4573 + 1.0;
                _4641 = _4673;
                _4643 = _4675;
                _4645 = _4677;
                _4647 = _4679;
                _4681 = _4575;
                _4683 = _4577;
                _4685 = _4579;
                _4687 = _4581;
                _4689 = true;
            }
        }
        else
        {
            float _4691 = _184 + _4583;
            float _4693 = _186 + _4585;
            float _4695 = _188 + _4587;
            float _4697 = _4589 + 1.0;
            _4681 = _4575;
            _4683 = _4577;
            _4685 = _4579;
            _4687 = _4581;
            _4649 = _4691;
            _4651 = _4693;
            _4653 = _4695;
            _4655 = _4697;
            _4689 = true;
        }
    }
    if ((!_4689) || _4671)
    {
        bool _4699;
        if (!_4671)
        {
            _4699 = _4627 >= 1;
        }
        if ((!_4699) || _4671)
        {
            if (!_4671)
            {
                bool _4701 = _4627 != 0;
                if (!_4701)
                {
                    float _4703 = _184 + _4575;
                    _4633 = _4703;
                }
                float _4705 = _4633;
                _4681 = _4705;
                if (!_4701)
                {
                    float _4707 = _186 + _4577;
                    _4635 = _4707;
                }
                float _4709 = _4635;
                _4683 = _4709;
                if (!_4701)
                {
                    float _4711 = _188 + _4579;
                    _4637 = _4711;
                }
                float _4713 = _4637;
                _4685 = _4713;
                if (!_4701)
                {
                    float _4715 = _4581 + 1.0;
                    _4639 = _4715;
                }
                float _4717 = _4639;
                bool _4719 = !_4701;
                _4687 = _4717;
                _4689 = _4719;
            }
            if ((!_4689) || _4671)
            {
                _4671 = false;
                _4681 = _4575;
                _4683 = _4577;
                _4685 = _4579;
                _4687 = _4581;
                _4689 = true;
            }
        }
        else
        {
            float _4721 = _184 + _4591;
            float _4723 = _186 + _4593;
            float _4725 = _188 + _4595;
            float _4727 = _4597 + 1.0;
            _4681 = _4575;
            _4683 = _4577;
            _4685 = _4579;
            _4687 = _4581;
            _4657 = _4721;
            _4659 = _4723;
            _4661 = _4725;
            _4663 = _4727;
        }
    }
    _4689 = false;
    float _4729 = _4641;
    float _4731 = _4643;
    float _4733 = _4645;
    float _4735 = _4647;
    float _4737 = _4681;
    float _4739 = _4683;
    float _4741 = _4685;
    float _4743 = _4687;
    float _4745 = _4649;
    float _4747 = _4651;
    float _4749 = _4653;
    float _4751 = _4655;
    float _4753 = _4657;
    float _4755 = _4659;
    float _4757 = _4661;
    float _4759 = _4663;
    float _4761 = -_2490;
    float _4763 = _194 + _4761;
    float _4765 = -_2494;
    float _4767 = _192 + _4765;
    float _4769 = _2504 * _4763;
    float _4771 = -_2498;
    float _4773 = _196 + _4771;
    float _4775 = fma(_2508, _4767, _4769);
    float _4777 = fma(_2512, _4773, _4775);
    float _4779 = _2540 * _4777;
    float _4781 = rint(_4779);
    float _4783 = precise::max(0.0, _4781);
    float _4785 = precise::min(_4783, 3.0);
    float _4787 = trunc(_4785);
    int _4789 = int(_4787);
    bool _4791 = _4789 >= 2;
    bool _4793 = !_4791;
    float _4795 = as_type<float>(_4789);
    float _4797 = _4781;
    float _4799 = _4775;
    float _4801 = _4769;
    float _4803 = _4729;
    float _4805 = _4731;
    float _4807 = _4733;
    float _4809 = _4735;
    float _4811 = _4745;
    float _4813 = _4747;
    float _4815 = _4749;
    float _4817 = _4751;
    float _4819 = _4753;
    float _4821 = _4755;
    float _4823 = _4757;
    float _4825 = _4759;
    float _4843;
    float _4845;
    float _4847;
    float _4849;
    if (!_4793)
    {
        bool _4827 = _4789 >= 3;
        bool _4829 = !_4827;
        if (!_4829)
        {
            bool _4831 = _4789 != 3;
            _4833 = _4831;
            if (!_4833)
            {
                float _4835 = _192 + _4729;
                float _4837 = _194 + _4731;
                float _4839 = _196 + _4733;
                float _4841 = _4735 + 1.0;
                _4803 = _4835;
                _4805 = _4837;
                _4807 = _4839;
                _4809 = _4841;
                _4843 = _4737;
                _4845 = _4739;
                _4847 = _4741;
                _4849 = _4743;
                _4851 = true;
            }
        }
        else
        {
            float _4853 = _192 + _4745;
            float _4855 = _194 + _4747;
            float _4857 = _196 + _4749;
            float _4859 = _4751 + 1.0;
            _4843 = _4737;
            _4845 = _4739;
            _4847 = _4741;
            _4849 = _4743;
            _4811 = _4853;
            _4813 = _4855;
            _4815 = _4857;
            _4817 = _4859;
            _4851 = true;
        }
    }
    if ((!_4851) || _4833)
    {
        bool _4861;
        if (!_4833)
        {
            _4861 = _4789 >= 1;
        }
        if ((!_4861) || _4833)
        {
            if (!_4833)
            {
                bool _4863 = _4789 != 0;
                if (!_4863)
                {
                    float _4865 = _192 + _4737;
                    _4795 = _4865;
                }
                float _4867 = _4795;
                _4843 = _4867;
                if (!_4863)
                {
                    float _4869 = _194 + _4739;
                    _4797 = _4869;
                }
                float _4871 = _4797;
                _4845 = _4871;
                if (!_4863)
                {
                    float _4873 = _196 + _4741;
                    _4799 = _4873;
                }
                float _4875 = _4799;
                _4847 = _4875;
                if (!_4863)
                {
                    float _4877 = _4743 + 1.0;
                    _4801 = _4877;
                }
                float _4879 = _4801;
                bool _4881 = !_4863;
                _4849 = _4879;
                _4851 = _4881;
            }
            if ((!_4851) || _4833)
            {
                _4833 = false;
                _4843 = _4737;
                _4845 = _4739;
                _4847 = _4741;
                _4849 = _4743;
                _4851 = true;
            }
        }
        else
        {
            float _4883 = _192 + _4753;
            float _4885 = _194 + _4755;
            float _4887 = _196 + _4757;
            float _4889 = _4759 + 1.0;
            _4843 = _4737;
            _4845 = _4739;
            _4847 = _4741;
            _4849 = _4743;
            _4819 = _4883;
            _4821 = _4885;
            _4823 = _4887;
            _4825 = _4889;
        }
    }
    _4851 = false;
    float _4891 = _4803;
    float _4893 = _4805;
    float _4895 = _4807;
    float _4897 = _4809;
    float _4899 = _4843;
    float _4901 = _4845;
    float _4903 = _4847;
    float _4905 = _4849;
    float _4907 = _4811;
    float _4909 = _4813;
    float _4911 = _4815;
    float _4913 = _4817;
    float _4915 = _4819;
    float _4917 = _4821;
    float _4919 = _4823;
    float _4921 = _4825;
    float _4923 = -_2490;
    float _4925 = _202 + _4923;
    float _4927 = -_2494;
    float _4929 = _200 + _4927;
    float _4931 = _2504 * _4925;
    float _4933 = -_2498;
    float _4935 = _204 + _4933;
    float _4937 = fma(_2508, _4929, _4931);
    float _4939 = fma(_2512, _4935, _4937);
    float _4941 = _2540 * _4939;
    float _4943 = rint(_4941);
    float _4945 = precise::max(0.0, _4943);
    float _4947 = precise::min(_4945, 3.0);
    float _4949 = trunc(_4947);
    int _4951 = int(_4949);
    bool _4953 = _4951 >= 2;
    bool _4955 = !_4953;
    float _4957 = as_type<float>(_4951);
    float _4959 = _4935;
    float _4961 = _4943;
    float _4963 = _4937;
    float _4965 = _4921;
    float _4967 = _4913;
    float _4969 = _4907;
    float _4971 = _4897;
    float _4973 = _4915;
    float _4975 = _4919;
    float _4977 = _4909;
    float _4979 = _4911;
    float _4981 = _4917;
    float _4983 = _4893;
    float _4985 = _4891;
    float _4987 = _4895;
    float _5005;
    float _5007;
    float _5009;
    float _5011;
    if (!_4955)
    {
        bool _4989 = _4951 >= 3;
        bool _4991 = !_4989;
        if (!_4991)
        {
            bool _4993 = _4951 != 3;
            _4995 = _4993;
            if (!_4995)
            {
                float _4997 = _200 + _4891;
                float _4999 = _202 + _4893;
                float _5001 = _204 + _4895;
                float _5003 = _4897 + 1.0;
                _5005 = _4905;
                _4971 = _5003;
                _5007 = _4899;
                _5009 = _4903;
                _5011 = _4901;
                _4983 = _4999;
                _4985 = _4997;
                _4987 = _5001;
                _5013 = true;
            }
        }
        else
        {
            float _5015 = _200 + _4907;
            float _5017 = _202 + _4909;
            float _5019 = _204 + _4911;
            float _5021 = _4913 + 1.0;
            _4967 = _5021;
            _4969 = _5015;
            _5005 = _4905;
            _5007 = _4899;
            _4977 = _5017;
            _4979 = _5019;
            _5009 = _4903;
            _5011 = _4901;
            _5013 = true;
        }
    }
    if ((!_5013) || _4995)
    {
        bool _5023;
        if (!_4995)
        {
            _5023 = _4951 >= 1;
        }
        if ((!_5023) || _4995)
        {
            if (!_4995)
            {
                bool _5025 = _4951 != 0;
                if (!_5025)
                {
                    float _5027 = _200 + _4899;
                    _4957 = _5027;
                }
                float _5029 = _4957;
                _5007 = _5029;
                if (!_5025)
                {
                    float _5031 = _202 + _4901;
                    _4959 = _5031;
                }
                float _5033 = _4959;
                _5011 = _5033;
                if (!_5025)
                {
                    float _5035 = _204 + _4903;
                    _4961 = _5035;
                }
                float _5037 = _4961;
                _5009 = _5037;
                if (!_5025)
                {
                    float _5039 = _4905 + 1.0;
                    _4963 = _5039;
                }
                float _5041 = _4963;
                bool _5043 = !_5025;
                _5005 = _5041;
                _5013 = _5043;
            }
            if ((!_5013) || _4995)
            {
                _4995 = false;
                _5005 = _4905;
                _5007 = _4899;
                _5009 = _4903;
                _5011 = _4901;
                _5013 = true;
            }
        }
        else
        {
            float _5045 = _200 + _4915;
            float _5047 = _202 + _4917;
            float _5049 = _204 + _4919;
            float _5051 = _4921 + 1.0;
            _4965 = _5051;
            _5005 = _4905;
            _4973 = _5045;
            _4975 = _5049;
            _5007 = _4899;
            _4981 = _5047;
            _5009 = _4903;
            _5011 = _4901;
        }
    }
    _5013 = false;
    float _5053 = _4965;
    float _5055 = _4967;
    float _5057 = _4969;
    float _5059 = _5005;
    float _5061 = _4971;
    float _5063 = _4973;
    float _5065 = _4975;
    float _5067 = _5007;
    float _5069 = _4977;
    float _5071 = _4979;
    float _5073 = _4981;
    float _5075 = _5009;
    float _5077 = _5011;
    float _5079 = _4983;
    float _5081 = _4985;
    float _5083 = _4987;
    float _5085 = _5053 * 4.0;
    float _5087 = fma(_5055, 4.0, _5053);
    float _5089 = _5055 + _5053;
    float _5091 = _5057 * 6.0;
    float _5093 = fma(_5059, 9.0, _5085);
    float _5095 = fma(_5061, 9.0, _5087);
    float _5097 = _5063 * 6.0;
    float _5099 = _5089 * 2.0;
    float _5101 = _5093 + _5055;
    float _5103 = _5065 * 6.0;
    float _5105 = fma(_5067, 9.0, _5097);
    float _5107 = _5069 * 6.0;
    float _5109 = _5101 * _5095;
    float _5111 = _5071 * 6.0;
    float _5113 = fma(_5063, 3.0, _5091);
    float _5115 = fma(_5073, 3.0, _5107);
    float _5117 = -_5109;
    float _5119 = fma(_5099, _5099, _5117);
    float _5121 = _5073 * 6.0;
    float _5123 = fma(_5075, 9.0, _5103);
    float _5125 = fma(_5065, 3.0, _5111);
    bool _5127 = _5119 != 0.0;
    bool _5129 = isnan(_5119);
    bool _5131 = _5127 || _5129;
    bool _5133 = isnan(0.0);
    bool _5135 = _5131 || _5133;
    float _5137 = fma(_5077, 9.0, _5121);
    float _5139 = fma(_5079, 9.0, _5115);
    float _5141 = fma(_5057, 3.0, _5105);
    float _5143 = fma(_5071, 3.0, _5123);
    float _5145 = fma(_5069, 3.0, _5137);
    float _5147 = fma(_5081, 9.0, _5113);
    float _5149 = fma(_5083, 9.0, _5125);
    bool _5151 = !_5135;
    if (!_5151)
    {
        float _5153 = 1.0 / _5119;
        float _5155 = _5141 * _5095;
        float _5157 = _5101 * _5147;
        float _5159 = _5101 * _5149;
        float _5161 = -_5155;
        float _5163 = fma(_5147, _5099, _5161);
        float _5165 = -_5157;
        float _5167 = fma(_5141, _5099, _5165);
        float _5169 = _5145 * _5095;
        float _5171 = _5101 * _5139;
        float _5173 = _5143 * _5095;
        float _5175 = -_5159;
        float _5177 = fma(_5143, _5099, _5175);
        float _5179 = -_5169;
        float _5181 = fma(_5139, _5099, _5179);
        float _5183 = -_5171;
        float _5185 = fma(_5145, _5099, _5183);
        float _5187 = -_5173;
        float _5189 = fma(_5149, _5099, _5187);
        float _5191 = _5177 * _5153;
        float _5193 = _5167 * _5153;
        float _5195 = _5185 * _5153;
        float _5197 = _5163 * _5153;
        float _5199 = _5181 * _5153;
        float _5201 = _5189 * _5153;
        float _5203 = -_5197;
        float _5205 = _5193 + _5203;
        float _5207 = -_5199;
        float _5209 = _5195 + _5207;
        float _5211 = -_5201;
        float _5213 = _5191 + _5211;
        _2559 = _5205;
        _2561 = _5209;
        _2563 = _5213;
        _2565 = _5197;
        _2567 = _5193;
        _2569 = _5199;
        _2571 = _5195;
        _2573 = _5191;
        _2575 = _5201;
    }
    float _5215 = _2559;
    float _5217 = _2561;
    float _5219 = _2563;
    float _5221 = _2565;
    float _5223 = _2567;
    float _5225 = _2569;
    float _5227 = _2571;
    float _5229 = _2573;
    float _5231 = _2575;
    float _5233 = fma(_5215, 496.0, 0.5);
    float _5235 = precise::clamp(_5233, 0.0, 1.0);
    float _5237 = fma(_5215, -31.0, 1.0);
    float _5239 = precise::clamp(_5237, 0.0, 1.0);
    float _5241 = _5235 + (-0.5);
    float _5243 = fma(_5217, 1008.0, 0.5);
    float _5245 = precise::clamp(_5243, 0.0, 1.0);
    float _5247 = fma(_5219, 496.0, 0.5);
    float _5249 = precise::clamp(_5247, 0.0, 1.0);
    float _5251 = fma(_5217, -63.0, 1.0);
    float _5253 = precise::clamp(_5251, 0.0, 1.0);
    float _5255 = _5239 * _5241;
    float _5257 = _5245 + (-0.5);
    float _5259 = fma(_5219, -31.0, 1.0);
    float _5261 = precise::clamp(_5259, 0.0, 1.0);
    float _5263 = _5249 + (-0.5);
    float _5265 = fma(_5255, -0.0322580635547637939453125, _5221);
    float _5267 = precise::clamp(_5265, 0.0, 1.0);
    float _5269 = _5253 * _5257;
    float _5271 = _5269 * 2.0;
    float _5273 = fma(_5255, 0.0322580635547637939453125, _5223);
    float _5275 = precise::clamp(_5273, 0.0, 1.0);
    float _5277 = _5261 * _5263;
    float _5279 = _5267 * 31.0;
    float _5281 = fma(_5271, -0.01587301678955554962158203125, _5225);
    float _5283 = precise::clamp(_5281, 0.0, 1.0);
    float _5285 = fma(_5271, 0.01587301678955554962158203125, _5227);
    float _5287 = precise::clamp(_5285, 0.0, 1.0);
    float _5289 = _5275 * 31.0;
    float _5291 = fma(_5277, 0.0322580635547637939453125, _5229);
    float _5293 = precise::clamp(_5291, 0.0, 1.0);
    float _5295 = _5283 * 63.0;
    float _5297 = _5287 * 63.0;
    float _5299 = fma(_5277, -0.0322580635547637939453125, _5231);
    float _5301 = precise::clamp(_5299, 0.0, 1.0);
    float _5303 = _5293 * 31.0;
    float _5305 = rint(_5289);
    float _5307 = _5301 * 31.0;
    float _5309 = rint(_5297);
    float _5311 = rint(_5279);
    float _5313 = rint(_5295);
    float _5315 = _5309 + 0.5;
    float _5317 = rint(_5303);
    float _5319 = _5305 + 0.5;
    float _5321 = _5311 + 0.5;
    float _5323 = rint(_5307);
    float _5325 = _5313 + 0.5;
    float _5327 = _5317 + 0.5;
    float _5329 = trunc(_5319);
    float _5331 = precise::max(_5329, 0.0);
    uint _5333 = uint(_5331);
    float _5335 = _5323 + 0.5;
    float _5337 = trunc(_5315);
    float _5339 = precise::max(_5337, 0.0);
    uint _5341 = uint(_5339);
    float _5343 = trunc(_5321);
    float _5345 = precise::max(_5343, 0.0);
    uint _5347 = uint(_5345);
    int _5349 = int(_5333) << 11;
    float _5351 = trunc(_5325);
    float _5353 = precise::max(_5351, 0.0);
    uint _5355 = uint(_5353);
    int _5357 = int(_5341) << 5;
    float _5359 = trunc(_5327);
    float _5361 = precise::max(_5359, 0.0);
    uint _5363 = uint(_5361);
    int _5365 = int(_5347) << 11;
    float _5367 = trunc(_5335);
    float _5369 = precise::max(_5367, 0.0);
    uint _5371 = uint(_5369);
    int _5373 = int(_5355) << 5;
    int _5375 = _5349 | _5357;
    int _5377 = int(_5363) | _5375;
    int _5379 = _5365 | _5373;
    int _5381 = int(_5371) | _5379;
    bool _5383 = _5377 != _5381;
    int _5385 = _5373;
    int _5387 = _5349;
    int _5389 = int(_5347);
    int _5391 = _5377;
    if (!_5383)
    {
        _5385 = _5377;
    }
    int _5393 = _5385;
    int _5395 = _5393;
    if (!_5383)
    {
        _5387 = 0;
    }
    int _5397 = _5387;
    int _5399 = _5397;
    if (!_5383)
    {
        _5389 = 0;
    }
    int _5401 = _5389;
    bool _5403 = !_5383;
    int _5405 = _5401;
    if (!_5403)
    {
        float _5407 = _5305 * 0.0322580635547637939453125;
        float _5409 = _5311 * 0.0322580635547637939453125;
        float _5411 = _5309 * 0.01587301678955554962158203125;
        bool _5413 = uint(_5377) >= uint(_5381);
        float _5415 = _5313 * 0.01587301678955554962158203125;
        float _5417 = _5317 * 0.0322580635547637939453125;
        float _5419 = _5323 * 0.0322580635547637939453125;
        bool _5421 = !_5413;
        float _5423 = _5421 ? _5407 : _5409;
        bool _5425 = !_5413;
        float _5427 = _5425 ? _5409 : _5407;
        bool _5429 = !_5413;
        float _5431 = _5429 ? _5411 : _5415;
        float _5433 = -_5423;
        float _5435 = _136 + _5433;
        bool _5437 = !_5413;
        float _5439 = _5437 ? _5415 : _5411;
        float _5441 = -_5423;
        float _5443 = _5441 + _5427;
        bool _5445 = !_5413;
        float _5447 = _5445 ? _5417 : _5419;
        float _5449 = -_5423;
        float _5451 = _128 + _5449;
        bool _5453 = !_5413;
        float _5455 = _5453 ? _5419 : _5417;
        float _5457 = -_5431;
        float _5459 = _5457 + _5439;
        float _5461 = -_5423;
        float _5463 = _120 + _5461;
        float _5465 = -_5423;
        float _5467 = _112 + _5465;
        float _5469 = -_5423;
        float _5471 = _104 + _5469;
        float _5473 = _5459 * _5459;
        float _5475 = -_5447;
        float _5477 = _5475 + _5455;
        float _5479 = -_5423;
        float _5481 = _96 + _5479;
        float _5483 = -_5423;
        float _5485 = _88 + _5483;
        float _5487 = fma(_5443, _5443, _5473);
        float _5489 = -_5423;
        float _5491 = _80 + _5489;
        float _5493 = -_5423;
        float _5495 = _200 + _5493;
        float _5497 = -_5423;
        float _5499 = _192 + _5497;
        float _5501 = fma(_5477, _5477, _5487);
        float _5503 = -_5423;
        float _5505 = _184 + _5503;
        float _5507 = -_5423;
        float _5509 = _176 + _5507;
        float _5511 = -_5423;
        float _5513 = _168 + _5511;
        float _5515 = -_5423;
        float _5517 = _160 + _5515;
        float _5519 = -_5423;
        float _5521 = _152 + _5519;
        float _5523 = -_5423;
        float _5525 = _144 + _5523;
        float _5527 = -_5431;
        float _5529 = _138 + _5527;
        float _5531 = 1.0 / _5501;
        float _5533 = -_5431;
        float _5535 = _202 + _5533;
        float _5537 = -_5447;
        float _5539 = _140 + _5537;
        float _5541 = -_5431;
        float _5543 = _130 + _5541;
        float _5545 = -_5431;
        float _5547 = _170 + _5545;
        float _5549 = -_5431;
        float _5551 = _162 + _5549;
        float _5553 = -_5447;
        float _5555 = _204 + _5553;
        float _5557 = -_5431;
        float _5559 = _194 + _5557;
        float _5561 = -_5431;
        float _5563 = _122 + _5561;
        float _5565 = -_5431;
        float _5567 = _114 + _5565;
        float _5569 = -_5431;
        float _5571 = _106 + _5569;
        float _5573 = -_5431;
        float _5575 = _98 + _5573;
        float _5577 = -_5431;
        float _5579 = _90 + _5577;
        float _5581 = -_5431;
        float _5583 = _82 + _5581;
        float _5585 = -_5431;
        float _5587 = _186 + _5585;
        float _5589 = -_5431;
        float _5591 = _178 + _5589;
        float _5593 = _5459 * _5531;
        float _5595 = _5443 * _5531;
        float _5597 = _5477 * _5531;
        float _5599 = -_5431;
        float _5601 = _154 + _5599;
        float _5603 = _5593 * _5529;
        float _5605 = _5593 * _5535;
        float _5607 = _5593 * _5543;
        float _5609 = _5593 * _5547;
        float _5611 = fma(_5595, _5435, _5603);
        float _5613 = fma(_5595, _5495, _5605);
        float _5615 = _5593 * _5551;
        float _5617 = -_5431;
        float _5619 = _146 + _5617;
        float _5621 = fma(_5597, _5539, _5611);
        float _5623 = fma(_5597, _5555, _5613);
        float _5625 = -_5447;
        float _5627 = _132 + _5625;
        float _5629 = _5593 * _5559;
        float _5631 = fma(_5595, _5451, _5607);
        bool _5633 = _5621 >= 0.5;
        float _5635 = -_5447;
        float _5637 = _172 + _5635;
        float _5639 = -_5447;
        float _5641 = _164 + _5639;
        float _5643 = fma(_5595, _5513, _5609);
        float _5645 = fma(_5595, _5517, _5615);
        float _5647 = -_5447;
        float _5649 = _196 + _5647;
        float _5651 = _5593 * _5563;
        float _5653 = _5593 * _5567;
        float _5655 = _5593 * _5571;
        float _5657 = _5593 * _5575;
        float _5659 = _5593 * _5579;
        float _5661 = _5593 * _5583;
        float _5663 = _5593 * _5587;
        float _5665 = _5593 * _5591;
        float _5667 = _5593 * _5601;
        float _5669 = _5593 * _5619;
        float _5671 = fma(_5595, _5499, _5629);
        float _5673 = fma(_5597, _5627, _5631);
        bool _5675 = _5623 >= 0.5;
        float _5677 = -_5447;
        float _5679 = _124 + _5677;
        bool _5681 = _5621 >= 0.833000004291534423828125;
        float _5683 = -_5447;
        float _5685 = _116 + _5683;
        float _5687 = -_5447;
        float _5689 = _108 + _5687;
        float _5691 = -_5447;
        float _5693 = _100 + _5691;
        float _5695 = -_5447;
        float _5697 = _92 + _5695;
        float _5699 = -_5447;
        float _5701 = _84 + _5699;
        float _5703 = -_5447;
        float _5705 = _188 + _5703;
        float _5707 = -_5447;
        float _5709 = _180 + _5707;
        float _5711 = -_5447;
        float _5713 = _156 + _5711;
        float _5715 = fma(_5597, _5637, _5643);
        float _5717 = fma(_5597, _5641, _5645);
        float _5719 = -_5447;
        float _5721 = _148 + _5719;
        float _5723 = fma(_5595, _5463, _5651);
        float _5725 = fma(_5595, _5467, _5653);
        float _5727 = fma(_5595, _5471, _5655);
        float _5729 = fma(_5595, _5481, _5657);
        float _5731 = fma(_5595, _5485, _5659);
        float _5733 = fma(_5595, _5491, _5661);
        float _5735 = fma(_5595, _5505, _5663);
        float _5737 = fma(_5595, _5509, _5665);
        float _5739 = fma(_5595, _5521, _5667);
        float _5741 = fma(_5595, _5525, _5669);
        float _5743 = fma(_5597, _5649, _5671);
        bool _5745 = _5621 >= 0.16599999368190765380859375;
        float _5747 = fma(_5597, _5679, _5723);
        float _5749 = fma(_5597, _5685, _5725);
        int _5751 = _5681 ? 0 : 32768;
        float _5753 = fma(_5597, _5689, _5727);
        bool _5755 = _5623 >= 0.833000004291534423828125;
        float _5757 = fma(_5597, _5693, _5729);
        bool _5759 = _5673 >= 0.5;
        float _5761 = fma(_5597, _5697, _5731);
        float _5763 = fma(_5597, _5701, _5733);
        float _5765 = fma(_5597, _5705, _5735);
        float _5767 = fma(_5597, _5709, _5737);
        float _5769 = fma(_5597, _5713, _5739);
        float _5771 = fma(_5597, _5721, _5741);
        int _5773 = _5751;
        if (!_5633)
        {
            int _5775 = _5745 ? 49152 : 16384;
            _5773 = _5775;
        }
        int _5777 = _5773;
        bool _5779 = _5623 >= 0.16599999368190765380859375;
        int _5781 = _5755 ? 0 : 32768;
        bool _5783 = _5743 >= 0.5;
        bool _5785 = _5673 >= 0.833000004291534423828125;
        int _5787 = _5781;
        if (!_5675)
        {
            int _5789 = _5779 ? 49152 : 16384;
            _5787 = _5789;
        }
        int _5791 = _5787;
        bool _5793 = _5673 >= 0.16599999368190765380859375;
        bool _5795 = _5743 >= 0.833000004291534423828125;
        int _5797 = _5785 ? 0 : 8192;
        bool _5799 = _5747 >= 0.5;
        bool _5801 = _5743 >= 0.16599999368190765380859375;
        int _5803 = _5795 ? 0 : 8192;
        int _5805 = _5797;
        int _5807 = _5803;
        if (!_5759)
        {
            int _5809 = _5793 ? 12288 : 4096;
            _5805 = _5809;
        }
        int _5811 = _5805;
        bool _5813 = _5747 >= 0.833000004291534423828125;
        bool _5815 = _5765 >= 0.5;
        if (!_5783)
        {
            int _5817 = _5801 ? 12288 : 4096;
            _5807 = _5817;
        }
        int _5819 = _5807;
        int _5821 = _5813 ? 0 : 2048;
        bool _5823 = _5747 >= 0.16599999368190765380859375;
        bool _5825 = _5765 >= 0.833000004291534423828125;
        bool _5827 = _5749 >= 0.5;
        bool _5829 = _5765 >= 0.16599999368190765380859375;
        int _5831 = _5825 ? 0 : 2048;
        int _5833 = _5821;
        int _5835 = _5831;
        if (!_5799)
        {
            int _5837 = _5823 ? 3072 : 1024;
            _5833 = _5837;
        }
        int _5839 = _5833;
        bool _5841 = _5749 >= 0.833000004291534423828125;
        bool _5843 = _5767 >= 0.5;
        if (!_5815)
        {
            int _5845 = _5829 ? 3072 : 1024;
            _5835 = _5845;
        }
        int _5847 = _5835;
        bool _5849 = _5749 >= 0.16599999368190765380859375;
        int _5851 = _5841 ? 0 : 512;
        bool _5853 = _5753 >= 0.5;
        bool _5855 = _5767 >= 0.833000004291534423828125;
        int _5857 = _5851;
        if (!_5827)
        {
            int _5859 = _5849 ? 768 : 256;
            _5857 = _5859;
        }
        int _5861 = _5857;
        bool _5863 = _5767 >= 0.16599999368190765380859375;
        bool _5865 = _5715 >= 0.5;
        int _5867 = _5855 ? 0 : 512;
        bool _5869 = _5753 >= 0.833000004291534423828125;
        int _5871 = _5867;
        if (!_5843)
        {
            int _5873 = _5863 ? 768 : 256;
            _5871 = _5873;
        }
        int _5875 = _5871;
        bool _5877 = _5753 >= 0.16599999368190765380859375;
        bool _5879 = _5715 >= 0.833000004291534423828125;
        int _5881 = _5869 ? 0 : 128;
        bool _5883 = _5715 >= 0.16599999368190765380859375;
        bool _5885 = _5757 >= 0.5;
        int _5887 = _5879 ? 0 : 128;
        int _5889 = _5881;
        int _5891 = _5887;
        if (!_5853)
        {
            int _5893 = _5877 ? 192 : 64;
            _5889 = _5893;
        }
        int _5895 = _5889;
        bool _5897 = _5757 >= 0.833000004291534423828125;
        bool _5899 = _5717 >= 0.5;
        if (!_5865)
        {
            int _5901 = _5883 ? 192 : 64;
            _5891 = _5901;
        }
        int _5903 = _5891;
        int _5905 = _5897 ? 0 : 32;
        bool _5907 = _5761 >= 0.5;
        bool _5909 = _5757 >= 0.16599999368190765380859375;
        bool _5911 = _5717 >= 0.833000004291534423828125;
        bool _5913 = _5717 >= 0.16599999368190765380859375;
        int _5915 = _5911 ? 0 : 32;
        int _5917 = _5905;
        int _5919 = _5915;
        if (!_5885)
        {
            int _5921 = _5909 ? 48 : 16;
            _5917 = _5921;
        }
        int _5923 = _5917;
        bool _5925 = _5761 >= 0.833000004291534423828125;
        bool _5927 = _5769 >= 0.5;
        if (!_5899)
        {
            int _5929 = _5913 ? 48 : 16;
            _5919 = _5929;
        }
        int _5931 = _5919;
        bool _5933 = _5761 >= 0.16599999368190765380859375;
        bool _5935 = _5769 >= 0.833000004291534423828125;
        int _5937 = _5925 ? 0 : 8;
        int _5939 = _5935 ? 0 : 8;
        int _5941 = _5937;
        int _5943 = _5939;
        if (!_5907)
        {
            int _5945 = _5933 ? 12 : 4;
            _5941 = _5945;
        }
        int _5947 = _5941;
        bool _5949 = _5763 >= 0.5;
        bool _5951 = _5771 >= 0.5;
        bool _5953 = _5769 >= 0.16599999368190765380859375;
        int _5955 = _5839 + _5777;
        int _5957 = _5955 + _5811;
        int _5959 = _5847 + _5791;
        int _5961 = _5959 + _5819;
        if (!_5927)
        {
            int _5963 = _5953 ? 12 : 4;
            _5943 = _5963;
        }
        int _5965 = _5943;
        bool _5967 = _5763 >= 0.833000004291534423828125;
        bool _5969 = _5771 >= 0.833000004291534423828125;
        bool _5971 = _5763 >= 0.16599999368190765380859375;
        bool _5973 = _5771 >= 0.16599999368190765380859375;
        int _5975 = _5895 + _5957;
        int _5977 = _5975 + _5861;
        int _5979 = _5903 + _5961;
        int _5981 = _5979 + _5875;
        int _5983 = _5967 ? 0 : 2;
        int _5985 = _5969 ? 0 : 2;
        int _5987 = _5983;
        int _5989 = _5985;
        if (!_5949)
        {
            int _5991 = _5971 ? 3 : 1;
            _5987 = _5991;
        }
        int _5993 = _5987;
        if (!_5951)
        {
            int _5995 = _5973 ? 3 : 1;
            _5989 = _5995;
        }
        int _5997 = _5989;
        int _5999 = _5947 + _5977;
        int _6001 = _5999 + _5923;
        int _6003 = _5965 + _5981;
        int _6005 = _6003 + _5931;
        bool _6007 = !_5413;
        int _6009 = _6007 ? _5381 : _5377;
        bool _6011 = !_5413;
        int _6013 = _6011 ? _5377 : _5381;
        int _6015 = _6001 + _5993;
        int _6017 = _6005 + _5997;
        _5395 = _6009;
        _5391 = _6013;
        _5399 = _6015;
        _5405 = _6017;
    }
    int _6019 = _5395;
    int _6021 = _5391;
    int _6023 = _5399;
    int _6025 = _5405;
    out.m_32.x = as_type<float>(_6019);
    out.m_32.y = as_type<float>(_6021);
    out.m_32.z = as_type<float>(_6023);
    out.m_32.w = as_type<float>(_6025);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5013 = false;
    bool _4995 = false;
    bool _4851 = false;
    bool _4833 = false;
    bool _4689 = false;
    bool _4671 = false;
    bool _4527 = false;
    bool _4509 = false;
    bool _4365 = false;
    bool _4347 = false;
    bool _4203 = false;
    bool _4185 = false;
    bool _4041 = false;
    bool _4023 = false;
    bool _3879 = false;
    bool _3861 = false;
    bool _3717 = false;
    bool _3699 = false;
    bool _3555 = false;
    bool _3537 = false;
    bool _3393 = false;
    bool _3375 = false;
    bool _3231 = false;
    bool _3213 = false;
    bool _3069 = false;
    bool _3051 = false;
    bool _2907 = false;
    bool _2889 = false;
    bool _2745 = false;
    bool _2727 = false;
    bool _2617 = false;
    bool _2583 = false;
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _6085 = float3(_63, _65, float(int(_74)));
    float3 _6089 = select(_6085, float3(0.0), isnan(_6085));
    float3 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6089.xy, uint(rint(_6089.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6089.xy, uint(rint(_6089.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyz;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float3 _6107 = float3(_63, _65, float(int(_74)));
    float3 _6109 = select(_6107, float3(0.0), isnan(_6107));
    float3 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6109.xy, uint(rint(_6109.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6109.xy, uint(rint(_6109.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xyz;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float3 _6128 = float3(_63, _65, float(int(_74)));
    float3 _6130 = select(_6128, float3(0.0), isnan(_6128));
    float3 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6130.xy, uint(rint(_6130.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6130.xy, uint(rint(_6130.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xyz;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float3 _6148 = float3(_63, _65, float(int(_74)));
    float3 _6150 = select(_6148, float3(0.0), isnan(_6148));
    float3 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6150.xy, uint(rint(_6150.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6150.xy, uint(rint(_6150.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xyz;
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = _102.z;
    float3 _6168 = float3(_63, _65, float(int(_74)));
    float3 _6170 = select(_6168, float3(0.0), isnan(_6168));
    float3 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6170.xy, uint(rint(_6170.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6170.xy, uint(rint(_6170.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xyz;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float3 _6188 = float3(_63, _65, float(int(_74)));
    float3 _6190 = select(_6188, float3(0.0), isnan(_6188));
    float3 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6190.xy, uint(rint(_6190.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6190.xy, uint(rint(_6190.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xyz;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float3 _6208 = float3(_63, _65, float(int(_74)));
    float3 _6210 = select(_6208, float3(0.0), isnan(_6208));
    float3 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6210.xy, uint(rint(_6210.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6210.xy, uint(rint(_6210.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xyz;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float3 _6228 = float3(_63, _65, float(int(_74)));
    float3 _6230 = select(_6228, float3(0.0), isnan(_6228));
    float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6230.xy, uint(rint(_6230.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6230.xy, uint(rint(_6230.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xyz;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float3 _6248 = float3(_63, _65, float(int(_74)));
    float3 _6250 = select(_6248, float3(0.0), isnan(_6248));
    float3 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6250.xy, uint(rint(_6250.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6250.xy, uint(rint(_6250.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xyz;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float3 _6268 = float3(_63, _65, float(int(_74)));
    float3 _6270 = select(_6268, float3(0.0), isnan(_6268));
    float3 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6270.xy, uint(rint(_6270.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6270.xy, uint(rint(_6270.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xyz;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float3 _6288 = float3(_63, _65, float(int(_74)));
    float3 _6290 = select(_6288, float3(0.0), isnan(_6288));
    float3 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6290.xy, uint(rint(_6290.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6290.xy, uint(rint(_6290.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xyz;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float3 _6308 = float3(_63, _65, float(int(_74)));
    float3 _6310 = select(_6308, float3(0.0), isnan(_6308));
    float3 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6310.xy, uint(rint(_6310.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6310.xy, uint(rint(_6310.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xyz;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float3 _6328 = float3(_63, _65, float(int(_74)));
    float3 _6330 = select(_6328, float3(0.0), isnan(_6328));
    float3 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6330.xy, uint(rint(_6330.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6330.xy, uint(rint(_6330.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xyz;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float3 _6348 = float3(_63, _65, float(int(_74)));
    float3 _6350 = select(_6348, float3(0.0), isnan(_6348));
    float3 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6350.xy, uint(rint(_6350.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6350.xy, uint(rint(_6350.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xyz;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float3 _6368 = float3(_63, _65, float(int(_74)));
    float3 _6370 = select(_6368, float3(0.0), isnan(_6368));
    float3 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6370.xy, uint(rint(_6370.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6370.xy, uint(rint(_6370.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xyz;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float3 _6388 = float3(_63, _65, float(int(_74)));
    float3 _6390 = select(_6388, float3(0.0), isnan(_6388));
    float3 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _6390.xy, uint(rint(_6390.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _6390.xy, uint(rint(_6390.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xyz;
    float _200 = _198.x;
    float _202 = _198.y;
    float _204 = _198.z;
    float _206 = _82 + _90;
    float _208 = _80 + _88;
    float _210 = _84 + _92;
    float _212 = _98 + _206;
    float _214 = _96 + _208;
    float _216 = _100 + _210;
    float _218 = _106 + _212;
    float _220 = _104 + _214;
    float _222 = _108 + _216;
    float _224 = _114 + _218;
    float _226 = _112 + _220;
    float _228 = _116 + _222;
    float _230 = _122 + _224;
    float _232 = _120 + _226;
    float _234 = _124 + _228;
    float _236 = _130 + _230;
    float _238 = _128 + _232;
    float _240 = _132 + _234;
    float _242 = _138 + _236;
    float _244 = _136 + _238;
    float _246 = _140 + _240;
    float _248 = _146 + _242;
    float _250 = _144 + _244;
    float _252 = _148 + _246;
    float _254 = _154 + _248;
    float _256 = _152 + _250;
    float _258 = _156 + _252;
    float _260 = _162 + _254;
    float _262 = _160 + _256;
    float _264 = _164 + _258;
    float _266 = _170 + _260;
    float _268 = _168 + _262;
    float _270 = _172 + _264;
    float _272 = _178 + _266;
    float _274 = _176 + _268;
    float _276 = _180 + _270;
    float _278 = _186 + _272;
    float _280 = _184 + _274;
    float _282 = _188 + _276;
    float _284 = _194 + _278;
    float _286 = _192 + _280;
    float _288 = _196 + _282;
    float _290 = _202 + _284;
    float _292 = _200 + _286;
    float _294 = _204 + _288;
    float _296 = fma(_290, -0.0625, _90);
    float _298 = fma(_292, -0.0625, _88);
    float _300 = fma(_294, -0.0625, _92);
    float _302 = fma(_290, -0.0625, _82);
    float _304 = fma(_292, -0.0625, _80);
    float _306 = _298 * _296;
    float _308 = _298 * _298;
    float _310 = fma(_294, -0.0625, _84);
    float _312 = _296 * _296;
    float _314 = _296 * _300;
    float _316 = _298 * _300;
    float _318 = fma(_304, _302, _306);
    float _320 = fma(_302, _302, _312);
    float _322 = fma(_302, _310, _314);
    float _324 = fma(_304, _304, _308);
    float _326 = fma(_304, _310, _316);
    float _328 = _300 * _300;
    float _330 = fma(_290, -0.0625, _98);
    float _332 = fma(_292, -0.0625, _96);
    float _334 = fma(_294, -0.0625, _100);
    float _336 = fma(_310, _310, _328);
    float _338 = fma(_330, _330, _320);
    float _340 = fma(_332, _330, _318);
    float _342 = fma(_330, _334, _322);
    float _344 = fma(_332, _332, _324);
    float _346 = fma(_332, _334, _326);
    float _348 = fma(_290, -0.0625, _106);
    float _350 = fma(_292, -0.0625, _104);
    float _352 = fma(_294, -0.0625, _108);
    float _354 = fma(_334, _334, _336);
    float _356 = fma(_348, _348, _338);
    float _358 = fma(_350, _348, _340);
    float _360 = fma(_348, _352, _342);
    float _362 = fma(_350, _350, _344);
    float _364 = fma(_350, _352, _346);
    float _366 = fma(_290, -0.0625, _114);
    float _368 = fma(_292, -0.0625, _112);
    float _370 = fma(_294, -0.0625, _116);
    float _372 = fma(_352, _352, _354);
    float _374 = fma(_366, _366, _356);
    float _376 = fma(_368, _366, _358);
    float _378 = fma(_366, _370, _360);
    float _380 = fma(_368, _368, _362);
    float _382 = fma(_368, _370, _364);
    float _384 = fma(_290, -0.0625, _122);
    float _386 = fma(_292, -0.0625, _120);
    float _388 = fma(_294, -0.0625, _124);
    float _390 = fma(_370, _370, _372);
    float _392 = fma(_384, _384, _374);
    float _394 = fma(_386, _384, _376);
    float _396 = fma(_384, _388, _378);
    float _398 = fma(_386, _386, _380);
    float _400 = fma(_386, _388, _382);
    float _402 = fma(_290, -0.0625, _130);
    float _404 = fma(_292, -0.0625, _128);
    float _406 = fma(_294, -0.0625, _132);
    float _408 = fma(_388, _388, _390);
    float _410 = fma(_402, _402, _392);
    float _412 = fma(_404, _402, _394);
    float _414 = fma(_402, _406, _396);
    float _416 = fma(_404, _404, _398);
    float _418 = fma(_404, _406, _400);
    float _420 = fma(_290, -0.0625, _138);
    float _422 = fma(_292, -0.0625, _136);
    float _424 = fma(_294, -0.0625, _140);
    float _426 = fma(_406, _406, _408);
    float _428 = fma(_420, _420, _410);
    float _430 = fma(_422, _420, _412);
    float _432 = fma(_420, _424, _414);
    float _434 = fma(_422, _422, _416);
    float _436 = fma(_422, _424, _418);
    float _438 = fma(_290, -0.0625, _146);
    float _440 = fma(_292, -0.0625, _144);
    float _442 = fma(_294, -0.0625, _148);
    float _444 = fma(_424, _424, _426);
    float _446 = fma(_438, _438, _428);
    float _448 = fma(_440, _438, _430);
    float _450 = fma(_438, _442, _432);
    float _452 = fma(_440, _440, _434);
    float _454 = fma(_440, _442, _436);
    float _456 = fma(_290, -0.0625, _154);
    float _458 = fma(_292, -0.0625, _152);
    float _460 = fma(_294, -0.0625, _156);
    float _462 = fma(_442, _442, _444);
    float _464 = fma(_456, _456, _446);
    float _466 = fma(_458, _456, _448);
    float _468 = fma(_456, _460, _450);
    float _470 = fma(_458, _458, _452);
    float _472 = fma(_458, _460, _454);
    float _474 = fma(_290, -0.0625, _162);
    float _476 = fma(_292, -0.0625, _160);
    float _478 = fma(_294, -0.0625, _164);
    float _480 = fma(_460, _460, _462);
    float _482 = fma(_474, _474, _464);
    float _484 = fma(_476, _474, _466);
    float _486 = fma(_474, _478, _468);
    float _488 = fma(_476, _476, _470);
    float _490 = fma(_476, _478, _472);
    float _492 = fma(_290, -0.0625, _170);
    float _494 = fma(_292, -0.0625, _168);
    float _496 = fma(_294, -0.0625, _172);
    float _498 = fma(_478, _478, _480);
    float _500 = fma(_492, _492, _482);
    float _502 = fma(_494, _492, _484);
    float _504 = fma(_492, _496, _486);
    float _506 = fma(_494, _494, _488);
    float _508 = fma(_494, _496, _490);
    float _510 = fma(_290, -0.0625, _178);
    float _512 = fma(_292, -0.0625, _176);
    float _514 = fma(_294, -0.0625, _180);
    float _516 = fma(_496, _496, _498);
    float _518 = fma(_510, _510, _500);
    float _520 = fma(_512, _510, _502);
    float _522 = fma(_510, _514, _504);
    float _524 = fma(_512, _512, _506);
    float _526 = fma(_512, _514, _508);
    float _528 = fma(_290, -0.0625, _186);
    float _530 = fma(_292, -0.0625, _184);
    float _532 = fma(_294, -0.0625, _188);
    float _534 = fma(_514, _514, _516);
    float _536 = fma(_528, _528, _518);
    float _538 = fma(_530, _528, _520);
    float _540 = fma(_528, _532, _522);
    float _542 = fma(_530, _530, _524);
    float _544 = fma(_530, _532, _526);
    float _546 = fma(_290, -0.0625, _194);
    float _548 = fma(_292, -0.0625, _192);
    float _550 = fma(_294, -0.0625, _196);
    float _552 = fma(_290, -0.0625, _202);
    float _554 = fma(_546, _546, _536);
    float _556 = fma(_548, _546, _538);
    float _558 = fma(_292, -0.0625, _200);
    float _560 = fma(_546, _550, _540);
    float _562 = fma(_294, -0.0625, _204);
    float _564 = fma(_548, _548, _542);
    float _566 = fma(_552, _552, _554);
    float _568 = fma(_558, _552, _556);
    float _570 = fma(_532, _532, _534);
    float _572 = fma(_548, _550, _544);
    float _574 = fma(_552, _562, _560);
    float _576 = fma(_558, _558, _564);
    float _578 = _566 + _568;
    float _580 = fma(_550, _550, _570);
    float _582 = fma(_558, _562, _572);
    float _584 = _576 + _568;
    float _586 = _574 + _578;
    float _588 = fma(_562, _562, _580);
    float _590 = _574 + _582;
    float _592 = _582 + _584;
    float _594 = _586 * _586;
    float _596 = _588 + _590;
    float _598 = fma(_592, _592, _594);
    float _600 = fma(_596, _596, _598);
    float _602 = rsqrt(_600);
    float _604 = _586 * _602;
    float _606 = _592 * _602;
    float _608 = _596 * _602;
    float _610 = _566 * _604;
    float _612 = _568 * _604;
    float _614 = fma(_568, _606, _610);
    float _616 = _574 * _604;
    float _618 = fma(_576, _606, _612);
    float _620 = fma(_574, _608, _614);
    float _622 = fma(_582, _606, _616);
    float _624 = fma(_582, _608, _618);
    float _626 = _620 * _620;
    float _628 = fma(_588, _608, _622);
    float _630 = fma(_624, _624, _626);
    float _632 = fma(_628, _628, _630);
    float _634 = rsqrt(_632);
    float _636 = _620 * _634;
    float _638 = _624 * _634;
    float _640 = _628 * _634;
    float _642 = _566 * _636;
    float _644 = _568 * _636;
    float _646 = _574 * _636;
    float _648 = fma(_568, _638, _642);
    float _650 = fma(_576, _638, _644);
    float _652 = fma(_582, _638, _646);
    float _654 = fma(_574, _640, _648);
    float _656 = fma(_582, _640, _650);
    float _658 = fma(_588, _640, _652);
    float _660 = _654 * _654;
    float _662 = fma(_656, _656, _660);
    float _664 = fma(_658, _658, _662);
    float _666 = rsqrt(_664);
    float _668 = _654 * _666;
    float _670 = _656 * _666;
    float _672 = _658 * _666;
    float _674 = _566 * _668;
    float _676 = _568 * _668;
    float _678 = _574 * _668;
    float _680 = fma(_568, _670, _674);
    float _682 = fma(_576, _670, _676);
    float _684 = fma(_582, _670, _678);
    float _686 = fma(_574, _672, _680);
    float _688 = fma(_582, _672, _682);
    float _690 = fma(_588, _672, _684);
    float _692 = _686 * _686;
    float _694 = fma(_688, _688, _692);
    float _696 = fma(_690, _690, _694);
    float _698 = rsqrt(_696);
    float _700 = _686 * _698;
    float _702 = _688 * _698;
    float _704 = _690 * _698;
    float _706 = _566 * _700;
    float _708 = _568 * _700;
    float _710 = _574 * _700;
    float _712 = fma(_568, _702, _706);
    float _714 = fma(_576, _702, _708);
    float _716 = fma(_582, _702, _710);
    float _718 = fma(_574, _704, _712);
    float _720 = fma(_582, _704, _714);
    float _722 = fma(_588, _704, _716);
    float _724 = _718 * _718;
    float _726 = fma(_720, _720, _724);
    float _728 = fma(_722, _722, _726);
    float _730 = rsqrt(_728);
    float _732 = _718 * _730;
    float _734 = _720 * _730;
    float _736 = _722 * _730;
    float _738 = _566 * _732;
    float _740 = _568 * _732;
    float _742 = _574 * _732;
    float _744 = fma(_568, _734, _738);
    float _746 = fma(_576, _734, _740);
    float _748 = fma(_582, _734, _742);
    float _750 = fma(_574, _736, _744);
    float _752 = fma(_582, _736, _746);
    float _754 = fma(_588, _736, _748);
    float _756 = _750 * _750;
    float _758 = fma(_752, _752, _756);
    float _760 = fma(_754, _754, _758);
    float _762 = rsqrt(_760);
    float _764 = _750 * _762;
    float _766 = _752 * _762;
    float _768 = _754 * _762;
    float _770 = _566 * _764;
    float _772 = _568 * _764;
    float _774 = _574 * _764;
    float _776 = fma(_568, _766, _770);
    float _778 = fma(_576, _766, _772);
    float _780 = fma(_582, _766, _774);
    float _782 = fma(_574, _768, _776);
    float _784 = fma(_582, _768, _778);
    float _786 = fma(_588, _768, _780);
    float _788 = _782 * _782;
    float _790 = fma(_784, _784, _788);
    float _792 = fma(_786, _786, _790);
    float _794 = rsqrt(_792);
    float _796 = _782 * _794;
    float _798 = _784 * _794;
    float _800 = _786 * _794;
    float _802 = _566 * _796;
    float _804 = _568 * _796;
    float _806 = fma(_568, _798, _802);
    float _808 = _574 * _796;
    float _810 = fma(_576, _798, _804);
    float _812 = fma(_574, _800, _806);
    float _814 = fma(_582, _798, _808);
    float _816 = fma(_582, _800, _810);
    float _818 = _812 * _812;
    float _820 = fma(_588, _800, _814);
    float _822 = fma(_816, _816, _818);
    float _824 = fma(_820, _820, _822);
    float _826 = rsqrt(_824);
    float _828 = _812 * _826;
    float _830 = _816 * _826;
    float _832 = _820 * _826;
    float _834 = _82 * _828;
    float _836 = _90 * _828;
    float _838 = _98 * _828;
    float _840 = fma(_80, _830, _834);
    float _842 = fma(_88, _830, _836);
    float _844 = fma(_96, _830, _838);
    float _846 = fma(_84, _832, _840);
    float _848 = fma(_92, _832, _842);
    float _850 = fma(_100, _832, _844);
    bool _854 = _846 >= _848;
    bool _856 = isnan(_846);
    bool _858 = _854 || _856;
    bool _860 = isnan(_848);
    bool _862 = _858 || _860;
    float _864 = _560;
    float _866 = _842;
    float _868 = _838;
    float _870 = _792;
    float _872 = _844;
    float _874 = _836;
    float _876 = _786;
    float _878 = _770;
    float _880 = _848;
    float _882 = _796;
    float _884 = _850;
    float _886 = _850;
    float _888 = _828;
    float _890 = _830;
    float _892 = 2.6624670822171524347550862082508e-44;
    float _894 = (*spvDescriptorSet0.fp_c3)._m0[1].x;
    if (!_862)
    {
        _864 = _88;
    }
    float _896 = _864;
    float _898 = _896;
    float _900 = _896;
    if (!_862)
    {
        _866 = _90;
    }
    float _902 = _866;
    float _904 = _902;
    float _906 = _902;
    if (!_862)
    {
        _868 = _92;
    }
    float _908 = _868;
    float _910 = _908;
    float _912 = _908;
    if (!_862)
    {
        _870 = _846;
    }
    float _914 = _870;
    float _916 = _914;
    float _918 = _914;
    if (!_862)
    {
        _872 = _848;
    }
    float _920 = _872;
    float _922 = _920;
    float _924 = _920;
    if (!_862)
    {
        _874 = _80;
    }
    float _926 = _874;
    float _928 = _926;
    float _930 = _926;
    if (!_862)
    {
        _876 = _82;
    }
    float _932 = _876;
    float _934 = _932;
    float _936 = _932;
    if (!_862)
    {
        _878 = _84;
    }
    float _938 = _878;
    bool _940 = !_862;
    float _942 = _938;
    float _944 = _938;
    if (!_940)
    {
        bool _946 = _846 > _848;
        if (!_946)
        {
            _916 = _846;
        }
        float _948 = _916;
        float _950 = _948;
        if (!_946)
        {
            _922 = _846;
        }
        float _952 = _922;
        float _954 = _952;
        if (!_946)
        {
            _928 = _80;
        }
        float _956 = _928;
        float _958 = _956;
        if (!_946)
        {
            _934 = _82;
        }
        float _960 = _934;
        float _962 = _960;
        if (!_946)
        {
            _942 = _84;
        }
        float _964 = _942;
        float _966 = _964;
        if (!_946)
        {
            _898 = _80;
        }
        float _968 = _898;
        float _970 = _968;
        if (!_946)
        {
            _904 = _82;
        }
        float _972 = _904;
        float _974 = _972;
        if (!_946)
        {
            _910 = _84;
        }
        float _976 = _910;
        _912 = _976;
        if (_946)
        {
            _950 = _848;
        }
        float _978 = _950;
        _918 = _978;
        if (_946)
        {
            _954 = _846;
        }
        float _980 = _954;
        _924 = _980;
        if (_946)
        {
            _958 = _88;
        }
        float _982 = _958;
        _930 = _982;
        if (_946)
        {
            _962 = _90;
        }
        float _984 = _962;
        _936 = _984;
        if (_946)
        {
            _966 = _92;
        }
        float _986 = _966;
        _944 = _986;
        if (_946)
        {
            _970 = _80;
        }
        float _988 = _970;
        _900 = _988;
        if (_946)
        {
            _974 = _82;
        }
        float _990 = _974;
        _906 = _990;
        if (_946)
        {
            _912 = _84;
        }
    }
    float _992 = _924;
    float _994 = _918;
    float _996 = _900;
    float _998 = _906;
    float _1000 = _912;
    float _1002 = _930;
    float _1004 = _936;
    float _1006 = _944;
    bool _1008 = _992 >= _850;
    bool _1010 = isnan(_992);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan(_850);
    bool _1016 = _1012 || _1014;
    float _1018 = _106 * _828;
    float _1020 = fma(_104, _830, _1018);
    float _1022 = fma(_108, _832, _1020);
    float _1024 = _1020;
    float _1026 = _994;
    float _1028 = _1002;
    float _1030 = _1004;
    float _1032 = _994;
    float _1034 = _1002;
    float _1036 = _1004;
    float _1038 = _1006;
    float _1040 = _998;
    float _1042 = _1022;
    float _1044 = _1022;
    if (!_1016)
    {
        _1024 = _96;
    }
    float _1046 = _1024;
    float _1048 = _1046;
    float _1050 = _1046;
    if (!_1016)
    {
        _880 = _98;
    }
    float _1052 = _880;
    float _1054 = _1052;
    float _1056 = _1052;
    if (!_1016)
    {
        _882 = _100;
    }
    float _1058 = _882;
    bool _1060 = !_1016;
    float _1062 = _1058;
    float _1064 = _1058;
    if (!_1060)
    {
        bool _1066 = _994 > _850;
        if (_1066)
        {
            _1026 = _850;
        }
        float _1068 = _1026;
        _1032 = _1068;
        if (!_1066)
        {
            _1048 = _996;
        }
        float _1070 = _1048;
        float _1072 = _1070;
        if (!_1066)
        {
            _1054 = _998;
        }
        float _1074 = _1054;
        float _1076 = _1074;
        if (!_1066)
        {
            _1062 = _1000;
        }
        float _1078 = _1062;
        float _1080 = _1078;
        if (!_1066)
        {
            _884 = _992;
        }
        float _1082 = _884;
        float _1084 = _1082;
        if (_1066)
        {
            _1072 = _996;
        }
        float _1086 = _1072;
        _1050 = _1086;
        if (_1066)
        {
            _1076 = _998;
        }
        float _1088 = _1076;
        _1056 = _1088;
        if (_1066)
        {
            _1080 = _1000;
        }
        float _1090 = _1080;
        _1064 = _1090;
        if (_1066)
        {
            _1084 = _992;
        }
        float _1092 = _1084;
        _886 = _1092;
        if (_1066)
        {
            _1028 = _96;
        }
        float _1094 = _1028;
        _1034 = _1094;
        if (_1066)
        {
            _1030 = _98;
        }
        float _1096 = _1030;
        _1036 = _1096;
        if (_1066)
        {
            _1038 = _100;
        }
    }
    float _1098 = _886;
    float _1100 = _1032;
    float _1102 = _1050;
    float _1104 = _1056;
    float _1106 = _1064;
    float _1108 = _1034;
    float _1110 = _1036;
    float _1112 = _1038;
    bool _1114 = _1098 >= _1022;
    bool _1116 = isnan(_1098);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(_1022);
    bool _1122 = _1118 || _1120;
    float _1124 = _114 * _828;
    float _1126 = fma(_112, _830, _1124);
    float _1128 = fma(_116, _832, _1126);
    float _1130 = _1126;
    float _1132 = _1124;
    float _1134 = _1100;
    float _1136 = _1108;
    float _1138 = _1110;
    float _1140 = _1100;
    float _1142 = _1108;
    float _1144 = _1110;
    float _1146 = _1112;
    float _1148 = _1104;
    float _1150 = _1106;
    float _1152 = _1128;
    float _1154 = _1128;
    if (!_1122)
    {
        _1130 = _104;
    }
    float _1156 = _1130;
    float _1158 = _1156;
    float _1160 = _1156;
    if (!_1122)
    {
        _1132 = _106;
    }
    float _1162 = _1132;
    float _1164 = _1162;
    float _1166 = _1162;
    if (!_1122)
    {
        _1040 = _108;
    }
    float _1168 = _1040;
    bool _1170 = !_1122;
    float _1172 = _1168;
    float _1174 = _1168;
    if (!_1170)
    {
        bool _1176 = _1100 > _1022;
        if (_1176)
        {
            _1134 = _1022;
        }
        float _1178 = _1134;
        _1140 = _1178;
        if (!_1176)
        {
            _1158 = _1102;
        }
        float _1180 = _1158;
        float _1182 = _1180;
        if (!_1176)
        {
            _1164 = _1104;
        }
        float _1184 = _1164;
        float _1186 = _1184;
        if (!_1176)
        {
            _1172 = _1106;
        }
        float _1188 = _1172;
        float _1190 = _1188;
        if (!_1176)
        {
            _1042 = _1098;
        }
        float _1192 = _1042;
        float _1194 = _1192;
        if (_1176)
        {
            _1182 = _1102;
        }
        float _1196 = _1182;
        _1160 = _1196;
        if (_1176)
        {
            _1186 = _1104;
        }
        float _1198 = _1186;
        _1166 = _1198;
        if (_1176)
        {
            _1190 = _1106;
        }
        float _1200 = _1190;
        _1174 = _1200;
        if (_1176)
        {
            _1194 = _1098;
        }
        float _1202 = _1194;
        _1044 = _1202;
        if (_1176)
        {
            _1136 = _104;
        }
        float _1204 = _1136;
        _1142 = _1204;
        if (_1176)
        {
            _1138 = _106;
        }
        float _1206 = _1138;
        _1144 = _1206;
        if (_1176)
        {
            _1146 = _108;
        }
    }
    float _1208 = _1044;
    float _1210 = _1140;
    float _1212 = _1160;
    float _1214 = _1166;
    float _1216 = _1174;
    float _1218 = _1142;
    float _1220 = _1144;
    float _1222 = _1146;
    bool _1224 = _1208 >= _1128;
    bool _1226 = isnan(_1208);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan(_1128);
    bool _1232 = _1228 || _1230;
    float _1234 = _122 * _828;
    float _1236 = fma(_120, _830, _1234);
    float _1238 = fma(_124, _832, _1236);
    float _1240 = _1236;
    float _1242 = _1210;
    float _1244 = _1218;
    float _1246 = _1220;
    float _1248 = _1210;
    float _1250 = _1218;
    float _1252 = _1220;
    float _1254 = _1222;
    float _1256 = _1216;
    float _1258 = _1238;
    float _1260 = _1238;
    float _1262 = _1208;
    if (!_1232)
    {
        _1240 = _112;
    }
    float _1264 = _1240;
    float _1266 = _1264;
    float _1268 = _1264;
    if (!_1232)
    {
        _1148 = _114;
    }
    float _1270 = _1148;
    float _1272 = _1270;
    float _1274 = _1270;
    if (!_1232)
    {
        _1150 = _116;
    }
    float _1276 = _1150;
    bool _1278 = !_1232;
    float _1280 = _1276;
    float _1282 = _1276;
    if (!_1278)
    {
        bool _1284 = _1210 > _1128;
        if (_1284)
        {
            _1242 = _1128;
        }
        float _1286 = _1242;
        _1248 = _1286;
        if (!_1284)
        {
            _1266 = _1212;
        }
        float _1288 = _1266;
        float _1290 = _1288;
        if (!_1284)
        {
            _1272 = _1214;
        }
        float _1292 = _1272;
        float _1294 = _1292;
        if (!_1284)
        {
            _1280 = _1216;
        }
        float _1296 = _1280;
        float _1298 = _1296;
        if (!_1284)
        {
            _1152 = _1208;
        }
        float _1300 = _1152;
        float _1302 = _1300;
        if (_1284)
        {
            _1290 = _1212;
        }
        float _1304 = _1290;
        _1268 = _1304;
        if (_1284)
        {
            _1294 = _1214;
        }
        float _1306 = _1294;
        _1274 = _1306;
        if (_1284)
        {
            _1298 = _1216;
        }
        float _1308 = _1298;
        _1282 = _1308;
        if (_1284)
        {
            _1302 = _1208;
        }
        float _1310 = _1302;
        _1154 = _1310;
        if (_1284)
        {
            _1244 = _112;
        }
        float _1312 = _1244;
        _1250 = _1312;
        if (_1284)
        {
            _1246 = _114;
        }
        float _1314 = _1246;
        _1252 = _1314;
        if (_1284)
        {
            _1254 = _116;
        }
    }
    float _1316 = _1154;
    float _1318 = _1248;
    float _1320 = _1268;
    float _1322 = _1274;
    float _1324 = _1282;
    float _1326 = _1250;
    float _1328 = _1252;
    float _1330 = _1254;
    bool _1332 = _1316 >= _1238;
    bool _1334 = isnan(_1316);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(_1238);
    bool _1340 = _1336 || _1338;
    float _1342 = _130 * _828;
    float _1344 = fma(_128, _830, _1342);
    float _1346 = fma(_132, _832, _1344);
    float _1348 = _1344;
    float _1350 = _1342;
    float _1352 = _1318;
    float _1354 = _1326;
    float _1356 = _1328;
    float _1358 = _1318;
    float _1360 = _1326;
    float _1362 = _1328;
    float _1364 = _1330;
    float _1366 = _1324;
    float _1368 = _1316;
    float _1370 = _1346;
    float _1372 = _1346;
    if (!_1340)
    {
        _1348 = _120;
    }
    float _1374 = _1348;
    float _1376 = _1374;
    float _1378 = _1374;
    if (!_1340)
    {
        _1350 = _122;
    }
    float _1380 = _1350;
    float _1382 = _1380;
    float _1384 = _1380;
    if (!_1340)
    {
        _1256 = _124;
    }
    float _1386 = _1256;
    bool _1388 = !_1340;
    float _1390 = _1386;
    float _1392 = _1386;
    if (!_1388)
    {
        bool _1394 = _1318 > _1238;
        if (_1394)
        {
            _1352 = _1238;
        }
        float _1396 = _1352;
        _1358 = _1396;
        if (!_1394)
        {
            _1376 = _1320;
        }
        float _1398 = _1376;
        float _1400 = _1398;
        if (!_1394)
        {
            _1382 = _1322;
        }
        float _1402 = _1382;
        float _1404 = _1402;
        if (!_1394)
        {
            _1390 = _1324;
        }
        float _1406 = _1390;
        float _1408 = _1406;
        if (!_1394)
        {
            _1258 = _1316;
        }
        float _1410 = _1258;
        float _1412 = _1410;
        if (_1394)
        {
            _1400 = _1320;
        }
        float _1414 = _1400;
        _1378 = _1414;
        if (_1394)
        {
            _1404 = _1322;
        }
        float _1416 = _1404;
        _1384 = _1416;
        if (_1394)
        {
            _1408 = _1324;
        }
        float _1418 = _1408;
        _1392 = _1418;
        if (_1394)
        {
            _1412 = _1316;
        }
        float _1420 = _1412;
        _1260 = _1420;
        if (_1394)
        {
            _1354 = _120;
        }
        float _1422 = _1354;
        _1360 = _1422;
        if (_1394)
        {
            _1356 = _122;
        }
        float _1424 = _1356;
        _1362 = _1424;
        if (_1394)
        {
            _1364 = _124;
        }
    }
    float _1426 = _1260;
    float _1428 = _1358;
    float _1430 = _1378;
    float _1432 = _1384;
    float _1434 = _1392;
    float _1436 = _1360;
    float _1438 = _1362;
    float _1440 = _1364;
    bool _1442 = _1426 >= _1346;
    bool _1444 = isnan(_1426);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan(_1346);
    bool _1450 = _1446 || _1448;
    float _1452 = _138 * _828;
    float _1454 = fma(_136, _830, _1452);
    float _1456 = fma(_140, _832, _1454);
    float _1458 = _1428;
    float _1460 = _1436;
    float _1462 = _1438;
    float _1464 = _1428;
    float _1466 = _1436;
    float _1468 = _1438;
    float _1470 = _1440;
    float _1472 = _1434;
    float _1474 = _1456;
    float _1476 = _1456;
    if (!_1450)
    {
        _1366 = _128;
    }
    float _1478 = _1366;
    float _1480 = _1478;
    float _1482 = _1478;
    if (!_1450)
    {
        _1368 = _130;
    }
    float _1484 = _1368;
    float _1486 = _1484;
    float _1488 = _1484;
    if (!_1450)
    {
        _1262 = _132;
    }
    float _1490 = _1262;
    bool _1492 = !_1450;
    float _1494 = _1490;
    float _1496 = _1490;
    if (!_1492)
    {
        bool _1498 = _1428 > _1346;
        if (_1498)
        {
            _1458 = _1346;
        }
        float _1500 = _1458;
        _1464 = _1500;
        if (!_1498)
        {
            _1480 = _1430;
        }
        float _1502 = _1480;
        float _1504 = _1502;
        if (!_1498)
        {
            _1486 = _1432;
        }
        float _1506 = _1486;
        float _1508 = _1506;
        if (!_1498)
        {
            _1494 = _1434;
        }
        float _1510 = _1494;
        float _1512 = _1510;
        if (!_1498)
        {
            _1370 = _1426;
        }
        float _1514 = _1370;
        float _1516 = _1514;
        if (_1498)
        {
            _1504 = _1430;
        }
        float _1518 = _1504;
        _1482 = _1518;
        if (_1498)
        {
            _1508 = _1432;
        }
        float _1520 = _1508;
        _1488 = _1520;
        if (_1498)
        {
            _1512 = _1434;
        }
        float _1522 = _1512;
        _1496 = _1522;
        if (_1498)
        {
            _1516 = _1426;
        }
        float _1524 = _1516;
        _1372 = _1524;
        if (_1498)
        {
            _1460 = _128;
        }
        float _1526 = _1460;
        _1466 = _1526;
        if (_1498)
        {
            _1462 = _130;
        }
        float _1528 = _1462;
        _1468 = _1528;
        if (_1498)
        {
            _1470 = _132;
        }
    }
    float _1530 = _1372;
    float _1532 = _1464;
    float _1534 = _1482;
    float _1536 = _1488;
    float _1538 = _1496;
    float _1540 = _1466;
    float _1542 = _1468;
    float _1544 = _1470;
    bool _1546 = _1530 >= _1456;
    bool _1548 = isnan(_1530);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(_1456);
    bool _1554 = _1550 || _1552;
    float _1556 = _146 * _828;
    float _1558 = fma(_144, _830, _1556);
    float _1560 = fma(_148, _832, _1558);
    float _1562 = _1558;
    float _1564 = _1556;
    float _1566 = _1532;
    float _1568 = _1540;
    float _1570 = _1542;
    float _1572 = _1532;
    float _1574 = _1540;
    float _1576 = _1542;
    float _1578 = _1544;
    float _1580 = _1538;
    float _1582 = _1534;
    float _1584 = _1560;
    float _1586 = _1560;
    if (!_1554)
    {
        _1562 = _136;
    }
    float _1588 = _1562;
    float _1590 = _1588;
    float _1592 = _1588;
    if (!_1554)
    {
        _1564 = _138;
    }
    float _1594 = _1564;
    float _1596 = _1594;
    float _1598 = _1594;
    if (!_1554)
    {
        _1472 = _140;
    }
    float _1600 = _1472;
    bool _1602 = !_1554;
    float _1604 = _1600;
    float _1606 = _1600;
    if (!_1602)
    {
        bool _1608 = _1532 > _1456;
        if (_1608)
        {
            _1566 = _1456;
        }
        float _1610 = _1566;
        _1572 = _1610;
        if (!_1608)
        {
            _1590 = _1534;
        }
        float _1612 = _1590;
        float _1614 = _1612;
        if (!_1608)
        {
            _1596 = _1536;
        }
        float _1616 = _1596;
        float _1618 = _1616;
        if (!_1608)
        {
            _1604 = _1538;
        }
        float _1620 = _1604;
        float _1622 = _1620;
        if (!_1608)
        {
            _1474 = _1530;
        }
        float _1624 = _1474;
        float _1626 = _1624;
        if (_1608)
        {
            _1614 = _1534;
        }
        float _1628 = _1614;
        _1592 = _1628;
        if (_1608)
        {
            _1618 = _1536;
        }
        float _1630 = _1618;
        _1598 = _1630;
        if (_1608)
        {
            _1622 = _1538;
        }
        float _1632 = _1622;
        _1606 = _1632;
        if (_1608)
        {
            _1626 = _1530;
        }
        float _1634 = _1626;
        _1476 = _1634;
        if (_1608)
        {
            _1568 = _136;
        }
        float _1636 = _1568;
        _1574 = _1636;
        if (_1608)
        {
            _1570 = _138;
        }
        float _1638 = _1570;
        _1576 = _1638;
        if (_1608)
        {
            _1578 = _140;
        }
    }
    float _1640 = _1476;
    float _1642 = _1572;
    float _1644 = _1592;
    float _1646 = _1598;
    float _1648 = _1606;
    float _1650 = _1574;
    float _1652 = _1576;
    float _1654 = _1578;
    bool _1656 = _1640 >= _1560;
    bool _1658 = isnan(_1640);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan(_1560);
    bool _1664 = _1660 || _1662;
    float _1666 = _154 * _828;
    float _1668 = fma(_152, _830, _1666);
    float _1670 = fma(_156, _832, _1668);
    float _1672 = _1668;
    float _1674 = _1642;
    float _1676 = _1650;
    float _1678 = _1652;
    float _1680 = _1642;
    float _1682 = _1650;
    float _1684 = _1652;
    float _1686 = _1654;
    float _1688 = _1648;
    float _1690 = _1670;
    float _1692 = _1670;
    float _1694 = _1640;
    if (!_1664)
    {
        _1580 = _144;
    }
    float _1696 = _1580;
    float _1698 = _1696;
    float _1700 = _1696;
    if (!_1664)
    {
        _1672 = _146;
    }
    float _1702 = _1672;
    float _1704 = _1702;
    float _1706 = _1702;
    if (!_1664)
    {
        _1582 = _148;
    }
    float _1708 = _1582;
    bool _1710 = !_1664;
    float _1712 = _1708;
    float _1714 = _1708;
    if (!_1710)
    {
        bool _1716 = _1642 > _1560;
        if (_1716)
        {
            _1674 = _1560;
        }
        float _1718 = _1674;
        _1680 = _1718;
        if (!_1716)
        {
            _1698 = _1644;
        }
        float _1720 = _1698;
        float _1722 = _1720;
        if (!_1716)
        {
            _1704 = _1646;
        }
        float _1724 = _1704;
        float _1726 = _1724;
        if (!_1716)
        {
            _1712 = _1648;
        }
        float _1728 = _1712;
        float _1730 = _1728;
        if (!_1716)
        {
            _1584 = _1640;
        }
        float _1732 = _1584;
        float _1734 = _1732;
        if (_1716)
        {
            _1722 = _1644;
        }
        float _1736 = _1722;
        _1700 = _1736;
        if (_1716)
        {
            _1726 = _1646;
        }
        float _1738 = _1726;
        _1706 = _1738;
        if (_1716)
        {
            _1730 = _1648;
        }
        float _1740 = _1730;
        _1714 = _1740;
        if (_1716)
        {
            _1734 = _1640;
        }
        float _1742 = _1734;
        _1586 = _1742;
        if (_1716)
        {
            _1676 = _144;
        }
        float _1744 = _1676;
        _1682 = _1744;
        if (_1716)
        {
            _1678 = _146;
        }
        float _1746 = _1678;
        _1684 = _1746;
        if (_1716)
        {
            _1686 = _148;
        }
    }
    float _1748 = _1586;
    float _1750 = _1680;
    float _1752 = _1700;
    float _1754 = _1706;
    float _1756 = _1714;
    float _1758 = _1682;
    float _1760 = _1684;
    float _1762 = _1686;
    bool _1764 = _1748 >= _1670;
    bool _1766 = isnan(_1748);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(_1670);
    bool _1772 = _1768 || _1770;
    float _1774 = _162 * _828;
    float _1776 = fma(_160, _830, _1774);
    float _1778 = fma(_164, _832, _1776);
    float _1780 = _1774;
    float _1782 = _1776;
    float _1784 = _1750;
    float _1786 = _1758;
    float _1788 = _1760;
    float _1790 = _1750;
    float _1792 = _1758;
    float _1794 = _1760;
    float _1796 = _1762;
    float _1798 = _1756;
    float _1800 = _1778;
    float _1802 = _1778;
    if (!_1772)
    {
        _1688 = _152;
    }
    float _1804 = _1688;
    float _1806 = _1804;
    float _1808 = _1804;
    if (!_1772)
    {
        _1780 = _154;
    }
    float _1810 = _1780;
    float _1812 = _1810;
    float _1814 = _1810;
    if (!_1772)
    {
        _1782 = _156;
    }
    float _1816 = _1782;
    bool _1818 = !_1772;
    float _1820 = _1816;
    float _1822 = _1816;
    if (!_1818)
    {
        bool _1824 = _1750 > _1670;
        if (_1824)
        {
            _1784 = _1670;
        }
        float _1826 = _1784;
        _1790 = _1826;
        if (!_1824)
        {
            _1806 = _1752;
        }
        float _1828 = _1806;
        float _1830 = _1828;
        if (!_1824)
        {
            _1812 = _1754;
        }
        float _1832 = _1812;
        float _1834 = _1832;
        if (!_1824)
        {
            _1820 = _1756;
        }
        float _1836 = _1820;
        float _1838 = _1836;
        if (!_1824)
        {
            _1690 = _1748;
        }
        float _1840 = _1690;
        float _1842 = _1840;
        if (_1824)
        {
            _1830 = _1752;
        }
        float _1844 = _1830;
        _1808 = _1844;
        if (_1824)
        {
            _1834 = _1754;
        }
        float _1846 = _1834;
        _1814 = _1846;
        if (_1824)
        {
            _1838 = _1756;
        }
        float _1848 = _1838;
        _1822 = _1848;
        if (_1824)
        {
            _1842 = _1748;
        }
        float _1850 = _1842;
        _1692 = _1850;
        if (_1824)
        {
            _1786 = _152;
        }
        float _1852 = _1786;
        _1792 = _1852;
        if (_1824)
        {
            _1788 = _154;
        }
        float _1854 = _1788;
        _1794 = _1854;
        if (_1824)
        {
            _1796 = _156;
        }
    }
    float _1856 = _1692;
    float _1858 = _1790;
    float _1860 = _1808;
    float _1862 = _1814;
    float _1864 = _1822;
    float _1866 = _1792;
    float _1868 = _1794;
    float _1870 = _1796;
    bool _1872 = _1856 >= _1778;
    bool _1874 = isnan(_1856);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan(_1778);
    bool _1880 = _1876 || _1878;
    float _1882 = _170 * _828;
    float _1884 = fma(_168, _830, _1882);
    float _1886 = fma(_172, _832, _1884);
    float _1888 = _1884;
    float _1890 = _1858;
    float _1892 = _1866;
    float _1894 = _1868;
    float _1896 = _1858;
    float _1898 = _1866;
    float _1900 = _1868;
    float _1902 = _1870;
    float _1904 = _1860;
    float _1906 = _1864;
    float _1908 = _1886;
    float _1910 = _1886;
    if (!_1880)
    {
        _1798 = _160;
    }
    float _1912 = _1798;
    float _1914 = _1912;
    float _1916 = _1912;
    if (!_1880)
    {
        _1694 = _162;
    }
    float _1918 = _1694;
    float _1920 = _1918;
    float _1922 = _1918;
    if (!_1880)
    {
        _1888 = _164;
    }
    float _1924 = _1888;
    bool _1926 = !_1880;
    float _1928 = _1924;
    float _1930 = _1924;
    if (!_1926)
    {
        bool _1932 = _1858 > _1778;
        if (_1932)
        {
            _1890 = _1778;
        }
        float _1934 = _1890;
        _1896 = _1934;
        if (!_1932)
        {
            _1914 = _1860;
        }
        float _1936 = _1914;
        float _1938 = _1936;
        if (!_1932)
        {
            _1920 = _1862;
        }
        float _1940 = _1920;
        float _1942 = _1940;
        if (!_1932)
        {
            _1928 = _1864;
        }
        float _1944 = _1928;
        float _1946 = _1944;
        if (!_1932)
        {
            _1800 = _1856;
        }
        float _1948 = _1800;
        float _1950 = _1948;
        if (_1932)
        {
            _1938 = _1860;
        }
        float _1952 = _1938;
        _1916 = _1952;
        if (_1932)
        {
            _1942 = _1862;
        }
        float _1954 = _1942;
        _1922 = _1954;
        if (_1932)
        {
            _1946 = _1864;
        }
        float _1956 = _1946;
        _1930 = _1956;
        if (_1932)
        {
            _1950 = _1856;
        }
        float _1958 = _1950;
        _1802 = _1958;
        if (_1932)
        {
            _1892 = _160;
        }
        float _1960 = _1892;
        _1898 = _1960;
        if (_1932)
        {
            _1894 = _162;
        }
        float _1962 = _1894;
        _1900 = _1962;
        if (_1932)
        {
            _1902 = _164;
        }
    }
    float _1964 = _1802;
    float _1966 = _1896;
    float _1968 = _1916;
    float _1970 = _1922;
    float _1972 = _1930;
    float _1974 = _1898;
    float _1976 = _1900;
    float _1978 = _1902;
    bool _1980 = _1964 >= _1886;
    bool _1982 = isnan(_1964);
    bool _1984 = _1980 || _1982;
    bool _1986 = isnan(_1886);
    bool _1988 = _1984 || _1986;
    float _1990 = _178 * _828;
    float _1992 = fma(_176, _830, _1990);
    float _1994 = fma(_180, _832, _1992);
    float _1996 = _1992;
    float _1998 = _1966;
    float _2000 = _1974;
    float _2002 = _1976;
    float _2004 = _1966;
    float _2006 = _1974;
    float _2008 = _1976;
    float _2010 = _1978;
    float _2012 = _1968;
    float _2014 = _1970;
    float _2016 = _1994;
    float _2018 = _1994;
    if (!_1988)
    {
        _1904 = _168;
    }
    float _2020 = _1904;
    float _2022 = _2020;
    float _2024 = _2020;
    if (!_1988)
    {
        _1996 = _170;
    }
    float _2026 = _1996;
    float _2028 = _2026;
    float _2030 = _2026;
    if (!_1988)
    {
        _1906 = _172;
    }
    float _2032 = _1906;
    bool _2034 = !_1988;
    float _2036 = _2032;
    float _2038 = _2032;
    if (!_2034)
    {
        bool _2040 = _1966 > _1886;
        if (_2040)
        {
            _1998 = _1886;
        }
        float _2042 = _1998;
        _2004 = _2042;
        if (!_2040)
        {
            _2022 = _1968;
        }
        float _2044 = _2022;
        float _2046 = _2044;
        if (!_2040)
        {
            _2028 = _1970;
        }
        float _2048 = _2028;
        float _2050 = _2048;
        if (!_2040)
        {
            _2036 = _1972;
        }
        float _2052 = _2036;
        float _2054 = _2052;
        if (!_2040)
        {
            _1908 = _1964;
        }
        float _2056 = _1908;
        float _2058 = _2056;
        if (_2040)
        {
            _2046 = _1968;
        }
        float _2060 = _2046;
        _2024 = _2060;
        if (_2040)
        {
            _2050 = _1970;
        }
        float _2062 = _2050;
        _2030 = _2062;
        if (_2040)
        {
            _2054 = _1972;
        }
        float _2064 = _2054;
        _2038 = _2064;
        if (_2040)
        {
            _2058 = _1964;
        }
        float _2066 = _2058;
        _1910 = _2066;
        if (_2040)
        {
            _2000 = _168;
        }
        float _2068 = _2000;
        _2006 = _2068;
        if (_2040)
        {
            _2002 = _170;
        }
        float _2070 = _2002;
        _2008 = _2070;
        if (_2040)
        {
            _2010 = _172;
        }
    }
    float _2072 = _1910;
    float _2074 = _2004;
    float _2076 = _2024;
    float _2078 = _2030;
    float _2080 = _2038;
    float _2082 = _2006;
    float _2084 = _2008;
    float _2086 = _2010;
    bool _2088 = _2072 >= _1994;
    bool _2090 = isnan(_2072);
    bool _2092 = _2088 || _2090;
    bool _2094 = isnan(_1994);
    bool _2096 = _2092 || _2094;
    float _2098 = _186 * _828;
    float _2100 = fma(_184, _830, _2098);
    float _2102 = fma(_188, _832, _2100);
    float _2104 = _2098;
    float _2106 = _2074;
    float _2108 = _2082;
    float _2110 = _2084;
    float _2112 = _2074;
    float _2114 = _2082;
    float _2116 = _2084;
    float _2118 = _2086;
    float _2120 = _2076;
    float _2122 = _2080;
    float _2124 = _2102;
    float _2126 = _2102;
    if (!_2096)
    {
        _2012 = _176;
    }
    float _2128 = _2012;
    float _2130 = _2128;
    float _2132 = _2128;
    if (!_2096)
    {
        _2014 = _178;
    }
    float _2134 = _2014;
    float _2136 = _2134;
    float _2138 = _2134;
    if (!_2096)
    {
        _2104 = _180;
    }
    float _2140 = _2104;
    bool _2142 = !_2096;
    float _2144 = _2140;
    float _2146 = _2140;
    if (!_2142)
    {
        bool _2148 = _2074 > _1994;
        if (_2148)
        {
            _2106 = _1994;
        }
        float _2150 = _2106;
        _2112 = _2150;
        if (!_2148)
        {
            _2130 = _2076;
        }
        float _2152 = _2130;
        float _2154 = _2152;
        if (!_2148)
        {
            _2136 = _2078;
        }
        float _2156 = _2136;
        float _2158 = _2156;
        if (!_2148)
        {
            _2144 = _2080;
        }
        float _2160 = _2144;
        float _2162 = _2160;
        if (!_2148)
        {
            _2016 = _2072;
        }
        float _2164 = _2016;
        float _2166 = _2164;
        if (_2148)
        {
            _2154 = _2076;
        }
        float _2168 = _2154;
        _2132 = _2168;
        if (_2148)
        {
            _2158 = _2078;
        }
        float _2170 = _2158;
        _2138 = _2170;
        if (_2148)
        {
            _2162 = _2080;
        }
        float _2172 = _2162;
        _2146 = _2172;
        if (_2148)
        {
            _2166 = _2072;
        }
        float _2174 = _2166;
        _2018 = _2174;
        if (_2148)
        {
            _2108 = _176;
        }
        float _2176 = _2108;
        _2114 = _2176;
        if (_2148)
        {
            _2110 = _178;
        }
        float _2178 = _2110;
        _2116 = _2178;
        if (_2148)
        {
            _2118 = _180;
        }
    }
    float _2180 = _2018;
    float _2182 = _2112;
    float _2184 = _2132;
    float _2186 = _2138;
    float _2188 = _2146;
    float _2190 = _2114;
    float _2192 = _2116;
    float _2194 = _2118;
    bool _2196 = _2180 >= _2102;
    bool _2198 = isnan(_2180);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan(_2102);
    bool _2204 = _2200 || _2202;
    float _2206 = _194 * _828;
    float _2208 = fma(_192, _830, _2206);
    float _2210 = fma(_196, _832, _2208);
    float _2212 = _2208;
    float _2214 = _2182;
    float _2216 = _2190;
    float _2218 = _2192;
    float _2220 = _2190;
    float _2222 = _2182;
    float _2224 = _2192;
    float _2226 = _2194;
    float _2228 = _2186;
    float _2230 = _2210;
    float _2232 = _2210;
    if (!_2204)
    {
        _2120 = _184;
    }
    float _2234 = _2120;
    float _2236 = _2234;
    float _2238 = _2234;
    if (!_2204)
    {
        _2212 = _186;
    }
    float _2240 = _2212;
    float _2242 = _2240;
    float _2244 = _2240;
    if (!_2204)
    {
        _2122 = _188;
    }
    float _2246 = _2122;
    bool _2248 = !_2204;
    float _2250 = _2246;
    float _2252 = _2246;
    if (!_2248)
    {
        bool _2254 = _2182 > _2102;
        if (_2254)
        {
            _2214 = _2102;
        }
        float _2256 = _2214;
        _2222 = _2256;
        if (!_2254)
        {
            _2236 = _2184;
        }
        float _2258 = _2236;
        float _2260 = _2258;
        if (!_2254)
        {
            _2242 = _2186;
        }
        float _2262 = _2242;
        float _2264 = _2262;
        if (!_2254)
        {
            _2250 = _2188;
        }
        float _2266 = _2250;
        float _2268 = _2266;
        if (!_2254)
        {
            _2124 = _2180;
        }
        float _2270 = _2124;
        float _2272 = _2270;
        if (_2254)
        {
            _2260 = _2184;
        }
        float _2274 = _2260;
        _2238 = _2274;
        if (_2254)
        {
            _2264 = _2186;
        }
        float _2276 = _2264;
        _2244 = _2276;
        if (_2254)
        {
            _2268 = _2188;
        }
        float _2278 = _2268;
        _2252 = _2278;
        if (_2254)
        {
            _2272 = _2180;
        }
        float _2280 = _2272;
        _2126 = _2280;
        if (_2254)
        {
            _2216 = _184;
        }
        float _2282 = _2216;
        _2220 = _2282;
        if (_2254)
        {
            _2218 = _186;
        }
        float _2284 = _2218;
        _2224 = _2284;
        if (_2254)
        {
            _2226 = _188;
        }
    }
    float _2286 = _2126;
    float _2288 = _2220;
    float _2290 = _2222;
    float _2292 = _2238;
    float _2294 = _2244;
    float _2296 = _2252;
    float _2298 = _2224;
    float _2300 = _2226;
    bool _2302 = _2286 >= _2210;
    bool _2304 = isnan(_2286);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan(_2210);
    bool _2310 = _2306 || _2308;
    float _2312 = _202 * _828;
    float _2314 = fma(_200, _830, _2312);
    float _2316 = fma(_204, _832, _2314);
    float _2318 = _2314;
    float _2320 = _2290;
    float _2322 = _2298;
    float _2324 = _2298;
    float _2326 = _2300;
    float _2328 = _2290;
    float _2330 = _2292;
    float _2332 = _2294;
    if (!_2310)
    {
        _2318 = _2288;
    }
    float _2334 = _2318;
    float _2336 = _2334;
    float _2338 = _2334;
    if (!_2310)
    {
        _888 = _192;
    }
    float _2340 = _888;
    float _2342 = _2340;
    float _2344 = _2340;
    if (!_2310)
    {
        _890 = _194;
    }
    float _2346 = _890;
    float _2348 = _2346;
    float _2350 = _2346;
    if (!_2310)
    {
        _2228 = _196;
    }
    float _2352 = _2228;
    bool _2354 = !_2310;
    float _2356 = _2352;
    float _2358 = _2352;
    if (!_2354)
    {
        bool _2360 = _2290 > _2210;
        if (_2360)
        {
            _2320 = _2210;
        }
        float _2362 = _2320;
        _2328 = _2362;
        if (!_2360)
        {
            _2342 = _2292;
        }
        float _2364 = _2342;
        float _2366 = _2364;
        if (!_2360)
        {
            _2348 = _2294;
        }
        float _2368 = _2348;
        float _2370 = _2368;
        if (!_2360)
        {
            _2356 = _2296;
        }
        float _2372 = _2356;
        float _2374 = _2372;
        if (!_2360)
        {
            _2230 = _2286;
        }
        float _2376 = _2230;
        float _2378 = _2376;
        if (!_2360)
        {
            _2336 = _2288;
        }
        float _2380 = _2336;
        float _2382 = _2380;
        if (_2360)
        {
            _2366 = _2292;
        }
        float _2384 = _2366;
        _2344 = _2384;
        if (_2360)
        {
            _2370 = _2294;
        }
        float _2386 = _2370;
        _2350 = _2386;
        if (_2360)
        {
            _2374 = _2296;
        }
        float _2388 = _2374;
        _2358 = _2388;
        if (_2360)
        {
            _2378 = _2286;
        }
        float _2390 = _2378;
        _2232 = _2390;
        if (_2360)
        {
            _2382 = _192;
        }
        float _2392 = _2382;
        _2338 = _2392;
        if (_2360)
        {
            _2322 = _194;
        }
        float _2394 = _2322;
        _2324 = _2394;
        if (_2360)
        {
            _2326 = _196;
        }
    }
    float _2396 = _2232;
    float _2398 = _2324;
    float _2400 = _2326;
    float _2402 = _2328;
    float _2404 = _2344;
    float _2406 = _2350;
    float _2408 = _2358;
    float _2410 = _2338;
    bool _2412 = _2396 >= _2316;
    bool _2414 = isnan(_2396);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan(_2316);
    bool _2420 = _2416 || _2418;
    float _2422 = _2410;
    float _2424 = _2410;
    if (!_2420)
    {
        _2330 = _2398;
    }
    float _2426 = _2330;
    float _2428 = _2426;
    float _2430 = _2426;
    if (!_2420)
    {
        _2332 = _2400;
    }
    float _2432 = _2332;
    float _2434 = _2432;
    float _2436 = _2432;
    if (!_2420)
    {
        _892 = _200;
    }
    float _2438 = _892;
    float _2440 = _2438;
    float _2442 = _2438;
    if (!_2420)
    {
        _894 = _202;
    }
    float _2444 = _894;
    float _2446 = 0.0;
    float _2448 = _2444;
    float _2450 = _2444;
    if (!_2420)
    {
        _2446 = _204;
    }
    float _2452 = _2446;
    bool _2454 = !_2420;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2454)
    {
        bool _2460 = _2402 > _2316;
        if (!_2460)
        {
            _2440 = _2404;
        }
        float _2462 = _2440;
        float _2464 = _2462;
        if (!_2460)
        {
            _2448 = _2406;
        }
        float _2466 = _2448;
        float _2468 = _2466;
        if (!_2460)
        {
            _2456 = _2408;
        }
        float _2470 = _2456;
        float _2472 = _2470;
        if (!_2460)
        {
            _2428 = _2398;
        }
        float _2474 = _2428;
        float _2476 = _2474;
        if (!_2460)
        {
            _2434 = _2400;
        }
        float _2478 = _2434;
        _2436 = _2478;
        if (_2460)
        {
            _2464 = _2404;
        }
        float _2480 = _2464;
        _2442 = _2480;
        if (_2460)
        {
            _2468 = _2406;
        }
        float _2482 = _2468;
        _2450 = _2482;
        if (_2460)
        {
            _2472 = _2408;
        }
        float _2484 = _2472;
        _2458 = _2484;
        if (_2460)
        {
            _2422 = _200;
        }
        float _2486 = _2422;
        _2424 = _2486;
        if (_2460)
        {
            _2476 = _202;
        }
        float _2488 = _2476;
        _2430 = _2488;
        if (_2460)
        {
            _2436 = _204;
        }
    }
    float _2490 = _2430;
    float _2492 = _2450;
    float _2494 = _2424;
    float _2496 = _2442;
    float _2498 = _2436;
    float _2500 = _2458;
    float _2502 = -_2490;
    float _2504 = _2492 + _2502;
    float _2506 = -_2494;
    float _2508 = _2496 + _2506;
    float _2510 = -_2498;
    float _2512 = _2500 + _2510;
    float _2514 = _2504 * _2504;
    float _2516 = fma(_2508, _2508, _2514);
    float _2518 = -_2494;
    float _2520 = _80 + _2518;
    float _2522 = fma(_2512, _2512, _2516);
    float _2524 = -_2490;
    float _2526 = _82 + _2524;
    float _2528 = _2504 * _2526;
    float _2530 = 1.0 / _2522;
    float _2532 = -_2498;
    float _2534 = _84 + _2532;
    float _2536 = fma(_2508, _2520, _2528);
    float _2538 = fma(_2512, _2534, _2536);
    float _2540 = _2530 * 3.0;
    float _2542 = _2540 * _2538;
    float _2544 = rint(_2542);
    float _2546 = precise::max(0.0, _2544);
    float _2548 = precise::min(_2546, 3.0);
    float _2550 = trunc(_2548);
    int _2553 = int(_2550);
    bool _2555 = _2553 >= 2;
    bool _2557 = !_2555;
    float _2559 = _2508;
    float _2561 = _2504;
    float _2563 = _2512;
    float _2565 = _2494;
    float _2567 = _2496;
    float _2569 = _2490;
    float _2571 = _2492;
    float _2573 = _2500;
    float _2575 = _2498;
    float _2585;
    float _2587;
    float _2589;
    float _2591;
    float _2593;
    float _2595;
    float _2597;
    float _2599;
    float _2601;
    float _2603;
    float _2605;
    float _2607;
    float _2609;
    float _2611;
    float _2613;
    float _2615;
    if (!_2557)
    {
        bool _2577 = _2553 >= 3;
        bool _2579 = !_2577;
        if (!_2579)
        {
            bool _2581 = _2553 != 3;
            _2583 = _2581;
            if (!_2583)
            {
                _2585 = _80;
                _2587 = _82;
                _2589 = _84;
                _2591 = 1.0;
                _2593 = 0.0;
                _2595 = 0.0;
                _2597 = 0.0;
                _2599 = 0.0;
                _2601 = 0.0;
                _2603 = 0.0;
                _2605 = 0.0;
                _2607 = 0.0;
                _2609 = 0.0;
                _2611 = 0.0;
                _2613 = 0.0;
                _2615 = 0.0;
                _2617 = true;
            }
        }
        else
        {
            _2585 = 0.0;
            _2587 = 0.0;
            _2589 = 0.0;
            _2591 = 0.0;
            _2593 = 0.0;
            _2595 = 0.0;
            _2597 = 0.0;
            _2599 = 0.0;
            _2601 = _80;
            _2603 = _82;
            _2605 = _84;
            _2607 = 1.0;
            _2609 = 0.0;
            _2611 = 0.0;
            _2613 = 0.0;
            _2615 = 0.0;
            _2617 = true;
        }
    }
    if ((!_2617) || _2583)
    {
        bool _2619;
        if (!_2583)
        {
            _2619 = _2553 >= 1;
        }
        if ((!_2619) || _2583)
        {
            bool _2621;
            if (!_2583)
            {
                _2621 = _2553 != 0;
            }
            if ((!_2621) && (!_2583))
            {
                _2585 = 0.0;
                _2587 = 0.0;
                _2589 = 0.0;
                _2591 = 0.0;
                _2593 = _80;
                _2595 = _82;
                _2597 = _84;
                _2599 = 1.0;
                _2601 = 0.0;
                _2603 = 0.0;
                _2605 = 0.0;
                _2607 = 0.0;
                _2609 = 0.0;
                _2611 = 0.0;
                _2613 = 0.0;
                _2615 = 0.0;
                _2617 = true;
            }
            else
            {
                _2583 = false;
                _2585 = 0.0;
                _2587 = 0.0;
                _2589 = 0.0;
                _2591 = 0.0;
                _2593 = 0.0;
                _2595 = 0.0;
                _2597 = 0.0;
                _2599 = 0.0;
                _2601 = 0.0;
                _2603 = 0.0;
                _2605 = 0.0;
                _2607 = 0.0;
                _2609 = 0.0;
                _2611 = 0.0;
                _2613 = 0.0;
                _2615 = 0.0;
                _2617 = true;
            }
        }
        else
        {
            _2585 = 0.0;
            _2587 = 0.0;
            _2589 = 0.0;
            _2591 = 0.0;
            _2593 = 0.0;
            _2595 = 0.0;
            _2597 = 0.0;
            _2599 = 0.0;
            _2601 = 0.0;
            _2603 = 0.0;
            _2605 = 0.0;
            _2607 = 0.0;
            _2609 = _80;
            _2611 = _82;
            _2613 = _84;
            _2615 = 1.0;
        }
    }
    _2617 = false;
    float _2623 = _2585;
    float _2625 = _2587;
    float _2627 = _2589;
    float _2629 = _2591;
    float _2631 = _2593;
    float _2633 = _2595;
    float _2635 = _2597;
    float _2637 = _2599;
    float _2639 = _2601;
    float _2641 = _2603;
    float _2643 = _2605;
    float _2645 = _2607;
    float _2647 = _2609;
    float _2649 = _2611;
    float _2651 = _2613;
    float _2653 = _2615;
    float _2655 = -_2490;
    float _2657 = _90 + _2655;
    float _2659 = -_2494;
    float _2661 = _88 + _2659;
    float _2663 = _2504 * _2657;
    float _2665 = -_2498;
    float _2667 = _92 + _2665;
    float _2669 = fma(_2508, _2661, _2663);
    float _2671 = fma(_2512, _2667, _2669);
    float _2673 = _2540 * _2671;
    float _2675 = rint(_2673);
    float _2677 = precise::max(0.0, _2675);
    float _2679 = precise::min(_2677, 3.0);
    float _2681 = trunc(_2679);
    int _2683 = int(_2681);
    bool _2685 = _2683 >= 2;
    bool _2687 = !_2685;
    float _2689 = as_type<float>(_2683);
    float _2691 = _2675;
    float _2693 = _2669;
    float _2695 = _2663;
    float _2697 = _2623;
    float _2699 = _2625;
    float _2701 = _2627;
    float _2703 = _2629;
    float _2705 = _2639;
    float _2707 = _2641;
    float _2709 = _2643;
    float _2711 = _2645;
    float _2713 = _2647;
    float _2715 = _2649;
    float _2717 = _2651;
    float _2719 = _2653;
    float _2737;
    float _2739;
    float _2741;
    float _2743;
    if (!_2687)
    {
        bool _2721 = _2683 >= 3;
        bool _2723 = !_2721;
        if (!_2723)
        {
            bool _2725 = _2683 != 3;
            _2727 = _2725;
            if (!_2727)
            {
                float _2729 = _88 + _2623;
                float _2731 = _90 + _2625;
                float _2733 = _92 + _2627;
                float _2735 = _2629 + 1.0;
                _2697 = _2729;
                _2699 = _2731;
                _2701 = _2733;
                _2703 = _2735;
                _2737 = _2631;
                _2739 = _2633;
                _2741 = _2635;
                _2743 = _2637;
                _2745 = true;
            }
        }
        else
        {
            float _2747 = _88 + _2639;
            float _2749 = _90 + _2641;
            float _2751 = _92 + _2643;
            float _2753 = _2645 + 1.0;
            _2737 = _2631;
            _2739 = _2633;
            _2741 = _2635;
            _2743 = _2637;
            _2705 = _2747;
            _2707 = _2749;
            _2709 = _2751;
            _2711 = _2753;
            _2745 = true;
        }
    }
    if ((!_2745) || _2727)
    {
        bool _2755;
        if (!_2727)
        {
            _2755 = _2683 >= 1;
        }
        if ((!_2755) || _2727)
        {
            if (!_2727)
            {
                bool _2757 = _2683 != 0;
                if (!_2757)
                {
                    float _2759 = _88 + _2631;
                    _2689 = _2759;
                }
                float _2761 = _2689;
                _2737 = _2761;
                if (!_2757)
                {
                    float _2763 = _90 + _2633;
                    _2691 = _2763;
                }
                float _2765 = _2691;
                _2739 = _2765;
                if (!_2757)
                {
                    float _2767 = _92 + _2635;
                    _2693 = _2767;
                }
                float _2769 = _2693;
                _2741 = _2769;
                if (!_2757)
                {
                    float _2771 = _2637 + 1.0;
                    _2695 = _2771;
                }
                float _2773 = _2695;
                bool _2775 = !_2757;
                _2743 = _2773;
                _2745 = _2775;
            }
            if ((!_2745) || _2727)
            {
                _2727 = false;
                _2737 = _2631;
                _2739 = _2633;
                _2741 = _2635;
                _2743 = _2637;
                _2745 = true;
            }
        }
        else
        {
            float _2777 = _88 + _2647;
            float _2779 = _90 + _2649;
            float _2781 = _92 + _2651;
            float _2783 = _2653 + 1.0;
            _2737 = _2631;
            _2739 = _2633;
            _2741 = _2635;
            _2743 = _2637;
            _2713 = _2777;
            _2715 = _2779;
            _2717 = _2781;
            _2719 = _2783;
        }
    }
    _2745 = false;
    float _2785 = _2697;
    float _2787 = _2699;
    float _2789 = _2701;
    float _2791 = _2703;
    float _2793 = _2737;
    float _2795 = _2739;
    float _2797 = _2741;
    float _2799 = _2743;
    float _2801 = _2705;
    float _2803 = _2707;
    float _2805 = _2709;
    float _2807 = _2711;
    float _2809 = _2713;
    float _2811 = _2715;
    float _2813 = _2717;
    float _2815 = _2719;
    float _2817 = -_2490;
    float _2819 = _98 + _2817;
    float _2821 = -_2494;
    float _2823 = _96 + _2821;
    float _2825 = _2504 * _2819;
    float _2827 = -_2498;
    float _2829 = _100 + _2827;
    float _2831 = fma(_2508, _2823, _2825);
    float _2833 = fma(_2512, _2829, _2831);
    float _2835 = _2540 * _2833;
    float _2837 = rint(_2835);
    float _2839 = precise::max(0.0, _2837);
    float _2841 = precise::min(_2839, 3.0);
    float _2843 = trunc(_2841);
    int _2845 = int(_2843);
    bool _2847 = _2845 >= 2;
    bool _2849 = !_2847;
    float _2851 = as_type<float>(_2845);
    float _2853 = _2837;
    float _2855 = _2831;
    float _2857 = _2825;
    float _2859 = _2785;
    float _2861 = _2787;
    float _2863 = _2789;
    float _2865 = _2791;
    float _2867 = _2801;
    float _2869 = _2803;
    float _2871 = _2805;
    float _2873 = _2807;
    float _2875 = _2809;
    float _2877 = _2811;
    float _2879 = _2813;
    float _2881 = _2815;
    float _2899;
    float _2901;
    float _2903;
    float _2905;
    if (!_2849)
    {
        bool _2883 = _2845 >= 3;
        bool _2885 = !_2883;
        if (!_2885)
        {
            bool _2887 = _2845 != 3;
            _2889 = _2887;
            if (!_2889)
            {
                float _2891 = _96 + _2785;
                float _2893 = _98 + _2787;
                float _2895 = _100 + _2789;
                float _2897 = _2791 + 1.0;
                _2859 = _2891;
                _2861 = _2893;
                _2863 = _2895;
                _2865 = _2897;
                _2899 = _2793;
                _2901 = _2795;
                _2903 = _2797;
                _2905 = _2799;
                _2907 = true;
            }
        }
        else
        {
            float _2909 = _96 + _2801;
            float _2911 = _98 + _2803;
            float _2913 = _100 + _2805;
            float _2915 = _2807 + 1.0;
            _2899 = _2793;
            _2901 = _2795;
            _2903 = _2797;
            _2905 = _2799;
            _2867 = _2909;
            _2869 = _2911;
            _2871 = _2913;
            _2873 = _2915;
            _2907 = true;
        }
    }
    if ((!_2907) || _2889)
    {
        bool _2917;
        if (!_2889)
        {
            _2917 = _2845 >= 1;
        }
        if ((!_2917) || _2889)
        {
            if (!_2889)
            {
                bool _2919 = _2845 != 0;
                if (!_2919)
                {
                    float _2921 = _96 + _2793;
                    _2851 = _2921;
                }
                float _2923 = _2851;
                _2899 = _2923;
                if (!_2919)
                {
                    float _2925 = _98 + _2795;
                    _2853 = _2925;
                }
                float _2927 = _2853;
                _2901 = _2927;
                if (!_2919)
                {
                    float _2929 = _100 + _2797;
                    _2855 = _2929;
                }
                float _2931 = _2855;
                _2903 = _2931;
                if (!_2919)
                {
                    float _2933 = _2799 + 1.0;
                    _2857 = _2933;
                }
                float _2935 = _2857;
                bool _2937 = !_2919;
                _2905 = _2935;
                _2907 = _2937;
            }
            if ((!_2907) || _2889)
            {
                _2889 = false;
                _2899 = _2793;
                _2901 = _2795;
                _2903 = _2797;
                _2905 = _2799;
                _2907 = true;
            }
        }
        else
        {
            float _2939 = _96 + _2809;
            float _2941 = _98 + _2811;
            float _2943 = _100 + _2813;
            float _2945 = _2815 + 1.0;
            _2899 = _2793;
            _2901 = _2795;
            _2903 = _2797;
            _2905 = _2799;
            _2875 = _2939;
            _2877 = _2941;
            _2879 = _2943;
            _2881 = _2945;
        }
    }
    _2907 = false;
    float _2947 = _2859;
    float _2949 = _2861;
    float _2951 = _2863;
    float _2953 = _2865;
    float _2955 = _2899;
    float _2957 = _2901;
    float _2959 = _2903;
    float _2961 = _2905;
    float _2963 = _2867;
    float _2965 = _2869;
    float _2967 = _2871;
    float _2969 = _2873;
    float _2971 = _2875;
    float _2973 = _2877;
    float _2975 = _2879;
    float _2977 = _2881;
    float _2979 = -_2490;
    float _2981 = _106 + _2979;
    float _2983 = -_2494;
    float _2985 = _104 + _2983;
    float _2987 = _2504 * _2981;
    float _2989 = -_2498;
    float _2991 = _108 + _2989;
    float _2993 = fma(_2508, _2985, _2987);
    float _2995 = fma(_2512, _2991, _2993);
    float _2997 = _2540 * _2995;
    float _2999 = rint(_2997);
    float _3001 = precise::max(0.0, _2999);
    float _3003 = precise::min(_3001, 3.0);
    float _3005 = trunc(_3003);
    int _3007 = int(_3005);
    bool _3009 = _3007 >= 2;
    bool _3011 = !_3009;
    float _3013 = as_type<float>(_3007);
    float _3015 = _2999;
    float _3017 = _2993;
    float _3019 = _2987;
    float _3021 = _2947;
    float _3023 = _2949;
    float _3025 = _2951;
    float _3027 = _2953;
    float _3029 = _2963;
    float _3031 = _2965;
    float _3033 = _2967;
    float _3035 = _2969;
    float _3037 = _2971;
    float _3039 = _2973;
    float _3041 = _2975;
    float _3043 = _2977;
    float _3061;
    float _3063;
    float _3065;
    float _3067;
    if (!_3011)
    {
        bool _3045 = _3007 >= 3;
        bool _3047 = !_3045;
        if (!_3047)
        {
            bool _3049 = _3007 != 3;
            _3051 = _3049;
            if (!_3051)
            {
                float _3053 = _104 + _2947;
                float _3055 = _106 + _2949;
                float _3057 = _108 + _2951;
                float _3059 = _2953 + 1.0;
                _3021 = _3053;
                _3023 = _3055;
                _3025 = _3057;
                _3027 = _3059;
                _3061 = _2955;
                _3063 = _2957;
                _3065 = _2959;
                _3067 = _2961;
                _3069 = true;
            }
        }
        else
        {
            float _3071 = _104 + _2963;
            float _3073 = _106 + _2965;
            float _3075 = _108 + _2967;
            float _3077 = _2969 + 1.0;
            _3061 = _2955;
            _3063 = _2957;
            _3065 = _2959;
            _3067 = _2961;
            _3029 = _3071;
            _3031 = _3073;
            _3033 = _3075;
            _3035 = _3077;
            _3069 = true;
        }
    }
    if ((!_3069) || _3051)
    {
        bool _3079;
        if (!_3051)
        {
            _3079 = _3007 >= 1;
        }
        if ((!_3079) || _3051)
        {
            if (!_3051)
            {
                bool _3081 = _3007 != 0;
                if (!_3081)
                {
                    float _3083 = _104 + _2955;
                    _3013 = _3083;
                }
                float _3085 = _3013;
                _3061 = _3085;
                if (!_3081)
                {
                    float _3087 = _106 + _2957;
                    _3015 = _3087;
                }
                float _3089 = _3015;
                _3063 = _3089;
                if (!_3081)
                {
                    float _3091 = _108 + _2959;
                    _3017 = _3091;
                }
                float _3093 = _3017;
                _3065 = _3093;
                if (!_3081)
                {
                    float _3095 = _2961 + 1.0;
                    _3019 = _3095;
                }
                float _3097 = _3019;
                bool _3099 = !_3081;
                _3067 = _3097;
                _3069 = _3099;
            }
            if ((!_3069) || _3051)
            {
                _3051 = false;
                _3061 = _2955;
                _3063 = _2957;
                _3065 = _2959;
                _3067 = _2961;
                _3069 = true;
            }
        }
        else
        {
            float _3101 = _104 + _2971;
            float _3103 = _106 + _2973;
            float _3105 = _108 + _2975;
            float _3107 = _2977 + 1.0;
            _3061 = _2955;
            _3063 = _2957;
            _3065 = _2959;
            _3067 = _2961;
            _3037 = _3101;
            _3039 = _3103;
            _3041 = _3105;
            _3043 = _3107;
        }
    }
    _3069 = false;
    float _3109 = _3021;
    float _3111 = _3023;
    float _3113 = _3025;
    float _3115 = _3027;
    float _3117 = _3061;
    float _3119 = _3063;
    float _3121 = _3065;
    float _3123 = _3067;
    float _3125 = _3029;
    float _3127 = _3031;
    float _3129 = _3033;
    float _3131 = _3035;
    float _3133 = _3037;
    float _3135 = _3039;
    float _3137 = _3041;
    float _3139 = _3043;
    float _3141 = -_2490;
    float _3143 = _114 + _3141;
    float _3145 = -_2494;
    float _3147 = _112 + _3145;
    float _3149 = _2504 * _3143;
    float _3151 = -_2498;
    float _3153 = _116 + _3151;
    float _3155 = fma(_2508, _3147, _3149);
    float _3157 = fma(_2512, _3153, _3155);
    float _3159 = _2540 * _3157;
    float _3161 = rint(_3159);
    float _3163 = precise::max(0.0, _3161);
    float _3165 = precise::min(_3163, 3.0);
    float _3167 = trunc(_3165);
    int _3169 = int(_3167);
    bool _3171 = _3169 >= 2;
    bool _3173 = !_3171;
    float _3175 = as_type<float>(_3169);
    float _3177 = _3161;
    float _3179 = _3155;
    float _3181 = _3149;
    float _3183 = _3109;
    float _3185 = _3111;
    float _3187 = _3113;
    float _3189 = _3115;
    float _3191 = _3125;
    float _3193 = _3127;
    float _3195 = _3129;
    float _3197 = _3131;
    float _3199 = _3133;
    float _3201 = _3135;
    float _3203 = _3137;
    float _3205 = _3139;
    float _3223;
    float _3225;
    float _3227;
    float _3229;
    if (!_3173)
    {
        bool _3207 = _3169 >= 3;
        bool _3209 = !_3207;
        if (!_3209)
        {
            bool _3211 = _3169 != 3;
            _3213 = _3211;
            if (!_3213)
            {
                float _3215 = _112 + _3109;
                float _3217 = _114 + _3111;
                float _3219 = _116 + _3113;
                float _3221 = _3115 + 1.0;
                _3183 = _3215;
                _3185 = _3217;
                _3187 = _3219;
                _3189 = _3221;
                _3223 = _3117;
                _3225 = _3119;
                _3227 = _3121;
                _3229 = _3123;
                _3231 = true;
            }
        }
        else
        {
            float _3233 = _112 + _3125;
            float _3235 = _114 + _3127;
            float _3237 = _116 + _3129;
            float _3239 = _3131 + 1.0;
            _3223 = _3117;
            _3225 = _3119;
            _3227 = _3121;
            _3229 = _3123;
            _3191 = _3233;
            _3193 = _3235;
            _3195 = _3237;
            _3197 = _3239;
            _3231 = true;
        }
    }
    if ((!_3231) || _3213)
    {
        bool _3241;
        if (!_3213)
        {
            _3241 = _3169 >= 1;
        }
        if ((!_3241) || _3213)
        {
            if (!_3213)
            {
                bool _3243 = _3169 != 0;
                if (!_3243)
                {
                    float _3245 = _112 + _3117;
                    _3175 = _3245;
                }
                float _3247 = _3175;
                _3223 = _3247;
                if (!_3243)
                {
                    float _3249 = _114 + _3119;
                    _3177 = _3249;
                }
                float _3251 = _3177;
                _3225 = _3251;
                if (!_3243)
                {
                    float _3253 = _116 + _3121;
                    _3179 = _3253;
                }
                float _3255 = _3179;
                _3227 = _3255;
                if (!_3243)
                {
                    float _3257 = _3123 + 1.0;
                    _3181 = _3257;
                }
                float _3259 = _3181;
                bool _3261 = !_3243;
                _3229 = _3259;
                _3231 = _3261;
            }
            if ((!_3231) || _3213)
            {
                _3213 = false;
                _3223 = _3117;
                _3225 = _3119;
                _3227 = _3121;
                _3229 = _3123;
                _3231 = true;
            }
        }
        else
        {
            float _3263 = _112 + _3133;
            float _3265 = _114 + _3135;
            float _3267 = _116 + _3137;
            float _3269 = _3139 + 1.0;
            _3223 = _3117;
            _3225 = _3119;
            _3227 = _3121;
            _3229 = _3123;
            _3199 = _3263;
            _3201 = _3265;
            _3203 = _3267;
            _3205 = _3269;
        }
    }
    _3231 = false;
    float _3271 = _3183;
    float _3273 = _3185;
    float _3275 = _3187;
    float _3277 = _3189;
    float _3279 = _3223;
    float _3281 = _3225;
    float _3283 = _3227;
    float _3285 = _3229;
    float _3287 = _3191;
    float _3289 = _3193;
    float _3291 = _3195;
    float _3293 = _3197;
    float _3295 = _3199;
    float _3297 = _3201;
    float _3299 = _3203;
    float _3301 = _3205;
    float _3303 = -_2490;
    float _3305 = _122 + _3303;
    float _3307 = -_2494;
    float _3309 = _120 + _3307;
    float _3311 = _2504 * _3305;
    float _3313 = -_2498;
    float _3315 = _124 + _3313;
    float _3317 = fma(_2508, _3309, _3311);
    float _3319 = fma(_2512, _3315, _3317);
    float _3321 = _2540 * _3319;
    float _3323 = rint(_3321);
    float _3325 = precise::max(0.0, _3323);
    float _3327 = precise::min(_3325, 3.0);
    float _3329 = trunc(_3327);
    int _3331 = int(_3329);
    bool _3333 = _3331 >= 2;
    bool _3335 = !_3333;
    float _3337 = as_type<float>(_3331);
    float _3339 = _3323;
    float _3341 = _3317;
    float _3343 = _3311;
    float _3345 = _3271;
    float _3347 = _3273;
    float _3349 = _3275;
    float _3351 = _3277;
    float _3353 = _3287;
    float _3355 = _3289;
    float _3357 = _3291;
    float _3359 = _3293;
    float _3361 = _3295;
    float _3363 = _3297;
    float _3365 = _3299;
    float _3367 = _3301;
    float _3385;
    float _3387;
    float _3389;
    float _3391;
    if (!_3335)
    {
        bool _3369 = _3331 >= 3;
        bool _3371 = !_3369;
        if (!_3371)
        {
            bool _3373 = _3331 != 3;
            _3375 = _3373;
            if (!_3375)
            {
                float _3377 = _120 + _3271;
                float _3379 = _122 + _3273;
                float _3381 = _124 + _3275;
                float _3383 = _3277 + 1.0;
                _3345 = _3377;
                _3347 = _3379;
                _3349 = _3381;
                _3351 = _3383;
                _3385 = _3279;
                _3387 = _3281;
                _3389 = _3283;
                _3391 = _3285;
                _3393 = true;
            }
        }
        else
        {
            float _3395 = _120 + _3287;
            float _3397 = _122 + _3289;
            float _3399 = _124 + _3291;
            float _3401 = _3293 + 1.0;
            _3385 = _3279;
            _3387 = _3281;
            _3389 = _3283;
            _3391 = _3285;
            _3353 = _3395;
            _3355 = _3397;
            _3357 = _3399;
            _3359 = _3401;
            _3393 = true;
        }
    }
    if ((!_3393) || _3375)
    {
        bool _3403;
        if (!_3375)
        {
            _3403 = _3331 >= 1;
        }
        if ((!_3403) || _3375)
        {
            if (!_3375)
            {
                bool _3405 = _3331 != 0;
                if (!_3405)
                {
                    float _3407 = _120 + _3279;
                    _3337 = _3407;
                }
                float _3409 = _3337;
                _3385 = _3409;
                if (!_3405)
                {
                    float _3411 = _122 + _3281;
                    _3339 = _3411;
                }
                float _3413 = _3339;
                _3387 = _3413;
                if (!_3405)
                {
                    float _3415 = _124 + _3283;
                    _3341 = _3415;
                }
                float _3417 = _3341;
                _3389 = _3417;
                if (!_3405)
                {
                    float _3419 = _3285 + 1.0;
                    _3343 = _3419;
                }
                float _3421 = _3343;
                bool _3423 = !_3405;
                _3391 = _3421;
                _3393 = _3423;
            }
            if ((!_3393) || _3375)
            {
                _3375 = false;
                _3385 = _3279;
                _3387 = _3281;
                _3389 = _3283;
                _3391 = _3285;
                _3393 = true;
            }
        }
        else
        {
            float _3425 = _120 + _3295;
            float _3427 = _122 + _3297;
            float _3429 = _124 + _3299;
            float _3431 = _3301 + 1.0;
            _3385 = _3279;
            _3387 = _3281;
            _3389 = _3283;
            _3391 = _3285;
            _3361 = _3425;
            _3363 = _3427;
            _3365 = _3429;
            _3367 = _3431;
        }
    }
    _3393 = false;
    float _3433 = _3345;
    float _3435 = _3347;
    float _3437 = _3349;
    float _3439 = _3351;
    float _3441 = _3385;
    float _3443 = _3387;
    float _3445 = _3389;
    float _3447 = _3391;
    float _3449 = _3353;
    float _3451 = _3355;
    float _3453 = _3357;
    float _3455 = _3359;
    float _3457 = _3361;
    float _3459 = _3363;
    float _3461 = _3365;
    float _3463 = _3367;
    float _3465 = -_2490;
    float _3467 = _130 + _3465;
    float _3469 = -_2494;
    float _3471 = _128 + _3469;
    float _3473 = _2504 * _3467;
    float _3475 = -_2498;
    float _3477 = _132 + _3475;
    float _3479 = fma(_2508, _3471, _3473);
    float _3481 = fma(_2512, _3477, _3479);
    float _3483 = _2540 * _3481;
    float _3485 = rint(_3483);
    float _3487 = precise::max(0.0, _3485);
    float _3489 = precise::min(_3487, 3.0);
    float _3491 = trunc(_3489);
    int _3493 = int(_3491);
    bool _3495 = _3493 >= 2;
    bool _3497 = !_3495;
    float _3499 = as_type<float>(_3493);
    float _3501 = _3485;
    float _3503 = _3479;
    float _3505 = _3473;
    float _3507 = _3433;
    float _3509 = _3435;
    float _3511 = _3437;
    float _3513 = _3439;
    float _3515 = _3449;
    float _3517 = _3451;
    float _3519 = _3453;
    float _3521 = _3455;
    float _3523 = _3457;
    float _3525 = _3459;
    float _3527 = _3461;
    float _3529 = _3463;
    float _3547;
    float _3549;
    float _3551;
    float _3553;
    if (!_3497)
    {
        bool _3531 = _3493 >= 3;
        bool _3533 = !_3531;
        if (!_3533)
        {
            bool _3535 = _3493 != 3;
            _3537 = _3535;
            if (!_3537)
            {
                float _3539 = _128 + _3433;
                float _3541 = _130 + _3435;
                float _3543 = _132 + _3437;
                float _3545 = _3439 + 1.0;
                _3507 = _3539;
                _3509 = _3541;
                _3511 = _3543;
                _3513 = _3545;
                _3547 = _3441;
                _3549 = _3443;
                _3551 = _3445;
                _3553 = _3447;
                _3555 = true;
            }
        }
        else
        {
            float _3557 = _128 + _3449;
            float _3559 = _130 + _3451;
            float _3561 = _132 + _3453;
            float _3563 = _3455 + 1.0;
            _3547 = _3441;
            _3549 = _3443;
            _3551 = _3445;
            _3553 = _3447;
            _3515 = _3557;
            _3517 = _3559;
            _3519 = _3561;
            _3521 = _3563;
            _3555 = true;
        }
    }
    if ((!_3555) || _3537)
    {
        bool _3565;
        if (!_3537)
        {
            _3565 = _3493 >= 1;
        }
        if ((!_3565) || _3537)
        {
            if (!_3537)
            {
                bool _3567 = _3493 != 0;
                if (!_3567)
                {
                    float _3569 = _128 + _3441;
                    _3499 = _3569;
                }
                float _3571 = _3499;
                _3547 = _3571;
                if (!_3567)
                {
                    float _3573 = _130 + _3443;
                    _3501 = _3573;
                }
                float _3575 = _3501;
                _3549 = _3575;
                if (!_3567)
                {
                    float _3577 = _132 + _3445;
                    _3503 = _3577;
                }
                float _3579 = _3503;
                _3551 = _3579;
                if (!_3567)
                {
                    float _3581 = _3447 + 1.0;
                    _3505 = _3581;
                }
                float _3583 = _3505;
                bool _3585 = !_3567;
                _3553 = _3583;
                _3555 = _3585;
            }
            if ((!_3555) || _3537)
            {
                _3537 = false;
                _3547 = _3441;
                _3549 = _3443;
                _3551 = _3445;
                _3553 = _3447;
                _3555 = true;
            }
        }
        else
        {
            float _3587 = _128 + _3457;
            float _3589 = _130 + _3459;
            float _3591 = _132 + _3461;
            float _3593 = _3463 + 1.0;
            _3547 = _3441;
            _3549 = _3443;
            _3551 = _3445;
            _3553 = _3447;
            _3523 = _3587;
            _3525 = _3589;
            _3527 = _3591;
            _3529 = _3593;
        }
    }
    _3555 = false;
    float _3595 = _3507;
    float _3597 = _3509;
    float _3599 = _3511;
    float _3601 = _3513;
    float _3603 = _3547;
    float _3605 = _3549;
    float _3607 = _3551;
    float _3609 = _3553;
    float _3611 = _3515;
    float _3613 = _3517;
    float _3615 = _3519;
    float _3617 = _3521;
    float _3619 = _3523;
    float _3621 = _3525;
    float _3623 = _3527;
    float _3625 = _3529;
    float _3627 = -_2490;
    float _3629 = _138 + _3627;
    float _3631 = -_2494;
    float _3633 = _136 + _3631;
    float _3635 = _2504 * _3629;
    float _3637 = -_2498;
    float _3639 = _140 + _3637;
    float _3641 = fma(_2508, _3633, _3635);
    float _3643 = fma(_2512, _3639, _3641);
    float _3645 = _2540 * _3643;
    float _3647 = rint(_3645);
    float _3649 = precise::max(0.0, _3647);
    float _3651 = precise::min(_3649, 3.0);
    float _3653 = trunc(_3651);
    int _3655 = int(_3653);
    bool _3657 = _3655 >= 2;
    bool _3659 = !_3657;
    float _3661 = as_type<float>(_3655);
    float _3663 = _3647;
    float _3665 = _3641;
    float _3667 = _3635;
    float _3669 = _3595;
    float _3671 = _3597;
    float _3673 = _3599;
    float _3675 = _3601;
    float _3677 = _3611;
    float _3679 = _3613;
    float _3681 = _3615;
    float _3683 = _3617;
    float _3685 = _3619;
    float _3687 = _3621;
    float _3689 = _3623;
    float _3691 = _3625;
    float _3709;
    float _3711;
    float _3713;
    float _3715;
    if (!_3659)
    {
        bool _3693 = _3655 >= 3;
        bool _3695 = !_3693;
        if (!_3695)
        {
            bool _3697 = _3655 != 3;
            _3699 = _3697;
            if (!_3699)
            {
                float _3701 = _136 + _3595;
                float _3703 = _138 + _3597;
                float _3705 = _140 + _3599;
                float _3707 = _3601 + 1.0;
                _3669 = _3701;
                _3671 = _3703;
                _3673 = _3705;
                _3675 = _3707;
                _3709 = _3603;
                _3711 = _3605;
                _3713 = _3607;
                _3715 = _3609;
                _3717 = true;
            }
        }
        else
        {
            float _3719 = _136 + _3611;
            float _3721 = _138 + _3613;
            float _3723 = _140 + _3615;
            float _3725 = _3617 + 1.0;
            _3709 = _3603;
            _3711 = _3605;
            _3713 = _3607;
            _3715 = _3609;
            _3677 = _3719;
            _3679 = _3721;
            _3681 = _3723;
            _3683 = _3725;
            _3717 = true;
        }
    }
    if ((!_3717) || _3699)
    {
        bool _3727;
        if (!_3699)
        {
            _3727 = _3655 >= 1;
        }
        if ((!_3727) || _3699)
        {
            if (!_3699)
            {
                bool _3729 = _3655 != 0;
                if (!_3729)
                {
                    float _3731 = _136 + _3603;
                    _3661 = _3731;
                }
                float _3733 = _3661;
                _3709 = _3733;
                if (!_3729)
                {
                    float _3735 = _138 + _3605;
                    _3663 = _3735;
                }
                float _3737 = _3663;
                _3711 = _3737;
                if (!_3729)
                {
                    float _3739 = _140 + _3607;
                    _3665 = _3739;
                }
                float _3741 = _3665;
                _3713 = _3741;
                if (!_3729)
                {
                    float _3743 = _3609 + 1.0;
                    _3667 = _3743;
                }
                float _3745 = _3667;
                bool _3747 = !_3729;
                _3715 = _3745;
                _3717 = _3747;
            }
            if ((!_3717) || _3699)
            {
                _3699 = false;
                _3709 = _3603;
                _3711 = _3605;
                _3713 = _3607;
                _3715 = _3609;
                _3717 = true;
            }
        }
        else
        {
            float _3749 = _136 + _3619;
            float _3751 = _138 + _3621;
            float _3753 = _140 + _3623;
            float _3755 = _3625 + 1.0;
            _3709 = _3603;
            _3711 = _3605;
            _3713 = _3607;
            _3715 = _3609;
            _3685 = _3749;
            _3687 = _3751;
            _3689 = _3753;
            _3691 = _3755;
        }
    }
    _3717 = false;
    float _3757 = _3669;
    float _3759 = _3671;
    float _3761 = _3673;
    float _3763 = _3675;
    float _3765 = _3709;
    float _3767 = _3711;
    float _3769 = _3713;
    float _3771 = _3715;
    float _3773 = _3677;
    float _3775 = _3679;
    float _3777 = _3681;
    float _3779 = _3683;
    float _3781 = _3685;
    float _3783 = _3687;
    float _3785 = _3689;
    float _3787 = _3691;
    float _3789 = -_2490;
    float _3791 = _146 + _3789;
    float _3793 = -_2494;
    float _3795 = _144 + _3793;
    float _3797 = _2504 * _3791;
    float _3799 = -_2498;
    float _3801 = _148 + _3799;
    float _3803 = fma(_2508, _3795, _3797);
    float _3805 = fma(_2512, _3801, _3803);
    float _3807 = _2540 * _3805;
    float _3809 = rint(_3807);
    float _3811 = precise::max(0.0, _3809);
    float _3813 = precise::min(_3811, 3.0);
    float _3815 = trunc(_3813);
    int _3817 = int(_3815);
    bool _3819 = _3817 >= 2;
    bool _3821 = !_3819;
    float _3823 = as_type<float>(_3817);
    float _3825 = _3809;
    float _3827 = _3803;
    float _3829 = _3797;
    float _3831 = _3757;
    float _3833 = _3759;
    float _3835 = _3761;
    float _3837 = _3763;
    float _3839 = _3773;
    float _3841 = _3775;
    float _3843 = _3777;
    float _3845 = _3779;
    float _3847 = _3781;
    float _3849 = _3783;
    float _3851 = _3785;
    float _3853 = _3787;
    float _3871;
    float _3873;
    float _3875;
    float _3877;
    if (!_3821)
    {
        bool _3855 = _3817 >= 3;
        bool _3857 = !_3855;
        if (!_3857)
        {
            bool _3859 = _3817 != 3;
            _3861 = _3859;
            if (!_3861)
            {
                float _3863 = _144 + _3757;
                float _3865 = _146 + _3759;
                float _3867 = _148 + _3761;
                float _3869 = _3763 + 1.0;
                _3831 = _3863;
                _3833 = _3865;
                _3835 = _3867;
                _3837 = _3869;
                _3871 = _3765;
                _3873 = _3767;
                _3875 = _3769;
                _3877 = _3771;
                _3879 = true;
            }
        }
        else
        {
            float _3881 = _144 + _3773;
            float _3883 = _146 + _3775;
            float _3885 = _148 + _3777;
            float _3887 = _3779 + 1.0;
            _3871 = _3765;
            _3873 = _3767;
            _3875 = _3769;
            _3877 = _3771;
            _3839 = _3881;
            _3841 = _3883;
            _3843 = _3885;
            _3845 = _3887;
            _3879 = true;
        }
    }
    if ((!_3879) || _3861)
    {
        bool _3889;
        if (!_3861)
        {
            _3889 = _3817 >= 1;
        }
        if ((!_3889) || _3861)
        {
            if (!_3861)
            {
                bool _3891 = _3817 != 0;
                if (!_3891)
                {
                    float _3893 = _144 + _3765;
                    _3823 = _3893;
                }
                float _3895 = _3823;
                _3871 = _3895;
                if (!_3891)
                {
                    float _3897 = _146 + _3767;
                    _3825 = _3897;
                }
                float _3899 = _3825;
                _3873 = _3899;
                if (!_3891)
                {
                    float _3901 = _148 + _3769;
                    _3827 = _3901;
                }
                float _3903 = _3827;
                _3875 = _3903;
                if (!_3891)
                {
                    float _3905 = _3771 + 1.0;
                    _3829 = _3905;
                }
                float _3907 = _3829;
                bool _3909 = !_3891;
                _3877 = _3907;
                _3879 = _3909;
            }
            if ((!_3879) || _3861)
            {
                _3861 = false;
                _3871 = _3765;
                _3873 = _3767;
                _3875 = _3769;
                _3877 = _3771;
                _3879 = true;
            }
        }
        else
        {
            float _3911 = _144 + _3781;
            float _3913 = _146 + _3783;
            float _3915 = _148 + _3785;
            float _3917 = _3787 + 1.0;
            _3871 = _3765;
            _3873 = _3767;
            _3875 = _3769;
            _3877 = _3771;
            _3847 = _3911;
            _3849 = _3913;
            _3851 = _3915;
            _3853 = _3917;
        }
    }
    _3879 = false;
    float _3919 = _3831;
    float _3921 = _3833;
    float _3923 = _3835;
    float _3925 = _3837;
    float _3927 = _3871;
    float _3929 = _3873;
    float _3931 = _3875;
    float _3933 = _3877;
    float _3935 = _3839;
    float _3937 = _3841;
    float _3939 = _3843;
    float _3941 = _3845;
    float _3943 = _3847;
    float _3945 = _3849;
    float _3947 = _3851;
    float _3949 = _3853;
    float _3951 = -_2490;
    float _3953 = _154 + _3951;
    float _3955 = -_2494;
    float _3957 = _152 + _3955;
    float _3959 = _2504 * _3953;
    float _3961 = -_2498;
    float _3963 = _156 + _3961;
    float _3965 = fma(_2508, _3957, _3959);
    float _3967 = fma(_2512, _3963, _3965);
    float _3969 = _2540 * _3967;
    float _3971 = rint(_3969);
    float _3973 = precise::max(0.0, _3971);
    float _3975 = precise::min(_3973, 3.0);
    float _3977 = trunc(_3975);
    int _3979 = int(_3977);
    bool _3981 = _3979 >= 2;
    bool _3983 = !_3981;
    float _3985 = as_type<float>(_3979);
    float _3987 = _3971;
    float _3989 = _3965;
    float _3991 = _3959;
    float _3993 = _3919;
    float _3995 = _3921;
    float _3997 = _3923;
    float _3999 = _3925;
    float _4001 = _3935;
    float _4003 = _3937;
    float _4005 = _3939;
    float _4007 = _3941;
    float _4009 = _3943;
    float _4011 = _3945;
    float _4013 = _3947;
    float _4015 = _3949;
    float _4033;
    float _4035;
    float _4037;
    float _4039;
    if (!_3983)
    {
        bool _4017 = _3979 >= 3;
        bool _4019 = !_4017;
        if (!_4019)
        {
            bool _4021 = _3979 != 3;
            _4023 = _4021;
            if (!_4023)
            {
                float _4025 = _152 + _3919;
                float _4027 = _154 + _3921;
                float _4029 = _156 + _3923;
                float _4031 = _3925 + 1.0;
                _3993 = _4025;
                _3995 = _4027;
                _3997 = _4029;
                _3999 = _4031;
                _4033 = _3927;
                _4035 = _3929;
                _4037 = _3931;
                _4039 = _3933;
                _4041 = true;
            }
        }
        else
        {
            float _4043 = _152 + _3935;
            float _4045 = _154 + _3937;
            float _4047 = _156 + _3939;
            float _4049 = _3941 + 1.0;
            _4033 = _3927;
            _4035 = _3929;
            _4037 = _3931;
            _4039 = _3933;
            _4001 = _4043;
            _4003 = _4045;
            _4005 = _4047;
            _4007 = _4049;
            _4041 = true;
        }
    }
    if ((!_4041) || _4023)
    {
        bool _4051;
        if (!_4023)
        {
            _4051 = _3979 >= 1;
        }
        if ((!_4051) || _4023)
        {
            if (!_4023)
            {
                bool _4053 = _3979 != 0;
                if (!_4053)
                {
                    float _4055 = _152 + _3927;
                    _3985 = _4055;
                }
                float _4057 = _3985;
                _4033 = _4057;
                if (!_4053)
                {
                    float _4059 = _154 + _3929;
                    _3987 = _4059;
                }
                float _4061 = _3987;
                _4035 = _4061;
                if (!_4053)
                {
                    float _4063 = _156 + _3931;
                    _3989 = _4063;
                }
                float _4065 = _3989;
                _4037 = _4065;
                if (!_4053)
                {
                    float _4067 = _3933 + 1.0;
                    _3991 = _4067;
                }
                float _4069 = _3991;
                bool _4071 = !_4053;
                _4039 = _4069;
                _4041 = _4071;
            }
            if ((!_4041) || _4023)
            {
                _4023 = false;
                _4033 = _3927;
                _4035 = _3929;
                _4037 = _3931;
                _4039 = _3933;
                _4041 = true;
            }
        }
        else
        {
            float _4073 = _152 + _3943;
            float _4075 = _154 + _3945;
            float _4077 = _156 + _3947;
            float _4079 = _3949 + 1.0;
            _4033 = _3927;
            _4035 = _3929;
            _4037 = _3931;
            _4039 = _3933;
            _4009 = _4073;
            _4011 = _4075;
            _4013 = _4077;
            _4015 = _4079;
        }
    }
    _4041 = false;
    float _4081 = _3993;
    float _4083 = _3995;
    float _4085 = _3997;
    float _4087 = _3999;
    float _4089 = _4033;
    float _4091 = _4035;
    float _4093 = _4037;
    float _4095 = _4039;
    float _4097 = _4001;
    float _4099 = _4003;
    float _4101 = _4005;
    float _4103 = _4007;
    float _4105 = _4009;
    float _4107 = _4011;
    float _4109 = _4013;
    float _4111 = _4015;
    float _4113 = -_2490;
    float _4115 = _162 + _4113;
    float _4117 = -_2494;
    float _4119 = _160 + _4117;
    float _4121 = _2504 * _4115;
    float _4123 = -_2498;
    float _4125 = _164 + _4123;
    float _4127 = fma(_2508, _4119, _4121);
    float _4129 = fma(_2512, _4125, _4127);
    float _4131 = _2540 * _4129;
    float _4133 = rint(_4131);
    float _4135 = precise::max(0.0, _4133);
    float _4137 = precise::min(_4135, 3.0);
    float _4139 = trunc(_4137);
    int _4141 = int(_4139);
    bool _4143 = _4141 >= 2;
    bool _4145 = !_4143;
    float _4147 = as_type<float>(_4141);
    float _4149 = _4133;
    float _4151 = _4127;
    float _4153 = _4121;
    float _4155 = _4081;
    float _4157 = _4083;
    float _4159 = _4085;
    float _4161 = _4087;
    float _4163 = _4097;
    float _4165 = _4099;
    float _4167 = _4101;
    float _4169 = _4103;
    float _4171 = _4105;
    float _4173 = _4107;
    float _4175 = _4109;
    float _4177 = _4111;
    float _4195;
    float _4197;
    float _4199;
    float _4201;
    if (!_4145)
    {
        bool _4179 = _4141 >= 3;
        bool _4181 = !_4179;
        if (!_4181)
        {
            bool _4183 = _4141 != 3;
            _4185 = _4183;
            if (!_4185)
            {
                float _4187 = _160 + _4081;
                float _4189 = _162 + _4083;
                float _4191 = _164 + _4085;
                float _4193 = _4087 + 1.0;
                _4155 = _4187;
                _4157 = _4189;
                _4159 = _4191;
                _4161 = _4193;
                _4195 = _4089;
                _4197 = _4091;
                _4199 = _4093;
                _4201 = _4095;
                _4203 = true;
            }
        }
        else
        {
            float _4205 = _160 + _4097;
            float _4207 = _162 + _4099;
            float _4209 = _164 + _4101;
            float _4211 = _4103 + 1.0;
            _4195 = _4089;
            _4197 = _4091;
            _4199 = _4093;
            _4201 = _4095;
            _4163 = _4205;
            _4165 = _4207;
            _4167 = _4209;
            _4169 = _4211;
            _4203 = true;
        }
    }
    if ((!_4203) || _4185)
    {
        bool _4213;
        if (!_4185)
        {
            _4213 = _4141 >= 1;
        }
        if ((!_4213) || _4185)
        {
            if (!_4185)
            {
                bool _4215 = _4141 != 0;
                if (!_4215)
                {
                    float _4217 = _160 + _4089;
                    _4147 = _4217;
                }
                float _4219 = _4147;
                _4195 = _4219;
                if (!_4215)
                {
                    float _4221 = _162 + _4091;
                    _4149 = _4221;
                }
                float _4223 = _4149;
                _4197 = _4223;
                if (!_4215)
                {
                    float _4225 = _164 + _4093;
                    _4151 = _4225;
                }
                float _4227 = _4151;
                _4199 = _4227;
                if (!_4215)
                {
                    float _4229 = _4095 + 1.0;
                    _4153 = _4229;
                }
                float _4231 = _4153;
                bool _4233 = !_4215;
                _4201 = _4231;
                _4203 = _4233;
            }
            if ((!_4203) || _4185)
            {
                _4185 = false;
                _4195 = _4089;
                _4197 = _4091;
                _4199 = _4093;
                _4201 = _4095;
                _4203 = true;
            }
        }
        else
        {
            float _4235 = _160 + _4105;
            float _4237 = _162 + _4107;
            float _4239 = _164 + _4109;
            float _4241 = _4111 + 1.0;
            _4195 = _4089;
            _4197 = _4091;
            _4199 = _4093;
            _4201 = _4095;
            _4171 = _4235;
            _4173 = _4237;
            _4175 = _4239;
            _4177 = _4241;
        }
    }
    _4203 = false;
    float _4243 = _4155;
    float _4245 = _4157;
    float _4247 = _4159;
    float _4249 = _4161;
    float _4251 = _4195;
    float _4253 = _4197;
    float _4255 = _4199;
    float _4257 = _4201;
    float _4259 = _4163;
    float _4261 = _4165;
    float _4263 = _4167;
    float _4265 = _4169;
    float _4267 = _4171;
    float _4269 = _4173;
    float _4271 = _4175;
    float _4273 = _4177;
    float _4275 = -_2490;
    float _4277 = _170 + _4275;
    float _4279 = -_2494;
    float _4281 = _168 + _4279;
    float _4283 = _2504 * _4277;
    float _4285 = -_2498;
    float _4287 = _172 + _4285;
    float _4289 = fma(_2508, _4281, _4283);
    float _4291 = fma(_2512, _4287, _4289);
    float _4293 = _2540 * _4291;
    float _4295 = rint(_4293);
    float _4297 = precise::max(0.0, _4295);
    float _4299 = precise::min(_4297, 3.0);
    float _4301 = trunc(_4299);
    int _4303 = int(_4301);
    bool _4305 = _4303 >= 2;
    bool _4307 = !_4305;
    float _4309 = as_type<float>(_4303);
    float _4311 = _4295;
    float _4313 = _4289;
    float _4315 = _4283;
    float _4317 = _4243;
    float _4319 = _4245;
    float _4321 = _4247;
    float _4323 = _4249;
    float _4325 = _4259;
    float _4327 = _4261;
    float _4329 = _4263;
    float _4331 = _4265;
    float _4333 = _4267;
    float _4335 = _4269;
    float _4337 = _4271;
    float _4339 = _4273;
    float _4357;
    float _4359;
    float _4361;
    float _4363;
    if (!_4307)
    {
        bool _4341 = _4303 >= 3;
        bool _4343 = !_4341;
        if (!_4343)
        {
            bool _4345 = _4303 != 3;
            _4347 = _4345;
            if (!_4347)
            {
                float _4349 = _168 + _4243;
                float _4351 = _170 + _4245;
                float _4353 = _172 + _4247;
                float _4355 = _4249 + 1.0;
                _4317 = _4349;
                _4319 = _4351;
                _4321 = _4353;
                _4323 = _4355;
                _4357 = _4251;
                _4359 = _4253;
                _4361 = _4255;
                _4363 = _4257;
                _4365 = true;
            }
        }
        else
        {
            float _4367 = _168 + _4259;
            float _4369 = _170 + _4261;
            float _4371 = _172 + _4263;
            float _4373 = _4265 + 1.0;
            _4357 = _4251;
            _4359 = _4253;
            _4361 = _4255;
            _4363 = _4257;
            _4325 = _4367;
            _4327 = _4369;
            _4329 = _4371;
            _4331 = _4373;
            _4365 = true;
        }
    }
    if ((!_4365) || _4347)
    {
        bool _4375;
        if (!_4347)
        {
            _4375 = _4303 >= 1;
        }
        if ((!_4375) || _4347)
        {
            if (!_4347)
            {
                bool _4377 = _4303 != 0;
                if (!_4377)
                {
                    float _4379 = _168 + _4251;
                    _4309 = _4379;
                }
                float _4381 = _4309;
                _4357 = _4381;
                if (!_4377)
                {
                    float _4383 = _170 + _4253;
                    _4311 = _4383;
                }
                float _4385 = _4311;
                _4359 = _4385;
                if (!_4377)
                {
                    float _4387 = _172 + _4255;
                    _4313 = _4387;
                }
                float _4389 = _4313;
                _4361 = _4389;
                if (!_4377)
                {
                    float _4391 = _4257 + 1.0;
                    _4315 = _4391;
                }
                float _4393 = _4315;
                bool _4395 = !_4377;
                _4363 = _4393;
                _4365 = _4395;
            }
            if ((!_4365) || _4347)
            {
                _4347 = false;
                _4357 = _4251;
                _4359 = _4253;
                _4361 = _4255;
                _4363 = _4257;
                _4365 = true;
            }
        }
        else
        {
            float _4397 = _168 + _4267;
            float _4399 = _170 + _4269;
            float _4401 = _172 + _4271;
            float _4403 = _4273 + 1.0;
            _4357 = _4251;
            _4359 = _4253;
            _4361 = _4255;
            _4363 = _4257;
            _4333 = _4397;
            _4335 = _4399;
            _4337 = _4401;
            _4339 = _4403;
        }
    }
    _4365 = false;
    float _4405 = _4317;
    float _4407 = _4319;
    float _4409 = _4321;
    float _4411 = _4323;
    float _4413 = _4357;
    float _4415 = _4359;
    float _4417 = _4361;
    float _4419 = _4363;
    float _4421 = _4325;
    float _4423 = _4327;
    float _4425 = _4329;
    float _4427 = _4331;
    float _4429 = _4333;
    float _4431 = _4335;
    float _4433 = _4337;
    float _4435 = _4339;
    float _4437 = -_2490;
    float _4439 = _178 + _4437;
    float _4441 = -_2494;
    float _4443 = _176 + _4441;
    float _4445 = _2504 * _4439;
    float _4447 = -_2498;
    float _4449 = _180 + _4447;
    float _4451 = fma(_2508, _4443, _4445);
    float _4453 = fma(_2512, _4449, _4451);
    float _4455 = _2540 * _4453;
    float _4457 = rint(_4455);
    float _4459 = precise::max(0.0, _4457);
    float _4461 = precise::min(_4459, 3.0);
    float _4463 = trunc(_4461);
    int _4465 = int(_4463);
    bool _4467 = _4465 >= 2;
    bool _4469 = !_4467;
    float _4471 = as_type<float>(_4465);
    float _4473 = _4457;
    float _4475 = _4451;
    float _4477 = _4445;
    float _4479 = _4405;
    float _4481 = _4407;
    float _4483 = _4409;
    float _4485 = _4411;
    float _4487 = _4421;
    float _4489 = _4423;
    float _4491 = _4425;
    float _4493 = _4427;
    float _4495 = _4429;
    float _4497 = _4431;
    float _4499 = _4433;
    float _4501 = _4435;
    float _4519;
    float _4521;
    float _4523;
    float _4525;
    if (!_4469)
    {
        bool _4503 = _4465 >= 3;
        bool _4505 = !_4503;
        if (!_4505)
        {
            bool _4507 = _4465 != 3;
            _4509 = _4507;
            if (!_4509)
            {
                float _4511 = _176 + _4405;
                float _4513 = _178 + _4407;
                float _4515 = _180 + _4409;
                float _4517 = _4411 + 1.0;
                _4479 = _4511;
                _4481 = _4513;
                _4483 = _4515;
                _4485 = _4517;
                _4519 = _4413;
                _4521 = _4415;
                _4523 = _4417;
                _4525 = _4419;
                _4527 = true;
            }
        }
        else
        {
            float _4529 = _176 + _4421;
            float _4531 = _178 + _4423;
            float _4533 = _180 + _4425;
            float _4535 = _4427 + 1.0;
            _4519 = _4413;
            _4521 = _4415;
            _4523 = _4417;
            _4525 = _4419;
            _4487 = _4529;
            _4489 = _4531;
            _4491 = _4533;
            _4493 = _4535;
            _4527 = true;
        }
    }
    if ((!_4527) || _4509)
    {
        bool _4537;
        if (!_4509)
        {
            _4537 = _4465 >= 1;
        }
        if ((!_4537) || _4509)
        {
            if (!_4509)
            {
                bool _4539 = _4465 != 0;
                if (!_4539)
                {
                    float _4541 = _176 + _4413;
                    _4471 = _4541;
                }
                float _4543 = _4471;
                _4519 = _4543;
                if (!_4539)
                {
                    float _4545 = _178 + _4415;
                    _4473 = _4545;
                }
                float _4547 = _4473;
                _4521 = _4547;
                if (!_4539)
                {
                    float _4549 = _180 + _4417;
                    _4475 = _4549;
                }
                float _4551 = _4475;
                _4523 = _4551;
                if (!_4539)
                {
                    float _4553 = _4419 + 1.0;
                    _4477 = _4553;
                }
                float _4555 = _4477;
                bool _4557 = !_4539;
                _4525 = _4555;
                _4527 = _4557;
            }
            if ((!_4527) || _4509)
            {
                _4509 = false;
                _4519 = _4413;
                _4521 = _4415;
                _4523 = _4417;
                _4525 = _4419;
                _4527 = true;
            }
        }
        else
        {
            float _4559 = _176 + _4429;
            float _4561 = _178 + _4431;
            float _4563 = _180 + _4433;
            float _4565 = _4435 + 1.0;
            _4519 = _4413;
            _4521 = _4415;
            _4523 = _4417;
            _4525 = _4419;
            _4495 = _4559;
            _4497 = _4561;
            _4499 = _4563;
            _4501 = _4565;
        }
    }
    _4527 = false;
    float _4567 = _4479;
    float _4569 = _4481;
    float _4571 = _4483;
    float _4573 = _4485;
    float _4575 = _4519;
    float _4577 = _4521;
    float _4579 = _4523;
    float _4581 = _4525;
    float _4583 = _4487;
    float _4585 = _4489;
    float _4587 = _4491;
    float _4589 = _4493;
    float _4591 = _4495;
    float _4593 = _4497;
    float _4595 = _4499;
    float _4597 = _4501;
    float _4599 = -_2490;
    float _4601 = _186 + _4599;
    float _4603 = -_2494;
    float _4605 = _184 + _4603;
    float _4607 = _2504 * _4601;
    float _4609 = -_2498;
    float _4611 = _188 + _4609;
    float _4613 = fma(_2508, _4605, _4607);
    float _4615 = fma(_2512, _4611, _4613);
    float _4617 = _2540 * _4615;
    float _4619 = rint(_4617);
    float _4621 = precise::max(0.0, _4619);
    float _4623 = precise::min(_4621, 3.0);
    float _4625 = trunc(_4623);
    int _4627 = int(_4625);
    bool _4629 = _4627 >= 2;
    bool _4631 = !_4629;
    float _4633 = as_type<float>(_4627);
    float _4635 = _4619;
    float _4637 = _4613;
    float _4639 = _4607;
    float _4641 = _4567;
    float _4643 = _4569;
    float _4645 = _4571;
    float _4647 = _4573;
    float _4649 = _4583;
    float _4651 = _4585;
    float _4653 = _4587;
    float _4655 = _4589;
    float _4657 = _4591;
    float _4659 = _4593;
    float _4661 = _4595;
    float _4663 = _4597;
    float _4681;
    float _4683;
    float _4685;
    float _4687;
    if (!_4631)
    {
        bool _4665 = _4627 >= 3;
        bool _4667 = !_4665;
        if (!_4667)
        {
            bool _4669 = _4627 != 3;
            _4671 = _4669;
            if (!_4671)
            {
                float _4673 = _184 + _4567;
                float _4675 = _186 + _4569;
                float _4677 = _188 + _4571;
                float _4679 = _4573 + 1.0;
                _4641 = _4673;
                _4643 = _4675;
                _4645 = _4677;
                _4647 = _4679;
                _4681 = _4575;
                _4683 = _4577;
                _4685 = _4579;
                _4687 = _4581;
                _4689 = true;
            }
        }
        else
        {
            float _4691 = _184 + _4583;
            float _4693 = _186 + _4585;
            float _4695 = _188 + _4587;
            float _4697 = _4589 + 1.0;
            _4681 = _4575;
            _4683 = _4577;
            _4685 = _4579;
            _4687 = _4581;
            _4649 = _4691;
            _4651 = _4693;
            _4653 = _4695;
            _4655 = _4697;
            _4689 = true;
        }
    }
    if ((!_4689) || _4671)
    {
        bool _4699;
        if (!_4671)
        {
            _4699 = _4627 >= 1;
        }
        if ((!_4699) || _4671)
        {
            if (!_4671)
            {
                bool _4701 = _4627 != 0;
                if (!_4701)
                {
                    float _4703 = _184 + _4575;
                    _4633 = _4703;
                }
                float _4705 = _4633;
                _4681 = _4705;
                if (!_4701)
                {
                    float _4707 = _186 + _4577;
                    _4635 = _4707;
                }
                float _4709 = _4635;
                _4683 = _4709;
                if (!_4701)
                {
                    float _4711 = _188 + _4579;
                    _4637 = _4711;
                }
                float _4713 = _4637;
                _4685 = _4713;
                if (!_4701)
                {
                    float _4715 = _4581 + 1.0;
                    _4639 = _4715;
                }
                float _4717 = _4639;
                bool _4719 = !_4701;
                _4687 = _4717;
                _4689 = _4719;
            }
            if ((!_4689) || _4671)
            {
                _4671 = false;
                _4681 = _4575;
                _4683 = _4577;
                _4685 = _4579;
                _4687 = _4581;
                _4689 = true;
            }
        }
        else
        {
            float _4721 = _184 + _4591;
            float _4723 = _186 + _4593;
            float _4725 = _188 + _4595;
            float _4727 = _4597 + 1.0;
            _4681 = _4575;
            _4683 = _4577;
            _4685 = _4579;
            _4687 = _4581;
            _4657 = _4721;
            _4659 = _4723;
            _4661 = _4725;
            _4663 = _4727;
        }
    }
    _4689 = false;
    float _4729 = _4641;
    float _4731 = _4643;
    float _4733 = _4645;
    float _4735 = _4647;
    float _4737 = _4681;
    float _4739 = _4683;
    float _4741 = _4685;
    float _4743 = _4687;
    float _4745 = _4649;
    float _4747 = _4651;
    float _4749 = _4653;
    float _4751 = _4655;
    float _4753 = _4657;
    float _4755 = _4659;
    float _4757 = _4661;
    float _4759 = _4663;
    float _4761 = -_2490;
    float _4763 = _194 + _4761;
    float _4765 = -_2494;
    float _4767 = _192 + _4765;
    float _4769 = _2504 * _4763;
    float _4771 = -_2498;
    float _4773 = _196 + _4771;
    float _4775 = fma(_2508, _4767, _4769);
    float _4777 = fma(_2512, _4773, _4775);
    float _4779 = _2540 * _4777;
    float _4781 = rint(_4779);
    float _4783 = precise::max(0.0, _4781);
    float _4785 = precise::min(_4783, 3.0);
    float _4787 = trunc(_4785);
    int _4789 = int(_4787);
    bool _4791 = _4789 >= 2;
    bool _4793 = !_4791;
    float _4795 = as_type<float>(_4789);
    float _4797 = _4781;
    float _4799 = _4775;
    float _4801 = _4769;
    float _4803 = _4729;
    float _4805 = _4731;
    float _4807 = _4733;
    float _4809 = _4735;
    float _4811 = _4745;
    float _4813 = _4747;
    float _4815 = _4749;
    float _4817 = _4751;
    float _4819 = _4753;
    float _4821 = _4755;
    float _4823 = _4757;
    float _4825 = _4759;
    float _4843;
    float _4845;
    float _4847;
    float _4849;
    if (!_4793)
    {
        bool _4827 = _4789 >= 3;
        bool _4829 = !_4827;
        if (!_4829)
        {
            bool _4831 = _4789 != 3;
            _4833 = _4831;
            if (!_4833)
            {
                float _4835 = _192 + _4729;
                float _4837 = _194 + _4731;
                float _4839 = _196 + _4733;
                float _4841 = _4735 + 1.0;
                _4803 = _4835;
                _4805 = _4837;
                _4807 = _4839;
                _4809 = _4841;
                _4843 = _4737;
                _4845 = _4739;
                _4847 = _4741;
                _4849 = _4743;
                _4851 = true;
            }
        }
        else
        {
            float _4853 = _192 + _4745;
            float _4855 = _194 + _4747;
            float _4857 = _196 + _4749;
            float _4859 = _4751 + 1.0;
            _4843 = _4737;
            _4845 = _4739;
            _4847 = _4741;
            _4849 = _4743;
            _4811 = _4853;
            _4813 = _4855;
            _4815 = _4857;
            _4817 = _4859;
            _4851 = true;
        }
    }
    if ((!_4851) || _4833)
    {
        bool _4861;
        if (!_4833)
        {
            _4861 = _4789 >= 1;
        }
        if ((!_4861) || _4833)
        {
            if (!_4833)
            {
                bool _4863 = _4789 != 0;
                if (!_4863)
                {
                    float _4865 = _192 + _4737;
                    _4795 = _4865;
                }
                float _4867 = _4795;
                _4843 = _4867;
                if (!_4863)
                {
                    float _4869 = _194 + _4739;
                    _4797 = _4869;
                }
                float _4871 = _4797;
                _4845 = _4871;
                if (!_4863)
                {
                    float _4873 = _196 + _4741;
                    _4799 = _4873;
                }
                float _4875 = _4799;
                _4847 = _4875;
                if (!_4863)
                {
                    float _4877 = _4743 + 1.0;
                    _4801 = _4877;
                }
                float _4879 = _4801;
                bool _4881 = !_4863;
                _4849 = _4879;
                _4851 = _4881;
            }
            if ((!_4851) || _4833)
            {
                _4833 = false;
                _4843 = _4737;
                _4845 = _4739;
                _4847 = _4741;
                _4849 = _4743;
                _4851 = true;
            }
        }
        else
        {
            float _4883 = _192 + _4753;
            float _4885 = _194 + _4755;
            float _4887 = _196 + _4757;
            float _4889 = _4759 + 1.0;
            _4843 = _4737;
            _4845 = _4739;
            _4847 = _4741;
            _4849 = _4743;
            _4819 = _4883;
            _4821 = _4885;
            _4823 = _4887;
            _4825 = _4889;
        }
    }
    _4851 = false;
    float _4891 = _4803;
    float _4893 = _4805;
    float _4895 = _4807;
    float _4897 = _4809;
    float _4899 = _4843;
    float _4901 = _4845;
    float _4903 = _4847;
    float _4905 = _4849;
    float _4907 = _4811;
    float _4909 = _4813;
    float _4911 = _4815;
    float _4913 = _4817;
    float _4915 = _4819;
    float _4917 = _4821;
    float _4919 = _4823;
    float _4921 = _4825;
    float _4923 = -_2490;
    float _4925 = _202 + _4923;
    float _4927 = -_2494;
    float _4929 = _200 + _4927;
    float _4931 = _2504 * _4925;
    float _4933 = -_2498;
    float _4935 = _204 + _4933;
    float _4937 = fma(_2508, _4929, _4931);
    float _4939 = fma(_2512, _4935, _4937);
    float _4941 = _2540 * _4939;
    float _4943 = rint(_4941);
    float _4945 = precise::max(0.0, _4943);
    float _4947 = precise::min(_4945, 3.0);
    float _4949 = trunc(_4947);
    int _4951 = int(_4949);
    bool _4953 = _4951 >= 2;
    bool _4955 = !_4953;
    float _4957 = as_type<float>(_4951);
    float _4959 = _4935;
    float _4961 = _4943;
    float _4963 = _4937;
    float _4965 = _4921;
    float _4967 = _4913;
    float _4969 = _4907;
    float _4971 = _4897;
    float _4973 = _4915;
    float _4975 = _4919;
    float _4977 = _4909;
    float _4979 = _4911;
    float _4981 = _4917;
    float _4983 = _4893;
    float _4985 = _4891;
    float _4987 = _4895;
    float _5005;
    float _5007;
    float _5009;
    float _5011;
    if (!_4955)
    {
        bool _4989 = _4951 >= 3;
        bool _4991 = !_4989;
        if (!_4991)
        {
            bool _4993 = _4951 != 3;
            _4995 = _4993;
            if (!_4995)
            {
                float _4997 = _200 + _4891;
                float _4999 = _202 + _4893;
                float _5001 = _204 + _4895;
                float _5003 = _4897 + 1.0;
                _5005 = _4905;
                _4971 = _5003;
                _5007 = _4899;
                _5009 = _4903;
                _5011 = _4901;
                _4983 = _4999;
                _4985 = _4997;
                _4987 = _5001;
                _5013 = true;
            }
        }
        else
        {
            float _5015 = _200 + _4907;
            float _5017 = _202 + _4909;
            float _5019 = _204 + _4911;
            float _5021 = _4913 + 1.0;
            _4967 = _5021;
            _4969 = _5015;
            _5005 = _4905;
            _5007 = _4899;
            _4977 = _5017;
            _4979 = _5019;
            _5009 = _4903;
            _5011 = _4901;
            _5013 = true;
        }
    }
    if ((!_5013) || _4995)
    {
        bool _5023;
        if (!_4995)
        {
            _5023 = _4951 >= 1;
        }
        if ((!_5023) || _4995)
        {
            if (!_4995)
            {
                bool _5025 = _4951 != 0;
                if (!_5025)
                {
                    float _5027 = _200 + _4899;
                    _4957 = _5027;
                }
                float _5029 = _4957;
                _5007 = _5029;
                if (!_5025)
                {
                    float _5031 = _202 + _4901;
                    _4959 = _5031;
                }
                float _5033 = _4959;
                _5011 = _5033;
                if (!_5025)
                {
                    float _5035 = _204 + _4903;
                    _4961 = _5035;
                }
                float _5037 = _4961;
                _5009 = _5037;
                if (!_5025)
                {
                    float _5039 = _4905 + 1.0;
                    _4963 = _5039;
                }
                float _5041 = _4963;
                bool _5043 = !_5025;
                _5005 = _5041;
                _5013 = _5043;
            }
            if ((!_5013) || _4995)
            {
                _4995 = false;
                _5005 = _4905;
                _5007 = _4899;
                _5009 = _4903;
                _5011 = _4901;
                _5013 = true;
            }
        }
        else
        {
            float _5045 = _200 + _4915;
            float _5047 = _202 + _4917;
            float _5049 = _204 + _4919;
            float _5051 = _4921 + 1.0;
            _4965 = _5051;
            _5005 = _4905;
            _4973 = _5045;
            _4975 = _5049;
            _5007 = _4899;
            _4981 = _5047;
            _5009 = _4903;
            _5011 = _4901;
        }
    }
    _5013 = false;
    float _5053 = _4965;
    float _5055 = _4967;
    float _5057 = _4969;
    float _5059 = _5005;
    float _5061 = _4971;
    float _5063 = _4973;
    float _5065 = _4975;
    float _5067 = _5007;
    float _5069 = _4977;
    float _5071 = _4979;
    float _5073 = _4981;
    float _5075 = _5009;
    float _5077 = _5011;
    float _5079 = _4983;
    float _5081 = _4985;
    float _5083 = _4987;
    float _5085 = _5053 * 4.0;
    float _5087 = fma(_5055, 4.0, _5053);
    float _5089 = _5055 + _5053;
    float _5091 = _5057 * 6.0;
    float _5093 = fma(_5059, 9.0, _5085);
    float _5095 = fma(_5061, 9.0, _5087);
    float _5097 = _5063 * 6.0;
    float _5099 = _5089 * 2.0;
    float _5101 = _5093 + _5055;
    float _5103 = _5065 * 6.0;
    float _5105 = fma(_5067, 9.0, _5097);
    float _5107 = _5069 * 6.0;
    float _5109 = _5101 * _5095;
    float _5111 = _5071 * 6.0;
    float _5113 = fma(_5063, 3.0, _5091);
    float _5115 = fma(_5073, 3.0, _5107);
    float _5117 = -_5109;
    float _5119 = fma(_5099, _5099, _5117);
    float _5121 = _5073 * 6.0;
    float _5123 = fma(_5075, 9.0, _5103);
    float _5125 = fma(_5065, 3.0, _5111);
    bool _5127 = _5119 != 0.0;
    bool _5129 = isnan(_5119);
    bool _5131 = _5127 || _5129;
    bool _5133 = isnan(0.0);
    bool _5135 = _5131 || _5133;
    float _5137 = fma(_5077, 9.0, _5121);
    float _5139 = fma(_5079, 9.0, _5115);
    float _5141 = fma(_5057, 3.0, _5105);
    float _5143 = fma(_5071, 3.0, _5123);
    float _5145 = fma(_5069, 3.0, _5137);
    float _5147 = fma(_5081, 9.0, _5113);
    float _5149 = fma(_5083, 9.0, _5125);
    bool _5151 = !_5135;
    if (!_5151)
    {
        float _5153 = 1.0 / _5119;
        float _5155 = _5141 * _5095;
        float _5157 = _5101 * _5147;
        float _5159 = _5101 * _5149;
        float _5161 = -_5155;
        float _5163 = fma(_5147, _5099, _5161);
        float _5165 = -_5157;
        float _5167 = fma(_5141, _5099, _5165);
        float _5169 = _5145 * _5095;
        float _5171 = _5101 * _5139;
        float _5173 = _5143 * _5095;
        float _5175 = -_5159;
        float _5177 = fma(_5143, _5099, _5175);
        float _5179 = -_5169;
        float _5181 = fma(_5139, _5099, _5179);
        float _5183 = -_5171;
        float _5185 = fma(_5145, _5099, _5183);
        float _5187 = -_5173;
        float _5189 = fma(_5149, _5099, _5187);
        float _5191 = _5177 * _5153;
        float _5193 = _5167 * _5153;
        float _5195 = _5185 * _5153;
        float _5197 = _5163 * _5153;
        float _5199 = _5181 * _5153;
        float _5201 = _5189 * _5153;
        float _5203 = -_5197;
        float _5205 = _5193 + _5203;
        float _5207 = -_5199;
        float _5209 = _5195 + _5207;
        float _5211 = -_5201;
        float _5213 = _5191 + _5211;
        _2559 = _5205;
        _2561 = _5209;
        _2563 = _5213;
        _2565 = _5197;
        _2567 = _5193;
        _2569 = _5199;
        _2571 = _5195;
        _2573 = _5191;
        _2575 = _5201;
    }
    float _5215 = _2559;
    float _5217 = _2561;
    float _5219 = _2563;
    float _5221 = _2565;
    float _5223 = _2567;
    float _5225 = _2569;
    float _5227 = _2571;
    float _5229 = _2573;
    float _5231 = _2575;
    float _5233 = fma(_5215, 496.0, 0.5);
    float _5235 = precise::clamp(_5233, 0.0, 1.0);
    float _5237 = fma(_5215, -31.0, 1.0);
    float _5239 = precise::clamp(_5237, 0.0, 1.0);
    float _5241 = _5235 + (-0.5);
    float _5243 = fma(_5217, 1008.0, 0.5);
    float _5245 = precise::clamp(_5243, 0.0, 1.0);
    float _5247 = fma(_5219, 496.0, 0.5);
    float _5249 = precise::clamp(_5247, 0.0, 1.0);
    float _5251 = fma(_5217, -63.0, 1.0);
    float _5253 = precise::clamp(_5251, 0.0, 1.0);
    float _5255 = _5239 * _5241;
    float _5257 = _5245 + (-0.5);
    float _5259 = fma(_5219, -31.0, 1.0);
    float _5261 = precise::clamp(_5259, 0.0, 1.0);
    float _5263 = _5249 + (-0.5);
    float _5265 = fma(_5255, -0.0322580635547637939453125, _5221);
    float _5267 = precise::clamp(_5265, 0.0, 1.0);
    float _5269 = _5253 * _5257;
    float _5271 = _5269 * 2.0;
    float _5273 = fma(_5255, 0.0322580635547637939453125, _5223);
    float _5275 = precise::clamp(_5273, 0.0, 1.0);
    float _5277 = _5261 * _5263;
    float _5279 = _5267 * 31.0;
    float _5281 = fma(_5271, -0.01587301678955554962158203125, _5225);
    float _5283 = precise::clamp(_5281, 0.0, 1.0);
    float _5285 = fma(_5271, 0.01587301678955554962158203125, _5227);
    float _5287 = precise::clamp(_5285, 0.0, 1.0);
    float _5289 = _5275 * 31.0;
    float _5291 = fma(_5277, 0.0322580635547637939453125, _5229);
    float _5293 = precise::clamp(_5291, 0.0, 1.0);
    float _5295 = _5283 * 63.0;
    float _5297 = _5287 * 63.0;
    float _5299 = fma(_5277, -0.0322580635547637939453125, _5231);
    float _5301 = precise::clamp(_5299, 0.0, 1.0);
    float _5303 = _5293 * 31.0;
    float _5305 = rint(_5289);
    float _5307 = _5301 * 31.0;
    float _5309 = rint(_5297);
    float _5311 = rint(_5279);
    float _5313 = rint(_5295);
    float _5315 = _5309 + 0.5;
    float _5317 = rint(_5303);
    float _5319 = _5305 + 0.5;
    float _5321 = _5311 + 0.5;
    float _5323 = rint(_5307);
    float _5325 = _5313 + 0.5;
    float _5327 = _5317 + 0.5;
    float _5329 = trunc(_5319);
    float _5331 = precise::max(_5329, 0.0);
    uint _5333 = uint(_5331);
    float _5335 = _5323 + 0.5;
    float _5337 = trunc(_5315);
    float _5339 = precise::max(_5337, 0.0);
    uint _5341 = uint(_5339);
    float _5343 = trunc(_5321);
    float _5345 = precise::max(_5343, 0.0);
    uint _5347 = uint(_5345);
    int _5349 = int(_5333) << 11;
    float _5351 = trunc(_5325);
    float _5353 = precise::max(_5351, 0.0);
    uint _5355 = uint(_5353);
    int _5357 = int(_5341) << 5;
    float _5359 = trunc(_5327);
    float _5361 = precise::max(_5359, 0.0);
    uint _5363 = uint(_5361);
    int _5365 = int(_5347) << 11;
    float _5367 = trunc(_5335);
    float _5369 = precise::max(_5367, 0.0);
    uint _5371 = uint(_5369);
    int _5373 = int(_5355) << 5;
    int _5375 = _5349 | _5357;
    int _5377 = int(_5363) | _5375;
    int _5379 = _5365 | _5373;
    int _5381 = int(_5371) | _5379;
    bool _5383 = _5377 != _5381;
    int _5385 = _5373;
    int _5387 = _5349;
    int _5389 = int(_5347);
    int _5391 = _5377;
    if (!_5383)
    {
        _5385 = _5377;
    }
    int _5393 = _5385;
    int _5395 = _5393;
    if (!_5383)
    {
        _5387 = 0;
    }
    int _5397 = _5387;
    int _5399 = _5397;
    if (!_5383)
    {
        _5389 = 0;
    }
    int _5401 = _5389;
    bool _5403 = !_5383;
    int _5405 = _5401;
    if (!_5403)
    {
        float _5407 = _5305 * 0.0322580635547637939453125;
        float _5409 = _5311 * 0.0322580635547637939453125;
        float _5411 = _5309 * 0.01587301678955554962158203125;
        bool _5413 = uint(_5377) >= uint(_5381);
        float _5415 = _5313 * 0.01587301678955554962158203125;
        float _5417 = _5317 * 0.0322580635547637939453125;
        float _5419 = _5323 * 0.0322580635547637939453125;
        bool _5421 = !_5413;
        float _5423 = _5421 ? _5407 : _5409;
        bool _5425 = !_5413;
        float _5427 = _5425 ? _5409 : _5407;
        bool _5429 = !_5413;
        float _5431 = _5429 ? _5411 : _5415;
        float _5433 = -_5423;
        float _5435 = _136 + _5433;
        bool _5437 = !_5413;
        float _5439 = _5437 ? _5415 : _5411;
        float _5441 = -_5423;
        float _5443 = _5441 + _5427;
        bool _5445 = !_5413;
        float _5447 = _5445 ? _5417 : _5419;
        float _5449 = -_5423;
        float _5451 = _128 + _5449;
        bool _5453 = !_5413;
        float _5455 = _5453 ? _5419 : _5417;
        float _5457 = -_5431;
        float _5459 = _5457 + _5439;
        float _5461 = -_5423;
        float _5463 = _120 + _5461;
        float _5465 = -_5423;
        float _5467 = _112 + _5465;
        float _5469 = -_5423;
        float _5471 = _104 + _5469;
        float _5473 = _5459 * _5459;
        float _5475 = -_5447;
        float _5477 = _5475 + _5455;
        float _5479 = -_5423;
        float _5481 = _96 + _5479;
        float _5483 = -_5423;
        float _5485 = _88 + _5483;
        float _5487 = fma(_5443, _5443, _5473);
        float _5489 = -_5423;
        float _5491 = _80 + _5489;
        float _5493 = -_5423;
        float _5495 = _200 + _5493;
        float _5497 = -_5423;
        float _5499 = _192 + _5497;
        float _5501 = fma(_5477, _5477, _5487);
        float _5503 = -_5423;
        float _5505 = _184 + _5503;
        float _5507 = -_5423;
        float _5509 = _176 + _5507;
        float _5511 = -_5423;
        float _5513 = _168 + _5511;
        float _5515 = -_5423;
        float _5517 = _160 + _5515;
        float _5519 = -_5423;
        float _5521 = _152 + _5519;
        float _5523 = -_5423;
        float _5525 = _144 + _5523;
        float _5527 = -_5431;
        float _5529 = _138 + _5527;
        float _5531 = 1.0 / _5501;
        float _5533 = -_5431;
        float _5535 = _202 + _5533;
        float _5537 = -_5447;
        float _5539 = _140 + _5537;
        float _5541 = -_5431;
        float _5543 = _130 + _5541;
        float _5545 = -_5431;
        float _5547 = _170 + _5545;
        float _5549 = -_5431;
        float _5551 = _162 + _5549;
        float _5553 = -_5447;
        float _5555 = _204 + _5553;
        float _5557 = -_5431;
        float _5559 = _194 + _5557;
        float _5561 = -_5431;
        float _5563 = _122 + _5561;
        float _5565 = -_5431;
        float _5567 = _114 + _5565;
        float _5569 = -_5431;
        float _5571 = _106 + _5569;
        float _5573 = -_5431;
        float _5575 = _98 + _5573;
        float _5577 = -_5431;
        float _5579 = _90 + _5577;
        float _5581 = -_5431;
        float _5583 = _82 + _5581;
        float _5585 = -_5431;
        float _5587 = _186 + _5585;
        float _5589 = -_5431;
        float _5591 = _178 + _5589;
        float _5593 = _5459 * _5531;
        float _5595 = _5443 * _5531;
        float _5597 = _5477 * _5531;
        float _5599 = -_5431;
        float _5601 = _154 + _5599;
        float _5603 = _5593 * _5529;
        float _5605 = _5593 * _5535;
        float _5607 = _5593 * _5543;
        float _5609 = _5593 * _5547;
        float _5611 = fma(_5595, _5435, _5603);
        float _5613 = fma(_5595, _5495, _5605);
        float _5615 = _5593 * _5551;
        float _5617 = -_5431;
        float _5619 = _146 + _5617;
        float _5621 = fma(_5597, _5539, _5611);
        float _5623 = fma(_5597, _5555, _5613);
        float _5625 = -_5447;
        float _5627 = _132 + _5625;
        float _5629 = _5593 * _5559;
        float _5631 = fma(_5595, _5451, _5607);
        bool _5633 = _5621 >= 0.5;
        float _5635 = -_5447;
        float _5637 = _172 + _5635;
        float _5639 = -_5447;
        float _5641 = _164 + _5639;
        float _5643 = fma(_5595, _5513, _5609);
        float _5645 = fma(_5595, _5517, _5615);
        float _5647 = -_5447;
        float _5649 = _196 + _5647;
        float _5651 = _5593 * _5563;
        float _5653 = _5593 * _5567;
        float _5655 = _5593 * _5571;
        float _5657 = _5593 * _5575;
        float _5659 = _5593 * _5579;
        float _5661 = _5593 * _5583;
        float _5663 = _5593 * _5587;
        float _5665 = _5593 * _5591;
        float _5667 = _5593 * _5601;
        float _5669 = _5593 * _5619;
        float _5671 = fma(_5595, _5499, _5629);
        float _5673 = fma(_5597, _5627, _5631);
        bool _5675 = _5623 >= 0.5;
        float _5677 = -_5447;
        float _5679 = _124 + _5677;
        bool _5681 = _5621 >= 0.833000004291534423828125;
        float _5683 = -_5447;
        float _5685 = _116 + _5683;
        float _5687 = -_5447;
        float _5689 = _108 + _5687;
        float _5691 = -_5447;
        float _5693 = _100 + _5691;
        float _5695 = -_5447;
        float _5697 = _92 + _5695;
        float _5699 = -_5447;
        float _5701 = _84 + _5699;
        float _5703 = -_5447;
        float _5705 = _188 + _5703;
        float _5707 = -_5447;
        float _5709 = _180 + _5707;
        float _5711 = -_5447;
        float _5713 = _156 + _5711;
        float _5715 = fma(_5597, _5637, _5643);
        float _5717 = fma(_5597, _5641, _5645);
        float _5719 = -_5447;
        float _5721 = _148 + _5719;
        float _5723 = fma(_5595, _5463, _5651);
        float _5725 = fma(_5595, _5467, _5653);
        float _5727 = fma(_5595, _5471, _5655);
        float _5729 = fma(_5595, _5481, _5657);
        float _5731 = fma(_5595, _5485, _5659);
        float _5733 = fma(_5595, _5491, _5661);
        float _5735 = fma(_5595, _5505, _5663);
        float _5737 = fma(_5595, _5509, _5665);
        float _5739 = fma(_5595, _5521, _5667);
        float _5741 = fma(_5595, _5525, _5669);
        float _5743 = fma(_5597, _5649, _5671);
        bool _5745 = _5621 >= 0.16599999368190765380859375;
        float _5747 = fma(_5597, _5679, _5723);
        float _5749 = fma(_5597, _5685, _5725);
        int _5751 = _5681 ? 0 : 32768;
        float _5753 = fma(_5597, _5689, _5727);
        bool _5755 = _5623 >= 0.833000004291534423828125;
        float _5757 = fma(_5597, _5693, _5729);
        bool _5759 = _5673 >= 0.5;
        float _5761 = fma(_5597, _5697, _5731);
        float _5763 = fma(_5597, _5701, _5733);
        float _5765 = fma(_5597, _5705, _5735);
        float _5767 = fma(_5597, _5709, _5737);
        float _5769 = fma(_5597, _5713, _5739);
        float _5771 = fma(_5597, _5721, _5741);
        int _5773 = _5751;
        if (!_5633)
        {
            int _5775 = _5745 ? 49152 : 16384;
            _5773 = _5775;
        }
        int _5777 = _5773;
        bool _5779 = _5623 >= 0.16599999368190765380859375;
        int _5781 = _5755 ? 0 : 32768;
        bool _5783 = _5743 >= 0.5;
        bool _5785 = _5673 >= 0.833000004291534423828125;
        int _5787 = _5781;
        if (!_5675)
        {
            int _5789 = _5779 ? 49152 : 16384;
            _5787 = _5789;
        }
        int _5791 = _5787;
        bool _5793 = _5673 >= 0.16599999368190765380859375;
        bool _5795 = _5743 >= 0.833000004291534423828125;
        int _5797 = _5785 ? 0 : 8192;
        bool _5799 = _5747 >= 0.5;
        bool _5801 = _5743 >= 0.16599999368190765380859375;
        int _5803 = _5795 ? 0 : 8192;
        int _5805 = _5797;
        int _5807 = _5803;
        if (!_5759)
        {
            int _5809 = _5793 ? 12288 : 4096;
            _5805 = _5809;
        }
        int _5811 = _5805;
        bool _5813 = _5747 >= 0.833000004291534423828125;
        bool _5815 = _5765 >= 0.5;
        if (!_5783)
        {
            int _5817 = _5801 ? 12288 : 4096;
            _5807 = _5817;
        }
        int _5819 = _5807;
        int _5821 = _5813 ? 0 : 2048;
        bool _5823 = _5747 >= 0.16599999368190765380859375;
        bool _5825 = _5765 >= 0.833000004291534423828125;
        bool _5827 = _5749 >= 0.5;
        bool _5829 = _5765 >= 0.16599999368190765380859375;
        int _5831 = _5825 ? 0 : 2048;
        int _5833 = _5821;
        int _5835 = _5831;
        if (!_5799)
        {
            int _5837 = _5823 ? 3072 : 1024;
            _5833 = _5837;
        }
        int _5839 = _5833;
        bool _5841 = _5749 >= 0.833000004291534423828125;
        bool _5843 = _5767 >= 0.5;
        if (!_5815)
        {
            int _5845 = _5829 ? 3072 : 1024;
            _5835 = _5845;
        }
        int _5847 = _5835;
        bool _5849 = _5749 >= 0.16599999368190765380859375;
        int _5851 = _5841 ? 0 : 512;
        bool _5853 = _5753 >= 0.5;
        bool _5855 = _5767 >= 0.833000004291534423828125;
        int _5857 = _5851;
        if (!_5827)
        {
            int _5859 = _5849 ? 768 : 256;
            _5857 = _5859;
        }
        int _5861 = _5857;
        bool _5863 = _5767 >= 0.16599999368190765380859375;
        bool _5865 = _5715 >= 0.5;
        int _5867 = _5855 ? 0 : 512;
        bool _5869 = _5753 >= 0.833000004291534423828125;
        int _5871 = _5867;
        if (!_5843)
        {
            int _5873 = _5863 ? 768 : 256;
            _5871 = _5873;
        }
        int _5875 = _5871;
        bool _5877 = _5753 >= 0.16599999368190765380859375;
        bool _5879 = _5715 >= 0.833000004291534423828125;
        int _5881 = _5869 ? 0 : 128;
        bool _5883 = _5715 >= 0.16599999368190765380859375;
        bool _5885 = _5757 >= 0.5;
        int _5887 = _5879 ? 0 : 128;
        int _5889 = _5881;
        int _5891 = _5887;
        if (!_5853)
        {
            int _5893 = _5877 ? 192 : 64;
            _5889 = _5893;
        }
        int _5895 = _5889;
        bool _5897 = _5757 >= 0.833000004291534423828125;
        bool _5899 = _5717 >= 0.5;
        if (!_5865)
        {
            int _5901 = _5883 ? 192 : 64;
            _5891 = _5901;
        }
        int _5903 = _5891;
        int _5905 = _5897 ? 0 : 32;
        bool _5907 = _5761 >= 0.5;
        bool _5909 = _5757 >= 0.16599999368190765380859375;
        bool _5911 = _5717 >= 0.833000004291534423828125;
        bool _5913 = _5717 >= 0.16599999368190765380859375;
        int _5915 = _5911 ? 0 : 32;
        int _5917 = _5905;
        int _5919 = _5915;
        if (!_5885)
        {
            int _5921 = _5909 ? 48 : 16;
            _5917 = _5921;
        }
        int _5923 = _5917;
        bool _5925 = _5761 >= 0.833000004291534423828125;
        bool _5927 = _5769 >= 0.5;
        if (!_5899)
        {
            int _5929 = _5913 ? 48 : 16;
            _5919 = _5929;
        }
        int _5931 = _5919;
        bool _5933 = _5761 >= 0.16599999368190765380859375;
        bool _5935 = _5769 >= 0.833000004291534423828125;
        int _5937 = _5925 ? 0 : 8;
        int _5939 = _5935 ? 0 : 8;
        int _5941 = _5937;
        int _5943 = _5939;
        if (!_5907)
        {
            int _5945 = _5933 ? 12 : 4;
            _5941 = _5945;
        }
        int _5947 = _5941;
        bool _5949 = _5763 >= 0.5;
        bool _5951 = _5771 >= 0.5;
        bool _5953 = _5769 >= 0.16599999368190765380859375;
        int _5955 = _5839 + _5777;
        int _5957 = _5955 + _5811;
        int _5959 = _5847 + _5791;
        int _5961 = _5959 + _5819;
        if (!_5927)
        {
            int _5963 = _5953 ? 12 : 4;
            _5943 = _5963;
        }
        int _5965 = _5943;
        bool _5967 = _5763 >= 0.833000004291534423828125;
        bool _5969 = _5771 >= 0.833000004291534423828125;
        bool _5971 = _5763 >= 0.16599999368190765380859375;
        bool _5973 = _5771 >= 0.16599999368190765380859375;
        int _5975 = _5895 + _5957;
        int _5977 = _5975 + _5861;
        int _5979 = _5903 + _5961;
        int _5981 = _5979 + _5875;
        int _5983 = _5967 ? 0 : 2;
        int _5985 = _5969 ? 0 : 2;
        int _5987 = _5983;
        int _5989 = _5985;
        if (!_5949)
        {
            int _5991 = _5971 ? 3 : 1;
            _5987 = _5991;
        }
        int _5993 = _5987;
        if (!_5951)
        {
            int _5995 = _5973 ? 3 : 1;
            _5989 = _5995;
        }
        int _5997 = _5989;
        int _5999 = _5947 + _5977;
        int _6001 = _5999 + _5923;
        int _6003 = _5965 + _5981;
        int _6005 = _6003 + _5931;
        bool _6007 = !_5413;
        int _6009 = _6007 ? _5381 : _5377;
        bool _6011 = !_5413;
        int _6013 = _6011 ? _5377 : _5381;
        int _6015 = _6001 + _5993;
        int _6017 = _6005 + _5997;
        _5395 = _6009;
        _5391 = _6013;
        _5399 = _6015;
        _5405 = _6017;
    }
    int _6019 = _5395;
    int _6021 = _5391;
    int _6023 = _5399;
    int _6025 = _5405;
    out.m_32.x = as_type<float>(_6019);
    out.m_32.y = as_type<float>(_6021);
    out.m_32.z = as_type<float>(_6023);
    out.m_32.w = as_type<float>(_6025);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

