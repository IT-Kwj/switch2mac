#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _1506, thread const int& _1507, constant _10& support_buffer)
{
    int _1510 = 1 + _1507;
    float _1512 = support_buffer._m5[_1510].x;
    float _1514 = abs(_1512);
    bool _1516 = _1514 == 1.0;
    if (_1516)
    {
        return _1506;
    }
    float _1518 = float(_1506);
    float _1520 = _1518 / _1514;
    int _1522 = int(_1520);
    return _1522;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_29.z;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    bool _66 = _60 != 0.0;
    bool _68 = isnan(_60);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.0);
    bool _74 = _70 || _72;
    bool _76 = !_74;
    if (!_76)
    {
        float _78 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _80 = fma(_60, _78, 1.0);
        float _82 = log2(_80);
        float _84 = _82 + (-1.0);
        float _86 = trunc(_84);
        int _88 = int(_86);
        float _90 = float(_88);
        float _92 = trunc(_90);
        int _94 = int(_92);
        float _96 = _90 + 1.0;
        float _98 = trunc(_96);
        int _100 = int(_98);
        int _102 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_94), spvDescriptorSet0.fp_t_tcb_8.get_height(_94)).x;
        int _104 = _102;
        int _106 = 0;
        int _108 = _40(_104, _106, (*spvDescriptorSet0.support_buffer));
        int _110 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_94), spvDescriptorSet0.fp_t_tcb_8.get_height(_94)).y;
        int _112 = _110;
        int _114 = 0;
        int _116 = _40(_112, _114, (*spvDescriptorSet0.support_buffer));
        int _118 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_100), spvDescriptorSet0.fp_t_tcb_8.get_height(_100)).x;
        int _120 = _118;
        int _122 = 0;
        int _124 = _40(_120, _122, (*spvDescriptorSet0.support_buffer));
        int _126 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_100), spvDescriptorSet0.fp_t_tcb_8.get_height(_100)).y;
        int _128 = _126;
        int _130 = 0;
        int _132 = _40(_128, _130, (*spvDescriptorSet0.support_buffer));
        float _134 = in.m_31.x;
        float _136 = gl_FragCoord.w;
        float _138 = _134 * _136;
        float _140 = in.m_31.y;
        float _142 = gl_FragCoord.w;
        float _144 = _140 * _142;
        float _146 = _58 * _138;
        float _148 = _58 * _144;
        float _150 = float(_108);
        float _152 = float(_116);
        float _154 = 1.0 / _150;
        float _156 = fma(_146, _150, -0.5);
        float _158 = fma(_148, _152, -0.5);
        float _160 = floor(_156);
        float _162 = floor(_158);
        float _164 = float(_124);
        float _166 = float(_132);
        float _168 = fma(_146, _164, -0.5);
        float _170 = -_160;
        float _172 = _156 + _170;
        float _174 = fma(_148, _166, -0.5);
        float _176 = floor(_168);
        float _178 = -_172;
        float _180 = _178 + 1.0;
        float _182 = -_172;
        float _184 = _182 + 2.0;
        float _186 = _172 * _172;
        float _188 = -_162;
        float _190 = _158 + _188;
        float _192 = _180 * _180;
        float _194 = _184 * _184;
        float _196 = floor(_174);
        float _198 = -_190;
        float _200 = _198 + 1.0;
        float _202 = _180 * _192;
        float _204 = -_190;
        float _206 = _204 + 2.0;
        float _208 = _172 * _186;
        float _210 = _200 * _200;
        float _212 = _202 * 4.0;
        float _214 = _208 * 0.16666667163372039794921875;
        float _216 = _200 * _210;
        float _218 = -_212;
        float _220 = fma(_184, _194, _218);
        float _222 = -_202;
        float _224 = _222 + 6.0;
        float _226 = _206 * _206;
        float _228 = _216 * 4.0;
        float _230 = -_176;
        float _232 = _168 + _230;
        float _234 = -_220;
        float _236 = _234 + _224;
        float _238 = 1.0 / _152;
        float _240 = -_228;
        float _242 = fma(_206, _226, _240);
        float _244 = -_232;
        float _246 = _244 + 1.0;
        float _248 = -_216;
        float _250 = _248 + 6.0;
        float _252 = _236 * 0.16666667163372039794921875;
        float _254 = -_232;
        float _256 = _254 + 2.0;
        float _258 = _246 * _246;
        float _260 = -_242;
        float _262 = _260 + _250;
        float _264 = -_196;
        float _266 = _174 + _264;
        float _268 = _256 * _256;
        float _270 = _246 * _258;
        float _272 = _262 * 0.16666667163372039794921875;
        float _274 = -_266;
        float _276 = _274 + 1.0;
        float _278 = _202 + _220;
        float _280 = _270 * 4.0;
        float _282 = -_270;
        float _284 = _282 + 6.0;
        float _286 = 1.0 / _252;
        float _288 = _278 * 0.16666667163372039794921875;
        float _290 = -_280;
        float _292 = fma(_256, _268, _290);
        float _294 = _276 * _276;
        float _296 = -_266;
        float _298 = _296 + 2.0;
        float _300 = _220 * 0.16666667163372039794921875;
        float _302 = -_292;
        float _304 = _302 + _284;
        float _306 = _276 * _294;
        float _308 = 1.0 / _288;
        float _310 = _298 * _298;
        float _312 = _304 * 0.16666667163372039794921875;
        float _314 = _306 * 4.0;
        float _316 = _216 + _242;
        float _318 = -_306;
        float _320 = _318 + 6.0;
        float _322 = _242 * 0.16666667163372039794921875;
        float _324 = -_314;
        float _326 = fma(_298, _310, _324);
        float _328 = _160 + 1.5;
        float _330 = _316 * 0.16666667163372039794921875;
        float _332 = 1.0 / _272;
        float _334 = _160 + (-0.5);
        float _336 = fma(_214, _286, _328);
        float _338 = _190 * _190;
        float _340 = _270 + _292;
        float _342 = -_326;
        float _344 = _342 + _320;
        float _346 = fma(_300, _308, _334);
        float _348 = _190 * _338;
        float _350 = 1.0 / _330;
        float _352 = _340 * 0.16666667163372039794921875;
        float _354 = _306 + _326;
        float _356 = _162 + (-0.5);
        float _358 = _162 + 1.5;
        float _360 = _348 * 0.16666667163372039794921875;
        float _362 = _344 * 0.16666667163372039794921875;
        float _364 = _354 * 0.16666667163372039794921875;
        float _366 = 1.0 / _312;
        float _368 = fma(_360, _332, _358);
        float _370 = _232 * _232;
        float _372 = _196 + 1.5;
        float _374 = _232 * _370;
        float _376 = _292 * 0.16666667163372039794921875;
        float _378 = 1.0 / _362;
        float _380 = fma(_322, _350, _356);
        float _382 = _346 * _154;
        float _384 = _266 * _266;
        float _386 = _336 * _154;
        float _388 = _380 * _238;
        float _390 = _368 * _238;
        float _392 = _266 * _384;
        float _394 = 1.0 / _364;
        float _396 = _196 + (-0.5);
        float _398 = _176 + (-0.5);
        float _400 = _176 + 1.5;
        float _402 = _326 * 0.16666667163372039794921875;
        float _404 = _392 * 0.16666667163372039794921875;
        float _406 = _374 * 0.16666667163372039794921875;
        float _408 = 1.0 / _352;
        float _410 = fma(_404, _378, _372);
        float _412 = fma(_406, _366, _400);
        float _414 = 1.0 / _166;
        float _416 = fma(_402, _394, _396);
        float _418 = 1.0 / _164;
        float _420 = fma(_376, _408, _398);
        float2 _1126 = float2(_382, _388);
        float3 _424 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1126, float2(0.0), isnan(_1126)), level(_90)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1126, float2(0.0), isnan(_1126)), level(_90)).xyz;
        float _426 = _424.x;
        float _428 = _424.y;
        float _430 = _424.z;
        float2 _1143 = float2(_386, _388);
        float3 _432 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1143, float2(0.0), isnan(_1143)), level(_90)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1143, float2(0.0), isnan(_1143)), level(_90)).xyz;
        float _434 = _432.x;
        float _436 = _432.y;
        float _438 = _432.z;
        float2 _1158 = float2(_382, _390);
        float3 _440 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1158, float2(0.0), isnan(_1158)), level(_90)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1158, float2(0.0), isnan(_1158)), level(_90)).xyz;
        float _442 = _440.x;
        float _444 = _440.y;
        float _446 = _440.z;
        float2 _1173 = float2(_386, _390);
        float3 _448 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1173, float2(0.0), isnan(_1173)), level(_90)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1173, float2(0.0), isnan(_1173)), level(_90)).xyz;
        float _450 = _448.x;
        float _452 = _448.y;
        float _454 = _448.z;
        float _456 = _416 * _414;
        float _458 = _420 * _418;
        float _460 = _412 * _418;
        float _462 = _410 * _414;
        float2 _1200 = float2(_458, _456);
        float3 _464 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1200, float2(0.0), isnan(_1200)), level(_96)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1200, float2(0.0), isnan(_1200)), level(_96)).xyz;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _464.z;
        float2 _1215 = float2(_460, _456);
        float3 _472 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1215, float2(0.0), isnan(_1215)), level(_96)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1215, float2(0.0), isnan(_1215)), level(_96)).xyz;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _472.z;
        float2 _1230 = float2(_458, _462);
        float3 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1230, float2(0.0), isnan(_1230)), level(_96)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1230, float2(0.0), isnan(_1230)), level(_96)).xyz;
        float _482 = _480.x;
        float _484 = _480.y;
        float _486 = _480.z;
        float2 _1245 = float2(_460, _462);
        float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1245, float2(0.0), isnan(_1245)), level(_96)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1245, float2(0.0), isnan(_1245)), level(_96)).xyz;
        float _490 = _488.x;
        float _492 = _488.y;
        float _494 = _488.z;
        float _496 = in.m_29.y;
        float _498 = gl_FragCoord.w;
        float _500 = _496 * _498;
        float _502 = _58 * _500;
        float _504 = 0.0 + _82;
        float _506 = precise::clamp(_504, 0.0, 1.0);
        float _508 = fma(_502, _506, _62);
        float _510 = _506 * _502;
        float _512 = -_90;
        float _514 = _84 + _512;
        float _516 = precise::clamp(_514, 0.0, 1.0);
        float _518 = -_436;
        float _520 = _428 + _518;
        float _522 = -_434;
        float _524 = _426 + _522;
        float _526 = -_450;
        float _528 = _442 + _526;
        float _530 = -_438;
        float _532 = _430 + _530;
        float _534 = -_454;
        float _536 = _446 + _534;
        float _538 = fma(_288, _524, _434);
        float _540 = fma(_288, _528, _450);
        float _542 = -_452;
        float _544 = _444 + _542;
        float _546 = fma(_288, _532, _438);
        float _548 = fma(_288, _536, _454);
        float _550 = fma(_288, _520, _436);
        float _552 = fma(_288, _544, _452);
        float _554 = -_540;
        float _556 = _554 + _538;
        float _558 = -_548;
        float _560 = _558 + _546;
        float _562 = -_476;
        float _564 = _468 + _562;
        float _566 = -_478;
        float _568 = _470 + _566;
        float _570 = -_474;
        float _572 = _466 + _570;
        float _574 = 1.0 / _508;
        float _576 = -_494;
        float _578 = _486 + _576;
        float _580 = fma(_352, _564, _476);
        float _582 = -_490;
        float _584 = _482 + _582;
        float _586 = -_492;
        float _588 = _484 + _586;
        float _590 = fma(_352, _568, _478);
        float _592 = fma(_352, _578, _494);
        float _594 = fma(_352, _572, _474);
        float _596 = fma(_352, _584, _490);
        float _598 = fma(_352, _588, _492);
        float _600 = -_592;
        float _602 = _600 + _590;
        float _604 = fma(_330, _556, _540);
        float _606 = -_596;
        float _608 = _606 + _594;
        float _610 = -_552;
        float _612 = _610 + _550;
        float _614 = -_598;
        float _616 = _614 + _580;
        float _618 = fma(_330, _560, _548);
        float _620 = fma(_364, _602, _592);
        float _622 = fma(_364, _608, _596);
        float _624 = fma(_330, _612, _552);
        float _626 = fma(_364, _616, _598);
        float _628 = -_618;
        float _630 = _628 + _620;
        float _632 = -_604;
        float _634 = _632 + _622;
        float _636 = _574 * _510;
        float _638 = -_624;
        float _640 = _638 + _626;
        float _642 = fma(_516, _630, _618);
        float _644 = fma(_516, _634, _604);
        float _646 = fma(_516, _640, _624);
        float _648 = _642 * _510;
        float _650 = _644 * _636;
        float _652 = _646 * _636;
        float _654 = _648 * _574;
        out.m_34.x = _650;
        out.m_34.y = _652;
        out.m_34.z = _654;
        out.m_34.w = _508;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _62;
    return out;
}

