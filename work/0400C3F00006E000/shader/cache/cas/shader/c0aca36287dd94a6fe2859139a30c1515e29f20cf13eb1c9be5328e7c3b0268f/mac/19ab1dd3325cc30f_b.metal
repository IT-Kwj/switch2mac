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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_43 [[user(locn2), flat]];
    float4 m_45 [[user(locn3), flat]];
    float4 m_35 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_47 [[user(locn7), flat]];
    float4 m_52 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _722 = float2(_77, _79);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_722, float2(0.0), isnan(_722))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_722, float2(0.0), isnan(_722))).w;
    float _83 = in.m_37.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_41.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _75 * _87;
    float _103 = _75 * _93;
    float _105 = _75 * _99;
    float _107 = _101 * _103;
    float _109 = in.m_35.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_35.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _75 * _113;
    float _123 = _75 * _119;
    float _125 = _107 * _81;
    float _127 = 0.0 + _125;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = _129 * _105;
    bool _135 = _131 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _143 = _139 || _141;
    if (!_143)
    {
        discard_fragment();
    }
    float2 _820;
    _820.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_121, _123));
    _820.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_121, _123));
    float _145 = _820.x;
    float _147 = _145 * 256.0;
    int _150 = int(_147);
    float _152 = float(uint(_150));
    float _154 = _152 * 0.00390625;
    float _156 = precise::min(_154, 2.0);
    float2 _839 = float2(_121, _123);
    float3 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_839, float2(0.0), isnan(_839)), level(_156)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_839, float2(0.0), isnan(_839)), level(_156)).xyz;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = in.m_43.x;
    float _170 = in.m_45.x;
    float _172 = in.m_47.x;
    float _174 = (*spvDescriptorSet0.fp_c9)._m0[191].x + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _176 = (*spvDescriptorSet0.fp_c9)._m0[191].y + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _178 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _180 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _178;
    float _182 = 1.0 / _174;
    float _184 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _186 = _184 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _188 = 1.0 / _176;
    float _190 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _192 = precise::max(_168, _190);
    float _194 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _196 = precise::max(_168, _194);
    float _198 = precise::min(_192, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _200 = precise::min(_196, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _202 = _198 + (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _204 = _200 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _206 = _202 * _182;
    float _208 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _210 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _208;
    float _212 = -_206;
    float _214 = fma(_204, _188, _212);
    float _216 = 1.0 / _210;
    float _218 = fma(_170, _214, _206);
    float _220 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _222 = _220 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _224 = -_218;
    float _226 = _224 + 1.0;
    float _228 = 1.0 / _222;
    float _230 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _232 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _230;
    float _234 = fma(_172, 0.100000001490116119384765625, _226);
    float _236 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _238 = _236 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _240 = floor(_234);
    float _242 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _244 = _242 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _246 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _248 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _246;
    float _250 = 1.0 / _244;
    float _252 = 1.0 / _248;
    float _254 = -_240;
    float _256 = _234 + _254;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _262 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _260;
    float _264 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _266 = _264 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _268 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _270 = _258 + _268;
    float _272 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _274 = _258 + _272;
    float _276 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _278 = _258 + _276;
    float _280 = 1.0 / _232;
    float _282 = _270 * _216;
    float _284 = _274 * _228;
    float _286 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _288 = _258 + _286;
    float _290 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _292 = _258 + _290;
    float _294 = fma(_180, _282, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _296 = 1.0 / _238;
    float _298 = _288 * _250;
    float _300 = _292 * _252;
    float _302 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _304 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _302;
    float _306 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _308 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _306;
    float _310 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _312 = _310 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _314 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _316 = _314 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _318 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _320 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _318;
    float _322 = _278 * _280;
    bool _324 = _258 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _326 = isnan(_258);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = fma(_304, _282, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _338 = fma(_308, _282, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _340 = fma(_320, _322, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _342 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _344 = _258 + _342;
    bool _346 = _258 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _348 = isnan(_258);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_334;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _364 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _362;
    bool _366 = _258 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _368 = isnan(_258);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = _344 * _296;
    float _380 = fma(_312, _284, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _382 = fma(_316, _284, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _384 = fma(_186, _284, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _386 = fma(_262, _322, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    bool _388 = _258 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _390 = isnan(_258);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = _356 * _360;
    float _402 = fma(_364, _322, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _404 = -_356;
    float _406 = _404 + 1.0;
    float _408 = -_376;
    float _410 = _408 + 1.0;
    bool _412 = _258 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _414 = isnan(_258);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _426 = _424 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _428 = _398 * _406;
    float _430 = _334 * _410;
    bool _432 = _258 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _434 = isnan(_258);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -_422;
    float _446 = _444 + 1.0;
    float _448 = _336 * _428;
    float _450 = _338 * _428;
    float _452 = -_398;
    float _454 = _452 + 1.0;
    float _456 = _294 * _428;
    float _458 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _460 = _458 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _462 = -_442;
    float _464 = _462 + 1.0;
    float _466 = _376 * _446;
    float _468 = fma(_454, (*spvDescriptorSet0.fp_c9)._m0[107].x, _448);
    float _470 = fma(_454, (*spvDescriptorSet0.fp_c9)._m0[107].y, _450);
    float _472 = fma(_426, _378, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _474 = fma(_266, _378, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _476 = fma(_454, (*spvDescriptorSet0.fp_c9)._m0[107].z, _456);
    float _478 = fma(_460, _378, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _480 = _422 * _464;
    float _482 = fma(_380, _400, _468);
    float _484 = fma(_382, _400, _470);
    float _486 = fma(_384, _400, _476);
    bool _488 = _258 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _490 = isnan(_258);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _502 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _500;
    float _504 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _506 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _504;
    float _508 = fma(_340, _430, _482);
    float _510 = fma(_386, _430, _484);
    float _512 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _514 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _512;
    float _516 = fma(_402, _430, _486);
    float _518 = fma(_502, _300, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _520 = fma(_506, _300, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _522 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _524 = _522 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _526 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _528 = _526 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _530 = -_498;
    float _532 = _530 + 1.0;
    float _534 = fma(_472, _466, _508);
    float _536 = fma(_474, _466, _510);
    float _538 = fma(_514, _300, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _540 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _542 = _540 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _544 = fma(_478, _466, _516);
    float _546 = fma(_524, _298, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _548 = fma(_528, _298, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _550 = _442 * _532;
    float _552 = fma(_518, _480, _534);
    float _554 = fma(_520, _480, _536);
    float _556 = fma(_542, _298, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _558 = fma(_538, _480, _544);
    float _560 = fma(_546, _550, _552);
    float _562 = fma(_548, _550, _554);
    float _564 = fma(_556, _550, _558);
    float _566 = fma(_498, (*spvDescriptorSet0.fp_c9)._m0[113].x, _560);
    float _568 = fma(_498, (*spvDescriptorSet0.fp_c9)._m0[113].y, _562);
    float _570 = fma(_498, (*spvDescriptorSet0.fp_c9)._m0[113].z, _564);
    float _572 = fma(_566, (*spvDescriptorSet0.fp_c9)._m0[106].x, _162);
    float _574 = fma(_568, (*spvDescriptorSet0.fp_c9)._m0[106].x, _164);
    float _576 = fma(_570, (*spvDescriptorSet0.fp_c9)._m0[106].x, _166);
    if (!_143)
    {
        out.m_50.x = _572;
        out.m_50.y = _574;
        out.m_50.z = _576;
        out.m_50.w = _125;
        return out;
    }
    float _578 = _574 * 0.715200006961822509765625;
    float _580 = in.m_52.w;
    float _582 = gl_FragCoord.w;
    float _584 = _580 * _582;
    float _586 = in.m_52.z;
    float _588 = gl_FragCoord.w;
    float _590 = _586 * _588;
    float _592 = in.m_52.x;
    float _594 = gl_FragCoord.w;
    float _596 = _592 * _594;
    float _598 = fma(_572, 0.2125999927520751953125, _578);
    float _600 = in.m_52.y;
    float _602 = gl_FragCoord.w;
    float _604 = _600 * _602;
    float _606 = fma(_576, 0.072200000286102294921875, _598);
    bool _608 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _610 = 1.0 / _606;
    float _612 = _610 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _614 = precise::clamp(_612, 0.0, 1.0);
    float _616 = _75 * _584;
    float _618 = fma(_614, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _620 = _75 * _590;
    float _622 = _618 * _616;
    float _624 = 0.0 + _131;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = _75 * _596;
    float _630 = _75 * _604;
    float _632 = fma(_576, _622, _620);
    float _634 = fma(_572, _622, _628);
    float _636 = fma(_574, _622, _630);
    float _638 = _620;
    if (!_608)
    {
        _638 = _626;
    }
    float _640 = _638;
    bool _642 = !_608;
    float _644 = _640;
    if (!_642)
    {
        float _646 = in.m_54.w;
        float _648 = gl_FragCoord.w;
        float _650 = _646 * _648;
        float _652 = in.m_54.z;
        float _654 = gl_FragCoord.w;
        float _656 = _652 * _654;
        float _658 = _75 * _650;
        float _660 = _75 * _656;
        float _662 = 1.0 / _658;
        float _664 = _660 * _662;
        float _666 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _668 = fma(_664, (*spvDescriptorSet0.fp_c8)._m0[30].w, _666);
        float _670 = 1.0 / _668;
        float _672 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _674 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _676 = fma(_670, _672, _674);
        float _678 = _676 * 8.0;
        float _680 = precise::clamp(_678, 0.0, 1.0);
        float _682 = _626 * _680;
        _644 = _682;
    }
    float _684 = _644;
    float _686 = 0.0 + _684;
    float _688 = precise::clamp(_686, 0.0, 1.0);
    out.m_50.x = _634;
    out.m_50.y = _636;
    out.m_50.z = _632;
    out.m_50.w = _688;
    return out;
}

