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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _616 = false;
    bool _442 = false;
    bool _172 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2519 = as_type<float>(_108);
        out.gl_Position.z = _2519;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    float _114 = float(_92);
    float _116 = 1.0 / _114;
    float _118 = -_112;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_112);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = _120 * _116;
    bool _134 = _120 >= _114;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    out.m_49.x = _132;
    float _140 = _132;
    float _142 = _120;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2591 = as_type<float>(_148);
        out.gl_Position.z = _2591;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _152 = !_150;
    float _170;
    if (!_152)
    {
        float _154 = in.m_51.x;
        float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _160 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _162 = _160 * _156;
        float _164 = floor(_162);
        float _166 = -_164;
        float _168 = _162 + _166;
        _170 = _168;
        _172 = true;
    }
    else
    {
        _170 = _132;
    }
    _172 = false;
    float _174 = _170;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _178 = _174 + _176;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _182 = _174 + _180;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _186 = _174 + _184;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _194 = _192 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _200 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = 1.0 / _198;
    bool _206 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_174);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = 1.0 / _194;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _222 = _174 + _220;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _226 = 1.0 / _202;
    float _228 = _178 * _204;
    float _230 = 1.0 / _190;
    float _232 = _222 * _218;
    bool _234 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _236 = isnan(_174);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    bool _246 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _248 = isnan(_174);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_244;
    float _260 = _258 + 1.0;
    float _262 = _182 * _226;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _268;
    float _272 = _256 * _260;
    float _274 = -_256;
    float _276 = _274 + 1.0;
    float _278 = fma(_266, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_270, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _282 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_174);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _186 * _230;
    bool _296 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_174);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = fma(_310, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = -_306;
    float _320 = _318 + 1.0;
    float _322 = _306 * _276;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _216 * _320;
    float _334 = -_216;
    float _336 = _334 + 1.0;
    float _338 = fma(_314, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _340 = fma(_326, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _342 = fma(_330, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _344 = _292 * _336;
    float _346 = -_292;
    float _348 = _346 + 1.0;
    float _350 = _278 * _344;
    float _352 = _280 * _344;
    float _354 = _316 * _344;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _364 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_338, _332, _360);
    float _376 = fma(_340, _332, _362);
    float _378 = fma(_342, _332, _364);
    float _380 = fma(_358, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _382 = fma(_368, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _384 = fma(_372, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _398 = fma(_380, _322, _374);
    float _400 = fma(_388, _232, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _402 = fma(_392, _232, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _404 = fma(_396, _232, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _406 = fma(_382, _322, _376);
    float _408 = fma(_384, _322, _378);
    float _410 = fma(_400, _272, _398);
    float _412 = fma(_402, _272, _406);
    float _414 = fma(_404, _272, _408);
    float _416 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].x, _410);
    float _418 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].y, _412);
    float _420 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].z, _414);
    bool _422 = !_224;
    float _440;
    if (!_422)
    {
        float _424 = in.m_51.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _132;
    }
    _442 = false;
    float _444 = _440;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _444 + _452;
    bool _456 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _458 = isnan(_444);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _476 = 1.0 / _470;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _480 = 1.0 / _474;
    float _482 = _418 * _448;
    float _484 = _420 * _450;
    bool _486 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_444);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -_466;
    float _500 = _498 + 1.0;
    float _502 = _454 * _476;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _444 + _504;
    bool _508 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _510 = isnan(_444);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _496 * _500;
    float _522 = -_496;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _534;
    float _538 = _518 * _524;
    float _540 = fma(_528, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = fma(_532, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _544 = fma(_536, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _546 = _506 * _480;
    float _548 = _540 * _538;
    float _550 = _542 * _538;
    float _552 = _544 * _538;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].x, _548);
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].y, _550);
    float _574 = fma(_560, _546, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _576 = fma(_564, _546, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _578 = fma(_568, _546, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].z, _552);
    float _582 = fma(_574, _520, _570);
    float _584 = fma(_576, _520, _572);
    float _586 = _416 * _446;
    float _588 = fma(_578, _520, _580);
    float _590 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].x, _582);
    float _592 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].y, _584);
    float _594 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].z, _588);
    bool _596 = !_478;
    float _614;
    if (!_596)
    {
        float _598 = in.m_51.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _132;
    }
    _616 = false;
    float _618 = _614;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = _650 * _662;
    float _672 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _674 = fma(_670, _654, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _674 * _664;
    float _680 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[116].x, _682);
    float _692 = _690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_51.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _132;
    }
    _714 = false;
    float _716 = _712;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _720 = _716 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _724 = _716 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _728 = _716 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _746 = 1.0 / _740;
    bool _748 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _750 = isnan(_716);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _736;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _764 = _716 + _762;
    bool _766 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _768 = 1.0 / _744;
    float _770 = _720 * _746;
    bool _772 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _774 = isnan(_716);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = 1.0 / _732;
    float _786 = _764 * _760;
    bool _788 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _790 = isnan(_716);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_758;
    float _802 = _800 + 1.0;
    float _804 = -_798;
    float _806 = _804 + 1.0;
    float _808 = _724 * _768;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _814;
    float _818 = _798 * _802;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _824 = fma(_812, _770, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _826 = fma(_816, _770, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _828 = _728 * _784;
    bool _830 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _832 = isnan(_716);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _842;
    float _846 = fma(_822, _808, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _848 = fma(_844, _770, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _850 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _852 = isnan(_716);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _840 * _806;
    float _864 = -_840;
    float _866 = _864 + 1.0;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _876 = _860 * _866;
    float _878 = -_860;
    float _880 = _878 + 1.0;
    float _882 = fma(_874, _808, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _884 = fma(_870, _808, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _886 = _782 * _880;
    float _888 = -_782;
    float _890 = _888 + 1.0;
    float _892 = _824 * _886;
    float _894 = _826 * _886;
    float _896 = _848 * _886;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _898;
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].x, _892);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].y, _894);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].z, _896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _912;
    float _916 = fma(_882, _876, _902);
    float _918 = fma(_846, _876, _906);
    float _920 = fma(_900, _828, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _922 = fma(_910, _828, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _924 = fma(_884, _876, _904);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _934 = fma(_914, _828, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _940 = fma(_920, _862, _916);
    float _942 = fma(_928, _786, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _944 = fma(_932, _786, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _946 = fma(_922, _862, _924);
    float _948 = fma(_938, _786, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _950 = fma(_934, _862, _918);
    float _952 = fma(_942, _818, _940);
    float _954 = fma(_944, _818, _946);
    float _956 = fma(_948, _818, _950);
    float _958 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].x, _952);
    float _960 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].y, _954);
    float _962 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].z, _956);
    bool _964 = !_766;
    if (!_964)
    {
        float _966 = in.m_51.x;
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _970 = _966 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _140 = _980;
    }
    float _982 = _140;
    float _984 = in.m_51.z;
    float _986 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _988 = log2(_986);
    float _990 = in.m_51.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1002 = _1000 != 0;
    float _1004 = in.m_51.y;
    bool _1006 = !_998;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1012 = 1.0 + _1010;
    float _1014 = _120 * _988;
    float _1016 = 1.0 / _1012;
    float _1018 = in.m_42.x;
    float _1020 = in.m_42.y;
    float _1022 = in.m_42.z;
    float _1024 = _984 * 2.0;
    float _1026 = exp2(_1014);
    bool _1028 = !_994;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _990 * 2.0;
    float _1034 = _1004 * 2.0;
    float _1036 = floor(_1024);
    float _1038 = floor(_1032);
    float _1040 = -_1026;
    float _1042 = _1040 + 1.0;
    bool _1044 = _1036 > 0.0;
    float _1046 = floor(_1034);
    bool _1048 = _1036 >= 0.0;
    bool _1050 = isnan(_1036);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _990 + _1004;
    int _1060 = _1056 ? 0 : 1;
    float _1062 = _1058 + (-1.0);
    bool _1064 = _1038 > 0.0;
    float _1066 = _1004 + _984;
    bool _1068 = _1038 >= 0.0;
    bool _1070 = isnan(_1038);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _1066 + (-1.0);
    bool _1080 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1088 = _1084 || _1086;
    int _1090 = ~_1060;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    float _1096 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1098 = _1094;
    float _1100 = _1004;
    if (!_1044)
    {
        int _1102 = ~_1060;
        int _1104 = _1102 + 1;
        _1098 = _1104;
    }
    int _1106 = _1098;
    bool _1108 = _1046 > 0.0;
    float _1110 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1112 = _1088 ? _1042 : 0.0;
    float _1114 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1116 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1118 = _1046 >= 0.0;
    bool _1120 = isnan(_1046);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1114);
    float _1130 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1116);
    float _1132 = _1112 * _1016;
    int _1134 = abs(_1030);
    float _1136 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1128);
    float _1138 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1130);
    int _1140 = _1076 ? 0 : 1;
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1146 = ~_1140;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1154 = _1142 + _1152;
    float _1156 = -_1144;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1160 = _1150;
    float _1162 = _1154;
    float _1164 = _1158;
    bool _1166 = _1108;
    float _1168 = _1022;
    if (!_1064)
    {
        int _1170 = ~_1140;
        int _1172 = _1170 + 1;
        _1160 = _1172;
    }
    int _1174 = _1160;
    float _1176 = float(_1134);
    float _1178 = abs(_1154);
    float _1180 = abs(_1158);
    float _1182 = precise::max(_1178, _1180);
    float _1184 = float(_1106);
    bool _1186 = _1182 >= 16.0;
    bool _1188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(1.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = _1176 * _1184;
    int _1200 = abs(_1008);
    bool _1202 = !_1196;
    float _1204 = _1202 ? _120 : _1132;
    float _1206 = _1198 * (-2.0);
    float _1208 = _990 + (-0.5);
    int _1210 = _1126 ? 0 : 1;
    float _1212 = fma(_1096, _1206, _1096);
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    if (_1186)
    {
        float _1216 = _1154 * 0.0625;
        _1162 = _1216;
    }
    float _1218 = _1162;
    float _1220 = float(_1200);
    if (_1186)
    {
        float _1222 = _1158 * 0.0625;
        _1164 = _1222;
    }
    float _1224 = _1164;
    float _1226 = fma(_1204, _1212, _1214);
    float _1228 = float(_1174);
    float _1230 = _990 + _984;
    bool _1232 = !_1002;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1226 * 0.15915493667125701904296875;
    float _1238 = abs(_1218);
    bool _1240 = _1238 != 0.0;
    bool _1242 = isnan(_1238);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan(0.0);
    bool _1248 = _1244 || _1246;
    float _1250 = _1220 * _1228;
    int _1252 = ~_1210;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = _1230 + (-1.0);
    int _1260 = _1256;
    if (!_1108)
    {
        int _1262 = ~_1210;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _1250 * (-2.0);
    int _1270 = abs(_1234);
    float _1272 = _1236 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    float _1276 = abs(_1224);
    bool _1278 = _1276 == 0.0;
    bool _1280 = !_1248;
    bool _1282 = _1278 && _1280;
    float _1284 = in.m_55.x;
    float _1286 = in.m_55.y;
    float _1288 = in.m_55.z;
    float _1290 = float(_1270);
    float _1292 = fma(_1110, _1268, _1110);
    float _1294 = float(_1266);
    float _1296 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1298 = abs(_1224);
    bool _1300 = _1298 == 0.0;
    float _1302 = _1236 * 6.283185482025146484375;
    float _1304 = cos(_1302);
    float _1306 = _1004 + (-0.5);
    float _1308 = _1290 * _1294;
    float _1310 = _984 + (-0.5);
    float _1312 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1314 = _1308 * (-2.0);
    int _1316 = as_type<int>(_1308);
    int _1318 = as_type<int>(_1312);
    if (_1282)
    {
        bool _1320 = as_type<int>(_1224) >= 0;
        _1166 = _1320;
    }
    bool _1322 = _1166;
    float _1324 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1326 = fma(_1204, _1292, _1312);
    float _1328 = fma(_1296, _1314, _1296);
    int _1330 = _1322 ? (-1) : 0;
    if (_1282)
    {
        int _1332 = _1322 ? 0 : 1078530011;
        _1316 = _1332;
    }
    int _1334 = _1316;
    float _1336 = fma(_1204, _1328, _1324);
    if (_1282)
    {
        int _1338 = int(0x80000000) & as_type<int>(_1218);
        int _1340 = _1334 | _1338;
        _1318 = _1340;
    }
    int _1342 = _1318;
    bool _1344 = !_1248;
    bool _1346 = _1344 && _1300;
    int _1348 = _1342;
    float _1350 = as_type<float>(_1342);
    if (!_1346)
    {
        float _1352 = abs(_1218);
        bool _1354 = _1352 != as_type<float>(0x7f800000u /* inf */);
        bool _1356 = isnan(_1352);
        bool _1358 = _1354 || _1356;
        bool _1360 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1362 = _1358 || _1360;
        float _1364 = abs(_1224);
        bool _1366 = _1364 == as_type<float>(0x7f800000u /* inf */);
        float _1368 = abs(_1224);
        bool _1370 = _1368 == as_type<float>(0x7f800000u /* inf */);
        bool _1372 = !_1362;
        bool _1374 = _1370 && _1372;
        if (_1374)
        {
            bool _1376 = as_type<int>(_1224) >= 0;
            _1330 = _1376 ? (-1) : 0;
        }
        int _1378 = _1330;
        if (_1374)
        {
            _1348 = 1075235812;
        }
        int _1380 = _1348;
        int _1382 = _1380;
        if (_1374)
        {
            int _1384 = ~_1378;
            int _1386 = (_1384 != 0) ? _1380 : 1061752795;
            _1382 = _1386;
        }
        int _1388 = _1382;
        float _1390 = as_type<float>(_1388);
        if (_1374)
        {
            int _1392 = int(0x80000000) & as_type<int>(_1218);
            int _1394 = _1388 | _1392;
            _1390 = as_type<float>(_1394);
        }
        float _1396 = _1390;
        bool _1398 = !_1362;
        bool _1400 = _1398 && _1366;
        _1350 = _1396;
        if (!_1400)
        {
            float _1402 = abs(_1218);
            float _1404 = abs(_1224);
            float _1406 = precise::max(_1402, _1404);
            float _1408 = abs(_1218);
            float _1410 = abs(_1224);
            float _1412 = precise::min(_1408, _1410);
            float _1414 = 1.0 / _1406;
            float _1416 = abs(_1218);
            float _1418 = abs(_1224);
            bool _1420 = _1416 > _1418;
            bool _1422 = as_type<int>(_1224) >= 0;
            float _1424 = _1412 * _1414;
            float _1426 = _1424 * _1424;
            float _1428 = _1426 + 11.33538818359375;
            float _1430 = fma(_1426, _1428, 28.84246826171875);
            float _1432 = fma(_1426, _1430, 19.6966705322265625);
            float _1434 = fma(_1426, -0.82336294651031494140625, -5.674867153167724609375);
            float _1436 = fma(_1426, _1434, -6.565555095672607421875);
            float _1438 = 1.0 / _1432;
            float _1440 = _1426 * _1436;
            float _1442 = abs(_1218);
            float _1444 = abs(_1224);
            float _1446 = _1442 + _1444;
            int _1448 = as_type<int>(_1218) & int(0x80000000);
            float _1450 = _1424 * _1440;
            bool _1452 = _1446 > as_type<float>(0x7f800000u /* inf */);
            bool _1454 = isnan(_1446);
            bool _1456 = _1452 || _1454;
            bool _1458 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1460 = _1456 || _1458;
            float _1462 = fma(_1450, _1438, _1424);
            float _1464 = _1462;
            _1350 = _1446;
            if (_1420)
            {
                float _1466 = -_1462;
                float _1468 = _1466 + 1.57079637050628662109375;
                _1464 = _1468;
            }
            float _1470 = _1464;
            int _1472 = as_type<int>(_1470);
            if (!_1422)
            {
                float _1474 = -_1470;
                float _1476 = _1474 + 3.1415927410125732421875;
                _1472 = as_type<int>(_1476);
            }
            int _1478 = _1472;
            if (!_1460)
            {
                int _1480 = _1448 | _1478;
                _1350 = as_type<float>(_1480);
            }
        }
    }
    float _1482 = _1350;
    float _1484 = -_1482;
    float _1486 = _1326 + _1484;
    float _1488 = _1336 * 0.15915493667125701904296875;
    float _1490 = _984 * 6.283185482025146484375;
    float _1492 = _1486 * 0.15915493667125701904296875;
    float _1494 = _1488 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _990 * 6.283185482025146484375;
    float _1500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1502 = fma(_120, 0.310000002384185791015625, _1490);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1288);
    float _1506 = fma(_120, 0.10999999940395355224609375, _1498);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1286);
    float _1510 = _1502 * 0.15915493667125701904296875;
    float _1512 = _1492 * 6.283185482025146484375;
    float _1514 = sin(_1512);
    float _1516 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1506 * 0.15915493667125701904296875;
    float _1520 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1522 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1524 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1526 = _1492 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1504 * _1522;
    float _1532 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1524);
    float _1534 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1532);
    float _1536 = _1488 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    float _1540 = _1508 * _1516;
    float _1542 = _1304 * _1514;
    float _1544 = _1500 * _1520;
    float _1546 = _1534 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1548 = _1510 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = _1496 * _1540;
    float _1554 = _1274 * _1528;
    float _1556 = _1304 * _1528;
    float _1558 = _1528 * _1496;
    float _1560 = _1274 * _1552;
    float _1562 = _1274 * _1514;
    float _1564 = _1514 * _1496;
    float _1566 = _1518 * 6.283185482025146484375;
    float _1568 = sin(_1566);
    float _1570 = -_1542;
    float _1572 = fma(_1538, _1554, _1570);
    float _1574 = _1304 * _1552;
    float _1576 = fma(_1538, _1556, _1562);
    float _1578 = fma(_1572, _1544, _1560);
    float _1580 = -_1540;
    float _1582 = _1538 * _1580;
    float _1584 = fma(_1538, _1562, _1556);
    float _1586 = fma(_1550, 0.12999999523162841796875, 1.0);
    float _1588 = -_1554;
    float _1590 = fma(_1538, _1542, _1588);
    float _1592 = fma(_1558, _1544, _1582);
    float _1594 = fma(_1584, _1530, _1578);
    float _1596 = fma(_1576, _1544, _1574);
    float _1598 = fma(_1564, _1530, _1592);
    float _1600 = _1144 + _1594;
    float _1602 = fma(_1568, 0.300000011920928955078125, _1586);
    float _1604 = fma(_1590, _1530, _1596);
    float _1606 = _1142 + _1598;
    float _1608 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1600);
    float _1610 = _1546 + _1604;
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1606);
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1616 = _1608 + _1614;
    float _1618 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1610);
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1622 = _1612 + _1620;
    float _1624 = _1616 * _1616;
    float _1626 = fma(_1622, _1622, _1624);
    float _1628 = sqrt(_1626);
    bool _1630 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = _1534;
    float _1634 = _1576;
    float _1636 = _1628;
    float _1638 = _1612;
    float _1640 = _1610;
    if (!_1630)
    {
        _1632 = _1612;
    }
    float _1642 = _1632;
    float _1644 = _1642;
    if (!_1630)
    {
        _1634 = _1608;
    }
    float _1646 = _1634;
    float _1648 = _1646;
    if (!_1630)
    {
        _1168 = _1618;
    }
    float _1650 = _1168;
    bool _1652 = !_1630;
    float _1654 = _1650;
    if (!_1652)
    {
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1660 = _1628 + _1658;
        float _1662 = rsqrt(_1626);
        float _1664 = _1660 * _1656;
        float _1666 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = _1664 * 0.15915493667125701904296875;
        float _1670 = _1668 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        float _1674 = _1668 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 + (-1.0);
        float _1680 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1682 = fma(_1676, _1666, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1684 = fma(_1618, _1672, _1680);
        float _1686 = _1662 * _1682;
        float _1688 = fma(_1622, _1686, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1616, _1686, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1654 = _1684;
        _1644 = _1688;
        _1648 = _1690;
    }
    float _1692 = _1654;
    float _1694 = _1644;
    float _1696 = _1648;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = fma(_1708, _1708, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1716;
    float _1742 = _1730;
    float _1744 = _1738;
    float _1746 = _1700;
    if (_1734)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1748;
    }
    float _1750 = _1740;
    if (_1734)
    {
        float _1752 = rsqrt(_1730);
        _1742 = _1752;
    }
    float _1754 = _1742;
    float _1756 = _1754;
    if (_1734)
    {
        float _1758 = _1738 * _1750;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (_1734)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1636 = _1762;
    }
    float _1764 = _1636;
    float _1766 = _1708;
    if (_1734)
    {
        float _1768 = _1764 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1776 = precise::max(0.0, _1774);
    float _1778 = _1750;
    float _1780 = _1776;
    if (_1734)
    {
        float _1782 = _1764 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        _1778 = _1784;
    }
    float _1786 = _1778;
    float _1788 = -_1720;
    float _1790 = -_1776;
    float _1792 = fma(_1700, _1788, _1790);
    if (_1734)
    {
        float _1794 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1794;
    }
    float _1796 = _1746;
    float _1798 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1800 = _1796;
    float _1802 = _1772;
    if (_1734)
    {
        float _1804 = fma(_1772, _1796, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1800 = _1804;
    }
    float _1806 = _1800;
    float _1808 = _1806;
    if (!_1734)
    {
        _1802 = _1722;
    }
    float _1810 = _1802;
    float _1812 = _1810;
    float _1814 = _1786;
    if (_1734)
    {
        float _1816 = _1786 + (-1.0);
        _1780 = _1816;
    }
    float _1818 = _1780;
    float _1820 = _1818;
    if (_1734)
    {
        float _1822 = _1754 * _1806;
        _1638 = _1822;
    }
    float _1824 = _1638;
    if (!_1734)
    {
        _1808 = _1792;
    }
    float _1826 = _1808;
    float _1828 = _1826;
    if (_1734)
    {
        float _1830 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1830;
    }
    float _1832 = _1640;
    if (_1734)
    {
        float _1834 = _1722 * _1824;
        _1812 = _1834;
    }
    float _1836 = _1812;
    if (!_1734)
    {
        _1820 = _1724;
    }
    float _1838 = _1820;
    float _1840 = _1838;
    if (_1734)
    {
        float _1842 = _1724 * _1824;
        _1840 = _1842;
    }
    float _1844 = _1840;
    if (!_1734)
    {
        _1756 = _1726;
    }
    float _1846 = _1756;
    float _1848 = _1846;
    if (_1734)
    {
        float _1850 = fma(_1792, _1786, _1832);
        _1828 = _1850;
    }
    float _1852 = _1828;
    if (_1734)
    {
        float _1854 = _1836 * _1836;
        _1848 = _1854;
    }
    float _1856 = _1848;
    if (!_1734)
    {
        _1814 = _1728;
    }
    float _1858 = _1814;
    float _1860 = _1858;
    if (_1734)
    {
        float _1862 = _1844 * _1844;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1852, _1852, _1856);
    float _1868 = _1866 + _1864;
    float _1870 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1798);
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1876 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1874);
    float _1878 = precise::clamp(_1876, 0.0, 1.0);
    float _1880 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1882 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1884 = rsqrt(_1868);
    float _1886 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1888 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1872);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1880);
    float _1894 = -_1878;
    float _1896 = _1894 + 1.0;
    float _1898 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1900 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1888);
    float _1902 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1892);
    float _1904 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1906 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1898);
    float _1908 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = abs(_1896);
    float _1912 = log2(_1910);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1906);
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1920 = _1884 * _1836;
    float _1922 = _1884 * _1852;
    float _1924 = _1884 * _1844;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1918);
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = -_1904;
    float _1934 = fma(_1932, _1886, 1.0);
    float _1936 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1926);
    float _1938 = -_1928;
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1938);
    float _1942 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1944 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    float _1948 = -_1924;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1940);
    float _1952 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1954 = log2(_1934);
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1942);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1962 = fma(_1950, 0.5, 0.5);
    float _1964 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1956);
    float _1966 = _1922 + 1.0;
    float _1968 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = 1.0 / _1946;
    float _1972 = fma(_1962, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1974 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1964);
    float _1976 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1978 = fma(_1962, _1972, -0.212114393711090087890625);
    float _1980 = sqrt(_1958);
    float _1982 = _1954 * 0.693147182464599609375;
    float _1984 = fma(_1962, _1978, 1.570728778839111328125);
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1988 = exp2(_1952);
    float _1990 = _1974 * _1970;
    float _1992 = _1976 * _1970;
    float _1994 = fma(_1990, 0.5, 0.5);
    float _1996 = fma(_1992, -0.5, 0.5);
    float _1998 = _1980 * 0.636619746685028076171875;
    float _2000 = -_1922;
    float _2002 = fma(_1988, _1966, _2000);
    float _2004 = -_1984;
    float _2006 = fma(_1998, _2004, 1.0);
    float3 _5525 = float3(_1994, _1996, _1986);
    float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).x;
    float3 _5536 = float3(_1994, _1996, _1986);
    float4 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5536, float3(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5536, float3(0.0), isnan(_5536)), level(0.0)).xyzw;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _2011.w;
    float _2021 = fma(_2002, 0.5, 0.5);
    float2 _5555 = float2(_2006, _2021);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5555, float2(0.0), isnan(_5555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5555, float2(0.0), isnan(_5555)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = in.m_57.y;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2037 = in.m_59.y;
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2045 = _2043 != 0;
    out.m_61.x = _684;
    out.m_61.y = _686;
    out.m_61.z = _688;
    out.m_61.w = _692;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2049 = _2047 != 0;
    float _2051 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2055 = _2053 != 0;
    float _2057 = in.m_59.x;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2061 = _2059 != 0;
    float _2063 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2067 = _2065 != 0;
    float _2069 = in.m_57.x;
    bool _2071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2073 = isnan(0.5);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2079 = _2075 || _2077;
    bool _2081 = _984 > 0.5;
    float _2083 = 1.0 / _2041;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2087 = _990 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2089 = -_2033;
    float _2091 = _2089 + 1.0;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2095 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2097 = -_2085;
    float _2099 = fma(_2087, 2.0, _2097);
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2101;
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2107 = fma(_2095, -2.0, _2093);
    int _2109 = _2081 ? as_type<int>(_2091) : as_type<int>(_2033);
    out.m_63.y = _2037;
    bool _2111 = _1004 > 0.5;
    float _2113 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2107);
    float _2115 = _2103 * _2083;
    out.m_65.w = _2033;
    int _2117 = _2111 ? as_type<int>(_2091) : as_type<int>(_2033);
    float _2119 = exp2(_2051);
    float _2121 = _2091;
    float _2123 = _2041;
    bool _2125 = _2055;
    float _2127 = _2115;
    if (_2067)
    {
        _2121 = _990;
    }
    float _2129 = _2121;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2133 = _2061 ? as_type<float>(_2117) : _2033;
    out.m_63.x = _2057;
    float _2135 = _2129;
    if (!_2067)
    {
        _2135 = _984;
    }
    float _2137 = _2135;
    float _2139 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2063);
    float _2141 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2145 = _2055 ? as_type<float>(_2109) : _2033;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_2067)
    {
        _2123 = _1004;
    }
    float _2149 = _2123;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2153 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2143);
    float _2155 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2147);
    float _2157 = _2149;
    if (_2045)
    {
        bool _2159 = _990 > 0.5;
        _2125 = _2159;
    }
    bool _2161 = _2125;
    float _2163 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2151);
    float _2165 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2131);
    if (!_2067)
    {
        _2157 = _990;
    }
    float _2167 = _2157;
    float _2169 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2171 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2175 = _982 + _2173;
    float _2177 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2155);
    float _2179 = fma(_2169, _2133, -0.5);
    float _2181 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2183 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2153);
    float _2187 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2171);
    float _2189 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    float _2191 = -_2113;
    float _2193 = fma(_2185, _2179, _2191);
    bool _2195 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2197 = isnan(_982);
    bool _2199 = _2195 || _2197;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2203 = _2199 || _2201;
    float _2205 = float(_2203);
    float _2207 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2187);
    float _2209 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2189);
    bool _2211 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2213 = isnan(_982);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = fma(_2145, _2181, -0.5);
    float _2225 = -_2205;
    float _2227 = _2225 + 1.0;
    float _2229 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2233 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2235 = fma(_2115, _2175, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2237 = 1.0 / _2229;
    float _2239 = _2221 * _2227;
    float _2241 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2243 = fma(_2233, -2.0, _2231);
    float _2245 = _2235 * _2239;
    float _2247 = _2241 + _2229;
    float _2249 = -_2221;
    float _2251 = _2249 + 1.0;
    float _2253 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2255 = _2229;
    int _2257 = as_type<int>(_2253);
    if (!_2079)
    {
        _2255 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2259 = _2255;
    float _2261 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2243);
    float _2263 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2245);
    float _2265 = _2263;
    if (!_2045)
    {
        _1100 = _2069;
    }
    float _2267 = _1100;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2273 = -_2261;
    float _2275 = fma(_2177, _2223, _2273);
    float _2277 = _2247 * _2237;
    float _2279 = _2277 * 0.5;
    float _2281 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2263);
    float _2283 = _2279;
    float _2285 = _2267;
    if (!_2045)
    {
        _2127 = _2267;
    }
    float _2287 = _2127;
    float _2289 = -_2269;
    float _2291 = fma(_2253, 2.0, _2289);
    float _2293 = _2287;
    if (!_2079)
    {
        float _2295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2297 = fma(_2279, _2259, _2295);
        _2283 = _2297;
    }
    float _2299 = _2283;
    if (!_2079)
    {
        _2265 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2301 = _2265;
    float _2303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2045)
    {
        _2285 = _2069;
    }
    float _2305 = _2285;
    float _2307 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2163);
    float _2309 = -_120;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2099);
    float _2313 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2165);
    float _2315 = -_120;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2291);
    float _2319 = _2305;
    if (!_2079)
    {
        float _2321 = -_2301;
        float _2323 = _2321 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _142 = _2323;
    }
    float _2325 = _142;
    float _2327 = _2325;
    if (_2045)
    {
        float _2329 = -_2305;
        float _2331 = _2329 + 1.0;
        _2257 = as_type<int>(_2331);
    }
    int _2333 = _2257;
    float _2335 = _2299;
    if (!_2079)
    {
        float _2337 = 1.0 / _2299;
        _2335 = _2337;
    }
    float _2339 = _2335;
    int _2341 = 0;
    if (_2049)
    {
        float _2343 = -_2305;
        float _2345 = _2343 + 1.0;
        _2341 = as_type<int>(_2345);
    }
    int _2347 = _2341;
    float _2349 = _2271 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2351 = -_2119;
    float _2353 = _2351 + 1.0;
    if (_2045)
    {
        float _2355 = _2161 ? as_type<float>(_2333) : _2305;
        _2293 = _2355;
    }
    float _2357 = _2293;
    float _2359 = _962 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2049)
    {
        float _2361 = _2111 ? as_type<float>(_2347) : _2305;
        _2319 = _2361;
    }
    float _2363 = _2319;
    float _2365 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2367 = _2165;
    float _2369 = _2363;
    if (!_2079)
    {
        float _2371 = 1.0 / _2325;
        _2367 = _2371;
    }
    float _2373 = _2367;
    float _2375 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2377 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2379 = fma(_2349, _2363, -0.5);
    float _2381 = _2281 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2383 = fma(_2375, _2357, -0.5);
    float _2385 = _958 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2387 = fma(_2313, _2379, _2317);
    if (!_2079)
    {
        float _2389 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2391 = -_2301;
        float _2393 = fma(_2339, _2389, _2391);
        _2369 = _2393;
    }
    float _2395 = _2369;
    float _2397 = _960 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_2079)
    {
        _2327 = 1.0;
    }
    float _2399 = _2327;
    float _2401 = _2385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2405 = _2397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2407 = fma(_2307, _2383, _2311);
    float _2409 = _2193 + 0.5;
    float _2411 = _2399;
    if (!_2079)
    {
        float _2413 = _2395 * _2373;
        float _2415 = precise::clamp(_2413, 0.0, 1.0);
        _2411 = _2415;
    }
    float _2417 = _2411;
    float _2419 = _2403 + _1946;
    out.m_67.x = _2401;
    out.m_67.y = _2405;
    out.m_67.z = _2377;
    out.m_67.w = _2381;
    float _2421 = _2275 + 0.5;
    float _2423 = _2417 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2425 = _2417 > 0.0;
    bool _2427 = isnan(_2417);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = _2419 * 0.5;
    float _2437 = _2387 + 0.5;
    float _2439 = _2407 + 0.5;
    out.m_65.y = _2409;
    out.m_69.x = _2437;
    out.m_69.y = _2421;
    float _2441 = _2423 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2439;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1976;
    out.gl_Position.z = _2403;
    out.gl_Position.w = _1946;
    out.m_71.z = _2435;
    out.m_71.w = _1946;
    out.m_45.x = _2441;
    float _2443 = _2365 * _2008;
    float _2445 = -_2365;
    float _2447 = _2445 + 1.0;
    float _2449 = _2019 * _2443;
    float _2451 = _2019 * _2447;
    float _2453 = _2031 * _2443;
    float _2455 = fma(_2027, _2449, _2013);
    float _2457 = fma(_2029, _2449, _2015);
    float _2459 = fma(_2019, _2453, _2017);
    out.m_73.x = _2455;
    out.m_73.y = _2457;
    out.m_73.z = _2459;
    out.m_73.w = _2451;
    if (_2433)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2461 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2461;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _616 = false;
    bool _442 = false;
    bool _172 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2519 = as_type<float>(_108);
        out.gl_Position.z = _2519;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    float _114 = float(_92);
    float _116 = 1.0 / _114;
    float _118 = -_112;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_112);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = _120 * _116;
    bool _134 = _120 >= _114;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    out.m_49.x = _132;
    float _140 = _132;
    float _142 = _120;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2591 = as_type<float>(_148);
        out.gl_Position.z = _2591;
    }
    if (_138)
    {
        return out;
    }
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _152 = !_150;
    float _170;
    if (!_152)
    {
        float _154 = in.m_51.x;
        float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _160 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _162 = _160 * _156;
        float _164 = floor(_162);
        float _166 = -_164;
        float _168 = _162 + _166;
        _170 = _168;
        _172 = true;
    }
    else
    {
        _170 = _132;
    }
    _172 = false;
    float _174 = _170;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _178 = _174 + _176;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _182 = _174 + _180;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _186 = _174 + _184;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _194 = _192 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _200 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = 1.0 / _198;
    bool _206 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_174);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = 1.0 / _194;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _222 = _174 + _220;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _226 = 1.0 / _202;
    float _228 = _178 * _204;
    float _230 = 1.0 / _190;
    float _232 = _222 * _218;
    bool _234 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _236 = isnan(_174);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    bool _246 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _248 = isnan(_174);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_244;
    float _260 = _258 + 1.0;
    float _262 = _182 * _226;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _268;
    float _272 = _256 * _260;
    float _274 = -_256;
    float _276 = _274 + 1.0;
    float _278 = fma(_266, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_270, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _282 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_174);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _186 * _230;
    bool _296 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_174);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = fma(_310, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = -_306;
    float _320 = _318 + 1.0;
    float _322 = _306 * _276;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _216 * _320;
    float _334 = -_216;
    float _336 = _334 + 1.0;
    float _338 = fma(_314, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _340 = fma(_326, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _342 = fma(_330, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _344 = _292 * _336;
    float _346 = -_292;
    float _348 = _346 + 1.0;
    float _350 = _278 * _344;
    float _352 = _280 * _344;
    float _354 = _316 * _344;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _364 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_338, _332, _360);
    float _376 = fma(_340, _332, _362);
    float _378 = fma(_342, _332, _364);
    float _380 = fma(_358, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _382 = fma(_368, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _384 = fma(_372, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _398 = fma(_380, _322, _374);
    float _400 = fma(_388, _232, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _402 = fma(_392, _232, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _404 = fma(_396, _232, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _406 = fma(_382, _322, _376);
    float _408 = fma(_384, _322, _378);
    float _410 = fma(_400, _272, _398);
    float _412 = fma(_402, _272, _406);
    float _414 = fma(_404, _272, _408);
    float _416 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].x, _410);
    float _418 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].y, _412);
    float _420 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].z, _414);
    bool _422 = !_224;
    float _440;
    if (!_422)
    {
        float _424 = in.m_51.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _132;
    }
    _442 = false;
    float _444 = _440;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _444 + _452;
    bool _456 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _458 = isnan(_444);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _476 = 1.0 / _470;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _480 = 1.0 / _474;
    float _482 = _418 * _448;
    float _484 = _420 * _450;
    bool _486 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_444);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -_466;
    float _500 = _498 + 1.0;
    float _502 = _454 * _476;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _444 + _504;
    bool _508 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _510 = isnan(_444);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _496 * _500;
    float _522 = -_496;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _534;
    float _538 = _518 * _524;
    float _540 = fma(_528, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = fma(_532, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _544 = fma(_536, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _546 = _506 * _480;
    float _548 = _540 * _538;
    float _550 = _542 * _538;
    float _552 = _544 * _538;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].x, _548);
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].y, _550);
    float _574 = fma(_560, _546, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _576 = fma(_564, _546, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _578 = fma(_568, _546, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].z, _552);
    float _582 = fma(_574, _520, _570);
    float _584 = fma(_576, _520, _572);
    float _586 = _416 * _446;
    float _588 = fma(_578, _520, _580);
    float _590 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].x, _582);
    float _592 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].y, _584);
    float _594 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].z, _588);
    bool _596 = !_478;
    float _614;
    if (!_596)
    {
        float _598 = in.m_51.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _132;
    }
    _616 = false;
    float _618 = _614;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = _650 * _662;
    float _672 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _674 = fma(_670, _654, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _674 * _664;
    float _680 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[116].x, _682);
    float _692 = _690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_51.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _132;
    }
    _714 = false;
    float _716 = _712;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _720 = _716 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _724 = _716 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _728 = _716 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _746 = 1.0 / _740;
    bool _748 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _750 = isnan(_716);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _736;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _764 = _716 + _762;
    bool _766 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _768 = 1.0 / _744;
    float _770 = _720 * _746;
    bool _772 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _774 = isnan(_716);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = 1.0 / _732;
    float _786 = _764 * _760;
    bool _788 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _790 = isnan(_716);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_758;
    float _802 = _800 + 1.0;
    float _804 = -_798;
    float _806 = _804 + 1.0;
    float _808 = _724 * _768;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _814;
    float _818 = _798 * _802;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _824 = fma(_812, _770, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _826 = fma(_816, _770, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _828 = _728 * _784;
    bool _830 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _832 = isnan(_716);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _842;
    float _846 = fma(_822, _808, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _848 = fma(_844, _770, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _850 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _852 = isnan(_716);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _840 * _806;
    float _864 = -_840;
    float _866 = _864 + 1.0;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _876 = _860 * _866;
    float _878 = -_860;
    float _880 = _878 + 1.0;
    float _882 = fma(_874, _808, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _884 = fma(_870, _808, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _886 = _782 * _880;
    float _888 = -_782;
    float _890 = _888 + 1.0;
    float _892 = _824 * _886;
    float _894 = _826 * _886;
    float _896 = _848 * _886;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _898;
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].x, _892);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].y, _894);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].z, _896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _912;
    float _916 = fma(_882, _876, _902);
    float _918 = fma(_846, _876, _906);
    float _920 = fma(_900, _828, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _922 = fma(_910, _828, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _924 = fma(_884, _876, _904);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _934 = fma(_914, _828, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _940 = fma(_920, _862, _916);
    float _942 = fma(_928, _786, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _944 = fma(_932, _786, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _946 = fma(_922, _862, _924);
    float _948 = fma(_938, _786, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _950 = fma(_934, _862, _918);
    float _952 = fma(_942, _818, _940);
    float _954 = fma(_944, _818, _946);
    float _956 = fma(_948, _818, _950);
    float _958 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].x, _952);
    float _960 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].y, _954);
    float _962 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].z, _956);
    bool _964 = !_766;
    if (!_964)
    {
        float _966 = in.m_51.x;
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _970 = _966 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _140 = _980;
    }
    float _982 = _140;
    float _984 = in.m_51.z;
    float _986 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _988 = log2(_986);
    float _990 = in.m_51.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1002 = _1000 != 0;
    float _1004 = in.m_51.y;
    bool _1006 = !_998;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1012 = 1.0 + _1010;
    float _1014 = _120 * _988;
    float _1016 = 1.0 / _1012;
    float _1018 = in.m_42.x;
    float _1020 = in.m_42.y;
    float _1022 = in.m_42.z;
    float _1024 = _984 * 2.0;
    float _1026 = exp2(_1014);
    bool _1028 = !_994;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _990 * 2.0;
    float _1034 = _1004 * 2.0;
    float _1036 = floor(_1024);
    float _1038 = floor(_1032);
    float _1040 = -_1026;
    float _1042 = _1040 + 1.0;
    bool _1044 = _1036 > 0.0;
    float _1046 = floor(_1034);
    bool _1048 = _1036 >= 0.0;
    bool _1050 = isnan(_1036);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _990 + _1004;
    int _1060 = _1056 ? 0 : 1;
    float _1062 = _1058 + (-1.0);
    bool _1064 = _1038 > 0.0;
    float _1066 = _1004 + _984;
    bool _1068 = _1038 >= 0.0;
    bool _1070 = isnan(_1038);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _1066 + (-1.0);
    bool _1080 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1088 = _1084 || _1086;
    int _1090 = ~_1060;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    float _1096 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1098 = _1094;
    float _1100 = _1004;
    if (!_1044)
    {
        int _1102 = ~_1060;
        int _1104 = _1102 + 1;
        _1098 = _1104;
    }
    int _1106 = _1098;
    bool _1108 = _1046 > 0.0;
    float _1110 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1112 = _1088 ? _1042 : 0.0;
    float _1114 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1116 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1118 = _1046 >= 0.0;
    bool _1120 = isnan(_1046);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1114);
    float _1130 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1116);
    float _1132 = _1112 * _1016;
    int _1134 = abs(_1030);
    float _1136 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1128);
    float _1138 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1130);
    int _1140 = _1076 ? 0 : 1;
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1146 = ~_1140;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1154 = _1142 + _1152;
    float _1156 = -_1144;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1160 = _1150;
    float _1162 = _1154;
    float _1164 = _1158;
    bool _1166 = _1108;
    float _1168 = _1022;
    if (!_1064)
    {
        int _1170 = ~_1140;
        int _1172 = _1170 + 1;
        _1160 = _1172;
    }
    int _1174 = _1160;
    float _1176 = float(_1134);
    float _1178 = abs(_1154);
    float _1180 = abs(_1158);
    float _1182 = precise::max(_1178, _1180);
    float _1184 = float(_1106);
    bool _1186 = _1182 >= 16.0;
    bool _1188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(1.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = _1176 * _1184;
    int _1200 = abs(_1008);
    bool _1202 = !_1196;
    float _1204 = _1202 ? _120 : _1132;
    float _1206 = _1198 * (-2.0);
    float _1208 = _990 + (-0.5);
    int _1210 = _1126 ? 0 : 1;
    float _1212 = fma(_1096, _1206, _1096);
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    if (_1186)
    {
        float _1216 = _1154 * 0.0625;
        _1162 = _1216;
    }
    float _1218 = _1162;
    float _1220 = float(_1200);
    if (_1186)
    {
        float _1222 = _1158 * 0.0625;
        _1164 = _1222;
    }
    float _1224 = _1164;
    float _1226 = fma(_1204, _1212, _1214);
    float _1228 = float(_1174);
    float _1230 = _990 + _984;
    bool _1232 = !_1002;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1226 * 0.15915493667125701904296875;
    float _1238 = abs(_1218);
    bool _1240 = _1238 != 0.0;
    bool _1242 = isnan(_1238);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan(0.0);
    bool _1248 = _1244 || _1246;
    float _1250 = _1220 * _1228;
    int _1252 = ~_1210;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = _1230 + (-1.0);
    int _1260 = _1256;
    if (!_1108)
    {
        int _1262 = ~_1210;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _1250 * (-2.0);
    int _1270 = abs(_1234);
    float _1272 = _1236 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    float _1276 = abs(_1224);
    bool _1278 = _1276 == 0.0;
    bool _1280 = !_1248;
    bool _1282 = _1278 && _1280;
    float _1284 = in.m_55.x;
    float _1286 = in.m_55.y;
    float _1288 = in.m_55.z;
    float _1290 = float(_1270);
    float _1292 = fma(_1110, _1268, _1110);
    float _1294 = float(_1266);
    float _1296 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1298 = abs(_1224);
    bool _1300 = _1298 == 0.0;
    float _1302 = _1236 * 6.283185482025146484375;
    float _1304 = cos(_1302);
    float _1306 = _1004 + (-0.5);
    float _1308 = _1290 * _1294;
    float _1310 = _984 + (-0.5);
    float _1312 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1314 = _1308 * (-2.0);
    int _1316 = as_type<int>(_1308);
    int _1318 = as_type<int>(_1312);
    if (_1282)
    {
        bool _1320 = as_type<int>(_1224) >= 0;
        _1166 = _1320;
    }
    bool _1322 = _1166;
    float _1324 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1326 = fma(_1204, _1292, _1312);
    float _1328 = fma(_1296, _1314, _1296);
    int _1330 = _1322 ? (-1) : 0;
    if (_1282)
    {
        int _1332 = _1322 ? 0 : 1078530011;
        _1316 = _1332;
    }
    int _1334 = _1316;
    float _1336 = fma(_1204, _1328, _1324);
    if (_1282)
    {
        int _1338 = int(0x80000000) & as_type<int>(_1218);
        int _1340 = _1334 | _1338;
        _1318 = _1340;
    }
    int _1342 = _1318;
    bool _1344 = !_1248;
    bool _1346 = _1344 && _1300;
    int _1348 = _1342;
    float _1350 = as_type<float>(_1342);
    if (!_1346)
    {
        float _1352 = abs(_1218);
        bool _1354 = _1352 != as_type<float>(0x7f800000u /* inf */);
        bool _1356 = isnan(_1352);
        bool _1358 = _1354 || _1356;
        bool _1360 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1362 = _1358 || _1360;
        float _1364 = abs(_1224);
        bool _1366 = _1364 == as_type<float>(0x7f800000u /* inf */);
        float _1368 = abs(_1224);
        bool _1370 = _1368 == as_type<float>(0x7f800000u /* inf */);
        bool _1372 = !_1362;
        bool _1374 = _1370 && _1372;
        if (_1374)
        {
            bool _1376 = as_type<int>(_1224) >= 0;
            _1330 = _1376 ? (-1) : 0;
        }
        int _1378 = _1330;
        if (_1374)
        {
            _1348 = 1075235812;
        }
        int _1380 = _1348;
        int _1382 = _1380;
        if (_1374)
        {
            int _1384 = ~_1378;
            int _1386 = (_1384 != 0) ? _1380 : 1061752795;
            _1382 = _1386;
        }
        int _1388 = _1382;
        float _1390 = as_type<float>(_1388);
        if (_1374)
        {
            int _1392 = int(0x80000000) & as_type<int>(_1218);
            int _1394 = _1388 | _1392;
            _1390 = as_type<float>(_1394);
        }
        float _1396 = _1390;
        bool _1398 = !_1362;
        bool _1400 = _1398 && _1366;
        _1350 = _1396;
        if (!_1400)
        {
            float _1402 = abs(_1218);
            float _1404 = abs(_1224);
            float _1406 = precise::max(_1402, _1404);
            float _1408 = abs(_1218);
            float _1410 = abs(_1224);
            float _1412 = precise::min(_1408, _1410);
            float _1414 = 1.0 / _1406;
            float _1416 = abs(_1218);
            float _1418 = abs(_1224);
            bool _1420 = _1416 > _1418;
            bool _1422 = as_type<int>(_1224) >= 0;
            float _1424 = _1412 * _1414;
            float _1426 = _1424 * _1424;
            float _1428 = _1426 + 11.33538818359375;
            float _1430 = fma(_1426, _1428, 28.84246826171875);
            float _1432 = fma(_1426, _1430, 19.6966705322265625);
            float _1434 = fma(_1426, -0.82336294651031494140625, -5.674867153167724609375);
            float _1436 = fma(_1426, _1434, -6.565555095672607421875);
            float _1438 = 1.0 / _1432;
            float _1440 = _1426 * _1436;
            float _1442 = abs(_1218);
            float _1444 = abs(_1224);
            float _1446 = _1442 + _1444;
            int _1448 = as_type<int>(_1218) & int(0x80000000);
            float _1450 = _1424 * _1440;
            bool _1452 = _1446 > as_type<float>(0x7f800000u /* inf */);
            bool _1454 = isnan(_1446);
            bool _1456 = _1452 || _1454;
            bool _1458 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1460 = _1456 || _1458;
            float _1462 = fma(_1450, _1438, _1424);
            float _1464 = _1462;
            _1350 = _1446;
            if (_1420)
            {
                float _1466 = -_1462;
                float _1468 = _1466 + 1.57079637050628662109375;
                _1464 = _1468;
            }
            float _1470 = _1464;
            int _1472 = as_type<int>(_1470);
            if (!_1422)
            {
                float _1474 = -_1470;
                float _1476 = _1474 + 3.1415927410125732421875;
                _1472 = as_type<int>(_1476);
            }
            int _1478 = _1472;
            if (!_1460)
            {
                int _1480 = _1448 | _1478;
                _1350 = as_type<float>(_1480);
            }
        }
    }
    float _1482 = _1350;
    float _1484 = -_1482;
    float _1486 = _1326 + _1484;
    float _1488 = _1336 * 0.15915493667125701904296875;
    float _1490 = _984 * 6.283185482025146484375;
    float _1492 = _1486 * 0.15915493667125701904296875;
    float _1494 = _1488 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _990 * 6.283185482025146484375;
    float _1500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1502 = fma(_120, 0.310000002384185791015625, _1490);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1288);
    float _1506 = fma(_120, 0.10999999940395355224609375, _1498);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1286);
    float _1510 = _1502 * 0.15915493667125701904296875;
    float _1512 = _1492 * 6.283185482025146484375;
    float _1514 = sin(_1512);
    float _1516 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1506 * 0.15915493667125701904296875;
    float _1520 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1522 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1524 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1526 = _1492 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1504 * _1522;
    float _1532 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1524);
    float _1534 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1532);
    float _1536 = _1488 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    float _1540 = _1508 * _1516;
    float _1542 = _1304 * _1514;
    float _1544 = _1500 * _1520;
    float _1546 = _1534 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1548 = _1510 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = _1496 * _1540;
    float _1554 = _1274 * _1528;
    float _1556 = _1304 * _1528;
    float _1558 = _1528 * _1496;
    float _1560 = _1274 * _1552;
    float _1562 = _1274 * _1514;
    float _1564 = _1514 * _1496;
    float _1566 = _1518 * 6.283185482025146484375;
    float _1568 = sin(_1566);
    float _1570 = -_1542;
    float _1572 = fma(_1538, _1554, _1570);
    float _1574 = _1304 * _1552;
    float _1576 = fma(_1538, _1556, _1562);
    float _1578 = fma(_1572, _1544, _1560);
    float _1580 = -_1540;
    float _1582 = _1538 * _1580;
    float _1584 = fma(_1538, _1562, _1556);
    float _1586 = fma(_1550, 0.12999999523162841796875, 1.0);
    float _1588 = -_1554;
    float _1590 = fma(_1538, _1542, _1588);
    float _1592 = fma(_1558, _1544, _1582);
    float _1594 = fma(_1584, _1530, _1578);
    float _1596 = fma(_1576, _1544, _1574);
    float _1598 = fma(_1564, _1530, _1592);
    float _1600 = _1144 + _1594;
    float _1602 = fma(_1568, 0.300000011920928955078125, _1586);
    float _1604 = fma(_1590, _1530, _1596);
    float _1606 = _1142 + _1598;
    float _1608 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1600);
    float _1610 = _1546 + _1604;
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1606);
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1616 = _1608 + _1614;
    float _1618 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1610);
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1622 = _1612 + _1620;
    float _1624 = _1616 * _1616;
    float _1626 = fma(_1622, _1622, _1624);
    float _1628 = sqrt(_1626);
    bool _1630 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = _1534;
    float _1634 = _1576;
    float _1636 = _1628;
    float _1638 = _1612;
    float _1640 = _1610;
    if (!_1630)
    {
        _1632 = _1612;
    }
    float _1642 = _1632;
    float _1644 = _1642;
    if (!_1630)
    {
        _1634 = _1608;
    }
    float _1646 = _1634;
    float _1648 = _1646;
    if (!_1630)
    {
        _1168 = _1618;
    }
    float _1650 = _1168;
    bool _1652 = !_1630;
    float _1654 = _1650;
    if (!_1652)
    {
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1660 = _1628 + _1658;
        float _1662 = rsqrt(_1626);
        float _1664 = _1660 * _1656;
        float _1666 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = _1664 * 0.15915493667125701904296875;
        float _1670 = _1668 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        float _1674 = _1668 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 + (-1.0);
        float _1680 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1682 = fma(_1676, _1666, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1684 = fma(_1618, _1672, _1680);
        float _1686 = _1662 * _1682;
        float _1688 = fma(_1622, _1686, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1616, _1686, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1654 = _1684;
        _1644 = _1688;
        _1648 = _1690;
    }
    float _1692 = _1654;
    float _1694 = _1644;
    float _1696 = _1648;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = fma(_1708, _1708, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1716;
    float _1742 = _1730;
    float _1744 = _1738;
    float _1746 = _1700;
    if (_1734)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1748;
    }
    float _1750 = _1740;
    if (_1734)
    {
        float _1752 = rsqrt(_1730);
        _1742 = _1752;
    }
    float _1754 = _1742;
    float _1756 = _1754;
    if (_1734)
    {
        float _1758 = _1738 * _1750;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (_1734)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1636 = _1762;
    }
    float _1764 = _1636;
    float _1766 = _1708;
    if (_1734)
    {
        float _1768 = _1764 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1776 = precise::max(0.0, _1774);
    float _1778 = _1750;
    float _1780 = _1776;
    if (_1734)
    {
        float _1782 = _1764 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        _1778 = _1784;
    }
    float _1786 = _1778;
    float _1788 = -_1720;
    float _1790 = -_1776;
    float _1792 = fma(_1700, _1788, _1790);
    if (_1734)
    {
        float _1794 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1794;
    }
    float _1796 = _1746;
    float _1798 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1800 = _1796;
    float _1802 = _1772;
    if (_1734)
    {
        float _1804 = fma(_1772, _1796, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1800 = _1804;
    }
    float _1806 = _1800;
    float _1808 = _1806;
    if (!_1734)
    {
        _1802 = _1722;
    }
    float _1810 = _1802;
    float _1812 = _1810;
    float _1814 = _1786;
    if (_1734)
    {
        float _1816 = _1786 + (-1.0);
        _1780 = _1816;
    }
    float _1818 = _1780;
    float _1820 = _1818;
    if (_1734)
    {
        float _1822 = _1754 * _1806;
        _1638 = _1822;
    }
    float _1824 = _1638;
    if (!_1734)
    {
        _1808 = _1792;
    }
    float _1826 = _1808;
    float _1828 = _1826;
    if (_1734)
    {
        float _1830 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1830;
    }
    float _1832 = _1640;
    if (_1734)
    {
        float _1834 = _1722 * _1824;
        _1812 = _1834;
    }
    float _1836 = _1812;
    if (!_1734)
    {
        _1820 = _1724;
    }
    float _1838 = _1820;
    float _1840 = _1838;
    if (_1734)
    {
        float _1842 = _1724 * _1824;
        _1840 = _1842;
    }
    float _1844 = _1840;
    if (!_1734)
    {
        _1756 = _1726;
    }
    float _1846 = _1756;
    float _1848 = _1846;
    if (_1734)
    {
        float _1850 = fma(_1792, _1786, _1832);
        _1828 = _1850;
    }
    float _1852 = _1828;
    if (_1734)
    {
        float _1854 = _1836 * _1836;
        _1848 = _1854;
    }
    float _1856 = _1848;
    if (!_1734)
    {
        _1814 = _1728;
    }
    float _1858 = _1814;
    float _1860 = _1858;
    if (_1734)
    {
        float _1862 = _1844 * _1844;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1852, _1852, _1856);
    float _1868 = _1866 + _1864;
    float _1870 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1798);
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1876 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1874);
    float _1878 = precise::clamp(_1876, 0.0, 1.0);
    float _1880 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1882 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1884 = rsqrt(_1868);
    float _1886 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1888 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1872);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1880);
    float _1894 = -_1878;
    float _1896 = _1894 + 1.0;
    float _1898 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1900 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1888);
    float _1902 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1892);
    float _1904 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1906 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1898);
    float _1908 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = abs(_1896);
    float _1912 = log2(_1910);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1906);
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1920 = _1884 * _1836;
    float _1922 = _1884 * _1852;
    float _1924 = _1884 * _1844;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1918);
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = -_1904;
    float _1934 = fma(_1932, _1886, 1.0);
    float _1936 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1926);
    float _1938 = -_1928;
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1938);
    float _1942 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1944 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    float _1948 = -_1924;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1940);
    float _1952 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1954 = log2(_1934);
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1942);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1962 = fma(_1950, 0.5, 0.5);
    float _1964 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1956);
    float _1966 = _1922 + 1.0;
    float _1968 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = 1.0 / _1946;
    float _1972 = fma(_1962, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1974 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1964);
    float _1976 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1978 = fma(_1962, _1972, -0.212114393711090087890625);
    float _1980 = sqrt(_1958);
    float _1982 = _1954 * 0.693147182464599609375;
    float _1984 = fma(_1962, _1978, 1.570728778839111328125);
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1988 = exp2(_1952);
    float _1990 = _1974 * _1970;
    float _1992 = _1976 * _1970;
    float _1994 = fma(_1990, 0.5, 0.5);
    float _1996 = fma(_1992, -0.5, 0.5);
    float _1998 = _1980 * 0.636619746685028076171875;
    float _2000 = -_1922;
    float _2002 = fma(_1988, _1966, _2000);
    float _2004 = -_1984;
    float _2006 = fma(_1998, _2004, 1.0);
    float3 _5525 = float3(_1994, _1996, _1986);
    float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).x;
    float3 _5536 = float3(_1994, _1996, _1986);
    float4 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5536, float3(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5536, float3(0.0), isnan(_5536)), level(0.0)).xyzw;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _2011.w;
    float _2021 = fma(_2002, 0.5, 0.5);
    float2 _5555 = float2(_2006, _2021);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5555, float2(0.0), isnan(_5555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5555, float2(0.0), isnan(_5555)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = in.m_57.y;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2037 = in.m_59.y;
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2045 = _2043 != 0;
    out.m_61.x = _684;
    out.m_61.y = _686;
    out.m_61.z = _688;
    out.m_61.w = _692;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2049 = _2047 != 0;
    float _2051 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2055 = _2053 != 0;
    float _2057 = in.m_59.x;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2061 = _2059 != 0;
    float _2063 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2067 = _2065 != 0;
    float _2069 = in.m_57.x;
    bool _2071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2073 = isnan(0.5);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2079 = _2075 || _2077;
    bool _2081 = _984 > 0.5;
    float _2083 = 1.0 / _2041;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2087 = _990 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2089 = -_2033;
    float _2091 = _2089 + 1.0;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2095 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2097 = -_2085;
    float _2099 = fma(_2087, 2.0, _2097);
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2101;
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2107 = fma(_2095, -2.0, _2093);
    int _2109 = _2081 ? as_type<int>(_2091) : as_type<int>(_2033);
    out.m_63.y = _2037;
    bool _2111 = _1004 > 0.5;
    float _2113 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2107);
    float _2115 = _2103 * _2083;
    out.m_65.w = _2033;
    int _2117 = _2111 ? as_type<int>(_2091) : as_type<int>(_2033);
    float _2119 = exp2(_2051);
    float _2121 = _2091;
    float _2123 = _2041;
    bool _2125 = _2055;
    float _2127 = _2115;
    if (_2067)
    {
        _2121 = _990;
    }
    float _2129 = _2121;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2133 = _2061 ? as_type<float>(_2117) : _2033;
    out.m_63.x = _2057;
    float _2135 = _2129;
    if (!_2067)
    {
        _2135 = _984;
    }
    float _2137 = _2135;
    float _2139 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2063);
    float _2141 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2145 = _2055 ? as_type<float>(_2109) : _2033;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_2067)
    {
        _2123 = _1004;
    }
    float _2149 = _2123;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2153 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2143);
    float _2155 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2147);
    float _2157 = _2149;
    if (_2045)
    {
        bool _2159 = _990 > 0.5;
        _2125 = _2159;
    }
    bool _2161 = _2125;
    float _2163 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2151);
    float _2165 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2131);
    if (!_2067)
    {
        _2157 = _990;
    }
    float _2167 = _2157;
    float _2169 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2171 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2175 = _982 + _2173;
    float _2177 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2155);
    float _2179 = fma(_2169, _2133, -0.5);
    float _2181 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2183 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2153);
    float _2187 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2171);
    float _2189 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    float _2191 = -_2113;
    float _2193 = fma(_2185, _2179, _2191);
    bool _2195 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2197 = isnan(_982);
    bool _2199 = _2195 || _2197;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2203 = _2199 || _2201;
    float _2205 = float(_2203);
    float _2207 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2187);
    float _2209 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2189);
    bool _2211 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2213 = isnan(_982);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = fma(_2145, _2181, -0.5);
    float _2225 = -_2205;
    float _2227 = _2225 + 1.0;
    float _2229 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2233 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2235 = fma(_2115, _2175, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2237 = 1.0 / _2229;
    float _2239 = _2221 * _2227;
    float _2241 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2243 = fma(_2233, -2.0, _2231);
    float _2245 = _2235 * _2239;
    float _2247 = _2241 + _2229;
    float _2249 = -_2221;
    float _2251 = _2249 + 1.0;
    float _2253 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2255 = _2229;
    int _2257 = as_type<int>(_2253);
    if (!_2079)
    {
        _2255 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2259 = _2255;
    float _2261 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2243);
    float _2263 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2245);
    float _2265 = _2263;
    if (!_2045)
    {
        _1100 = _2069;
    }
    float _2267 = _1100;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2273 = -_2261;
    float _2275 = fma(_2177, _2223, _2273);
    float _2277 = _2247 * _2237;
    float _2279 = _2277 * 0.5;
    float _2281 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2263);
    float _2283 = _2279;
    float _2285 = _2267;
    if (!_2045)
    {
        _2127 = _2267;
    }
    float _2287 = _2127;
    float _2289 = -_2269;
    float _2291 = fma(_2253, 2.0, _2289);
    float _2293 = _2287;
    if (!_2079)
    {
        float _2295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2297 = fma(_2279, _2259, _2295);
        _2283 = _2297;
    }
    float _2299 = _2283;
    if (!_2079)
    {
        _2265 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2301 = _2265;
    float _2303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2045)
    {
        _2285 = _2069;
    }
    float _2305 = _2285;
    float _2307 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2163);
    float _2309 = -_120;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2099);
    float _2313 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2165);
    float _2315 = -_120;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2291);
    float _2319 = _2305;
    if (!_2079)
    {
        float _2321 = -_2301;
        float _2323 = _2321 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _142 = _2323;
    }
    float _2325 = _142;
    float _2327 = _2325;
    if (_2045)
    {
        float _2329 = -_2305;
        float _2331 = _2329 + 1.0;
        _2257 = as_type<int>(_2331);
    }
    int _2333 = _2257;
    float _2335 = _2299;
    if (!_2079)
    {
        float _2337 = 1.0 / _2299;
        _2335 = _2337;
    }
    float _2339 = _2335;
    int _2341 = 0;
    if (_2049)
    {
        float _2343 = -_2305;
        float _2345 = _2343 + 1.0;
        _2341 = as_type<int>(_2345);
    }
    int _2347 = _2341;
    float _2349 = _2271 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2351 = -_2119;
    float _2353 = _2351 + 1.0;
    if (_2045)
    {
        float _2355 = _2161 ? as_type<float>(_2333) : _2305;
        _2293 = _2355;
    }
    float _2357 = _2293;
    float _2359 = _962 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2049)
    {
        float _2361 = _2111 ? as_type<float>(_2347) : _2305;
        _2319 = _2361;
    }
    float _2363 = _2319;
    float _2365 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2367 = _2165;
    float _2369 = _2363;
    if (!_2079)
    {
        float _2371 = 1.0 / _2325;
        _2367 = _2371;
    }
    float _2373 = _2367;
    float _2375 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2377 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2379 = fma(_2349, _2363, -0.5);
    float _2381 = _2281 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2383 = fma(_2375, _2357, -0.5);
    float _2385 = _958 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2387 = fma(_2313, _2379, _2317);
    if (!_2079)
    {
        float _2389 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2391 = -_2301;
        float _2393 = fma(_2339, _2389, _2391);
        _2369 = _2393;
    }
    float _2395 = _2369;
    float _2397 = _960 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_2079)
    {
        _2327 = 1.0;
    }
    float _2399 = _2327;
    float _2401 = _2385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2405 = _2397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2407 = fma(_2307, _2383, _2311);
    float _2409 = _2193 + 0.5;
    float _2411 = _2399;
    if (!_2079)
    {
        float _2413 = _2395 * _2373;
        float _2415 = precise::clamp(_2413, 0.0, 1.0);
        _2411 = _2415;
    }
    float _2417 = _2411;
    float _2419 = _2403 + _1946;
    out.m_67.x = _2401;
    out.m_67.y = _2405;
    out.m_67.z = _2377;
    out.m_67.w = _2381;
    float _2421 = _2275 + 0.5;
    float _2423 = _2417 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2425 = _2417 > 0.0;
    bool _2427 = isnan(_2417);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = _2419 * 0.5;
    float _2437 = _2387 + 0.5;
    float _2439 = _2407 + 0.5;
    out.m_65.y = _2409;
    out.m_69.x = _2437;
    out.m_69.y = _2421;
    float _2441 = _2423 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2439;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1976;
    out.gl_Position.z = _2403;
    out.gl_Position.w = _1946;
    out.m_71.z = _2435;
    out.m_71.w = _1946;
    out.m_45.x = _2441;
    float _2443 = _2365 * _2008;
    float _2445 = -_2365;
    float _2447 = _2445 + 1.0;
    float _2449 = _2019 * _2443;
    float _2451 = _2019 * _2447;
    float _2453 = _2031 * _2443;
    float _2455 = fma(_2027, _2449, _2013);
    float _2457 = fma(_2029, _2449, _2015);
    float _2459 = fma(_2019, _2453, _2017);
    out.m_73.x = _2455;
    out.m_73.y = _2457;
    out.m_73.z = _2459;
    out.m_73.w = _2451;
    if (_2433)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2461 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2461;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _714 = false;
    bool _616 = false;
    bool _442 = false;
    bool _172 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    float _100 = as_type<float>(_92);
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _98;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _102 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2519 = as_type<float>(_108);
        out.gl_Position.z = _2519;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    float _114 = float(_92);
    float _116 = 1.0 / _114;
    float _118 = -_112;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_112);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = _120 * _116;
    bool _134 = _120 >= _114;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    out.m_49.x = _132;
    float _140 = _132;
    float _142 = _120;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _146 = _144 * 5.0;
        _110 = as_type<int>(_146);
    }
    int _148 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2591 = as_type<float>(_148);
        out.gl_Position.z = _2591;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _152 = !_150;
    float _170;
    if (!_152)
    {
        float _154 = in.m_51.x;
        float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _158 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _160 = fma(_158, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _162 = _160 * _156;
        float _164 = floor(_162);
        float _166 = -_164;
        float _168 = _162 + _166;
        _170 = _168;
        _172 = true;
    }
    else
    {
        _170 = _132;
    }
    _172 = false;
    float _174 = _170;
    float _176 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _178 = _174 + _176;
    float _180 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _182 = _174 + _180;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _186 = _174 + _184;
    float _188 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _190 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _188;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _194 = _192 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _200 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = 1.0 / _198;
    bool _206 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_174);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = 1.0 / _194;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _222 = _174 + _220;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _226 = 1.0 / _202;
    float _228 = _178 * _204;
    float _230 = 1.0 / _190;
    float _232 = _222 * _218;
    bool _234 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _236 = isnan(_174);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    bool _246 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _248 = isnan(_174);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = -_244;
    float _260 = _258 + 1.0;
    float _262 = _182 * _226;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _268;
    float _272 = _256 * _260;
    float _274 = -_256;
    float _276 = _274 + 1.0;
    float _278 = fma(_266, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _280 = fma(_270, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _282 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_174);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _186 * _230;
    bool _296 = _174 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_174);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _316 = fma(_310, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = -_306;
    float _320 = _318 + 1.0;
    float _322 = _306 * _276;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _216 * _320;
    float _334 = -_216;
    float _336 = _334 + 1.0;
    float _338 = fma(_314, _262, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _340 = fma(_326, _262, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _342 = fma(_330, _262, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _344 = _292 * _336;
    float _346 = -_292;
    float _348 = _346 + 1.0;
    float _350 = _278 * _344;
    float _352 = _280 * _344;
    float _354 = _316 * _344;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _364 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_338, _332, _360);
    float _376 = fma(_340, _332, _362);
    float _378 = fma(_342, _332, _364);
    float _380 = fma(_358, _294, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _382 = fma(_368, _294, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _384 = fma(_372, _294, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _398 = fma(_380, _322, _374);
    float _400 = fma(_388, _232, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _402 = fma(_392, _232, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _404 = fma(_396, _232, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _406 = fma(_382, _322, _376);
    float _408 = fma(_384, _322, _378);
    float _410 = fma(_400, _272, _398);
    float _412 = fma(_402, _272, _406);
    float _414 = fma(_404, _272, _408);
    float _416 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].x, _410);
    float _418 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].y, _412);
    float _420 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[147].z, _414);
    bool _422 = !_224;
    float _440;
    if (!_422)
    {
        float _424 = in.m_51.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _132;
    }
    _442 = false;
    float _444 = _440;
    float _446 = in.m_53.x;
    float _448 = in.m_53.y;
    float _450 = in.m_53.z;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _454 = _444 + _452;
    bool _456 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _458 = isnan(_444);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _476 = 1.0 / _470;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _480 = 1.0 / _474;
    float _482 = _418 * _448;
    float _484 = _420 * _450;
    bool _486 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_444);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -_466;
    float _500 = _498 + 1.0;
    float _502 = _454 * _476;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _444 + _504;
    bool _508 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _510 = isnan(_444);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = _496 * _500;
    float _522 = -_496;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _534;
    float _538 = _518 * _524;
    float _540 = fma(_528, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _542 = fma(_532, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _544 = fma(_536, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _546 = _506 * _480;
    float _548 = _540 * _538;
    float _550 = _542 * _538;
    float _552 = _544 * _538;
    float _554 = -_518;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].x, _548);
    float _572 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].y, _550);
    float _574 = fma(_560, _546, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _576 = fma(_564, _546, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _578 = fma(_568, _546, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[107].z, _552);
    float _582 = fma(_574, _520, _570);
    float _584 = fma(_576, _520, _572);
    float _586 = _416 * _446;
    float _588 = fma(_578, _520, _580);
    float _590 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].x, _582);
    float _592 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].y, _584);
    float _594 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[109].z, _588);
    bool _596 = !_478;
    float _614;
    if (!_596)
    {
        float _598 = in.m_51.x;
        float _600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _602 = _598 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _604 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _606 = _604 * _600;
        float _608 = floor(_606);
        float _610 = -_608;
        float _612 = _606 + _610;
        _614 = _612;
        _616 = true;
    }
    else
    {
        _614 = _132;
    }
    _616 = false;
    float _618 = _614;
    bool _620 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _622 = isnan(_618);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _638 = isnan(_618);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _648;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _654 = _618 + _652;
    float _656 = -_630;
    float _658 = _656 + 1.0;
    bool _660 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _662 = 1.0 / _634;
    float _664 = _646 * _658;
    float _666 = -_646;
    float _668 = _666 + 1.0;
    float _670 = _650 * _662;
    float _672 = _592 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _674 = fma(_670, _654, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _590 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _678 = _674 * _664;
    float _680 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _682 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[116].x, _682);
    float _692 = _690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _694 = !_660;
    float _712;
    if (!_694)
    {
        float _696 = in.m_51.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _132;
    }
    _714 = false;
    float _716 = _712;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _720 = _716 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _724 = _716 + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _728 = _716 + _726;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _738;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _746 = 1.0 / _740;
    bool _748 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _750 = isnan(_716);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = 1.0 / _736;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _764 = _716 + _762;
    bool _766 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _768 = 1.0 / _744;
    float _770 = _720 * _746;
    bool _772 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _774 = isnan(_716);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = 1.0 / _732;
    float _786 = _764 * _760;
    bool _788 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _790 = isnan(_716);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_758;
    float _802 = _800 + 1.0;
    float _804 = -_798;
    float _806 = _804 + 1.0;
    float _808 = _724 * _768;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _814;
    float _818 = _798 * _802;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _822 = _820 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _824 = fma(_812, _770, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _826 = fma(_816, _770, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _828 = _728 * _784;
    bool _830 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _832 = isnan(_716);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _838 = _834 || _836;
    float _840 = float(_838);
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _842;
    float _846 = fma(_822, _808, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _848 = fma(_844, _770, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _850 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _852 = isnan(_716);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _840 * _806;
    float _864 = -_840;
    float _866 = _864 + 1.0;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _876 = _860 * _866;
    float _878 = -_860;
    float _880 = _878 + 1.0;
    float _882 = fma(_874, _808, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _884 = fma(_870, _808, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _886 = _782 * _880;
    float _888 = -_782;
    float _890 = _888 + 1.0;
    float _892 = _824 * _886;
    float _894 = _826 * _886;
    float _896 = _848 * _886;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _898;
    float _902 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].x, _892);
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].y, _894);
    float _906 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[123].z, _896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _912;
    float _916 = fma(_882, _876, _902);
    float _918 = fma(_846, _876, _906);
    float _920 = fma(_900, _828, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _922 = fma(_910, _828, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _924 = fma(_884, _876, _904);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _934 = fma(_914, _828, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _940 = fma(_920, _862, _916);
    float _942 = fma(_928, _786, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _944 = fma(_932, _786, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _946 = fma(_922, _862, _924);
    float _948 = fma(_938, _786, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _950 = fma(_934, _862, _918);
    float _952 = fma(_942, _818, _940);
    float _954 = fma(_944, _818, _946);
    float _956 = fma(_948, _818, _950);
    float _958 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].x, _952);
    float _960 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].y, _954);
    float _962 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[127].z, _956);
    bool _964 = !_766;
    if (!_964)
    {
        float _966 = in.m_51.x;
        float _968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _970 = _966 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _974 = _972 * _968;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _140 = _980;
    }
    float _982 = _140;
    float _984 = in.m_51.z;
    float _986 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _988 = log2(_986);
    float _990 = in.m_51.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _998 = _996 != 0;
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1002 = _1000 != 0;
    float _1004 = in.m_51.y;
    bool _1006 = !_998;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1012 = 1.0 + _1010;
    float _1014 = _120 * _988;
    float _1016 = 1.0 / _1012;
    float _1018 = in.m_42.x;
    float _1020 = in.m_42.y;
    float _1022 = in.m_42.z;
    float _1024 = _984 * 2.0;
    float _1026 = exp2(_1014);
    bool _1028 = !_994;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _990 * 2.0;
    float _1034 = _1004 * 2.0;
    float _1036 = floor(_1024);
    float _1038 = floor(_1032);
    float _1040 = -_1026;
    float _1042 = _1040 + 1.0;
    bool _1044 = _1036 > 0.0;
    float _1046 = floor(_1034);
    bool _1048 = _1036 >= 0.0;
    bool _1050 = isnan(_1036);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _990 + _1004;
    int _1060 = _1056 ? 0 : 1;
    float _1062 = _1058 + (-1.0);
    bool _1064 = _1038 > 0.0;
    float _1066 = _1004 + _984;
    bool _1068 = _1038 >= 0.0;
    bool _1070 = isnan(_1038);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _1066 + (-1.0);
    bool _1080 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1088 = _1084 || _1086;
    int _1090 = ~_1060;
    int _1092 = _1090 + 1;
    int _1094 = _1092 + 1;
    float _1096 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1098 = _1094;
    float _1100 = _1004;
    if (!_1044)
    {
        int _1102 = ~_1060;
        int _1104 = _1102 + 1;
        _1098 = _1104;
    }
    int _1106 = _1098;
    bool _1108 = _1046 > 0.0;
    float _1110 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1112 = _1088 ? _1042 : 0.0;
    float _1114 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1116 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1118 = _1046 >= 0.0;
    bool _1120 = isnan(_1046);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1114);
    float _1130 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1116);
    float _1132 = _1112 * _1016;
    int _1134 = abs(_1030);
    float _1136 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1128);
    float _1138 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1130);
    int _1140 = _1076 ? 0 : 1;
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1146 = ~_1140;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1154 = _1142 + _1152;
    float _1156 = -_1144;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1160 = _1150;
    float _1162 = _1154;
    float _1164 = _1158;
    bool _1166 = _1108;
    float _1168 = _1022;
    if (!_1064)
    {
        int _1170 = ~_1140;
        int _1172 = _1170 + 1;
        _1160 = _1172;
    }
    int _1174 = _1160;
    float _1176 = float(_1134);
    float _1178 = abs(_1154);
    float _1180 = abs(_1158);
    float _1182 = precise::max(_1178, _1180);
    float _1184 = float(_1106);
    bool _1186 = _1182 >= 16.0;
    bool _1188 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(1.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = _1176 * _1184;
    int _1200 = abs(_1008);
    bool _1202 = !_1196;
    float _1204 = _1202 ? _120 : _1132;
    float _1206 = _1198 * (-2.0);
    float _1208 = _990 + (-0.5);
    int _1210 = _1126 ? 0 : 1;
    float _1212 = fma(_1096, _1206, _1096);
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    if (_1186)
    {
        float _1216 = _1154 * 0.0625;
        _1162 = _1216;
    }
    float _1218 = _1162;
    float _1220 = float(_1200);
    if (_1186)
    {
        float _1222 = _1158 * 0.0625;
        _1164 = _1222;
    }
    float _1224 = _1164;
    float _1226 = fma(_1204, _1212, _1214);
    float _1228 = float(_1174);
    float _1230 = _990 + _984;
    bool _1232 = !_1002;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = _1226 * 0.15915493667125701904296875;
    float _1238 = abs(_1218);
    bool _1240 = _1238 != 0.0;
    bool _1242 = isnan(_1238);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan(0.0);
    bool _1248 = _1244 || _1246;
    float _1250 = _1220 * _1228;
    int _1252 = ~_1210;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    float _1258 = _1230 + (-1.0);
    int _1260 = _1256;
    if (!_1108)
    {
        int _1262 = ~_1210;
        int _1264 = _1262 + 1;
        _1260 = _1264;
    }
    int _1266 = _1260;
    float _1268 = _1250 * (-2.0);
    int _1270 = abs(_1234);
    float _1272 = _1236 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    float _1276 = abs(_1224);
    bool _1278 = _1276 == 0.0;
    bool _1280 = !_1248;
    bool _1282 = _1278 && _1280;
    float _1284 = in.m_55.x;
    float _1286 = in.m_55.y;
    float _1288 = in.m_55.z;
    float _1290 = float(_1270);
    float _1292 = fma(_1110, _1268, _1110);
    float _1294 = float(_1266);
    float _1296 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1298 = abs(_1224);
    bool _1300 = _1298 == 0.0;
    float _1302 = _1236 * 6.283185482025146484375;
    float _1304 = cos(_1302);
    float _1306 = _1004 + (-0.5);
    float _1308 = _1290 * _1294;
    float _1310 = _984 + (-0.5);
    float _1312 = _1306 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1314 = _1308 * (-2.0);
    int _1316 = as_type<int>(_1308);
    int _1318 = as_type<int>(_1312);
    if (_1282)
    {
        bool _1320 = as_type<int>(_1224) >= 0;
        _1166 = _1320;
    }
    bool _1322 = _1166;
    float _1324 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1326 = fma(_1204, _1292, _1312);
    float _1328 = fma(_1296, _1314, _1296);
    int _1330 = _1322 ? (-1) : 0;
    if (_1282)
    {
        int _1332 = _1322 ? 0 : 1078530011;
        _1316 = _1332;
    }
    int _1334 = _1316;
    float _1336 = fma(_1204, _1328, _1324);
    if (_1282)
    {
        int _1338 = int(0x80000000) & as_type<int>(_1218);
        int _1340 = _1334 | _1338;
        _1318 = _1340;
    }
    int _1342 = _1318;
    bool _1344 = !_1248;
    bool _1346 = _1344 && _1300;
    int _1348 = _1342;
    float _1350 = as_type<float>(_1342);
    if (!_1346)
    {
        float _1352 = abs(_1218);
        bool _1354 = _1352 != as_type<float>(0x7f800000u /* inf */);
        bool _1356 = isnan(_1352);
        bool _1358 = _1354 || _1356;
        bool _1360 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1362 = _1358 || _1360;
        float _1364 = abs(_1224);
        bool _1366 = _1364 == as_type<float>(0x7f800000u /* inf */);
        float _1368 = abs(_1224);
        bool _1370 = _1368 == as_type<float>(0x7f800000u /* inf */);
        bool _1372 = !_1362;
        bool _1374 = _1370 && _1372;
        if (_1374)
        {
            bool _1376 = as_type<int>(_1224) >= 0;
            _1330 = _1376 ? (-1) : 0;
        }
        int _1378 = _1330;
        if (_1374)
        {
            _1348 = 1075235812;
        }
        int _1380 = _1348;
        int _1382 = _1380;
        if (_1374)
        {
            int _1384 = ~_1378;
            int _1386 = (_1384 != 0) ? _1380 : 1061752795;
            _1382 = _1386;
        }
        int _1388 = _1382;
        float _1390 = as_type<float>(_1388);
        if (_1374)
        {
            int _1392 = int(0x80000000) & as_type<int>(_1218);
            int _1394 = _1388 | _1392;
            _1390 = as_type<float>(_1394);
        }
        float _1396 = _1390;
        bool _1398 = !_1362;
        bool _1400 = _1398 && _1366;
        _1350 = _1396;
        if (!_1400)
        {
            float _1402 = abs(_1218);
            float _1404 = abs(_1224);
            float _1406 = precise::max(_1402, _1404);
            float _1408 = abs(_1218);
            float _1410 = abs(_1224);
            float _1412 = precise::min(_1408, _1410);
            float _1414 = 1.0 / _1406;
            float _1416 = abs(_1218);
            float _1418 = abs(_1224);
            bool _1420 = _1416 > _1418;
            bool _1422 = as_type<int>(_1224) >= 0;
            float _1424 = _1412 * _1414;
            float _1426 = _1424 * _1424;
            float _1428 = _1426 + 11.33538818359375;
            float _1430 = fma(_1426, _1428, 28.84246826171875);
            float _1432 = fma(_1426, _1430, 19.6966705322265625);
            float _1434 = fma(_1426, -0.82336294651031494140625, -5.674867153167724609375);
            float _1436 = fma(_1426, _1434, -6.565555095672607421875);
            float _1438 = 1.0 / _1432;
            float _1440 = _1426 * _1436;
            float _1442 = abs(_1218);
            float _1444 = abs(_1224);
            float _1446 = _1442 + _1444;
            int _1448 = as_type<int>(_1218) & int(0x80000000);
            float _1450 = _1424 * _1440;
            bool _1452 = _1446 > as_type<float>(0x7f800000u /* inf */);
            bool _1454 = isnan(_1446);
            bool _1456 = _1452 || _1454;
            bool _1458 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1460 = _1456 || _1458;
            float _1462 = fma(_1450, _1438, _1424);
            float _1464 = _1462;
            _1350 = _1446;
            if (_1420)
            {
                float _1466 = -_1462;
                float _1468 = _1466 + 1.57079637050628662109375;
                _1464 = _1468;
            }
            float _1470 = _1464;
            int _1472 = as_type<int>(_1470);
            if (!_1422)
            {
                float _1474 = -_1470;
                float _1476 = _1474 + 3.1415927410125732421875;
                _1472 = as_type<int>(_1476);
            }
            int _1478 = _1472;
            if (!_1460)
            {
                int _1480 = _1448 | _1478;
                _1350 = as_type<float>(_1480);
            }
        }
    }
    float _1482 = _1350;
    float _1484 = -_1482;
    float _1486 = _1326 + _1484;
    float _1488 = _1336 * 0.15915493667125701904296875;
    float _1490 = _984 * 6.283185482025146484375;
    float _1492 = _1486 * 0.15915493667125701904296875;
    float _1494 = _1488 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _990 * 6.283185482025146484375;
    float _1500 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1284);
    float _1502 = fma(_120, 0.310000002384185791015625, _1490);
    float _1504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1288);
    float _1506 = fma(_120, 0.10999999940395355224609375, _1498);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1286);
    float _1510 = _1502 * 0.15915493667125701904296875;
    float _1512 = _1492 * 6.283185482025146484375;
    float _1514 = sin(_1512);
    float _1516 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1518 = _1506 * 0.15915493667125701904296875;
    float _1520 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1522 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1524 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1526 = _1492 * 6.283185482025146484375;
    float _1528 = cos(_1526);
    float _1530 = _1504 * _1522;
    float _1532 = fma(_1018, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1524);
    float _1534 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1532);
    float _1536 = _1488 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    float _1540 = _1508 * _1516;
    float _1542 = _1304 * _1514;
    float _1544 = _1500 * _1520;
    float _1546 = _1534 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1548 = _1510 * 6.283185482025146484375;
    float _1550 = sin(_1548);
    float _1552 = _1496 * _1540;
    float _1554 = _1274 * _1528;
    float _1556 = _1304 * _1528;
    float _1558 = _1528 * _1496;
    float _1560 = _1274 * _1552;
    float _1562 = _1274 * _1514;
    float _1564 = _1514 * _1496;
    float _1566 = _1518 * 6.283185482025146484375;
    float _1568 = sin(_1566);
    float _1570 = -_1542;
    float _1572 = fma(_1538, _1554, _1570);
    float _1574 = _1304 * _1552;
    float _1576 = fma(_1538, _1556, _1562);
    float _1578 = fma(_1572, _1544, _1560);
    float _1580 = -_1540;
    float _1582 = _1538 * _1580;
    float _1584 = fma(_1538, _1562, _1556);
    float _1586 = fma(_1550, 0.12999999523162841796875, 1.0);
    float _1588 = -_1554;
    float _1590 = fma(_1538, _1542, _1588);
    float _1592 = fma(_1558, _1544, _1582);
    float _1594 = fma(_1584, _1530, _1578);
    float _1596 = fma(_1576, _1544, _1574);
    float _1598 = fma(_1564, _1530, _1592);
    float _1600 = _1144 + _1594;
    float _1602 = fma(_1568, 0.300000011920928955078125, _1586);
    float _1604 = fma(_1590, _1530, _1596);
    float _1606 = _1142 + _1598;
    float _1608 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1600);
    float _1610 = _1546 + _1604;
    float _1612 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1606);
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1616 = _1608 + _1614;
    float _1618 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1610);
    float _1620 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1622 = _1612 + _1620;
    float _1624 = _1616 * _1616;
    float _1626 = fma(_1622, _1622, _1624);
    float _1628 = sqrt(_1626);
    bool _1630 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = _1534;
    float _1634 = _1576;
    float _1636 = _1628;
    float _1638 = _1612;
    float _1640 = _1610;
    if (!_1630)
    {
        _1632 = _1612;
    }
    float _1642 = _1632;
    float _1644 = _1642;
    if (!_1630)
    {
        _1634 = _1608;
    }
    float _1646 = _1634;
    float _1648 = _1646;
    if (!_1630)
    {
        _1168 = _1618;
    }
    float _1650 = _1168;
    bool _1652 = !_1630;
    float _1654 = _1650;
    if (!_1652)
    {
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1660 = _1628 + _1658;
        float _1662 = rsqrt(_1626);
        float _1664 = _1660 * _1656;
        float _1666 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = _1664 * 0.15915493667125701904296875;
        float _1670 = _1668 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        float _1674 = _1668 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 + (-1.0);
        float _1680 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1682 = fma(_1676, _1666, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1684 = fma(_1618, _1672, _1680);
        float _1686 = _1662 * _1682;
        float _1688 = fma(_1622, _1686, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1616, _1686, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1654 = _1684;
        _1644 = _1688;
        _1648 = _1690;
    }
    float _1692 = _1654;
    float _1694 = _1644;
    float _1696 = _1648;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1694 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1696 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = fma(_1708, _1708, _1712);
    float _1716 = rsqrt(_1714);
    float _1718 = sqrt(_1714);
    float _1720 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1716;
    float _1742 = _1730;
    float _1744 = _1738;
    float _1746 = _1700;
    if (_1734)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1748;
    }
    float _1750 = _1740;
    if (_1734)
    {
        float _1752 = rsqrt(_1730);
        _1742 = _1752;
    }
    float _1754 = _1742;
    float _1756 = _1754;
    if (_1734)
    {
        float _1758 = _1738 * _1750;
        _1744 = _1758;
    }
    float _1760 = _1744;
    if (_1734)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1636 = _1762;
    }
    float _1764 = _1636;
    float _1766 = _1708;
    if (_1734)
    {
        float _1768 = _1764 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1776 = precise::max(0.0, _1774);
    float _1778 = _1750;
    float _1780 = _1776;
    if (_1734)
    {
        float _1782 = _1764 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        _1778 = _1784;
    }
    float _1786 = _1778;
    float _1788 = -_1720;
    float _1790 = -_1776;
    float _1792 = fma(_1700, _1788, _1790);
    if (_1734)
    {
        float _1794 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1794;
    }
    float _1796 = _1746;
    float _1798 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1800 = _1796;
    float _1802 = _1772;
    if (_1734)
    {
        float _1804 = fma(_1772, _1796, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1800 = _1804;
    }
    float _1806 = _1800;
    float _1808 = _1806;
    if (!_1734)
    {
        _1802 = _1722;
    }
    float _1810 = _1802;
    float _1812 = _1810;
    float _1814 = _1786;
    if (_1734)
    {
        float _1816 = _1786 + (-1.0);
        _1780 = _1816;
    }
    float _1818 = _1780;
    float _1820 = _1818;
    if (_1734)
    {
        float _1822 = _1754 * _1806;
        _1638 = _1822;
    }
    float _1824 = _1638;
    if (!_1734)
    {
        _1808 = _1792;
    }
    float _1826 = _1808;
    float _1828 = _1826;
    if (_1734)
    {
        float _1830 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1640 = _1830;
    }
    float _1832 = _1640;
    if (_1734)
    {
        float _1834 = _1722 * _1824;
        _1812 = _1834;
    }
    float _1836 = _1812;
    if (!_1734)
    {
        _1820 = _1724;
    }
    float _1838 = _1820;
    float _1840 = _1838;
    if (_1734)
    {
        float _1842 = _1724 * _1824;
        _1840 = _1842;
    }
    float _1844 = _1840;
    if (!_1734)
    {
        _1756 = _1726;
    }
    float _1846 = _1756;
    float _1848 = _1846;
    if (_1734)
    {
        float _1850 = fma(_1792, _1786, _1832);
        _1828 = _1850;
    }
    float _1852 = _1828;
    if (_1734)
    {
        float _1854 = _1836 * _1836;
        _1848 = _1854;
    }
    float _1856 = _1848;
    if (!_1734)
    {
        _1814 = _1728;
    }
    float _1858 = _1814;
    float _1860 = _1858;
    if (_1734)
    {
        float _1862 = _1844 * _1844;
        _1860 = _1862;
    }
    float _1864 = _1860;
    float _1866 = fma(_1852, _1852, _1856);
    float _1868 = _1866 + _1864;
    float _1870 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1798);
    float _1872 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1876 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1874);
    float _1878 = precise::clamp(_1876, 0.0, 1.0);
    float _1880 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1882 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1884 = rsqrt(_1868);
    float _1886 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1888 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1872);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1880);
    float _1894 = -_1878;
    float _1896 = _1894 + 1.0;
    float _1898 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1900 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1888);
    float _1902 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1892);
    float _1904 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1906 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1898);
    float _1908 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1910 = abs(_1896);
    float _1912 = log2(_1910);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1906);
    float _1918 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1920 = _1884 * _1836;
    float _1922 = _1884 * _1852;
    float _1924 = _1884 * _1844;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1918);
    float _1928 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1930 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1932 = -_1904;
    float _1934 = fma(_1932, _1886, 1.0);
    float _1936 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1926);
    float _1938 = -_1928;
    float _1940 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1938);
    float _1942 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1944 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1936);
    float _1948 = -_1924;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1940);
    float _1952 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1954 = log2(_1934);
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1942);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1962 = fma(_1950, 0.5, 0.5);
    float _1964 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1956);
    float _1966 = _1922 + 1.0;
    float _1968 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = 1.0 / _1946;
    float _1972 = fma(_1962, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1974 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1964);
    float _1976 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1978 = fma(_1962, _1972, -0.212114393711090087890625);
    float _1980 = sqrt(_1958);
    float _1982 = _1954 * 0.693147182464599609375;
    float _1984 = fma(_1962, _1978, 1.570728778839111328125);
    float _1986 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1988 = exp2(_1952);
    float _1990 = _1974 * _1970;
    float _1992 = _1976 * _1970;
    float _1994 = fma(_1990, 0.5, 0.5);
    float _1996 = fma(_1992, -0.5, 0.5);
    float _1998 = _1980 * 0.636619746685028076171875;
    float _2000 = -_1922;
    float _2002 = fma(_1988, _1966, _2000);
    float _2004 = -_1984;
    float _2006 = fma(_1998, _2004, 1.0);
    float3 _5525 = float3(_1994, _1996, _1986);
    float _2008 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5525, float3(0.0), isnan(_5525)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5525, float3(0.0), isnan(_5525)), level(0.0)).x;
    float3 _5536 = float3(_1994, _1996, _1986);
    float4 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5536, float3(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5536, float3(0.0), isnan(_5536)), level(0.0)).xyzw;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _2011.w;
    float _2021 = fma(_2002, 0.5, 0.5);
    float2 _5555 = float2(_2006, _2021);
    float3 _2025 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5555, float2(0.0), isnan(_5555)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5555, float2(0.0), isnan(_5555)), level(0.0)).xyz;
    float _2027 = _2025.x;
    float _2029 = _2025.y;
    float _2031 = _2025.z;
    float _2033 = in.m_57.y;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2037 = in.m_59.y;
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2041 = _2039 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2045 = _2043 != 0;
    out.m_61.x = _684;
    out.m_61.y = _686;
    out.m_61.z = _688;
    out.m_61.w = _692;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2049 = _2047 != 0;
    float _2051 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2055 = _2053 != 0;
    float _2057 = in.m_59.x;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2061 = _2059 != 0;
    float _2063 = _1908 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2067 = _2065 != 0;
    float _2069 = in.m_57.x;
    bool _2071 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2073 = isnan(0.5);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2079 = _2075 || _2077;
    bool _2081 = _984 > 0.5;
    float _2083 = 1.0 / _2041;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2087 = _990 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2089 = -_2033;
    float _2091 = _2089 + 1.0;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2095 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2097 = -_2085;
    float _2099 = fma(_2087, 2.0, _2097);
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2101;
    float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2107 = fma(_2095, -2.0, _2093);
    int _2109 = _2081 ? as_type<int>(_2091) : as_type<int>(_2033);
    out.m_63.y = _2037;
    bool _2111 = _1004 > 0.5;
    float _2113 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2107);
    float _2115 = _2103 * _2083;
    out.m_65.w = _2033;
    int _2117 = _2111 ? as_type<int>(_2091) : as_type<int>(_2033);
    float _2119 = exp2(_2051);
    float _2121 = _2091;
    float _2123 = _2041;
    bool _2125 = _2055;
    float _2127 = _2115;
    if (_2067)
    {
        _2121 = _990;
    }
    float _2129 = _2121;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2133 = _2061 ? as_type<float>(_2117) : _2033;
    out.m_63.x = _2057;
    float _2135 = _2129;
    if (!_2067)
    {
        _2135 = _984;
    }
    float _2137 = _2135;
    float _2139 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2063);
    float _2141 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2145 = _2055 ? as_type<float>(_2109) : _2033;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    if (_2067)
    {
        _2123 = _1004;
    }
    float _2149 = _2123;
    float _2151 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2153 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2143);
    float _2155 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2147);
    float _2157 = _2149;
    if (_2045)
    {
        bool _2159 = _990 > 0.5;
        _2125 = _2159;
    }
    bool _2161 = _2125;
    float _2163 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2151);
    float _2165 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2131);
    if (!_2067)
    {
        _2157 = _990;
    }
    float _2167 = _2157;
    float _2169 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2171 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2175 = _982 + _2173;
    float _2177 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2155);
    float _2179 = fma(_2169, _2133, -0.5);
    float _2181 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2183 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2153);
    float _2187 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2171);
    float _2189 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    float _2191 = -_2113;
    float _2193 = fma(_2185, _2179, _2191);
    bool _2195 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2197 = isnan(_982);
    bool _2199 = _2195 || _2197;
    bool _2201 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2203 = _2199 || _2201;
    float _2205 = float(_2203);
    float _2207 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2187);
    float _2209 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2189);
    bool _2211 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2213 = isnan(_982);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = fma(_2145, _2181, -0.5);
    float _2225 = -_2205;
    float _2227 = _2225 + 1.0;
    float _2229 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2233 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2235 = fma(_2115, _2175, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2237 = 1.0 / _2229;
    float _2239 = _2221 * _2227;
    float _2241 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2243 = fma(_2233, -2.0, _2231);
    float _2245 = _2235 * _2239;
    float _2247 = _2241 + _2229;
    float _2249 = -_2221;
    float _2251 = _2249 + 1.0;
    float _2253 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2255 = _2229;
    int _2257 = as_type<int>(_2253);
    if (!_2079)
    {
        _2255 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2259 = _2255;
    float _2261 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2243);
    float _2263 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2245);
    float _2265 = _2263;
    if (!_2045)
    {
        _1100 = _2069;
    }
    float _2267 = _1100;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2271 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2273 = -_2261;
    float _2275 = fma(_2177, _2223, _2273);
    float _2277 = _2247 * _2237;
    float _2279 = _2277 * 0.5;
    float _2281 = fma(_2205, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2263);
    float _2283 = _2279;
    float _2285 = _2267;
    if (!_2045)
    {
        _2127 = _2267;
    }
    float _2287 = _2127;
    float _2289 = -_2269;
    float _2291 = fma(_2253, 2.0, _2289);
    float _2293 = _2287;
    if (!_2079)
    {
        float _2295 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2297 = fma(_2279, _2259, _2295);
        _2283 = _2297;
    }
    float _2299 = _2283;
    if (!_2079)
    {
        _2265 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2301 = _2265;
    float _2303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_2045)
    {
        _2285 = _2069;
    }
    float _2305 = _2285;
    float _2307 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2163);
    float _2309 = -_120;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2099);
    float _2313 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2165);
    float _2315 = -_120;
    float _2317 = fma(_2315, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2291);
    float _2319 = _2305;
    if (!_2079)
    {
        float _2321 = -_2301;
        float _2323 = _2321 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _142 = _2323;
    }
    float _2325 = _142;
    float _2327 = _2325;
    if (_2045)
    {
        float _2329 = -_2305;
        float _2331 = _2329 + 1.0;
        _2257 = as_type<int>(_2331);
    }
    int _2333 = _2257;
    float _2335 = _2299;
    if (!_2079)
    {
        float _2337 = 1.0 / _2299;
        _2335 = _2337;
    }
    float _2339 = _2335;
    int _2341 = 0;
    if (_2049)
    {
        float _2343 = -_2305;
        float _2345 = _2343 + 1.0;
        _2341 = as_type<int>(_2345);
    }
    int _2347 = _2341;
    float _2349 = _2271 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2351 = -_2119;
    float _2353 = _2351 + 1.0;
    if (_2045)
    {
        float _2355 = _2161 ? as_type<float>(_2333) : _2305;
        _2293 = _2355;
    }
    float _2357 = _2293;
    float _2359 = _962 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2049)
    {
        float _2361 = _2111 ? as_type<float>(_2347) : _2305;
        _2319 = _2361;
    }
    float _2363 = _2319;
    float _2365 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2367 = _2165;
    float _2369 = _2363;
    if (!_2079)
    {
        float _2371 = 1.0 / _2325;
        _2367 = _2371;
    }
    float _2373 = _2367;
    float _2375 = _2303 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2377 = _2359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2379 = fma(_2349, _2363, -0.5);
    float _2381 = _2281 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2383 = fma(_2375, _2357, -0.5);
    float _2385 = _958 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2387 = fma(_2313, _2379, _2317);
    if (!_2079)
    {
        float _2389 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2391 = -_2301;
        float _2393 = fma(_2339, _2389, _2391);
        _2369 = _2393;
    }
    float _2395 = _2369;
    float _2397 = _960 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    if (_2079)
    {
        _2327 = 1.0;
    }
    float _2399 = _2327;
    float _2401 = _2385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2405 = _2397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2407 = fma(_2307, _2383, _2311);
    float _2409 = _2193 + 0.5;
    float _2411 = _2399;
    if (!_2079)
    {
        float _2413 = _2395 * _2373;
        float _2415 = precise::clamp(_2413, 0.0, 1.0);
        _2411 = _2415;
    }
    float _2417 = _2411;
    float _2419 = _2403 + _1946;
    out.m_67.x = _2401;
    out.m_67.y = _2405;
    out.m_67.z = _2377;
    out.m_67.w = _2381;
    float _2421 = _2275 + 0.5;
    float _2423 = _2417 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2425 = _2417 > 0.0;
    bool _2427 = isnan(_2417);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = _2419 * 0.5;
    float _2437 = _2387 + 0.5;
    float _2439 = _2407 + 0.5;
    out.m_65.y = _2409;
    out.m_69.x = _2437;
    out.m_69.y = _2421;
    float _2441 = _2423 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _2439;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1976;
    out.gl_Position.z = _2403;
    out.gl_Position.w = _1946;
    out.m_71.z = _2435;
    out.m_71.w = _1946;
    out.m_45.x = _2441;
    float _2443 = _2365 * _2008;
    float _2445 = -_2365;
    float _2447 = _2445 + 1.0;
    float _2449 = _2019 * _2443;
    float _2451 = _2019 * _2447;
    float _2453 = _2031 * _2443;
    float _2455 = fma(_2027, _2449, _2013);
    float _2457 = fma(_2029, _2449, _2015);
    float _2459 = fma(_2019, _2453, _2017);
    out.m_73.x = _2455;
    out.m_73.y = _2457;
    out.m_73.z = _2459;
    out.m_73.w = _2451;
    if (_2433)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2461 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2461;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

