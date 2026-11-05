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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_65 [[user(locn0)]];
    float4 m_77 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _620 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2126 = as_type<float>(_116);
        out.gl_Position.z = _2126;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _110 = _138;
    }
    float _140 = _110;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_154);
        out.gl_Position.z = _2196;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_51.x;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _162 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _160 * _158;
    float _180 = 0.0;
    if (!_172)
    {
        float _182 = _162 * _162;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_172)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    float _208 = _206 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = -_204;
    float _214 = _188 + _212;
    float _216 = _204;
    float _218 = _194;
    if (!_172)
    {
        _216 = _162;
    }
    float _220 = _216;
    bool _222 = !_172;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _162 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _162);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _254;
    }
    float _256 = _218;
    bool _258 = !_172;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _162 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _224 = _278;
    }
    float _280 = _224;
    float _282 = in.m_53.w;
    float _284 = in.m_44.x;
    float _286 = in.m_44.y;
    float _288 = in.m_44.z;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _296 = _294 != 0;
    float _298 = fma(_210, 0.5, 0.5);
    bool _300 = _214 < 0.5;
    float _302 = float(_300);
    float _304 = -_214;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _308 = !_176;
    int _310 = _308 ? 0 : 1;
    float _312 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _314 = !_292;
    int _316 = _314 ? 0 : 1;
    float _318 = -_302;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _322 = -_298;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _326 = abs(_310);
    int _328 = abs(_316);
    float _330 = fma(_280, _196, _312);
    bool _332 = !_296;
    int _334 = _332 ? 0 : 1;
    float _336 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _342 = fma(_280, _198, _336);
    int _344 = abs(_334);
    float _346 = fma(_280, _200, _338);
    float _348 = float(_328);
    float _350 = float(_326);
    float _352 = fma(_330, _282, _284);
    float _354 = abs(_306);
    float _356 = _348 * _354;
    float _358 = fma(_342, _282, _286);
    float _360 = fma(_346, _282, _288);
    float _362 = float(_344);
    float _364 = fma(_350, _324, _356);
    float _366 = abs(_320);
    float _368 = fma(_362, _366, _364);
    bool _370 = !_340;
    float _386;
    if (!_370)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _156 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_100);
        float _392 = 1.0 / _390;
        float _394 = _134 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _420 = _396 + _418;
    bool _422 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _424 = isnan(_396);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = 1.0 / _408;
    bool _436 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_396);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_432;
    float _450 = _448 + 1.0;
    bool _452 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _454 = isnan(_396);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = 1.0 / _416;
    float _466 = _446 * _450;
    float _468 = -_446;
    float _470 = _468 + 1.0;
    bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _474 = 1.0 / _412;
    float _476 = _400 * _434;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    float _486 = _404 * _464;
    bool _488 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _490 = isnan(_396);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = -_498;
    float _512 = _510 + 1.0;
    float _514 = _420 * _474;
    float _516 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _522;
    float _526 = _498 * _470;
    float _528 = fma(_504, _514, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _530 = fma(_520, _514, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _532 = fma(_508, _514, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _534 = _462 * _512;
    float _536 = fma(_524, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _538 = in.m_53.x;
    float _540 = in.m_53.y;
    float _542 = in.m_53.z;
    float _544 = _516 * _534;
    float _546 = _500 * _534;
    float _548 = -_462;
    float _550 = _548 + 1.0;
    float _552 = _536 * _534;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _566;
    float _570 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    float _572 = fma(_556, _486, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _574 = fma(_560, _486, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = fma(_568, _486, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _578 = fma(_528, _526, _562);
    float _580 = fma(_530, _526, _564);
    float _582 = fma(_532, _526, _570);
    float _584 = fma(_572, _466, _578);
    float _586 = fma(_574, _466, _580);
    float _588 = fma(_576, _466, _582);
    float _590 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].x, _584);
    float _592 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].y, _586);
    float _594 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].z, _588);
    float _596 = _590 * _538;
    float _598 = _592 * _540;
    float _600 = _594 * _542;
    bool _602 = !_472;
    float _618;
    if (!_602)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _606 = _156 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_100);
        float _624 = 1.0 / _622;
        float _626 = _134 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_51.z;
    float _632 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _634 = log2(_632);
    float _636 = _156 * 2.0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = in.m_51.y;
    float _652 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = _368 * _596;
    float _658 = floor(_636);
    float _660 = _368 * _598;
    float _662 = _368 * _600;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _666 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _670 = _664 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _672 = _634 * _134;
    float _674 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _676 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _678 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _674);
    float _680 = exp2(_672);
    float _682 = _630 * 2.0;
    bool _684 = _658 > 0.0;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _688 = 1.0 + _686;
    bool _690 = _658 >= 0.0;
    bool _692 = isnan(_658);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = _650 * 2.0;
    float _702 = _650 + _630;
    float _704 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _706 = floor(_682);
    bool _708 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _710 = isnan(1.0);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _716 = _712 || _714;
    float _718 = _702 + (-1.0);
    int _720 = _698 ? 0 : 1;
    float _722 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    bool _724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _676);
    float _736 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _738 = floor(_700);
    float _740 = -_680;
    float _742 = _740 + 1.0;
    float _744 = _734 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _746 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    bool _748 = !_640;
    int _750 = _748 ? 0 : 1;
    float _752 = -_736;
    float _754 = _752 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _756 = _732 ? _742 : 0.0;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _744 + _758;
    float _762 = 1.0 / _688;
    float _764 = -_744;
    float _766 = _764 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _768 = _706 >= 0.0;
    bool _770 = isnan(_706);
    bool _772 = _768 || _770;
    bool _774 = isnan(0.0);
    bool _776 = _772 || _774;
    int _778 = abs(_750);
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = !_644;
    int _784 = _782 ? 0 : 1;
    int _786 = ~_720;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    int _792 = _790;
    if (!_684)
    {
        int _794 = ~_720;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    bool _800 = _738 > 0.0;
    bool _802 = _706 > 0.0;
    if (_716)
    {
        float _804 = _756 * _762;
        _136 = _804;
    }
    float _806 = _136;
    int _808 = abs(_784);
    float _810 = in.m_55.x;
    float _812 = in.m_55.y;
    float _814 = in.m_55.z;
    bool _816 = _738 >= 0.0;
    bool _818 = isnan(_738);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    int _826 = _776 ? 0 : 1;
    int _828 = _824 ? 0 : 1;
    float _830 = float(_808);
    float _832 = float(_798);
    int _834 = ~_828;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    int _840 = ~_826;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    float _846 = _830 * _832;
    int _848 = _838;
    int _850 = _844;
    if (!_800)
    {
        int _852 = ~_828;
        int _854 = _852 + 1;
        _848 = _854;
    }
    int _856 = _848;
    float _858 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_802)
    {
        int _860 = ~_826;
        int _862 = _860 + 1;
        _850 = _862;
    }
    int _864 = _850;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _868 = _736 + _866;
    float _870 = _760 * _760;
    float _872 = _846 * (-2.0);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _858 + _874;
    float _878 = float(_778);
    float _880 = fma(_868, _868, _870);
    float _882 = float(_864);
    float _884 = fma(_872, _812, _812);
    float _886 = fma(_780, _872, _780);
    float _888 = fma(_876, _876, _880);
    float _890 = _766 * _766;
    float _892 = _878 * _882;
    float _894 = _650 + (-0.5);
    float _896 = sqrt(_888);
    float _898 = _156 + _650;
    float _900 = -_858;
    float _902 = _900 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _904 = fma(_754, _754, _890);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _884);
    float _908 = _898 + (-1.0);
    bool _910 = !_648;
    int _912 = _910 ? 0 : 1;
    float _914 = fma(_902, _902, _904);
    float _916 = rsqrt(_888);
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _892 * (-2.0);
    int _922 = abs(_912);
    float _924 = fma(_886, _806, _906);
    float _926 = float(_856);
    float _928 = fma(_918, _920, _918);
    float _930 = fma(_920, _810, _810);
    float _932 = rsqrt(_914);
    float _934 = _896 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _936 = float(_922);
    float _938 = _156 + (-0.5);
    float _940 = _156 + _630;
    float _942 = _630 + (-0.5);
    float _944 = precise::min(_670, _934);
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _930);
    float _948 = _936 * _926;
    float _950 = _940 + (-1.0);
    float _952 = _916 * _944;
    float _954 = fma(_928, _806, _946);
    float _956 = _948 * (-2.0);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _960 = _760 * _952;
    float _962 = _954 * 0.15915493667125701904296875;
    float _964 = fma(_956, _814, _814);
    float _966 = _754 * _932;
    float _968 = _868 * _952;
    float _970 = -_960;
    float _972 = _760 + _970;
    float _974 = _902 * _932;
    float _976 = fma(_958, _956, _958);
    float _978 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].z, _964);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _982 = _966 * _980;
    float _984 = -_968;
    float _986 = _868 + _984;
    float _988 = _972 * _972;
    float _990 = _876 * _952;
    float _992 = _766 * _932;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _996 = _974 * _994;
    float _998 = fma(_976, _806, _978);
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1002 = -_982;
    float _1004 = fma(_974, _1000, _1002);
    float _1006 = fma(_986, _986, _988);
    float _1008 = -_990;
    float _1010 = _876 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1014 = -_996;
    float _1016 = fma(_992, _1012, _1014);
    float _1018 = _1004 * _1004;
    float _1020 = _998 * 0.15915493667125701904296875;
    float _1022 = fma(_1010, _1010, _1006);
    float _1024 = in.m_57.x;
    float _1026 = in.m_57.y;
    float _1028 = in.m_57.z;
    float _1030 = _924 * 0.15915493667125701904296875;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1034 = _992 * _1032;
    float _1036 = fma(_1016, _1016, _1018);
    float _1038 = _962 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1044 = -_1034;
    float _1046 = fma(_966, _1042, _1044);
    float _1048 = fma(_1046, _1046, _1036);
    float _1050 = sqrt(_1022);
    float _1052 = _1030 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = _1030 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = _916 * _1050;
    float _1062 = _666 * _1060;
    float _1064 = _664 * _1060;
    float _1066 = _668 * _1060;
    float _1068 = _962 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _1040 * _1054;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1076 = _1066 * _1074;
    float _1078 = _1020 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _1040 * _1058;
    float _1084 = _1020 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _1070 * _1054;
    float _1090 = _1070 * _1058;
    float _1092 = rsqrt(_1048);
    float _1094 = _1070 * _1080;
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1098 = _1040 * _1080;
    float _1100 = _1058 * _1080;
    float _1102 = _1054 * _1080;
    float _1104 = _1062 * _1096;
    float _1106 = -_1088;
    float _1108 = fma(_1086, _1082, _1106);
    float _1110 = -_1082;
    float _1112 = fma(_1086, _1088, _1110);
    float _1114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1116 = fma(_1086, _1090, _1072);
    float _1118 = fma(_1086, _1072, _1090);
    float _1120 = _1094 * _1104;
    float _1122 = _1064 * _1114;
    float _1124 = -_1104;
    float _1126 = _1086 * _1124;
    float _1128 = _1016 * _1092;
    float _1130 = _1004 * _1092;
    float _1132 = fma(_1116, _1122, _1120);
    float _1134 = _1046 * _1092;
    float _1136 = _992 * _1128;
    float _1138 = _974 * _1130;
    float _1140 = _1098 * _1104;
    float _1142 = fma(_1100, _1122, _1126);
    float _1144 = -_1136;
    float _1146 = fma(_966, _1130, _1144);
    float _1148 = fma(_1112, _1076, _1132);
    float _1150 = fma(_1108, _1122, _1140);
    float _1152 = -_1138;
    float _1154 = fma(_992, _1134, _1152);
    float _1156 = fma(_1102, _1076, _1142);
    float _1158 = _1146 * _1148;
    float _1160 = fma(_1118, _1076, _1150);
    float _1162 = _1154 * _1148;
    float _1164 = _966 * _1134;
    float _1166 = fma(_1134, _1156, _1158);
    float _1168 = fma(_1128, _1156, _1162);
    float _1170 = -_1164;
    float _1172 = fma(_974, _1128, _1170);
    float _1174 = fma(_974, _1160, _1166);
    float _1176 = fma(_966, _1160, _1168);
    float _1178 = _1172 * _1148;
    float _1180 = _858 + _1174;
    float _1182 = _736 + _1176;
    float _1184 = fma(_1130, _1156, _1178);
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1188 = _1180 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1182 + _1190;
    float _1194 = fma(_992, _1160, _1184);
    float _1196 = _1188 * _1188;
    float _1198 = _744 + _1194;
    float _1200 = fma(_1192, _1192, _1196);
    float _1202 = sqrt(_1200);
    bool _1204 = _1202 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = _1194;
    float _1208 = _1196;
    float _1210 = _1184;
    float _1212 = _1202;
    float _1214 = _1200;
    float _1216 = _962;
    float _1218 = _934;
    if (!_1204)
    {
        _1206 = _1182;
    }
    float _1220 = _1206;
    float _1222 = _1220;
    if (!_1204)
    {
        _1208 = _1180;
    }
    float _1224 = _1208;
    float _1226 = _1224;
    if (!_1204)
    {
        _1210 = _1198;
    }
    float _1228 = _1210;
    bool _1230 = !_1204;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1202 + _1236;
        float _1240 = rsqrt(_1200);
        float _1242 = _1238 * _1234;
        float _1244 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = _1242 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 + (-1.0);
        float _1258 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = fma(_1254, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = fma(_1198, _1250, _1258);
        float _1264 = _1240 * _1260;
        float _1266 = fma(_1192, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1188, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1232 = _1262;
        _1222 = _1266;
        _1226 = _1268;
        _1212 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = _1212;
    float _1278 = -_960;
    float _1280 = _1278 + _1270;
    float _1282 = -_968;
    float _1284 = _1282 + _1272;
    float _1286 = -_990;
    float _1288 = _1286 + _1274;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1292 = _1280 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1296 = _1284 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = _1292 * _1292;
    float _1304 = fma(_1296, _1296, _1302);
    float _1306 = fma(_1300, _1300, _1304);
    float _1308 = rsqrt(_1306);
    float _1310 = sqrt(_1306);
    float _1312 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1314 = _1296 * _1312;
    float _1316 = _1300 * _1312;
    float _1318 = _1314 * _1314;
    float _1320 = _1316 * _1316;
    float _1322 = _1318 + _1320;
    float _1324 = sqrt(_1322);
    bool _1326 = _1324 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1330 = _1324 + _1328;
    float _1332 = _1188;
    float _1334 = _1330;
    if (_1326)
    {
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1336;
    }
    float _1338 = _1332;
    if (_1326)
    {
        float _1340 = _1330 * _1338;
        _1334 = _1340;
    }
    float _1342 = _1334;
    if (_1326)
    {
        float _1344 = _1342 * 0.15915493667125701904296875;
        _1214 = _1344;
    }
    float _1346 = _1214;
    float _1348 = _1192;
    if (_1326)
    {
        float _1350 = _1346 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        _1348 = _1352;
    }
    float _1354 = _1348;
    float _1356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1358 = precise::max(0.0, _1356);
    float _1360 = _1276;
    float _1362 = _1358;
    if (_1326)
    {
        float _1364 = _1346 * 6.283185482025146484375;
        float _1366 = cos(_1364);
        _1360 = _1366;
    }
    float _1368 = _1360;
    float _1370 = -_1312;
    float _1372 = -_1358;
    float _1374 = fma(_1292, _1370, _1372);
    float _1376 = _1356;
    if (_1326)
    {
        float _1378 = rsqrt(_1322);
        _1376 = _1378;
    }
    float _1380 = _1376;
    if (_1326)
    {
        float _1382 = _1374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1382;
    }
    float _1384 = _1362;
    float _1386 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1388 = _1354;
    float _1390 = _1384;
    if (_1326)
    {
        float _1392 = fma(_1354, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1216 = _1392;
    }
    float _1394 = _1216;
    float _1396 = _1394;
    if (!_1326)
    {
        _1388 = _1314;
    }
    float _1398 = _1388;
    float _1400 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1386);
    float _1402 = _1398;
    float _1404 = _1368;
    if (_1326)
    {
        float _1406 = _1368 + (-1.0);
        _1390 = _1406;
    }
    float _1408 = _1390;
    float _1410 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1400);
    float _1412 = _1408;
    if (_1326)
    {
        float _1414 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1414;
    }
    float _1416 = _1218;
    if (!_1326)
    {
        _1412 = _1316;
    }
    float _1418 = _1412;
    float _1420 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1422 = 0.0;
    float _1424 = _1380;
    float _1426 = _1418;
    if (_1326)
    {
        float _1428 = _1380 * _1394;
        _1422 = _1428;
    }
    float _1430 = _1422;
    if (!_1326)
    {
        _1424 = _1374;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1326)
    {
        float _1436 = fma(_1374, _1368, _1416);
        _1434 = _1436;
    }
    float _1438 = _1434;
    if (!_1326)
    {
        _1396 = _1318;
    }
    float _1440 = _1396;
    float _1442 = _1440;
    if (_1326)
    {
        float _1444 = _1314 * _1430;
        _1402 = _1444;
    }
    float _1446 = _1402;
    if (_1326)
    {
        float _1448 = _1316 * _1430;
        _1426 = _1448;
    }
    float _1450 = _1426;
    if (!_1326)
    {
        _1404 = _1320;
    }
    float _1452 = _1404;
    float _1454 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1456 = _1452;
    if (_1326)
    {
        float _1458 = _1446 * _1446;
        _1442 = _1458;
    }
    float _1460 = _1442;
    if (_1326)
    {
        float _1462 = _1450 * _1450;
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1468 = fma(_1438, _1438, _1460);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1472 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1470);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    float _1476 = _1468 + _1464;
    float _1478 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1480 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1466);
    float _1482 = -_1474;
    float _1484 = _1482 + 1.0;
    float _1486 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1488 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1478);
    float _1490 = rsqrt(_1476);
    float _1492 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1480);
    float _1494 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1500 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1502 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1504 = abs(_1484);
    float _1506 = log2(_1504);
    float _1508 = -_1486;
    float _1510 = fma(_1508, _1454, 1.0);
    float _1512 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1500);
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1516 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1518 = _1490 * _1438;
    float _1520 = _1490 * _1446;
    float _1522 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1514);
    float _1524 = _1490 * _1450;
    float _1526 = log2(_1510);
    float _1528 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1530 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1532 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1534 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1536 = -_1528;
    float _1538 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1536);
    float _1540 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1532);
    float _1542 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1530);
    float _1544 = -_1524;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1538);
    float _1548 = exp2(_1534);
    float _1550 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1552 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1540);
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1546, 0.5, 0.5);
    float _1558 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1550);
    float _1560 = _1518 + 1.0;
    float _1562 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1564 = 1.0 / _1542;
    float _1566 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1558);
    float _1568 = fma(_1556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = _1526 * 0.693147182464599609375;
    float _1572 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1574 = fma(_1556, _1568, -0.212114393711090087890625);
    float _1576 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1578 = sqrt(_1554);
    float _1580 = -_1518;
    float _1582 = fma(_1548, _1560, _1580);
    float _1584 = fma(_1556, _1574, 1.570728778839111328125);
    float _1586 = _1572 * _1564;
    float _1588 = _1562 * _1564;
    float _1590 = fma(_1582, 0.5, 0.5);
    float _1592 = fma(_1586, 0.5, 0.5);
    float _1594 = fma(_1588, -0.5, 0.5);
    float _1596 = _1578 * 0.636619746685028076171875;
    float3 _4406 = float3(_1592, _1594, _1576);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4406, float3(0.0), isnan(_4406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4406, float3(0.0), isnan(_4406)), level(0.0)).x;
    float _1600 = -_1584;
    float _1602 = fma(_1596, _1600, 1.0);
    float3 _4422 = float3(_1592, _1594, _1576);
    float4 _1605 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4422, float3(0.0), isnan(_4422)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4422, float3(0.0), isnan(_4422)), level(0.0)).xyzw;
    float _1607 = _1605.x;
    float _1609 = _1605.y;
    float _1611 = _1605.z;
    float _1613 = _1605.w;
    float2 _4439 = float2(_1602, _1590);
    float3 _1617 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4439, float2(0.0), isnan(_4439)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4439, float2(0.0), isnan(_4439)), level(0.0)).xyz;
    float _1619 = _1617.x;
    float _1621 = _1617.y;
    float _1623 = _1617.z;
    float _1625 = -_968;
    float _1627 = _736 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1631 = _628 + _1629;
    bool _1633 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1635 = isnan(_628);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1649;
    bool _1653 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1655 = isnan(_628);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = 1.0 / _1647;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1669 = _628 + _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1673 = _1671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1675 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1677 = isnan(_628);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1691 = _1026 != 0.0;
    bool _1693 = isnan(_1026);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.0);
    bool _1699 = _1695 || _1697;
    float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1705 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1707 = isnan(0.5);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    float _1715 = -_1685;
    float _1717 = _1715 + 1.0;
    float _1719 = 1.0 / _1673;
    bool _1721 = _1024 == 0.0;
    bool _1723 = !_1699;
    bool _1725 = _1721 && _1723;
    float _1727 = -_960;
    float _1729 = _744 + _1727;
    float _1731 = -_990;
    float _1733 = _858 + _1731;
    bool _1735 = _1028 == 0.0;
    bool _1737 = _1735 && _1725;
    float _1739 = _1651 * _1665;
    float _1741 = -_1643;
    float _1743 = _1741 + 1.0;
    float _1745 = _1643 * _1717;
    float _1747 = 1.0 / _1703;
    float _1749 = fma(_1739, _1669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1751 = _1663 * _1743;
    float _1753 = in.m_59.x;
    float _1755 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1757 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1759 = isnan(_628);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1749 * _1751;
    float _1771 = in.m_59.z;
    float _1773 = -_1663;
    float _1775 = _1773 + 1.0;
    float _1777 = _1689 * _1719;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1779;
    float _1783 = in.m_61.x;
    float _1785 = in.m_61.y;
    float _1787 = in.m_61.z;
    float _1789 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1769);
    float _1793 = fma(_1777, _1631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1795 = in.m_59.y;
    float _1797 = _1781 * _1747;
    float _1799 = -_1767;
    float _1801 = _1799 + 1.0;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1805 = _628 + _1803;
    float _1807 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1789);
    float _1809 = fma(_1793, _1745, _1791);
    float _1811 = _1685 * _1801;
    float _1813 = fma(_1797, _1805, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1815 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1817 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1819 = fma(_1813, _1811, _1809);
    out.m_63.x = _1753;
    float _1821 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1815);
    float _1823 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1819);
    out.m_63.z = _1771;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1829 = _1783;
    float _1831 = _1787;
    float _1833 = _1785;
    if (!_1737)
    {
        float _1835 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1783);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1843 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1845 = _1841;
    if (!_1737)
    {
        float _1847 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1787);
        _1831 = _1847;
    }
    float _1849 = _1831;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1853 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1821);
    float _1855 = 1.0 / _1843;
    float _1857 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1861 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_63.y = _1795;
    if (!_1737)
    {
        float _1863 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1785);
        _1833 = _1863;
    }
    float _1865 = _1833;
    float _1867 = _1094 * _1154;
    float _1869 = _1861 + _1843;
    out.m_65.x = _1839;
    out.m_65.y = _1859;
    out.m_65.z = _1841;
    out.m_65.w = _1857;
    float _1871 = _1116 * _1154;
    float _1873 = _1116 * _1172;
    float _1875 = _1116 * _1146;
    float _1877 = _1094 * _1172;
    float _1879 = _1094 * _1146;
    float _1881 = _1112 * _1154;
    float _1883 = _1112 * _1172;
    float _1885 = _1869 * _1855;
    float _1887 = _1885 * 0.5;
    float _1889 = fma(_1100, _1128, _1871);
    float _1891 = fma(_1100, _1134, _1875);
    float _1893 = -_1086;
    float _1895 = fma(_1893, _1128, _1867);
    float _1897 = -_1086;
    float _1899 = fma(_1897, _1130, _1877);
    float _1901 = fma(_1102, _1130, _1883);
    float _1903 = _1879;
    float _1905 = _1891;
    if (!_1713)
    {
        _1845 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1907 = _1845;
    float _1909 = _1112 * _1146;
    float _1911 = -_1086;
    float _1913 = fma(_1911, _1134, _1879);
    float _1915 = fma(_1100, _1130, _1873);
    float _1917 = _1907;
    if (!_1713)
    {
        _1903 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1919 = _1903;
    if (!_1713)
    {
        float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1923 = fma(_1887, _1907, _1921);
        _1917 = _1923;
    }
    float _1925 = _1917;
    float _1927 = fma(_1108, _966, _1889);
    float _1929 = fma(_1108, _992, _1915);
    float _1931 = fma(_1108, _974, _1891);
    float _1933 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1935 = _1933;
    if (!_1713)
    {
        float _1937 = -_1919;
        float _1939 = _1937 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1905 = _1939;
    }
    float _1941 = _1905;
    float _1943 = _1925;
    if (!_1713)
    {
        float _1945 = 1.0 / _1925;
        _1943 = _1945;
    }
    float _1947 = _1943;
    float _1949 = fma(_1098, _966, _1895);
    float _1951 = fma(_1098, _992, _1899);
    float _1953 = fma(_1098, _974, _1913);
    float _1955 = fma(_1102, _1128, _1881);
    float _1957 = _1949 * _1865;
    float _1959 = _1951 * _1865;
    float _1961 = _1953 * _1865;
    float _1963 = exp2(_1817);
    float _1965 = fma(_1118, _966, _1955);
    float _1967 = fma(_1927, _1837, _1957);
    float _1969 = in.m_59.w;
    float _1971 = fma(_1929, _1837, _1959);
    float _1973 = fma(_1931, _1837, _1961);
    float _1975 = fma(_1965, _1849, _1967);
    float _1977 = fma(_1118, _992, _1901);
    float _1979 = _1100;
    if (!_1713)
    {
        float _1981 = 1.0 / _1941;
        _1979 = _1981;
    }
    float _1983 = _1979;
    float _1985 = _1542 * 0.5;
    float _1987 = _1947;
    if (!_1713)
    {
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1991 = -_1919;
        float _1993 = fma(_1947, _1989, _1991);
        _1987 = _1993;
    }
    float _1995 = _1987;
    float _1997 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1933);
    out.m_67.x = _1627;
    out.m_67.y = _1729;
    out.m_67.z = _1733;
    float _1999 = fma(_1977, _1849, _1971);
    if (_1713)
    {
        _1935 = 1.0;
    }
    float _2001 = _1935;
    float _2003 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1997);
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    out.m_69.x = _1284;
    out.m_69.y = _1280;
    out.m_69.z = _1288;
    float _2009 = fma(_1102, _1134, _1909);
    float _2011 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2003);
    float _2013 = _1572 + _1542;
    out.m_71.x = _1064;
    float _2015 = fma(_1118, _974, _2009);
    float _2017 = _2011 + _1542;
    float _2019 = fma(_1562, -0.5, _1985);
    float _2021 = _2001;
    if (!_1713)
    {
        float _2023 = _1995 * _1983;
        float _2025 = precise::clamp(_2023, 0.0, 1.0);
        _2021 = _2025;
    }
    float _2027 = _2021;
    float _2029 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2031 = _2013 * 0.5;
    float _2033 = fma(_2015, _1849, _1973);
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2037 = _2027 > 0.0;
    bool _2039 = isnan(_2027);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    float _2047 = _2017 * 0.5;
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.w = _1969;
    out.m_73.w = _944;
    out.m_75.x = _1975;
    out.m_75.y = _1999;
    out.m_75.z = _2033;
    out.m_77.x = _1296;
    out.m_77.y = _1292;
    out.m_77.z = _1300;
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1562;
    out.gl_Position.z = _2011;
    out.gl_Position.w = _1542;
    out.m_79.x = _2031;
    out.m_79.y = _2019;
    out.m_79.z = _2047;
    out.m_79.w = _1542;
    out.m_47.x = _2049;
    float _2051 = _2029 * _1598;
    float _2053 = -_2029;
    float _2055 = _2053 + 1.0;
    float _2057 = _1613 * _2051;
    float _2059 = _1613 * _2055;
    float _2061 = _1623 * _2051;
    float _2063 = fma(_1619, _2057, _1607);
    float _2065 = fma(_1621, _2057, _1609);
    float _2067 = fma(_1613, _2061, _1611);
    out.m_81.x = _2063;
    out.m_81.y = _2065;
    out.m_81.z = _2067;
    out.m_81.w = _2059;
    if (_2045)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2069;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _620 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2126 = as_type<float>(_116);
        out.gl_Position.z = _2126;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _110 = _138;
    }
    float _140 = _110;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_154);
        out.gl_Position.z = _2196;
    }
    if (_146)
    {
        return out;
    }
    float _156 = in.m_51.x;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _162 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _160 * _158;
    float _180 = 0.0;
    if (!_172)
    {
        float _182 = _162 * _162;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_172)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    float _208 = _206 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = -_204;
    float _214 = _188 + _212;
    float _216 = _204;
    float _218 = _194;
    if (!_172)
    {
        _216 = _162;
    }
    float _220 = _216;
    bool _222 = !_172;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _162 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _162);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _254;
    }
    float _256 = _218;
    bool _258 = !_172;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _162 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _224 = _278;
    }
    float _280 = _224;
    float _282 = in.m_53.w;
    float _284 = in.m_44.x;
    float _286 = in.m_44.y;
    float _288 = in.m_44.z;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _296 = _294 != 0;
    float _298 = fma(_210, 0.5, 0.5);
    bool _300 = _214 < 0.5;
    float _302 = float(_300);
    float _304 = -_214;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _308 = !_176;
    int _310 = _308 ? 0 : 1;
    float _312 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _314 = !_292;
    int _316 = _314 ? 0 : 1;
    float _318 = -_302;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _322 = -_298;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _326 = abs(_310);
    int _328 = abs(_316);
    float _330 = fma(_280, _196, _312);
    bool _332 = !_296;
    int _334 = _332 ? 0 : 1;
    float _336 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _342 = fma(_280, _198, _336);
    int _344 = abs(_334);
    float _346 = fma(_280, _200, _338);
    float _348 = float(_328);
    float _350 = float(_326);
    float _352 = fma(_330, _282, _284);
    float _354 = abs(_306);
    float _356 = _348 * _354;
    float _358 = fma(_342, _282, _286);
    float _360 = fma(_346, _282, _288);
    float _362 = float(_344);
    float _364 = fma(_350, _324, _356);
    float _366 = abs(_320);
    float _368 = fma(_362, _366, _364);
    bool _370 = !_340;
    float _386;
    if (!_370)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _156 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_100);
        float _392 = 1.0 / _390;
        float _394 = _134 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _420 = _396 + _418;
    bool _422 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _424 = isnan(_396);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = 1.0 / _408;
    bool _436 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_396);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_432;
    float _450 = _448 + 1.0;
    bool _452 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _454 = isnan(_396);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = 1.0 / _416;
    float _466 = _446 * _450;
    float _468 = -_446;
    float _470 = _468 + 1.0;
    bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _474 = 1.0 / _412;
    float _476 = _400 * _434;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    float _486 = _404 * _464;
    bool _488 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _490 = isnan(_396);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = -_498;
    float _512 = _510 + 1.0;
    float _514 = _420 * _474;
    float _516 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _522;
    float _526 = _498 * _470;
    float _528 = fma(_504, _514, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _530 = fma(_520, _514, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _532 = fma(_508, _514, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _534 = _462 * _512;
    float _536 = fma(_524, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _538 = in.m_53.x;
    float _540 = in.m_53.y;
    float _542 = in.m_53.z;
    float _544 = _516 * _534;
    float _546 = _500 * _534;
    float _548 = -_462;
    float _550 = _548 + 1.0;
    float _552 = _536 * _534;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _566;
    float _570 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    float _572 = fma(_556, _486, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _574 = fma(_560, _486, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = fma(_568, _486, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _578 = fma(_528, _526, _562);
    float _580 = fma(_530, _526, _564);
    float _582 = fma(_532, _526, _570);
    float _584 = fma(_572, _466, _578);
    float _586 = fma(_574, _466, _580);
    float _588 = fma(_576, _466, _582);
    float _590 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].x, _584);
    float _592 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].y, _586);
    float _594 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].z, _588);
    float _596 = _590 * _538;
    float _598 = _592 * _540;
    float _600 = _594 * _542;
    bool _602 = !_472;
    float _618;
    if (!_602)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _606 = _156 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_100);
        float _624 = 1.0 / _622;
        float _626 = _134 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_51.z;
    float _632 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _634 = log2(_632);
    float _636 = _156 * 2.0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = in.m_51.y;
    float _652 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = _368 * _596;
    float _658 = floor(_636);
    float _660 = _368 * _598;
    float _662 = _368 * _600;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _666 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _670 = _664 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _672 = _634 * _134;
    float _674 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _676 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _678 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _674);
    float _680 = exp2(_672);
    float _682 = _630 * 2.0;
    bool _684 = _658 > 0.0;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _688 = 1.0 + _686;
    bool _690 = _658 >= 0.0;
    bool _692 = isnan(_658);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = _650 * 2.0;
    float _702 = _650 + _630;
    float _704 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _706 = floor(_682);
    bool _708 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _710 = isnan(1.0);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _716 = _712 || _714;
    float _718 = _702 + (-1.0);
    int _720 = _698 ? 0 : 1;
    float _722 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    bool _724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _676);
    float _736 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _738 = floor(_700);
    float _740 = -_680;
    float _742 = _740 + 1.0;
    float _744 = _734 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _746 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    bool _748 = !_640;
    int _750 = _748 ? 0 : 1;
    float _752 = -_736;
    float _754 = _752 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _756 = _732 ? _742 : 0.0;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _744 + _758;
    float _762 = 1.0 / _688;
    float _764 = -_744;
    float _766 = _764 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _768 = _706 >= 0.0;
    bool _770 = isnan(_706);
    bool _772 = _768 || _770;
    bool _774 = isnan(0.0);
    bool _776 = _772 || _774;
    int _778 = abs(_750);
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = !_644;
    int _784 = _782 ? 0 : 1;
    int _786 = ~_720;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    int _792 = _790;
    if (!_684)
    {
        int _794 = ~_720;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    bool _800 = _738 > 0.0;
    bool _802 = _706 > 0.0;
    if (_716)
    {
        float _804 = _756 * _762;
        _136 = _804;
    }
    float _806 = _136;
    int _808 = abs(_784);
    float _810 = in.m_55.x;
    float _812 = in.m_55.y;
    float _814 = in.m_55.z;
    bool _816 = _738 >= 0.0;
    bool _818 = isnan(_738);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    int _826 = _776 ? 0 : 1;
    int _828 = _824 ? 0 : 1;
    float _830 = float(_808);
    float _832 = float(_798);
    int _834 = ~_828;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    int _840 = ~_826;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    float _846 = _830 * _832;
    int _848 = _838;
    int _850 = _844;
    if (!_800)
    {
        int _852 = ~_828;
        int _854 = _852 + 1;
        _848 = _854;
    }
    int _856 = _848;
    float _858 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_802)
    {
        int _860 = ~_826;
        int _862 = _860 + 1;
        _850 = _862;
    }
    int _864 = _850;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _868 = _736 + _866;
    float _870 = _760 * _760;
    float _872 = _846 * (-2.0);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _858 + _874;
    float _878 = float(_778);
    float _880 = fma(_868, _868, _870);
    float _882 = float(_864);
    float _884 = fma(_872, _812, _812);
    float _886 = fma(_780, _872, _780);
    float _888 = fma(_876, _876, _880);
    float _890 = _766 * _766;
    float _892 = _878 * _882;
    float _894 = _650 + (-0.5);
    float _896 = sqrt(_888);
    float _898 = _156 + _650;
    float _900 = -_858;
    float _902 = _900 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _904 = fma(_754, _754, _890);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _884);
    float _908 = _898 + (-1.0);
    bool _910 = !_648;
    int _912 = _910 ? 0 : 1;
    float _914 = fma(_902, _902, _904);
    float _916 = rsqrt(_888);
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _892 * (-2.0);
    int _922 = abs(_912);
    float _924 = fma(_886, _806, _906);
    float _926 = float(_856);
    float _928 = fma(_918, _920, _918);
    float _930 = fma(_920, _810, _810);
    float _932 = rsqrt(_914);
    float _934 = _896 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _936 = float(_922);
    float _938 = _156 + (-0.5);
    float _940 = _156 + _630;
    float _942 = _630 + (-0.5);
    float _944 = precise::min(_670, _934);
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _930);
    float _948 = _936 * _926;
    float _950 = _940 + (-1.0);
    float _952 = _916 * _944;
    float _954 = fma(_928, _806, _946);
    float _956 = _948 * (-2.0);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _960 = _760 * _952;
    float _962 = _954 * 0.15915493667125701904296875;
    float _964 = fma(_956, _814, _814);
    float _966 = _754 * _932;
    float _968 = _868 * _952;
    float _970 = -_960;
    float _972 = _760 + _970;
    float _974 = _902 * _932;
    float _976 = fma(_958, _956, _958);
    float _978 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].z, _964);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _982 = _966 * _980;
    float _984 = -_968;
    float _986 = _868 + _984;
    float _988 = _972 * _972;
    float _990 = _876 * _952;
    float _992 = _766 * _932;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _996 = _974 * _994;
    float _998 = fma(_976, _806, _978);
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1002 = -_982;
    float _1004 = fma(_974, _1000, _1002);
    float _1006 = fma(_986, _986, _988);
    float _1008 = -_990;
    float _1010 = _876 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1014 = -_996;
    float _1016 = fma(_992, _1012, _1014);
    float _1018 = _1004 * _1004;
    float _1020 = _998 * 0.15915493667125701904296875;
    float _1022 = fma(_1010, _1010, _1006);
    float _1024 = in.m_57.x;
    float _1026 = in.m_57.y;
    float _1028 = in.m_57.z;
    float _1030 = _924 * 0.15915493667125701904296875;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1034 = _992 * _1032;
    float _1036 = fma(_1016, _1016, _1018);
    float _1038 = _962 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1044 = -_1034;
    float _1046 = fma(_966, _1042, _1044);
    float _1048 = fma(_1046, _1046, _1036);
    float _1050 = sqrt(_1022);
    float _1052 = _1030 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = _1030 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = _916 * _1050;
    float _1062 = _666 * _1060;
    float _1064 = _664 * _1060;
    float _1066 = _668 * _1060;
    float _1068 = _962 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _1040 * _1054;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1076 = _1066 * _1074;
    float _1078 = _1020 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _1040 * _1058;
    float _1084 = _1020 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _1070 * _1054;
    float _1090 = _1070 * _1058;
    float _1092 = rsqrt(_1048);
    float _1094 = _1070 * _1080;
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1098 = _1040 * _1080;
    float _1100 = _1058 * _1080;
    float _1102 = _1054 * _1080;
    float _1104 = _1062 * _1096;
    float _1106 = -_1088;
    float _1108 = fma(_1086, _1082, _1106);
    float _1110 = -_1082;
    float _1112 = fma(_1086, _1088, _1110);
    float _1114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1116 = fma(_1086, _1090, _1072);
    float _1118 = fma(_1086, _1072, _1090);
    float _1120 = _1094 * _1104;
    float _1122 = _1064 * _1114;
    float _1124 = -_1104;
    float _1126 = _1086 * _1124;
    float _1128 = _1016 * _1092;
    float _1130 = _1004 * _1092;
    float _1132 = fma(_1116, _1122, _1120);
    float _1134 = _1046 * _1092;
    float _1136 = _992 * _1128;
    float _1138 = _974 * _1130;
    float _1140 = _1098 * _1104;
    float _1142 = fma(_1100, _1122, _1126);
    float _1144 = -_1136;
    float _1146 = fma(_966, _1130, _1144);
    float _1148 = fma(_1112, _1076, _1132);
    float _1150 = fma(_1108, _1122, _1140);
    float _1152 = -_1138;
    float _1154 = fma(_992, _1134, _1152);
    float _1156 = fma(_1102, _1076, _1142);
    float _1158 = _1146 * _1148;
    float _1160 = fma(_1118, _1076, _1150);
    float _1162 = _1154 * _1148;
    float _1164 = _966 * _1134;
    float _1166 = fma(_1134, _1156, _1158);
    float _1168 = fma(_1128, _1156, _1162);
    float _1170 = -_1164;
    float _1172 = fma(_974, _1128, _1170);
    float _1174 = fma(_974, _1160, _1166);
    float _1176 = fma(_966, _1160, _1168);
    float _1178 = _1172 * _1148;
    float _1180 = _858 + _1174;
    float _1182 = _736 + _1176;
    float _1184 = fma(_1130, _1156, _1178);
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1188 = _1180 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1182 + _1190;
    float _1194 = fma(_992, _1160, _1184);
    float _1196 = _1188 * _1188;
    float _1198 = _744 + _1194;
    float _1200 = fma(_1192, _1192, _1196);
    float _1202 = sqrt(_1200);
    bool _1204 = _1202 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = _1194;
    float _1208 = _1196;
    float _1210 = _1184;
    float _1212 = _1202;
    float _1214 = _1200;
    float _1216 = _962;
    float _1218 = _934;
    if (!_1204)
    {
        _1206 = _1182;
    }
    float _1220 = _1206;
    float _1222 = _1220;
    if (!_1204)
    {
        _1208 = _1180;
    }
    float _1224 = _1208;
    float _1226 = _1224;
    if (!_1204)
    {
        _1210 = _1198;
    }
    float _1228 = _1210;
    bool _1230 = !_1204;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1202 + _1236;
        float _1240 = rsqrt(_1200);
        float _1242 = _1238 * _1234;
        float _1244 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = _1242 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 + (-1.0);
        float _1258 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = fma(_1254, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = fma(_1198, _1250, _1258);
        float _1264 = _1240 * _1260;
        float _1266 = fma(_1192, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1188, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1232 = _1262;
        _1222 = _1266;
        _1226 = _1268;
        _1212 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = _1212;
    float _1278 = -_960;
    float _1280 = _1278 + _1270;
    float _1282 = -_968;
    float _1284 = _1282 + _1272;
    float _1286 = -_990;
    float _1288 = _1286 + _1274;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1292 = _1280 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1296 = _1284 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = _1292 * _1292;
    float _1304 = fma(_1296, _1296, _1302);
    float _1306 = fma(_1300, _1300, _1304);
    float _1308 = rsqrt(_1306);
    float _1310 = sqrt(_1306);
    float _1312 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1314 = _1296 * _1312;
    float _1316 = _1300 * _1312;
    float _1318 = _1314 * _1314;
    float _1320 = _1316 * _1316;
    float _1322 = _1318 + _1320;
    float _1324 = sqrt(_1322);
    bool _1326 = _1324 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1330 = _1324 + _1328;
    float _1332 = _1188;
    float _1334 = _1330;
    if (_1326)
    {
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1336;
    }
    float _1338 = _1332;
    if (_1326)
    {
        float _1340 = _1330 * _1338;
        _1334 = _1340;
    }
    float _1342 = _1334;
    if (_1326)
    {
        float _1344 = _1342 * 0.15915493667125701904296875;
        _1214 = _1344;
    }
    float _1346 = _1214;
    float _1348 = _1192;
    if (_1326)
    {
        float _1350 = _1346 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        _1348 = _1352;
    }
    float _1354 = _1348;
    float _1356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1358 = precise::max(0.0, _1356);
    float _1360 = _1276;
    float _1362 = _1358;
    if (_1326)
    {
        float _1364 = _1346 * 6.283185482025146484375;
        float _1366 = cos(_1364);
        _1360 = _1366;
    }
    float _1368 = _1360;
    float _1370 = -_1312;
    float _1372 = -_1358;
    float _1374 = fma(_1292, _1370, _1372);
    float _1376 = _1356;
    if (_1326)
    {
        float _1378 = rsqrt(_1322);
        _1376 = _1378;
    }
    float _1380 = _1376;
    if (_1326)
    {
        float _1382 = _1374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1382;
    }
    float _1384 = _1362;
    float _1386 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1388 = _1354;
    float _1390 = _1384;
    if (_1326)
    {
        float _1392 = fma(_1354, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1216 = _1392;
    }
    float _1394 = _1216;
    float _1396 = _1394;
    if (!_1326)
    {
        _1388 = _1314;
    }
    float _1398 = _1388;
    float _1400 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1386);
    float _1402 = _1398;
    float _1404 = _1368;
    if (_1326)
    {
        float _1406 = _1368 + (-1.0);
        _1390 = _1406;
    }
    float _1408 = _1390;
    float _1410 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1400);
    float _1412 = _1408;
    if (_1326)
    {
        float _1414 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1414;
    }
    float _1416 = _1218;
    if (!_1326)
    {
        _1412 = _1316;
    }
    float _1418 = _1412;
    float _1420 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1422 = 0.0;
    float _1424 = _1380;
    float _1426 = _1418;
    if (_1326)
    {
        float _1428 = _1380 * _1394;
        _1422 = _1428;
    }
    float _1430 = _1422;
    if (!_1326)
    {
        _1424 = _1374;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1326)
    {
        float _1436 = fma(_1374, _1368, _1416);
        _1434 = _1436;
    }
    float _1438 = _1434;
    if (!_1326)
    {
        _1396 = _1318;
    }
    float _1440 = _1396;
    float _1442 = _1440;
    if (_1326)
    {
        float _1444 = _1314 * _1430;
        _1402 = _1444;
    }
    float _1446 = _1402;
    if (_1326)
    {
        float _1448 = _1316 * _1430;
        _1426 = _1448;
    }
    float _1450 = _1426;
    if (!_1326)
    {
        _1404 = _1320;
    }
    float _1452 = _1404;
    float _1454 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1456 = _1452;
    if (_1326)
    {
        float _1458 = _1446 * _1446;
        _1442 = _1458;
    }
    float _1460 = _1442;
    if (_1326)
    {
        float _1462 = _1450 * _1450;
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1468 = fma(_1438, _1438, _1460);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1472 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1470);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    float _1476 = _1468 + _1464;
    float _1478 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1480 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1466);
    float _1482 = -_1474;
    float _1484 = _1482 + 1.0;
    float _1486 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1488 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1478);
    float _1490 = rsqrt(_1476);
    float _1492 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1480);
    float _1494 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1500 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1502 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1504 = abs(_1484);
    float _1506 = log2(_1504);
    float _1508 = -_1486;
    float _1510 = fma(_1508, _1454, 1.0);
    float _1512 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1500);
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1516 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1518 = _1490 * _1438;
    float _1520 = _1490 * _1446;
    float _1522 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1514);
    float _1524 = _1490 * _1450;
    float _1526 = log2(_1510);
    float _1528 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1530 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1532 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1534 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1536 = -_1528;
    float _1538 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1536);
    float _1540 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1532);
    float _1542 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1530);
    float _1544 = -_1524;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1538);
    float _1548 = exp2(_1534);
    float _1550 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1552 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1540);
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1546, 0.5, 0.5);
    float _1558 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1550);
    float _1560 = _1518 + 1.0;
    float _1562 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1564 = 1.0 / _1542;
    float _1566 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1558);
    float _1568 = fma(_1556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = _1526 * 0.693147182464599609375;
    float _1572 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1574 = fma(_1556, _1568, -0.212114393711090087890625);
    float _1576 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1578 = sqrt(_1554);
    float _1580 = -_1518;
    float _1582 = fma(_1548, _1560, _1580);
    float _1584 = fma(_1556, _1574, 1.570728778839111328125);
    float _1586 = _1572 * _1564;
    float _1588 = _1562 * _1564;
    float _1590 = fma(_1582, 0.5, 0.5);
    float _1592 = fma(_1586, 0.5, 0.5);
    float _1594 = fma(_1588, -0.5, 0.5);
    float _1596 = _1578 * 0.636619746685028076171875;
    float3 _4406 = float3(_1592, _1594, _1576);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4406, float3(0.0), isnan(_4406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4406, float3(0.0), isnan(_4406)), level(0.0)).x;
    float _1600 = -_1584;
    float _1602 = fma(_1596, _1600, 1.0);
    float3 _4422 = float3(_1592, _1594, _1576);
    float4 _1605 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4422, float3(0.0), isnan(_4422)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4422, float3(0.0), isnan(_4422)), level(0.0)).xyzw;
    float _1607 = _1605.x;
    float _1609 = _1605.y;
    float _1611 = _1605.z;
    float _1613 = _1605.w;
    float2 _4439 = float2(_1602, _1590);
    float3 _1617 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4439, float2(0.0), isnan(_4439)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4439, float2(0.0), isnan(_4439)), level(0.0)).xyz;
    float _1619 = _1617.x;
    float _1621 = _1617.y;
    float _1623 = _1617.z;
    float _1625 = -_968;
    float _1627 = _736 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1631 = _628 + _1629;
    bool _1633 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1635 = isnan(_628);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1649;
    bool _1653 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1655 = isnan(_628);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = 1.0 / _1647;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1669 = _628 + _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1673 = _1671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1675 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1677 = isnan(_628);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1691 = _1026 != 0.0;
    bool _1693 = isnan(_1026);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.0);
    bool _1699 = _1695 || _1697;
    float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1705 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1707 = isnan(0.5);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    float _1715 = -_1685;
    float _1717 = _1715 + 1.0;
    float _1719 = 1.0 / _1673;
    bool _1721 = _1024 == 0.0;
    bool _1723 = !_1699;
    bool _1725 = _1721 && _1723;
    float _1727 = -_960;
    float _1729 = _744 + _1727;
    float _1731 = -_990;
    float _1733 = _858 + _1731;
    bool _1735 = _1028 == 0.0;
    bool _1737 = _1735 && _1725;
    float _1739 = _1651 * _1665;
    float _1741 = -_1643;
    float _1743 = _1741 + 1.0;
    float _1745 = _1643 * _1717;
    float _1747 = 1.0 / _1703;
    float _1749 = fma(_1739, _1669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1751 = _1663 * _1743;
    float _1753 = in.m_59.x;
    float _1755 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1757 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1759 = isnan(_628);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1749 * _1751;
    float _1771 = in.m_59.z;
    float _1773 = -_1663;
    float _1775 = _1773 + 1.0;
    float _1777 = _1689 * _1719;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1779;
    float _1783 = in.m_61.x;
    float _1785 = in.m_61.y;
    float _1787 = in.m_61.z;
    float _1789 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1769);
    float _1793 = fma(_1777, _1631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1795 = in.m_59.y;
    float _1797 = _1781 * _1747;
    float _1799 = -_1767;
    float _1801 = _1799 + 1.0;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1805 = _628 + _1803;
    float _1807 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1789);
    float _1809 = fma(_1793, _1745, _1791);
    float _1811 = _1685 * _1801;
    float _1813 = fma(_1797, _1805, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1815 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1817 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1819 = fma(_1813, _1811, _1809);
    out.m_63.x = _1753;
    float _1821 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1815);
    float _1823 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1819);
    out.m_63.z = _1771;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1829 = _1783;
    float _1831 = _1787;
    float _1833 = _1785;
    if (!_1737)
    {
        float _1835 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1783);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1843 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1845 = _1841;
    if (!_1737)
    {
        float _1847 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1787);
        _1831 = _1847;
    }
    float _1849 = _1831;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1853 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1821);
    float _1855 = 1.0 / _1843;
    float _1857 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1861 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_63.y = _1795;
    if (!_1737)
    {
        float _1863 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1785);
        _1833 = _1863;
    }
    float _1865 = _1833;
    float _1867 = _1094 * _1154;
    float _1869 = _1861 + _1843;
    out.m_65.x = _1839;
    out.m_65.y = _1859;
    out.m_65.z = _1841;
    out.m_65.w = _1857;
    float _1871 = _1116 * _1154;
    float _1873 = _1116 * _1172;
    float _1875 = _1116 * _1146;
    float _1877 = _1094 * _1172;
    float _1879 = _1094 * _1146;
    float _1881 = _1112 * _1154;
    float _1883 = _1112 * _1172;
    float _1885 = _1869 * _1855;
    float _1887 = _1885 * 0.5;
    float _1889 = fma(_1100, _1128, _1871);
    float _1891 = fma(_1100, _1134, _1875);
    float _1893 = -_1086;
    float _1895 = fma(_1893, _1128, _1867);
    float _1897 = -_1086;
    float _1899 = fma(_1897, _1130, _1877);
    float _1901 = fma(_1102, _1130, _1883);
    float _1903 = _1879;
    float _1905 = _1891;
    if (!_1713)
    {
        _1845 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1907 = _1845;
    float _1909 = _1112 * _1146;
    float _1911 = -_1086;
    float _1913 = fma(_1911, _1134, _1879);
    float _1915 = fma(_1100, _1130, _1873);
    float _1917 = _1907;
    if (!_1713)
    {
        _1903 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1919 = _1903;
    if (!_1713)
    {
        float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1923 = fma(_1887, _1907, _1921);
        _1917 = _1923;
    }
    float _1925 = _1917;
    float _1927 = fma(_1108, _966, _1889);
    float _1929 = fma(_1108, _992, _1915);
    float _1931 = fma(_1108, _974, _1891);
    float _1933 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1935 = _1933;
    if (!_1713)
    {
        float _1937 = -_1919;
        float _1939 = _1937 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1905 = _1939;
    }
    float _1941 = _1905;
    float _1943 = _1925;
    if (!_1713)
    {
        float _1945 = 1.0 / _1925;
        _1943 = _1945;
    }
    float _1947 = _1943;
    float _1949 = fma(_1098, _966, _1895);
    float _1951 = fma(_1098, _992, _1899);
    float _1953 = fma(_1098, _974, _1913);
    float _1955 = fma(_1102, _1128, _1881);
    float _1957 = _1949 * _1865;
    float _1959 = _1951 * _1865;
    float _1961 = _1953 * _1865;
    float _1963 = exp2(_1817);
    float _1965 = fma(_1118, _966, _1955);
    float _1967 = fma(_1927, _1837, _1957);
    float _1969 = in.m_59.w;
    float _1971 = fma(_1929, _1837, _1959);
    float _1973 = fma(_1931, _1837, _1961);
    float _1975 = fma(_1965, _1849, _1967);
    float _1977 = fma(_1118, _992, _1901);
    float _1979 = _1100;
    if (!_1713)
    {
        float _1981 = 1.0 / _1941;
        _1979 = _1981;
    }
    float _1983 = _1979;
    float _1985 = _1542 * 0.5;
    float _1987 = _1947;
    if (!_1713)
    {
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1991 = -_1919;
        float _1993 = fma(_1947, _1989, _1991);
        _1987 = _1993;
    }
    float _1995 = _1987;
    float _1997 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1933);
    out.m_67.x = _1627;
    out.m_67.y = _1729;
    out.m_67.z = _1733;
    float _1999 = fma(_1977, _1849, _1971);
    if (_1713)
    {
        _1935 = 1.0;
    }
    float _2001 = _1935;
    float _2003 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1997);
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    out.m_69.x = _1284;
    out.m_69.y = _1280;
    out.m_69.z = _1288;
    float _2009 = fma(_1102, _1134, _1909);
    float _2011 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2003);
    float _2013 = _1572 + _1542;
    out.m_71.x = _1064;
    float _2015 = fma(_1118, _974, _2009);
    float _2017 = _2011 + _1542;
    float _2019 = fma(_1562, -0.5, _1985);
    float _2021 = _2001;
    if (!_1713)
    {
        float _2023 = _1995 * _1983;
        float _2025 = precise::clamp(_2023, 0.0, 1.0);
        _2021 = _2025;
    }
    float _2027 = _2021;
    float _2029 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2031 = _2013 * 0.5;
    float _2033 = fma(_2015, _1849, _1973);
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2037 = _2027 > 0.0;
    bool _2039 = isnan(_2027);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    float _2047 = _2017 * 0.5;
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.w = _1969;
    out.m_73.w = _944;
    out.m_75.x = _1975;
    out.m_75.y = _1999;
    out.m_75.z = _2033;
    out.m_77.x = _1296;
    out.m_77.y = _1292;
    out.m_77.z = _1300;
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1562;
    out.gl_Position.z = _2011;
    out.gl_Position.w = _1542;
    out.m_79.x = _2031;
    out.m_79.y = _2019;
    out.m_79.z = _2047;
    out.m_79.w = _1542;
    out.m_47.x = _2049;
    float _2051 = _2029 * _1598;
    float _2053 = -_2029;
    float _2055 = _2053 + 1.0;
    float _2057 = _1613 * _2051;
    float _2059 = _1613 * _2055;
    float _2061 = _1623 * _2051;
    float _2063 = fma(_1619, _2057, _1607);
    float _2065 = fma(_1621, _2057, _1609);
    float _2067 = fma(_1613, _2061, _1611);
    out.m_81.x = _2063;
    out.m_81.y = _2065;
    out.m_81.z = _2067;
    out.m_81.w = _2059;
    if (_2045)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2069;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _620 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2126 = as_type<float>(_116);
        out.gl_Position.z = _2126;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = _134;
    if (_130)
    {
        float _138 = float(_100);
        _110 = _138;
    }
    float _140 = _110;
    bool _142 = _134 >= _140;
    bool _144 = !_130;
    bool _146 = _142 || _144;
    float _148 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_154);
        out.gl_Position.z = _2196;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_51.x;
    float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _162 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    int _174 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _176 = _174 != 0;
    float _178 = _160 * _158;
    float _180 = 0.0;
    if (!_172)
    {
        float _182 = _162 * _162;
        float _184 = _182 * 0.5;
        _180 = _184;
    }
    float _186 = _180;
    float _188 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[20].x, _178);
    float _190 = _186;
    if (!_172)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = in.m_49.x;
    float _198 = in.m_49.y;
    float _200 = in.m_49.z;
    float _202 = _188 * 6.283185482025146484375;
    float _204 = floor(_188);
    float _206 = _202 * 0.15915493667125701904296875;
    float _208 = _206 * 6.283185482025146484375;
    float _210 = cos(_208);
    float _212 = -_204;
    float _214 = _188 + _212;
    float _216 = _204;
    float _218 = _194;
    if (!_172)
    {
        _216 = _162;
    }
    float _220 = _216;
    bool _222 = !_172;
    float _224 = _220;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _162 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _162);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _254;
    }
    float _256 = _218;
    bool _258 = !_172;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _162 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _224 = _278;
    }
    float _280 = _224;
    float _282 = in.m_53.w;
    float _284 = in.m_44.x;
    float _286 = in.m_44.y;
    float _288 = in.m_44.z;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _296 = _294 != 0;
    float _298 = fma(_210, 0.5, 0.5);
    bool _300 = _214 < 0.5;
    float _302 = float(_300);
    float _304 = -_214;
    float _306 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _308 = !_176;
    int _310 = _308 ? 0 : 1;
    float _312 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _314 = !_292;
    int _316 = _314 ? 0 : 1;
    float _318 = -_302;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _322 = -_298;
    float _324 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _326 = abs(_310);
    int _328 = abs(_316);
    float _330 = fma(_280, _196, _312);
    bool _332 = !_296;
    int _334 = _332 ? 0 : 1;
    float _336 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _338 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _342 = fma(_280, _198, _336);
    int _344 = abs(_334);
    float _346 = fma(_280, _200, _338);
    float _348 = float(_328);
    float _350 = float(_326);
    float _352 = fma(_330, _282, _284);
    float _354 = abs(_306);
    float _356 = _348 * _354;
    float _358 = fma(_342, _282, _286);
    float _360 = fma(_346, _282, _288);
    float _362 = float(_344);
    float _364 = fma(_350, _324, _356);
    float _366 = abs(_320);
    float _368 = fma(_362, _366, _364);
    bool _370 = !_340;
    float _386;
    if (!_370)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _156 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_100);
        float _392 = 1.0 / _390;
        float _394 = _134 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _414;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _420 = _396 + _418;
    bool _422 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _424 = isnan(_396);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = 1.0 / _408;
    bool _436 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _438 = isnan(_396);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _444 = _440 || _442;
    float _446 = float(_444);
    float _448 = -_432;
    float _450 = _448 + 1.0;
    bool _452 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _454 = isnan(_396);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = 1.0 / _416;
    float _466 = _446 * _450;
    float _468 = -_446;
    float _470 = _468 + 1.0;
    bool _472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _474 = 1.0 / _412;
    float _476 = _400 * _434;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _482;
    float _486 = _404 * _464;
    bool _488 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _490 = isnan(_396);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = fma(_484, _476, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _510 = -_498;
    float _512 = _510 + 1.0;
    float _514 = _420 * _474;
    float _516 = fma(_480, _476, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _522;
    float _526 = _498 * _470;
    float _528 = fma(_504, _514, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _530 = fma(_520, _514, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _532 = fma(_508, _514, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _534 = _462 * _512;
    float _536 = fma(_524, _476, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _538 = in.m_53.x;
    float _540 = in.m_53.y;
    float _542 = in.m_53.z;
    float _544 = _516 * _534;
    float _546 = _500 * _534;
    float _548 = -_462;
    float _550 = _548 + 1.0;
    float _552 = _536 * _534;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _554;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _558;
    float _562 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].x, _544);
    float _564 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].y, _546);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _566;
    float _570 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[143].z, _552);
    float _572 = fma(_556, _486, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _574 = fma(_560, _486, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _576 = fma(_568, _486, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _578 = fma(_528, _526, _562);
    float _580 = fma(_530, _526, _564);
    float _582 = fma(_532, _526, _570);
    float _584 = fma(_572, _466, _578);
    float _586 = fma(_574, _466, _580);
    float _588 = fma(_576, _466, _582);
    float _590 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].x, _584);
    float _592 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].y, _586);
    float _594 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[146].z, _588);
    float _596 = _590 * _538;
    float _598 = _592 * _540;
    float _600 = _594 * _542;
    bool _602 = !_472;
    float _618;
    if (!_602)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _606 = _156 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_100);
        float _624 = 1.0 / _622;
        float _626 = _134 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_51.z;
    float _632 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _634 = log2(_632);
    float _636 = _156 * 2.0;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = in.m_51.y;
    float _652 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _654 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _656 = _368 * _596;
    float _658 = floor(_636);
    float _660 = _368 * _598;
    float _662 = _368 * _600;
    float _664 = _656 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _666 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _668 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _670 = _664 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _672 = _634 * _134;
    float _674 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _676 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[5].x, _652);
    float _678 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[4].x, _674);
    float _680 = exp2(_672);
    float _682 = _630 * 2.0;
    bool _684 = _658 > 0.0;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _688 = 1.0 + _686;
    bool _690 = _658 >= 0.0;
    bool _692 = isnan(_658);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = _650 * 2.0;
    float _702 = _650 + _630;
    float _704 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _678);
    float _706 = floor(_682);
    bool _708 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _710 = isnan(1.0);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _716 = _712 || _714;
    float _718 = _702 + (-1.0);
    int _720 = _698 ? 0 : 1;
    float _722 = fma(_352, (*spvDescriptorSet0.vp_c10)._m0[6].x, _654);
    bool _724 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _726 = isnan(0.0);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _732 = _728 || _730;
    float _734 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _676);
    float _736 = _704 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _738 = floor(_700);
    float _740 = -_680;
    float _742 = _740 + 1.0;
    float _744 = _734 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _746 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _722);
    bool _748 = !_640;
    int _750 = _748 ? 0 : 1;
    float _752 = -_736;
    float _754 = _752 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _756 = _732 ? _742 : 0.0;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _760 = _744 + _758;
    float _762 = 1.0 / _688;
    float _764 = -_744;
    float _766 = _764 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _768 = _706 >= 0.0;
    bool _770 = isnan(_706);
    bool _772 = _768 || _770;
    bool _774 = isnan(0.0);
    bool _776 = _772 || _774;
    int _778 = abs(_750);
    float _780 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _782 = !_644;
    int _784 = _782 ? 0 : 1;
    int _786 = ~_720;
    int _788 = _786 + 1;
    int _790 = _788 + 1;
    int _792 = _790;
    if (!_684)
    {
        int _794 = ~_720;
        int _796 = _794 + 1;
        _792 = _796;
    }
    int _798 = _792;
    bool _800 = _738 > 0.0;
    bool _802 = _706 > 0.0;
    if (_716)
    {
        float _804 = _756 * _762;
        _136 = _804;
    }
    float _806 = _136;
    int _808 = abs(_784);
    float _810 = in.m_55.x;
    float _812 = in.m_55.y;
    float _814 = in.m_55.z;
    bool _816 = _738 >= 0.0;
    bool _818 = isnan(_738);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    int _826 = _776 ? 0 : 1;
    int _828 = _824 ? 0 : 1;
    float _830 = float(_808);
    float _832 = float(_798);
    int _834 = ~_828;
    int _836 = _834 + 1;
    int _838 = _836 + 1;
    int _840 = ~_826;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    float _846 = _830 * _832;
    int _848 = _838;
    int _850 = _844;
    if (!_800)
    {
        int _852 = ~_828;
        int _854 = _852 + 1;
        _848 = _854;
    }
    int _856 = _848;
    float _858 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (!_802)
    {
        int _860 = ~_826;
        int _862 = _860 + 1;
        _850 = _862;
    }
    int _864 = _850;
    float _866 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _868 = _736 + _866;
    float _870 = _760 * _760;
    float _872 = _846 * (-2.0);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _858 + _874;
    float _878 = float(_778);
    float _880 = fma(_868, _868, _870);
    float _882 = float(_864);
    float _884 = fma(_872, _812, _812);
    float _886 = fma(_780, _872, _780);
    float _888 = fma(_876, _876, _880);
    float _890 = _766 * _766;
    float _892 = _878 * _882;
    float _894 = _650 + (-0.5);
    float _896 = sqrt(_888);
    float _898 = _156 + _650;
    float _900 = -_858;
    float _902 = _900 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _904 = fma(_754, _754, _890);
    float _906 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _884);
    float _908 = _898 + (-1.0);
    bool _910 = !_648;
    int _912 = _910 ? 0 : 1;
    float _914 = fma(_902, _902, _904);
    float _916 = rsqrt(_888);
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _920 = _892 * (-2.0);
    int _922 = abs(_912);
    float _924 = fma(_886, _806, _906);
    float _926 = float(_856);
    float _928 = fma(_918, _920, _918);
    float _930 = fma(_920, _810, _810);
    float _932 = rsqrt(_914);
    float _934 = _896 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _936 = float(_922);
    float _938 = _156 + (-0.5);
    float _940 = _156 + _630;
    float _942 = _630 + (-0.5);
    float _944 = precise::min(_670, _934);
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _930);
    float _948 = _936 * _926;
    float _950 = _940 + (-1.0);
    float _952 = _916 * _944;
    float _954 = fma(_928, _806, _946);
    float _956 = _948 * (-2.0);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _960 = _760 * _952;
    float _962 = _954 * 0.15915493667125701904296875;
    float _964 = fma(_956, _814, _814);
    float _966 = _754 * _932;
    float _968 = _868 * _952;
    float _970 = -_960;
    float _972 = _760 + _970;
    float _974 = _902 * _932;
    float _976 = fma(_958, _956, _958);
    float _978 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[196].z, _964);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _982 = _966 * _980;
    float _984 = -_968;
    float _986 = _868 + _984;
    float _988 = _972 * _972;
    float _990 = _876 * _952;
    float _992 = _766 * _932;
    float _994 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _996 = _974 * _994;
    float _998 = fma(_976, _806, _978);
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1002 = -_982;
    float _1004 = fma(_974, _1000, _1002);
    float _1006 = fma(_986, _986, _988);
    float _1008 = -_990;
    float _1010 = _876 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1014 = -_996;
    float _1016 = fma(_992, _1012, _1014);
    float _1018 = _1004 * _1004;
    float _1020 = _998 * 0.15915493667125701904296875;
    float _1022 = fma(_1010, _1010, _1006);
    float _1024 = in.m_57.x;
    float _1026 = in.m_57.y;
    float _1028 = in.m_57.z;
    float _1030 = _924 * 0.15915493667125701904296875;
    float _1032 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1034 = _992 * _1032;
    float _1036 = fma(_1016, _1016, _1018);
    float _1038 = _962 * 6.283185482025146484375;
    float _1040 = sin(_1038);
    float _1042 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1044 = -_1034;
    float _1046 = fma(_966, _1042, _1044);
    float _1048 = fma(_1046, _1046, _1036);
    float _1050 = sqrt(_1022);
    float _1052 = _1030 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = _1030 * 6.283185482025146484375;
    float _1058 = cos(_1056);
    float _1060 = _916 * _1050;
    float _1062 = _666 * _1060;
    float _1064 = _664 * _1060;
    float _1066 = _668 * _1060;
    float _1068 = _962 * 6.283185482025146484375;
    float _1070 = cos(_1068);
    float _1072 = _1040 * _1054;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1028);
    float _1076 = _1066 * _1074;
    float _1078 = _1020 * 6.283185482025146484375;
    float _1080 = cos(_1078);
    float _1082 = _1040 * _1058;
    float _1084 = _1020 * 6.283185482025146484375;
    float _1086 = sin(_1084);
    float _1088 = _1070 * _1054;
    float _1090 = _1070 * _1058;
    float _1092 = rsqrt(_1048);
    float _1094 = _1070 * _1080;
    float _1096 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1026);
    float _1098 = _1040 * _1080;
    float _1100 = _1058 * _1080;
    float _1102 = _1054 * _1080;
    float _1104 = _1062 * _1096;
    float _1106 = -_1088;
    float _1108 = fma(_1086, _1082, _1106);
    float _1110 = -_1082;
    float _1112 = fma(_1086, _1088, _1110);
    float _1114 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1024);
    float _1116 = fma(_1086, _1090, _1072);
    float _1118 = fma(_1086, _1072, _1090);
    float _1120 = _1094 * _1104;
    float _1122 = _1064 * _1114;
    float _1124 = -_1104;
    float _1126 = _1086 * _1124;
    float _1128 = _1016 * _1092;
    float _1130 = _1004 * _1092;
    float _1132 = fma(_1116, _1122, _1120);
    float _1134 = _1046 * _1092;
    float _1136 = _992 * _1128;
    float _1138 = _974 * _1130;
    float _1140 = _1098 * _1104;
    float _1142 = fma(_1100, _1122, _1126);
    float _1144 = -_1136;
    float _1146 = fma(_966, _1130, _1144);
    float _1148 = fma(_1112, _1076, _1132);
    float _1150 = fma(_1108, _1122, _1140);
    float _1152 = -_1138;
    float _1154 = fma(_992, _1134, _1152);
    float _1156 = fma(_1102, _1076, _1142);
    float _1158 = _1146 * _1148;
    float _1160 = fma(_1118, _1076, _1150);
    float _1162 = _1154 * _1148;
    float _1164 = _966 * _1134;
    float _1166 = fma(_1134, _1156, _1158);
    float _1168 = fma(_1128, _1156, _1162);
    float _1170 = -_1164;
    float _1172 = fma(_974, _1128, _1170);
    float _1174 = fma(_974, _1160, _1166);
    float _1176 = fma(_966, _1160, _1168);
    float _1178 = _1172 * _1148;
    float _1180 = _858 + _1174;
    float _1182 = _736 + _1176;
    float _1184 = fma(_1130, _1156, _1178);
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1188 = _1180 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1192 = _1182 + _1190;
    float _1194 = fma(_992, _1160, _1184);
    float _1196 = _1188 * _1188;
    float _1198 = _744 + _1194;
    float _1200 = fma(_1192, _1192, _1196);
    float _1202 = sqrt(_1200);
    bool _1204 = _1202 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = _1194;
    float _1208 = _1196;
    float _1210 = _1184;
    float _1212 = _1202;
    float _1214 = _1200;
    float _1216 = _962;
    float _1218 = _934;
    if (!_1204)
    {
        _1206 = _1182;
    }
    float _1220 = _1206;
    float _1222 = _1220;
    if (!_1204)
    {
        _1208 = _1180;
    }
    float _1224 = _1208;
    float _1226 = _1224;
    if (!_1204)
    {
        _1210 = _1198;
    }
    float _1228 = _1210;
    bool _1230 = !_1204;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1202 + _1236;
        float _1240 = rsqrt(_1200);
        float _1242 = _1238 * _1234;
        float _1244 = _1198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = _1242 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = sin(_1252);
        float _1256 = _1250 + (-1.0);
        float _1258 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1260 = fma(_1254, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1262 = fma(_1198, _1250, _1258);
        float _1264 = _1240 * _1260;
        float _1266 = fma(_1192, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1268 = fma(_1188, _1264, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1232 = _1262;
        _1222 = _1266;
        _1226 = _1268;
        _1212 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = _1212;
    float _1278 = -_960;
    float _1280 = _1278 + _1270;
    float _1282 = -_968;
    float _1284 = _1282 + _1272;
    float _1286 = -_990;
    float _1288 = _1286 + _1274;
    float _1290 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1292 = _1280 + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1296 = _1284 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1300 = _1288 + _1298;
    float _1302 = _1292 * _1292;
    float _1304 = fma(_1296, _1296, _1302);
    float _1306 = fma(_1300, _1300, _1304);
    float _1308 = rsqrt(_1306);
    float _1310 = sqrt(_1306);
    float _1312 = _1308 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1314 = _1296 * _1312;
    float _1316 = _1300 * _1312;
    float _1318 = _1314 * _1314;
    float _1320 = _1316 * _1316;
    float _1322 = _1318 + _1320;
    float _1324 = sqrt(_1322);
    bool _1326 = _1324 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1330 = _1324 + _1328;
    float _1332 = _1188;
    float _1334 = _1330;
    if (_1326)
    {
        float _1336 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1336;
    }
    float _1338 = _1332;
    if (_1326)
    {
        float _1340 = _1330 * _1338;
        _1334 = _1340;
    }
    float _1342 = _1334;
    if (_1326)
    {
        float _1344 = _1342 * 0.15915493667125701904296875;
        _1214 = _1344;
    }
    float _1346 = _1214;
    float _1348 = _1192;
    if (_1326)
    {
        float _1350 = _1346 * 6.283185482025146484375;
        float _1352 = sin(_1350);
        _1348 = _1352;
    }
    float _1354 = _1348;
    float _1356 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1358 = precise::max(0.0, _1356);
    float _1360 = _1276;
    float _1362 = _1358;
    if (_1326)
    {
        float _1364 = _1346 * 6.283185482025146484375;
        float _1366 = cos(_1364);
        _1360 = _1366;
    }
    float _1368 = _1360;
    float _1370 = -_1312;
    float _1372 = -_1358;
    float _1374 = fma(_1292, _1370, _1372);
    float _1376 = _1356;
    if (_1326)
    {
        float _1378 = rsqrt(_1322);
        _1376 = _1378;
    }
    float _1380 = _1376;
    if (_1326)
    {
        float _1382 = _1374 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1382;
    }
    float _1384 = _1362;
    float _1386 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1388 = _1354;
    float _1390 = _1384;
    if (_1326)
    {
        float _1392 = fma(_1354, _1384, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1216 = _1392;
    }
    float _1394 = _1216;
    float _1396 = _1394;
    if (!_1326)
    {
        _1388 = _1314;
    }
    float _1398 = _1388;
    float _1400 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1386);
    float _1402 = _1398;
    float _1404 = _1368;
    if (_1326)
    {
        float _1406 = _1368 + (-1.0);
        _1390 = _1406;
    }
    float _1408 = _1390;
    float _1410 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1400);
    float _1412 = _1408;
    if (_1326)
    {
        float _1414 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1218 = _1414;
    }
    float _1416 = _1218;
    if (!_1326)
    {
        _1412 = _1316;
    }
    float _1418 = _1412;
    float _1420 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1422 = 0.0;
    float _1424 = _1380;
    float _1426 = _1418;
    if (_1326)
    {
        float _1428 = _1380 * _1394;
        _1422 = _1428;
    }
    float _1430 = _1422;
    if (!_1326)
    {
        _1424 = _1374;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1326)
    {
        float _1436 = fma(_1374, _1368, _1416);
        _1434 = _1436;
    }
    float _1438 = _1434;
    if (!_1326)
    {
        _1396 = _1318;
    }
    float _1440 = _1396;
    float _1442 = _1440;
    if (_1326)
    {
        float _1444 = _1314 * _1430;
        _1402 = _1444;
    }
    float _1446 = _1402;
    if (_1326)
    {
        float _1448 = _1316 * _1430;
        _1426 = _1448;
    }
    float _1450 = _1426;
    if (!_1326)
    {
        _1404 = _1320;
    }
    float _1452 = _1404;
    float _1454 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1456 = _1452;
    if (_1326)
    {
        float _1458 = _1446 * _1446;
        _1442 = _1458;
    }
    float _1460 = _1442;
    if (_1326)
    {
        float _1462 = _1450 * _1450;
        _1456 = _1462;
    }
    float _1464 = _1456;
    float _1466 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1468 = fma(_1438, _1438, _1460);
    float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1472 = fma(_1310, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1470);
    float _1474 = precise::clamp(_1472, 0.0, 1.0);
    float _1476 = _1468 + _1464;
    float _1478 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1480 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1466);
    float _1482 = -_1474;
    float _1484 = _1482 + 1.0;
    float _1486 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1488 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1478);
    float _1490 = rsqrt(_1476);
    float _1492 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1480);
    float _1494 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1496 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1488);
    float _1498 = _1492 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1500 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1494);
    float _1502 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1504 = abs(_1484);
    float _1506 = log2(_1504);
    float _1508 = -_1486;
    float _1510 = fma(_1508, _1454, 1.0);
    float _1512 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1500);
    float _1514 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1516 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1518 = _1490 * _1438;
    float _1520 = _1490 * _1446;
    float _1522 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1514);
    float _1524 = _1490 * _1450;
    float _1526 = log2(_1510);
    float _1528 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1530 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1532 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1534 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1536 = -_1528;
    float _1538 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1536);
    float _1540 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1532);
    float _1542 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1530);
    float _1544 = -_1524;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1538);
    float _1548 = exp2(_1534);
    float _1550 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1552 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1540);
    float _1554 = fma(_1546, -0.5, 0.5);
    float _1556 = fma(_1546, 0.5, 0.5);
    float _1558 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1550);
    float _1560 = _1518 + 1.0;
    float _1562 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1552);
    float _1564 = 1.0 / _1542;
    float _1566 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1558);
    float _1568 = fma(_1556, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1570 = _1526 * 0.693147182464599609375;
    float _1572 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1566);
    float _1574 = fma(_1556, _1568, -0.212114393711090087890625);
    float _1576 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1578 = sqrt(_1554);
    float _1580 = -_1518;
    float _1582 = fma(_1548, _1560, _1580);
    float _1584 = fma(_1556, _1574, 1.570728778839111328125);
    float _1586 = _1572 * _1564;
    float _1588 = _1562 * _1564;
    float _1590 = fma(_1582, 0.5, 0.5);
    float _1592 = fma(_1586, 0.5, 0.5);
    float _1594 = fma(_1588, -0.5, 0.5);
    float _1596 = _1578 * 0.636619746685028076171875;
    float3 _4406 = float3(_1592, _1594, _1576);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4406, float3(0.0), isnan(_4406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4406, float3(0.0), isnan(_4406)), level(0.0)).x;
    float _1600 = -_1584;
    float _1602 = fma(_1596, _1600, 1.0);
    float3 _4422 = float3(_1592, _1594, _1576);
    float4 _1605 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4422, float3(0.0), isnan(_4422)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4422, float3(0.0), isnan(_4422)), level(0.0)).xyzw;
    float _1607 = _1605.x;
    float _1609 = _1605.y;
    float _1611 = _1605.z;
    float _1613 = _1605.w;
    float2 _4439 = float2(_1602, _1590);
    float3 _1617 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4439, float2(0.0), isnan(_4439)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4439, float2(0.0), isnan(_4439)), level(0.0)).xyz;
    float _1619 = _1617.x;
    float _1621 = _1617.y;
    float _1623 = _1617.z;
    float _1625 = -_968;
    float _1627 = _736 + _1625;
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1631 = _628 + _1629;
    bool _1633 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1635 = isnan(_628);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1647 = _1645 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1649;
    bool _1653 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1655 = isnan(_628);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = 1.0 / _1647;
    float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1669 = _628 + _1667;
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1673 = _1671 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1675 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1677 = isnan(_628);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1689 = _1687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1691 = _1026 != 0.0;
    bool _1693 = isnan(_1026);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(0.0);
    bool _1699 = _1695 || _1697;
    float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1705 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1707 = isnan(0.5);
    bool _1709 = _1705 || _1707;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    float _1715 = -_1685;
    float _1717 = _1715 + 1.0;
    float _1719 = 1.0 / _1673;
    bool _1721 = _1024 == 0.0;
    bool _1723 = !_1699;
    bool _1725 = _1721 && _1723;
    float _1727 = -_960;
    float _1729 = _744 + _1727;
    float _1731 = -_990;
    float _1733 = _858 + _1731;
    bool _1735 = _1028 == 0.0;
    bool _1737 = _1735 && _1725;
    float _1739 = _1651 * _1665;
    float _1741 = -_1643;
    float _1743 = _1741 + 1.0;
    float _1745 = _1643 * _1717;
    float _1747 = 1.0 / _1703;
    float _1749 = fma(_1739, _1669, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1751 = _1663 * _1743;
    float _1753 = in.m_59.x;
    float _1755 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1757 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1759 = isnan(_628);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1749 * _1751;
    float _1771 = in.m_59.z;
    float _1773 = -_1663;
    float _1775 = _1773 + 1.0;
    float _1777 = _1689 * _1719;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1779;
    float _1783 = in.m_61.x;
    float _1785 = in.m_61.y;
    float _1787 = in.m_61.z;
    float _1789 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1755);
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1769);
    float _1793 = fma(_1777, _1631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1795 = in.m_59.y;
    float _1797 = _1781 * _1747;
    float _1799 = -_1767;
    float _1801 = _1799 + 1.0;
    float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1805 = _628 + _1803;
    float _1807 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1789);
    float _1809 = fma(_1793, _1745, _1791);
    float _1811 = _1685 * _1801;
    float _1813 = fma(_1797, _1805, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1815 = _1729 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1817 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1819 = fma(_1813, _1811, _1809);
    out.m_63.x = _1753;
    float _1821 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1815);
    float _1823 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1819);
    out.m_63.z = _1771;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1829 = _1783;
    float _1831 = _1787;
    float _1833 = _1785;
    if (!_1737)
    {
        float _1835 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1783);
        _1829 = _1835;
    }
    float _1837 = _1829;
    float _1839 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1843 = _1807 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1845 = _1841;
    if (!_1737)
    {
        float _1847 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1787);
        _1831 = _1847;
    }
    float _1849 = _1831;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1853 = fma(_1733, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1821);
    float _1855 = 1.0 / _1843;
    float _1857 = _1823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1859 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1861 = _1853 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_63.y = _1795;
    if (!_1737)
    {
        float _1863 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1785);
        _1833 = _1863;
    }
    float _1865 = _1833;
    float _1867 = _1094 * _1154;
    float _1869 = _1861 + _1843;
    out.m_65.x = _1839;
    out.m_65.y = _1859;
    out.m_65.z = _1841;
    out.m_65.w = _1857;
    float _1871 = _1116 * _1154;
    float _1873 = _1116 * _1172;
    float _1875 = _1116 * _1146;
    float _1877 = _1094 * _1172;
    float _1879 = _1094 * _1146;
    float _1881 = _1112 * _1154;
    float _1883 = _1112 * _1172;
    float _1885 = _1869 * _1855;
    float _1887 = _1885 * 0.5;
    float _1889 = fma(_1100, _1128, _1871);
    float _1891 = fma(_1100, _1134, _1875);
    float _1893 = -_1086;
    float _1895 = fma(_1893, _1128, _1867);
    float _1897 = -_1086;
    float _1899 = fma(_1897, _1130, _1877);
    float _1901 = fma(_1102, _1130, _1883);
    float _1903 = _1879;
    float _1905 = _1891;
    if (!_1713)
    {
        _1845 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1907 = _1845;
    float _1909 = _1112 * _1146;
    float _1911 = -_1086;
    float _1913 = fma(_1911, _1134, _1879);
    float _1915 = fma(_1100, _1130, _1873);
    float _1917 = _1907;
    if (!_1713)
    {
        _1903 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1919 = _1903;
    if (!_1713)
    {
        float _1921 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1923 = fma(_1887, _1907, _1921);
        _1917 = _1923;
    }
    float _1925 = _1917;
    float _1927 = fma(_1108, _966, _1889);
    float _1929 = fma(_1108, _992, _1915);
    float _1931 = fma(_1108, _974, _1891);
    float _1933 = _1502 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1935 = _1933;
    if (!_1713)
    {
        float _1937 = -_1919;
        float _1939 = _1937 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1905 = _1939;
    }
    float _1941 = _1905;
    float _1943 = _1925;
    if (!_1713)
    {
        float _1945 = 1.0 / _1925;
        _1943 = _1945;
    }
    float _1947 = _1943;
    float _1949 = fma(_1098, _966, _1895);
    float _1951 = fma(_1098, _992, _1899);
    float _1953 = fma(_1098, _974, _1913);
    float _1955 = fma(_1102, _1128, _1881);
    float _1957 = _1949 * _1865;
    float _1959 = _1951 * _1865;
    float _1961 = _1953 * _1865;
    float _1963 = exp2(_1817);
    float _1965 = fma(_1118, _966, _1955);
    float _1967 = fma(_1927, _1837, _1957);
    float _1969 = in.m_59.w;
    float _1971 = fma(_1929, _1837, _1959);
    float _1973 = fma(_1931, _1837, _1961);
    float _1975 = fma(_1965, _1849, _1967);
    float _1977 = fma(_1118, _992, _1901);
    float _1979 = _1100;
    if (!_1713)
    {
        float _1981 = 1.0 / _1941;
        _1979 = _1981;
    }
    float _1983 = _1979;
    float _1985 = _1542 * 0.5;
    float _1987 = _1947;
    if (!_1713)
    {
        float _1989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1991 = -_1919;
        float _1993 = fma(_1947, _1989, _1991);
        _1987 = _1993;
    }
    float _1995 = _1987;
    float _1997 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1933);
    out.m_67.x = _1627;
    out.m_67.y = _1729;
    out.m_67.z = _1733;
    float _1999 = fma(_1977, _1849, _1971);
    if (_1713)
    {
        _1935 = 1.0;
    }
    float _2001 = _1935;
    float _2003 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1997);
    float _2005 = -_1963;
    float _2007 = _2005 + 1.0;
    out.m_69.x = _1284;
    out.m_69.y = _1280;
    out.m_69.z = _1288;
    float _2009 = fma(_1102, _1134, _1909);
    float _2011 = fma(_1516, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2003);
    float _2013 = _1572 + _1542;
    out.m_71.x = _1064;
    float _2015 = fma(_1118, _974, _2009);
    float _2017 = _2011 + _1542;
    float _2019 = fma(_1562, -0.5, _1985);
    float _2021 = _2001;
    if (!_1713)
    {
        float _2023 = _1995 * _1983;
        float _2025 = precise::clamp(_2023, 0.0, 1.0);
        _2021 = _2025;
    }
    float _2027 = _2021;
    float _2029 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2031 = _2013 * 0.5;
    float _2033 = fma(_2015, _1849, _1973);
    float _2035 = _2027 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2037 = _2027 > 0.0;
    bool _2039 = isnan(_2027);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan(0.0);
    bool _2045 = _2041 || _2043;
    float _2047 = _2017 * 0.5;
    float _2049 = _2035 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_63.w = _1969;
    out.m_73.w = _944;
    out.m_75.x = _1975;
    out.m_75.y = _1999;
    out.m_75.z = _2033;
    out.m_77.x = _1296;
    out.m_77.y = _1292;
    out.m_77.z = _1300;
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1562;
    out.gl_Position.z = _2011;
    out.gl_Position.w = _1542;
    out.m_79.x = _2031;
    out.m_79.y = _2019;
    out.m_79.z = _2047;
    out.m_79.w = _1542;
    out.m_47.x = _2049;
    float _2051 = _2029 * _1598;
    float _2053 = -_2029;
    float _2055 = _2053 + 1.0;
    float _2057 = _1613 * _2051;
    float _2059 = _1613 * _2055;
    float _2061 = _1623 * _2051;
    float _2063 = fma(_1619, _2057, _1607);
    float _2065 = fma(_1621, _2057, _1609);
    float _2067 = fma(_1613, _2061, _1611);
    out.m_81.x = _2063;
    out.m_81.y = _2065;
    out.m_81.z = _2067;
    out.m_81.w = _2059;
    if (_2045)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2069 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2069;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

