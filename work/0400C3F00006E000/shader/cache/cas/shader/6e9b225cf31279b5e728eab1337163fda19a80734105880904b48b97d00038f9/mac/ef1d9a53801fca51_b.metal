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
    constant _16* vp_c16 [[id(4)]];
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
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2568 = false;
    bool _1130 = false;
    bool _664 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_114);
        out.gl_Position.z = _3058;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3128 = as_type<float>(_152);
        out.gl_Position.z = _3128;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = _158 * _156;
    float _174 = 0.0;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _184 = _180;
    if (!_170)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _182 * 6.283185482025146484375;
    float _198 = floor(_182);
    float _200 = _196 * 0.15915493667125701904296875;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _200 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = 1.4012984643248170709237295832899e-45;
    float _212 = _188;
    if (!_170)
    {
        _210 = _160;
    }
    float _214 = _210;
    float _216 = -_198;
    float _218 = _182 + _216;
    bool _220 = !_170;
    float _222 = _214;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _160 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _160);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _252;
    }
    float _254 = _212;
    bool _256 = !_170;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _160 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _222 = _276;
    }
    float _278 = _222;
    float _280 = in.m_53.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _294 = _292 != 0;
    float _296 = -_218;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _300 = _218 < 0.5;
    float _302 = float(_300);
    float _304 = fma(_208, 0.5, 0.5);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_290;
    int _310 = _308 ? 0 : 1;
    bool _312 = !_204;
    int _314 = _312 ? 0 : 1;
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = -_304;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _324 = abs(_310);
    float _326 = fma(_278, _190, _306);
    int _328 = abs(_314);
    float _330 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = !_294;
    int _334 = _332 ? 0 : 1;
    float _336 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _192, _330);
    int _342 = abs(_334);
    float _344 = fma(_278, _194, _336);
    float _346 = float(_324);
    float _348 = float(_328);
    float _350 = fma(_326, _280, _282);
    float _352 = abs(_298);
    float _354 = _346 * _352;
    float _356 = fma(_340, _280, _284);
    float _358 = fma(_344, _280, _286);
    float _360 = float(_342);
    float _362 = fma(_348, _322, _354);
    float _364 = abs(_318);
    float _366 = fma(_360, _364, _362);
    bool _368 = !_338;
    bool _370 = _290;
    float _386;
    if (!_368)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_98);
        float _392 = 1.0 / _390;
        float _394 = _132 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _396 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _412;
    float _428 = 1.0 / _416;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _436 = 1.0 / _420;
    float _438 = _404 * _426;
    bool _440 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _442 = isnan(_396);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = 1.0 / _424;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _396 + _458;
    float _462 = _400 * _436;
    float _464 = _460 * _428;
    bool _466 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _468 = isnan(_396);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _480 = isnan(_396);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = fma(_432, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _492 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_396);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_476;
    float _506 = _504 + 1.0;
    float _508 = _408 * _456;
    float _510 = -_488;
    float _512 = _510 + 1.0;
    bool _514 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _516 = isnan(_396);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _502 * _506;
    float _528 = -_502;
    float _530 = _528 + 1.0;
    float _532 = _450 * _512;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _534;
    float _538 = -_450;
    float _540 = _538 + 1.0;
    float _542 = _488 * _530;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _548 = fma(_536, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = _524 * _540;
    float _560 = fma(_454, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _562 = fma(_546, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _564 = fma(_552, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _566 = fma(_556, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _568 = _548 * _558;
    float _570 = _490 * _558;
    float _572 = -_524;
    float _574 = _572 + 1.0;
    float _576 = _560 * _558;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _578;
    float _582 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _568);
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _570);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    float _596 = fma(_580, _438, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_562, _532, _582);
    float _600 = fma(_564, _532, _584);
    float _602 = fma(_566, _532, _586);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _612 = fma(_590, _438, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _614 = fma(_594, _438, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _620 = fma(_596, _542, _598);
    float _622 = fma(_606, _464, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _624 = fma(_610, _464, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _626 = fma(_618, _464, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_612, _542, _600);
    float _630 = fma(_614, _542, _602);
    float _632 = fma(_622, _526, _620);
    float _634 = fma(_624, _526, _628);
    float _636 = fma(_626, _526, _630);
    float _638 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].x, _632);
    float _640 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].y, _634);
    float _642 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].z, _636);
    bool _644 = !_434;
    int _646 = as_type<int>(_640);
    float _662;
    if (!_644)
    {
        float _648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _650 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _654 = _652 * _648;
        float _656 = floor(_654);
        float _658 = -_656;
        float _660 = _654 + _658;
        _662 = _660;
        _664 = true;
    }
    else
    {
        float _666 = float(_98);
        float _668 = 1.0 / _666;
        float _670 = _132 * _668;
        _662 = _670;
    }
    _664 = false;
    float _672 = _662;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _680 = _672 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _698 = 1.0 / _684;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _708 = 1.0 / _688;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _718;
    bool _722 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_672);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = 1.0 / _692;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[114].w + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _742 = _672 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _744;
    float _748 = -_732;
    float _750 = _748 + 1.0;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _754 = _742 * _698;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _758 = _672 + _756;
    float _760 = 1.0 / _702;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _764 = _672 + _762;
    float _766 = fma(_712, _754, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = _758 * _708;
    bool _770 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[114].w;
    bool _772 = isnan(_672);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[114].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    bool _782 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _784 = isnan(_672);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = fma(_716, _768, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = 1.0 / _738;
    float _798 = _676 * _734;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _802 = _672 + _800;
    float _804 = fma(_720, _798, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _806 = 1.0 / _706;
    float _808 = _764 * _760;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _812 = _672 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _822 = 1.0 / _696;
    float _824 = _812 * _796;
    float _826 = -_780;
    float _828 = _826 + 1.0;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _830;
    float _834 = fma(_816, _754, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _840 = fma(_820, _768, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _842 = fma(_832, _754, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _844 = _802 * _806;
    bool _846 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _848 = isnan(_672);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = fma(_838, _768, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _860 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _862 = isnan(_672);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    bool _872 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _874 = isnan(_672);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _856 * _828;
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = _680 * _822;
    bool _892 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _894 = isnan(_672);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_870;
    float _906 = _904 + 1.0;
    float _908 = _870 * _888;
    float _910 = -_882;
    float _912 = _910 + 1.0;
    float _914 = _902 * _906;
    float _916 = -_902;
    float _918 = _916 + 1.0;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _920;
    float _924 = _792 * _918;
    float _926 = -_792;
    float _928 = _926 + 1.0;
    float _930 = _882 * _928;
    float _932 = fma(_922, _798, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _934 = fma(_746, _798, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    bool _936 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _938 = isnan(_672);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _732 * _912;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _962 = _946 * _750;
    float _964 = fma(_952, _890, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _966 = -_946;
    float _968 = _966 + 1.0;
    float _970 = fma(_956, _890, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _972 = _766 * _962;
    float _974 = _834 * _962;
    float _976 = _842 * _962;
    float _978 = fma(_960, _890, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].x, _972);
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].y, _974);
    float _984 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].z, _976);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _986;
    float _990 = fma(_794, _948, _980);
    float _992 = fma(_840, _948, _982);
    float _994 = fma(_858, _948, _984);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _996;
    float _1000 = fma(_988, _808, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1002 = fma(_932, _930, _990);
    float _1004 = fma(_804, _930, _992);
    float _1006 = fma(_934, _930, _994);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1020;
    float _1024 = fma(_998, _808, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1026 = fma(_964, _924, _1002);
    float _1028 = fma(_970, _924, _1004);
    float _1030 = fma(_978, _924, _1006);
    float _1032 = fma(_1010, _844, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1034 = fma(_1014, _844, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1036 = fma(_1018, _844, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1038 = fma(_1022, _808, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1040 = fma(_1024, _914, _1028);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[114].x + _1042;
    float _1046 = fma(_1000, _914, _1026);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[114].y + _1048;
    float _1052 = fma(_1038, _914, _1030);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[114].z + _1054;
    float _1058 = fma(_1044, _824, (*spvDescriptorSet0.vp_c9)._m0[113].x);
    float _1060 = fma(_1050, _824, (*spvDescriptorSet0.vp_c9)._m0[113].y);
    float _1062 = fma(_1032, _908, _1046);
    float _1064 = fma(_1056, _824, (*spvDescriptorSet0.vp_c9)._m0[113].z);
    float _1066 = fma(_1034, _908, _1040);
    float _1068 = fma(_1036, _908, _1052);
    float _1070 = fma(_1058, _884, _1062);
    float _1072 = fma(_1060, _884, _1066);
    float _1074 = fma(_1064, _884, _1068);
    float _1076 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].x, _1070);
    float _1078 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].y, _1072);
    float _1080 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].z, _1074);
    float _1082 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1086 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = in.m_53.x;
    float _1094 = in.m_53.y;
    float _1096 = in.m_53.z;
    float _1098 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1100 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1090;
    out.m_55.y = _1098;
    out.m_55.z = _1100;
    out.m_55.w = _1084;
    float _1102 = _642 * _1096;
    float _1104 = _640 * _1094;
    float _1106 = _638 * _1092;
    bool _1108 = !_752;
    float _1110 = _1094;
    int _1112 = as_type<int>(_1100);
    float _1128;
    if (!_1108)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1116 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1120 = _1118 * _1114;
        float _1122 = floor(_1120);
        float _1124 = -_1122;
        float _1126 = _1120 + _1124;
        _1128 = _1126;
        _1110 = _1114;
        _1130 = true;
    }
    else
    {
        float _1132 = float(_98);
        float _1134 = 1.0 / _1132;
        float _1136 = _132 * _1134;
        _1128 = _1136;
    }
    _1130 = false;
    float _1138 = _1128;
    float _1140 = _1110;
    float _1142 = in.m_57.x;
    float _1144 = _154 * 2.0;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    float _1154 = in.m_51.z;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1158 = _1156 != 0;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1160;
    float _1164 = in.m_51.w;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1168 = _1138 + _1166;
    float _1170 = floor(_1144);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1174 = _1138 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1186 = _1138 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1190 = _1138 + _1188;
    float _1192 = _1140;
    if (_1152)
    {
        bool _1194 = _154 > 0.5;
        _370 = _1194;
    }
    bool _1196 = _370;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1200 = _1138 + _1198;
    float _1202 = 1.0 / _1162;
    float _1204 = in.m_57.y;
    float _1206 = _1148 * _132;
    if (_1152)
    {
        float _1208 = -_1142;
        float _1210 = _1208 + 1.0;
        _646 = as_type<int>(_1210);
    }
    int _1212 = _646;
    float _1214 = as_type<float>(_1212);
    if (!_1152)
    {
        _1192 = _1142;
    }
    float _1216 = _1192;
    float _1218 = _1216;
    if (_1158)
    {
        float _1220 = -_1142;
        float _1222 = _1220 + 1.0;
        _1112 = as_type<int>(_1222);
    }
    int _1224 = _1112;
    float _1226 = 1.0 / _1178;
    float _1228 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_1152)
    {
        float _1230 = _1196 ? as_type<float>(_1212) : _1142;
        _1218 = _1230;
    }
    float _1232 = _1218;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1236 = _1234 != 0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1244 = _1242 != 0;
    bool _1246 = _1196;
    if (_1158)
    {
        bool _1248 = _1154 > 0.5;
        _1246 = _1248;
    }
    bool _1250 = _1246;
    if (!_1158)
    {
        _1214 = _1142;
    }
    float _1252 = _1214;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1258 = _1252;
    if (_1158)
    {
        float _1260 = _1250 ? as_type<float>(_1224) : _1142;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1266 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1270 = _1268 != 0;
    float _1272 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1228);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1276 = _1274 != 0;
    float _1278 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1264);
    float _1280 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1266);
    bool _1282 = _1164 > 0.5;
    float _1284 = in.m_51.y;
    float _1286 = 1.0 / _1182;
    float _1288 = -_1204;
    float _1290 = _1288 + 1.0;
    float _1292 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1280);
    float _1294 = _1174 * _1226;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1300 = _1170 > 0.0;
    float _1302 = 1.0 / _1256;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1304;
    float _1308 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1278);
    int _1310 = _1282 ? as_type<int>(_1290) : as_type<int>(_1204);
    float _1312 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1272);
    bool _1314 = _1170 >= 0.0;
    bool _1316 = isnan(_1170);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1326 = _1138 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1330 = _1138 + _1328;
    float _1332 = 1.0 / _1298;
    float _1334 = _1168 * _1286;
    float _1336 = _1326 * _1202;
    float _1338 = _1308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1340;
    float _1344 = _1284 * 2.0;
    float _1346 = 1.0 / _1306;
    float _1348 = _1284 + _1154;
    float _1350 = _1330 * _1302;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1352;
    float _1356 = _1348 + (-1.0);
    float _1358 = _1312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1360 = 1.0 / _1342;
    float _1362 = _1186 * _1332;
    float _1364 = fma(_1354, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1366 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1368 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1370 = isnan(_1138);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = _1292 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1382 = exp2(_1206);
    float _1384 = _1270 ? as_type<float>(_1310) : _1204;
    float _1386 = _1190 * _1346;
    bool _1388 = _1284 > 0.5;
    float _1390 = _154 + _1284;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1400 = _1204;
    float _1402 = _1380;
    if (_1276)
    {
        float _1404 = _1388 ? _1290 : _1204;
        _1400 = _1404;
    }
    float _1406 = _1400;
    float _1408 = floor(_1344);
    bool _1410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(1.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1422 = 1.0 + _1420;
    float _1424 = _1200 * _1360;
    float _1426 = _1390 + (-1.0);
    float _1428 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = 1.0 / _1422;
    float _1432 = _1154 * 2.0;
    float _1434 = -_1382;
    float _1436 = _1434 + 1.0;
    bool _1438 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(0.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    float _1448 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1450 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1452 = _1322 ? 0 : 1;
    float _1454 = _1284 + (-0.5);
    float _1456 = floor(_1432);
    float _1458 = _1446 ? _1436 : 0.0;
    int _1460 = ~_1452;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    int _1466 = _1464;
    if (_1418)
    {
        float _1468 = _1458 * _1430;
        _134 = _1468;
    }
    float _1470 = _134;
    if (!_1300)
    {
        int _1472 = ~_1452;
        int _1474 = _1472 + 1;
        _1466 = _1474;
    }
    int _1476 = _1466;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1494 = _1408 > 0.0;
    float _1496 = fma(_1484, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1498 = _1456 > 0.0;
    float _1500 = fma(_1488, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1502 = _1456 >= 0.0;
    bool _1504 = isnan(_1456);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_1492, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1514;
    bool _1518 = _1408 >= 0.0;
    bool _1520 = isnan(_1408);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1544;
    float _1548 = fma(_1516, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1550 = fma(_1538, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1552 = fma(_1480, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1554 = fma(_1546, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1556 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1558 = isnan(_1138);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1572 = fma(_1542, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1574 = fma(_1530, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1576 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1578 = isnan(_1138);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -_1566;
    float _1590 = _1588 + 1.0;
    float _1592 = fma(_1534, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1594;
    float _1598 = fma(_1570, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1600;
    bool _1604 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1606 = isnan(_1138);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1586 * _1590;
    float _1618 = -_1586;
    float _1620 = _1618 + 1.0;
    float _1622 = fma(_1596, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1624 = fma(_1602, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1626 = fma(_1394, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _1628 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1630 = isnan(_1138);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = _1614 * _1620;
    float _1642 = -_1614;
    float _1644 = _1642 + 1.0;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1652 = _1650 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1654 = -_1638;
    float _1656 = _1654 + 1.0;
    float _1658 = _1638 * _1644;
    float _1660 = fma(_1648, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1662 = fma(_1652, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1664 = fma(_1398, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _1666 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1668 = isnan(_1138);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1674 = _1670 || _1672;
    float _1676 = float(_1674);
    float _1678 = -_1378;
    float _1680 = _1678 + 1.0;
    float _1682 = _1378 * _1656;
    bool _1684 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1686 = isnan(_1138);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1698 = _1676 * _1680;
    float _1700 = -_1676;
    float _1702 = _1700 + 1.0;
    bool _1704 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1706 = isnan(_1138);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    float _1716 = _1694 * _1702;
    float _1718 = -_1694;
    float _1720 = _1718 + 1.0;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1722;
    float _1726 = _1714 * _1720;
    float _1728 = -_1714;
    float _1730 = _1728 + 1.0;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1732;
    float _1736 = fma(_1724, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1738 = _1552 * _1726;
    float _1740 = _1364 * _1726;
    float _1742 = _1574 * _1726;
    bool _1744 = !_1240;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1750 = fma(_1734, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1738);
    int _1754 = abs(_1746);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1740);
    float _1758 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1742);
    float _1760 = fma(_1496, _1716, _1752);
    float _1762 = fma(_1500, _1716, _1756);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1766 = float(_1476);
    float _1768 = fma(_1512, _1716, _1758);
    float _1770 = fma(_1550, _1698, _1760);
    float _1772 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1774 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1776 = float(_1754);
    float _1778 = _1428 * _1748;
    bool _1780 = !_1244;
    int _1782 = _1780 ? 0 : 1;
    float _1784 = in.m_59.x;
    float _1786 = in.m_59.y;
    float _1788 = in.m_59.z;
    float _1790 = _1774 * _1696;
    float _1792 = _1776 * _1766;
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1796 = fma(_1548, _1698, _1762);
    bool _1798 = !_1236;
    int _1800 = _1798 ? 0 : 1;
    float _1802 = fma(_1554, _1698, _1768);
    float _1804 = _1772 * _1764;
    float _1806 = fma(_1572, _1682, _1770);
    int _1808 = abs(_1800);
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1812 = _1338 + _1810;
    int _1814 = abs(_1782);
    float _1816 = fma(_1592, _1682, _1796);
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1820 = _1358 + _1818;
    float _1822 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1824 = _1792 * (-2.0);
    float _1826 = fma(_1598, _1682, _1802);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1828;
    float _1832 = _1366 * _1794;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1836 = _1380 + _1834;
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1822);
    float _1840 = fma(_1622, _1658, _1806);
    float _1842 = fma(_1624, _1658, _1816);
    float _1844 = fma(_1824, _1786, _1786);
    float _1846 = fma(_1626, _1658, _1826);
    float _1848 = fma(_1830, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    int _1850 = _1510 ? 0 : 1;
    out.m_61.x = _1790;
    out.m_61.y = _1804;
    out.m_61.z = _1832;
    out.m_61.w = _1778;
    float _1852 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1838);
    float _1854 = fma(_1660, _1640, _1840);
    float _1856 = fma(_1662, _1640, _1842);
    float _1858 = fma(_1664, _1640, _1846);
    int _1860 = ~_1850;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = fma(_1736, _1616, _1854);
    int _1868 = _1864;
    float _1870 = _1832;
    float _1872 = _1736;
    float _1874 = _1750;
    if (!_1498)
    {
        int _1876 = ~_1850;
        int _1878 = _1876 + 1;
        _1868 = _1878;
    }
    int _1880 = _1868;
    float _1882 = fma(_1750, _1616, _1856);
    float _1884 = fma(_1848, _1616, _1858);
    bool _1886 = _1852 >= 0.0;
    float _1888 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1866);
    float _1890 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1882);
    float _1892 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1884);
    float _1894 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1844);
    float _1896 = _1812 * _1812;
    float _1898 = float(_1808);
    float _1900 = fma(_1450, _1824, _1450);
    float _1902 = float(_1880);
    float _1904 = fma(_1820, _1820, _1896);
    int _1906 = _1526 ? 0 : 1;
    float _1908 = _1888 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1910 = fma(_1836, _1836, _1904);
    float _1912 = _1898 * _1902;
    if (_1886)
    {
        _1870 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1914 = _1870;
    float _1916 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1918 = ~_1906;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1912 * (-2.0);
    float _1926 = rsqrt(_1910);
    float _1928 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1930 = _1922;
    int _1932 = as_type<int>(_1914);
    if (!_1494)
    {
        int _1934 = ~_1906;
        int _1936 = _1934 + 1;
        _1930 = _1936;
    }
    int _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1886)
    {
        float _1942 = _1914 * 5.0;
        _1932 = as_type<int>(_1942);
    }
    int _1944 = _1932;
    float _1946 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = float(_1814);
    if (_1886)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6032 = as_type<float>(_1944);
        out.gl_Position.z = _6032;
    }
    float _1954 = float(_1938);
    float _1956 = fma(_1448, _1924, _1448);
    float _1958 = fma(_1924, _1784, _1784);
    out.m_63.x = _1946;
    out.m_63.y = _1948;
    out.m_63.z = _1950;
    out.m_63.w = _1940;
    float _1960 = fma(_1900, _1470, _1894);
    float _1962 = _1952 * _1954;
    float _1964 = _154 + (-0.5);
    if (_1886)
    {
        out.m_47.x = 0.0;
    }
    float _1966 = _1812 * _1926;
    float _1968 = _1820 * _1926;
    if (_1886)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1970 = -_1966;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1338);
    float _1974 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1958);
    float _1976 = -_1968;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1358);
    float _1980 = _1836 * _1926;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1972 + _1982;
    float _1986 = fma(_1956, _1470, _1974);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1978 + _1988;
    float _1992 = _154 + _1154;
    float _1994 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1996 = -_1980;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1380);
    float _2000 = _1992 + (-1.0);
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1994);
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2006 = _1998 + _2004;
    float _2008 = _1962 * (-2.0);
    float _2010 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2012 = -_1966;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1812);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2002);
    float _2018 = fma(_2008, _1788, _1788);
    float _2020 = _1154 + (-0.5);
    float _2022 = fma(_2010, _2008, _2010);
    float _2024 = -_1968;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1820);
    bool _2028 = _2016 >= 0.0;
    float _2030 = _2014 * _2014;
    float _2032 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2018);
    float _2034 = -_1980;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1836);
    float _2038 = _1960 * 0.15915493667125701904296875;
    float _2040 = fma(_2026, _2026, _2030);
    float _2042 = fma(_2022, _1470, _2032);
    float _2044 = _1986 * 0.15915493667125701904296875;
    float _2046 = _2038 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    float _2050 = fma(_2036, _2036, _2040);
    float _2052 = _2042 * 0.15915493667125701904296875;
    float _2054 = _2018;
    float _2056 = _2014;
    if (_2028)
    {
        _2054 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2058 = _2054;
    int _2060 = as_type<int>(_2058);
    if (_2028)
    {
        out.m_47.x = 0.0;
    }
    float _2062 = _2038 * 6.283185482025146484375;
    float _2064 = cos(_2062);
    if (_2028)
    {
        float _2066 = _2058 * 5.0;
        _2060 = as_type<int>(_2066);
    }
    int _2068 = _2060;
    if (_2028)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6248 = as_type<float>(_2068);
        out.gl_Position.z = _6248;
    }
    float _2070 = _2044 * 6.283185482025146484375;
    float _2072 = sin(_2070);
    float _2074 = _2044 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _2052 * 6.283185482025146484375;
    float _2080 = sin(_2078);
    float _2082 = sqrt(_2050);
    if (_2028)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2084 = in.m_65.x;
    float _2086 = in.m_65.y;
    float _2088 = in.m_65.z;
    float _2090 = _2052 * 6.283185482025146484375;
    float _2092 = cos(_2090);
    float _2094 = _1926 * _2082;
    float _2096 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2098 = _2072 * _2048;
    float _2100 = _2076 * _2064;
    float _2102 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2104 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2106 = _2094 * _2096;
    float _2108 = _2072 * _2064;
    float _2110 = fma(_2080, _2100, _2098);
    float _2112 = fma(_2080, _2098, _2100);
    float _2114 = _2076 * _2048;
    float _2116 = _2094 * _2102;
    float _2118 = _2094 * _2104;
    float _2120 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2122 = _2064 * _2092;
    float _2124 = _2048 * _2092;
    float _2126 = _2076 * _2092;
    float _2128 = _2072 * _2092;
    float _2130 = -_2114;
    float _2132 = fma(_2080, _2108, _2130);
    float _2134 = -_2108;
    float _2136 = fma(_2080, _2114, _2134);
    float _2138 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2086);
    float _2142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2084);
    float _2144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2088);
    float _2146 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2148 = _2106 * _2140;
    float _2150 = _2118 * _2142;
    float _2152 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2154 = _2116 * _2144;
    float _2156 = _2126 * _2148;
    float _2158 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2160 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2162 = -_2148;
    float _2164 = _2080 * _2162;
    float _2166 = fma(_2110, _2150, _2156);
    float _2168 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2170 = -_2080;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2152);
    float _2174 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2158);
    float _2176 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2120);
    float _2178 = _2128 * _2148;
    float _2180 = fma(_2122, _2150, _2164);
    float _2182 = fma(_2136, _2154, _2166);
    float _2184 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2160);
    float _2186 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    float _2190 = -_2080;
    float _2192 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2146);
    float _2194 = -_2080;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2168);
    float _2198 = fma(_2132, _2150, _2178);
    float _2200 = fma(_2124, _2154, _2180);
    float _2202 = in.m_67.x;
    float _2204 = in.m_67.y;
    float _2206 = in.m_67.z;
    float _2208 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2210 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2212 = _2086 != 0.0;
    bool _2214 = isnan(_2086);
    bool _2216 = _2212 || _2214;
    bool _2218 = isnan(0.0);
    bool _2220 = _2216 || _2218;
    float _2222 = fma(_2112, _2154, _2198);
    float _2224 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2208);
    float _2226 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2210);
    bool _2228 = _2084 == 0.0;
    bool _2230 = !_2220;
    bool _2232 = _2228 && _2230;
    float _2234 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2224);
    float _2238 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2226);
    bool _2240 = _2088 == 0.0;
    bool _2242 = _2240 && _2232;
    float _2244 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2234);
    float _2246 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2248 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2250 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = _1358 + _2246;
    float _2256 = _1380 + _2248;
    float _2258 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2192);
    float _2260 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2264 = _2254 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2268 = _2256 + _2266;
    float _2270 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2272 = _2202;
    float _2274 = _2172;
    float _2276 = _2254;
    float _2278 = _2256;
    if (_2242)
    {
        _1872 = _2202;
    }
    float _2280 = _1872;
    float _2282 = in.m_69.x;
    float _2284 = in.m_69.y;
    float _2286 = in.m_69.z;
    float _2288 = in.m_69.w;
    float _2290 = _2264 * _2264;
    float _2292 = _2268 * _2268;
    float _2294 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2172);
    float _2296 = _2280;
    float _2298 = _2290;
    float _2300 = _2292;
    if (_2242)
    {
        _1874 = _2206;
    }
    float _2302 = _1874;
    float _2304 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2196);
    float _2306 = _2302;
    if (_2242)
    {
        _1402 = _2280;
    }
    float _2308 = _1402;
    float _2310 = _2290 + _2292;
    float _2312 = _2308;
    if (!_2242)
    {
        _2296 = _2202;
    }
    float _2314 = _2296;
    float _2316 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_2242)
    {
        _2272 = _2302;
    }
    float _2318 = _2272;
    float _2320 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2260);
    float _2322 = _2318;
    if (!_2242)
    {
        _2306 = _2206;
    }
    float _2324 = _2306;
    float _2326 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2316);
    float _2328 = sqrt(_2310);
    if (_2242)
    {
        _2056 = _2204;
    }
    float _2330 = _2056;
    float _2332 = _2330;
    if (!_2242)
    {
        float _2334 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2312 = _2334;
    }
    float _2336 = _2312;
    float _2338 = _2336;
    if (!_2242)
    {
        float _2340 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2324);
        _2322 = _2340;
    }
    float _2342 = _2322;
    float _2344 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    if (_2242)
    {
        _2274 = _2330;
    }
    float _2346 = _2274;
    float _2348 = _2346;
    if (!_2242)
    {
        _2332 = _2204;
    }
    float _2350 = _2332;
    float _2352 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2244);
    float _2354 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2356 = _2294 * _2284;
    float _2358 = _2258 * _2284;
    float _2360 = _2288;
    float _2362 = _2354;
    if (!_2242)
    {
        float _2364 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2350);
        _2348 = _2364;
    }
    float _2366 = _2348;
    float _2368 = _2286 * _2314;
    float _2370 = fma(_2184, _2282, _2356);
    float _2372 = _2282 * _2350;
    bool _2374 = _2328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2376 = _2284 * _2324;
    float _2378 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2380 = _2304 * _2284;
    float _2382 = fma(_2186, _2282, _2358);
    float _2384 = -_2372;
    float _2386 = fma(_2284, _2314, _2384);
    float _2388 = -_2368;
    float _2390 = fma(_2282, _2324, _2388);
    float _2392 = -_2376;
    float _2394 = fma(_2286, _2350, _2392);
    float _2396 = _1338 + _2378;
    float _2398 = fma(_2188, _2282, _2380);
    float _2400 = fma(_2320, _2286, _2370);
    float _2402 = fma(_2352, _2286, _2382);
    float _2404 = _2390 * _2288;
    float _2406 = _2394 * _2288;
    float _2408 = _2386 * _2288;
    float _2410 = fma(_2354, _2286, _2398);
    if (!_2374)
    {
        _2360 = _2396;
    }
    float _2412 = _2360;
    bool _2414 = !_2374;
    float _2416 = _2412;
    if (!_2414)
    {
        float _2418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2422 = _2328 + _2420;
        float _2424 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = rsqrt(_2310);
        float _2428 = _2422 * _2418;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2430 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = _2430 * 6.283185482025146484375;
        float _2438 = cos(_2436);
        float _2440 = fma(_2434, _2424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2442 = _2426 * _2440;
        float _2444 = fma(_2264, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2446 = _2438 + (-1.0);
        float _2448 = fma(_2268, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2452 = _2444 + _2450;
        float _2454 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _2448 + _2456;
        float _2460 = _2452 * _2452;
        float _2462 = fma(_2396, _2438, _2454);
        float _2464 = _2458 * _2458;
        _2416 = _2462;
        _2298 = _2460;
        _2300 = _2464;
        _2276 = _2444;
        _2278 = _2448;
    }
    float _2466 = _2416;
    float _2468 = _2298;
    float _2470 = _2300;
    float _2472 = _2276;
    float _2474 = _2278;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2478 = _2466 + _2476;
    float _2480 = _2294 * _2366;
    float _2482 = _2258 * _2366;
    float _2484 = _2304 * _2366;
    float _2486 = fma(_2478, _2478, _2468);
    float _2488 = _2404 * _2294;
    float _2490 = _2404 * _2258;
    float _2492 = _2404 * _2304;
    float _2494 = _2486 + _2470;
    float _2496 = fma(_2184, _2336, _2480);
    float _2498 = fma(_2186, _2336, _2482);
    float _2500 = fma(_2188, _2336, _2484);
    float _2502 = fma(_2406, _2184, _2488);
    float _2504 = fma(_2406, _2186, _2490);
    float _2506 = sqrt(_2494);
    float _2508 = fma(_2406, _2188, _2492);
    float _2510 = fma(_2320, _2342, _2496);
    float _2512 = fma(_2352, _2342, _2498);
    float _2514 = fma(_2354, _2342, _2500);
    float _2516 = fma(_2408, _2320, _2502);
    float _2518 = fma(_2408, _2352, _2504);
    float _2520 = fma(_2408, _2354, _2508);
    out.m_71.x = _2400;
    out.m_71.y = _2402;
    out.m_71.z = _2410;
    out.m_73.x = _2510;
    out.m_73.y = _2512;
    out.m_73.z = _2514;
    out.m_75.x = _2516;
    out.m_75.y = _2518;
    out.m_75.z = _2520;
    bool _2522 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2524 = isnan(_2506);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2530 = _2526 || _2528;
    float _2532 = _2520;
    if (!_2530)
    {
        _2362 = 1.0;
    }
    float _2534 = _2362;
    bool _2536 = !_2530;
    float _2538 = _2534;
    if (!_2536)
    {
        bool _2540 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2542 = isnan(_2506);
        bool _2544 = _2540 || _2542;
        bool _2546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2548 = _2544 || _2546;
        if (!_2548)
        {
            float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2552 = _2506 + _2550;
            float _2554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2556 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2554;
            float _2558 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2562 = 1.0 / _2556;
            float _2564 = _2552 * _2562;
            float _2566 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2538 = _2566;
            _2568 = true;
        }
        else
        {
            bool _2570 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2572 = isnan(_2506);
            bool _2574 = _2570 || _2572;
            bool _2576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2578 = _2574 || _2576;
            if (!_2578)
            {
                float _2580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2582 = _2506 + _2580;
                float _2584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2586 = _2584 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2588 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2590 = _2588 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2592 = 1.0 / _2586;
                float _2594 = _2582 * _2592;
                float _2596 = fma(_2594, _2590, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2538 = _2596;
                _2568 = true;
            }
            else
            {
                _2538 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2568 = false;
    float _2598 = _2538;
    float _2600 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2602 = _2466 + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2606 = _2472 + _2604;
    float _2608 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2610 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2612 = _2474 + _2610;
    float _2614 = fma(_2606, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2616 = -_1966;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2608);
    float _2620 = fma(_2612, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2622 = -_1968;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2614);
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2628 = _2618 + _2626;
    float _2630 = -_1980;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2620);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2624 + _2634;
    float _2638 = _2628 * _2628;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2642 = _2632 + _2640;
    float _2644 = fma(_2636, _2636, _2638);
    float _2646 = fma(_2642, _2642, _2644);
    float _2648 = rsqrt(_2646);
    float _2650 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2652 = _2636 * _2650;
    float _2654 = _2642 * _2650;
    float _2656 = _2652 * _2652;
    float _2658 = _2654 * _2654;
    float _2660 = _2656 + _2658;
    float _2662 = sqrt(_2660);
    bool _2664 = _2662 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2668 = _2662 + _2666;
    float _2670 = _2644;
    float _2672 = _2668;
    float _2674 = _2628;
    float _2676 = _2652;
    float _2678 = _2650;
    if (_2664)
    {
        float _2680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2680;
    }
    float _2682 = _2670;
    float _2684 = _2682;
    if (_2664)
    {
        float _2686 = _2668 * _2682;
        _2672 = _2686;
    }
    float _2688 = _2672;
    if (_2664)
    {
        float _2690 = rsqrt(_2660);
        _2684 = _2690;
    }
    float _2692 = _2684;
    float _2694 = _2692;
    if (_2664)
    {
        float _2696 = _2688 * 0.15915493667125701904296875;
        _2532 = _2696;
    }
    float _2698 = _2532;
    float _2700 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2702 = _2648;
    if (_2664)
    {
        float _2704 = _2698 * 6.283185482025146484375;
        float _2706 = sin(_2704);
        _2702 = _2706;
    }
    float _2708 = _2702;
    float _2710 = precise::max(0.0, _2700);
    float _2712 = _2642;
    float _2714 = _2710;
    if (_2664)
    {
        float _2716 = _2698 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        _2712 = _2718;
    }
    float _2720 = _2712;
    float _2722 = -_2650;
    float _2724 = -_2710;
    float _2726 = fma(_2628, _2722, _2724);
    float _2728 = _2726;
    if (_2664)
    {
        float _2730 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2674 = _2730;
    }
    float _2732 = _2674;
    float _2734 = _2708;
    float _2736 = _2732;
    if (_2664)
    {
        float _2738 = fma(_2708, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2734 = _2738;
    }
    float _2740 = _2734;
    if (!_2664)
    {
        _2736 = _2656;
    }
    float _2742 = _2736;
    float _2744 = _2742;
    if (_2664)
    {
        float _2746 = _2692 * _2740;
        _2338 = _2746;
    }
    float _2748 = _2338;
    if (!_2664)
    {
        _2694 = _2654;
    }
    float _2750 = _2694;
    float _2752 = sqrt(_2646);
    float _2754 = _2750;
    if (_2664)
    {
        float _2756 = _2720 + (-1.0);
        _2714 = _2756;
    }
    float _2758 = _2714;
    float _2760 = _2758;
    if (_2664)
    {
        float _2762 = _2652 * _2748;
        _2676 = _2762;
    }
    float _2764 = _2676;
    if (_2664)
    {
        float _2766 = _2654 * _2748;
        _2754 = _2766;
    }
    float _2768 = _2754;
    if (_2664)
    {
        float _2770 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2678 = _2770;
    }
    float _2772 = _2678;
    if (_2664)
    {
        float _2774 = _2764 * _2764;
        _2744 = _2774;
    }
    float _2776 = _2744;
    if (!_2664)
    {
        _2760 = _2658;
    }
    float _2778 = _2760;
    float _2780 = _2778;
    if (_2664)
    {
        float _2782 = _2768 * _2768;
        _2780 = _2782;
    }
    float _2784 = _2780;
    if (_2664)
    {
        float _2786 = fma(_2726, _2720, _2772);
        _2728 = _2786;
    }
    float _2788 = _2728;
    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2792 = fma(_2788, _2788, _2776);
    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2796 = fma(_2752, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2794);
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = _2792 + _2784;
    float _2802 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2804 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2806 = -_2798;
    float _2808 = _2806 + 1.0;
    float _2810 = rsqrt(_2800);
    float _2812 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2802);
    float _2814 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2816 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2804);
    float _2818 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2820 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2812);
    float _2822 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2814);
    float _2824 = abs(_2808);
    float _2826 = log2(_2824);
    float _2828 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2830 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2822);
    float _2832 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2816);
    float _2834 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2818);
    float _2836 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2838 = _2830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2840 = _2832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2842 = _2810 * _2764;
    float _2844 = _2810 * _2788;
    float _2846 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2848 = -_2836;
    float _2850 = fma(_2848, _2790, 1.0);
    float _2852 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2854 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2834);
    float _2856 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2846);
    float _2858 = _2810 * _2768;
    float _2860 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2862 = -_2852;
    float _2864 = fma(_2844, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2862);
    float _2866 = _2854 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2868 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2856);
    float _2870 = log2(_2850);
    float _2872 = -_2858;
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2864);
    float _2876 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2878 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2868);
    float _2880 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2882 = fma(_2874, -0.5, 0.5);
    float _2884 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2876);
    float _2886 = fma(_2874, 0.5, 0.5);
    float _2888 = exp2(_2860);
    float _2890 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2880);
    float _2892 = _2844 + 1.0;
    float _2894 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2884);
    float _2896 = fma(_2886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2898 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2890);
    float _2900 = 1.0 / _2878;
    float _2902 = fma(_2886, _2896, -0.212114393711090087890625);
    float _2904 = _2870 * 0.693147182464599609375;
    float _2906 = fma(_2886, _2902, 1.570728778839111328125);
    float _2908 = sqrt(_2882);
    float _2910 = -_2844;
    float _2912 = fma(_2888, _2892, _2910);
    float _2914 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2894);
    float _2916 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2898);
    float _2918 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2920 = fma(_2912, 0.5, 0.5);
    float _2922 = _2914 * _2900;
    float _2924 = _2916 * _2900;
    float _2926 = fma(_2922, 0.5, 0.5);
    float _2928 = fma(_2924, -0.5, 0.5);
    float _2930 = _2908 * 0.636619746685028076171875;
    float3 _7714 = float3(_2926, _2928, _2918);
    float _2932 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7714, float3(0.0), isnan(_7714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7714, float3(0.0), isnan(_7714)), level(0.0)).x;
    float _2934 = -_2906;
    float _2936 = fma(_2930, _2934, 1.0);
    float3 _7730 = float3(_2926, _2928, _2918);
    float4 _2939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7730, float3(0.0), isnan(_7730)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7730, float3(0.0), isnan(_7730)), level(0.0)).xyzw;
    float _2941 = _2939.x;
    float _2943 = _2939.y;
    float _2945 = _2939.z;
    float _2947 = _2939.w;
    float2 _7747 = float2(_2936, _2920);
    float3 _2951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7747, float2(0.0), isnan(_7747)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7747, float2(0.0), isnan(_7747)), level(0.0)).xyz;
    float _2953 = _2951.x;
    float _2955 = _2951.y;
    float _2957 = _2951.z;
    float _2959 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2961 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2963 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2965 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2961);
    float _2967 = exp2(_2959);
    float _2969 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2965);
    float _2971 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2969);
    float _2973 = _2971 + _2878;
    out.gl_Position.x = _2914;
    out.gl_Position.y = _2916;
    out.gl_Position.z = _2971;
    out.gl_Position.w = _2878;
    float _2975 = _2973 * 0.5;
    float _2977 = -_2967;
    float _2979 = _2977 + 1.0;
    float _2981 = _2963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2983 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2975;
    out.m_77.w = _2878;
    out.m_47.x = _2981;
    float _2985 = _2983 * _2932;
    float _2987 = -_2983;
    float _2989 = _2987 + 1.0;
    float _2991 = _2947 * _2985;
    float _2993 = _2957 * _2985;
    float _2995 = fma(_2953, _2991, _2941);
    float _2997 = fma(_2955, _2991, _2943);
    float _2999 = _2947 * _2989;
    float _3001 = fma(_2947, _2993, _2945);
    out.m_79.x = _2995;
    out.m_79.y = _2997;
    out.m_79.z = _3001;
    out.m_79.w = _2999;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2568 = false;
    bool _1130 = false;
    bool _664 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_114);
        out.gl_Position.z = _3058;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3128 = as_type<float>(_152);
        out.gl_Position.z = _3128;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = _158 * _156;
    float _174 = 0.0;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _184 = _180;
    if (!_170)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _182 * 6.283185482025146484375;
    float _198 = floor(_182);
    float _200 = _196 * 0.15915493667125701904296875;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _200 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = 1.4012984643248170709237295832899e-45;
    float _212 = _188;
    if (!_170)
    {
        _210 = _160;
    }
    float _214 = _210;
    float _216 = -_198;
    float _218 = _182 + _216;
    bool _220 = !_170;
    float _222 = _214;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _160 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _160);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _252;
    }
    float _254 = _212;
    bool _256 = !_170;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _160 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _222 = _276;
    }
    float _278 = _222;
    float _280 = in.m_53.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _294 = _292 != 0;
    float _296 = -_218;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _300 = _218 < 0.5;
    float _302 = float(_300);
    float _304 = fma(_208, 0.5, 0.5);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_290;
    int _310 = _308 ? 0 : 1;
    bool _312 = !_204;
    int _314 = _312 ? 0 : 1;
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = -_304;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _324 = abs(_310);
    float _326 = fma(_278, _190, _306);
    int _328 = abs(_314);
    float _330 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = !_294;
    int _334 = _332 ? 0 : 1;
    float _336 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _192, _330);
    int _342 = abs(_334);
    float _344 = fma(_278, _194, _336);
    float _346 = float(_324);
    float _348 = float(_328);
    float _350 = fma(_326, _280, _282);
    float _352 = abs(_298);
    float _354 = _346 * _352;
    float _356 = fma(_340, _280, _284);
    float _358 = fma(_344, _280, _286);
    float _360 = float(_342);
    float _362 = fma(_348, _322, _354);
    float _364 = abs(_318);
    float _366 = fma(_360, _364, _362);
    bool _368 = !_338;
    bool _370 = _290;
    float _386;
    if (!_368)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_98);
        float _392 = 1.0 / _390;
        float _394 = _132 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _396 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _412;
    float _428 = 1.0 / _416;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _436 = 1.0 / _420;
    float _438 = _404 * _426;
    bool _440 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _442 = isnan(_396);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = 1.0 / _424;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _396 + _458;
    float _462 = _400 * _436;
    float _464 = _460 * _428;
    bool _466 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _468 = isnan(_396);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _480 = isnan(_396);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = fma(_432, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _492 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_396);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_476;
    float _506 = _504 + 1.0;
    float _508 = _408 * _456;
    float _510 = -_488;
    float _512 = _510 + 1.0;
    bool _514 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _516 = isnan(_396);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _502 * _506;
    float _528 = -_502;
    float _530 = _528 + 1.0;
    float _532 = _450 * _512;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _534;
    float _538 = -_450;
    float _540 = _538 + 1.0;
    float _542 = _488 * _530;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _548 = fma(_536, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = _524 * _540;
    float _560 = fma(_454, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _562 = fma(_546, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _564 = fma(_552, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _566 = fma(_556, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _568 = _548 * _558;
    float _570 = _490 * _558;
    float _572 = -_524;
    float _574 = _572 + 1.0;
    float _576 = _560 * _558;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _578;
    float _582 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _568);
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _570);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    float _596 = fma(_580, _438, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_562, _532, _582);
    float _600 = fma(_564, _532, _584);
    float _602 = fma(_566, _532, _586);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _612 = fma(_590, _438, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _614 = fma(_594, _438, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _620 = fma(_596, _542, _598);
    float _622 = fma(_606, _464, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _624 = fma(_610, _464, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _626 = fma(_618, _464, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_612, _542, _600);
    float _630 = fma(_614, _542, _602);
    float _632 = fma(_622, _526, _620);
    float _634 = fma(_624, _526, _628);
    float _636 = fma(_626, _526, _630);
    float _638 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].x, _632);
    float _640 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].y, _634);
    float _642 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].z, _636);
    bool _644 = !_434;
    int _646 = as_type<int>(_640);
    float _662;
    if (!_644)
    {
        float _648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _650 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _654 = _652 * _648;
        float _656 = floor(_654);
        float _658 = -_656;
        float _660 = _654 + _658;
        _662 = _660;
        _664 = true;
    }
    else
    {
        float _666 = float(_98);
        float _668 = 1.0 / _666;
        float _670 = _132 * _668;
        _662 = _670;
    }
    _664 = false;
    float _672 = _662;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _680 = _672 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _698 = 1.0 / _684;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _708 = 1.0 / _688;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _718;
    bool _722 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_672);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = 1.0 / _692;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[114].w + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _742 = _672 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _744;
    float _748 = -_732;
    float _750 = _748 + 1.0;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _754 = _742 * _698;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _758 = _672 + _756;
    float _760 = 1.0 / _702;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _764 = _672 + _762;
    float _766 = fma(_712, _754, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = _758 * _708;
    bool _770 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[114].w;
    bool _772 = isnan(_672);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[114].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    bool _782 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _784 = isnan(_672);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = fma(_716, _768, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = 1.0 / _738;
    float _798 = _676 * _734;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _802 = _672 + _800;
    float _804 = fma(_720, _798, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _806 = 1.0 / _706;
    float _808 = _764 * _760;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _812 = _672 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _822 = 1.0 / _696;
    float _824 = _812 * _796;
    float _826 = -_780;
    float _828 = _826 + 1.0;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _830;
    float _834 = fma(_816, _754, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _840 = fma(_820, _768, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _842 = fma(_832, _754, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _844 = _802 * _806;
    bool _846 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _848 = isnan(_672);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = fma(_838, _768, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _860 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _862 = isnan(_672);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    bool _872 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _874 = isnan(_672);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _856 * _828;
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = _680 * _822;
    bool _892 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _894 = isnan(_672);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_870;
    float _906 = _904 + 1.0;
    float _908 = _870 * _888;
    float _910 = -_882;
    float _912 = _910 + 1.0;
    float _914 = _902 * _906;
    float _916 = -_902;
    float _918 = _916 + 1.0;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _920;
    float _924 = _792 * _918;
    float _926 = -_792;
    float _928 = _926 + 1.0;
    float _930 = _882 * _928;
    float _932 = fma(_922, _798, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _934 = fma(_746, _798, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    bool _936 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _938 = isnan(_672);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _732 * _912;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _962 = _946 * _750;
    float _964 = fma(_952, _890, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _966 = -_946;
    float _968 = _966 + 1.0;
    float _970 = fma(_956, _890, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _972 = _766 * _962;
    float _974 = _834 * _962;
    float _976 = _842 * _962;
    float _978 = fma(_960, _890, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].x, _972);
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].y, _974);
    float _984 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].z, _976);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _986;
    float _990 = fma(_794, _948, _980);
    float _992 = fma(_840, _948, _982);
    float _994 = fma(_858, _948, _984);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _996;
    float _1000 = fma(_988, _808, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1002 = fma(_932, _930, _990);
    float _1004 = fma(_804, _930, _992);
    float _1006 = fma(_934, _930, _994);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1020;
    float _1024 = fma(_998, _808, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1026 = fma(_964, _924, _1002);
    float _1028 = fma(_970, _924, _1004);
    float _1030 = fma(_978, _924, _1006);
    float _1032 = fma(_1010, _844, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1034 = fma(_1014, _844, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1036 = fma(_1018, _844, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1038 = fma(_1022, _808, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1040 = fma(_1024, _914, _1028);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[114].x + _1042;
    float _1046 = fma(_1000, _914, _1026);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[114].y + _1048;
    float _1052 = fma(_1038, _914, _1030);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[114].z + _1054;
    float _1058 = fma(_1044, _824, (*spvDescriptorSet0.vp_c9)._m0[113].x);
    float _1060 = fma(_1050, _824, (*spvDescriptorSet0.vp_c9)._m0[113].y);
    float _1062 = fma(_1032, _908, _1046);
    float _1064 = fma(_1056, _824, (*spvDescriptorSet0.vp_c9)._m0[113].z);
    float _1066 = fma(_1034, _908, _1040);
    float _1068 = fma(_1036, _908, _1052);
    float _1070 = fma(_1058, _884, _1062);
    float _1072 = fma(_1060, _884, _1066);
    float _1074 = fma(_1064, _884, _1068);
    float _1076 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].x, _1070);
    float _1078 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].y, _1072);
    float _1080 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].z, _1074);
    float _1082 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1086 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = in.m_53.x;
    float _1094 = in.m_53.y;
    float _1096 = in.m_53.z;
    float _1098 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1100 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1090;
    out.m_55.y = _1098;
    out.m_55.z = _1100;
    out.m_55.w = _1084;
    float _1102 = _642 * _1096;
    float _1104 = _640 * _1094;
    float _1106 = _638 * _1092;
    bool _1108 = !_752;
    float _1110 = _1094;
    int _1112 = as_type<int>(_1100);
    float _1128;
    if (!_1108)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1116 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1120 = _1118 * _1114;
        float _1122 = floor(_1120);
        float _1124 = -_1122;
        float _1126 = _1120 + _1124;
        _1128 = _1126;
        _1110 = _1114;
        _1130 = true;
    }
    else
    {
        float _1132 = float(_98);
        float _1134 = 1.0 / _1132;
        float _1136 = _132 * _1134;
        _1128 = _1136;
    }
    _1130 = false;
    float _1138 = _1128;
    float _1140 = _1110;
    float _1142 = in.m_57.x;
    float _1144 = _154 * 2.0;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    float _1154 = in.m_51.z;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1158 = _1156 != 0;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1160;
    float _1164 = in.m_51.w;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1168 = _1138 + _1166;
    float _1170 = floor(_1144);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1174 = _1138 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1186 = _1138 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1190 = _1138 + _1188;
    float _1192 = _1140;
    if (_1152)
    {
        bool _1194 = _154 > 0.5;
        _370 = _1194;
    }
    bool _1196 = _370;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1200 = _1138 + _1198;
    float _1202 = 1.0 / _1162;
    float _1204 = in.m_57.y;
    float _1206 = _1148 * _132;
    if (_1152)
    {
        float _1208 = -_1142;
        float _1210 = _1208 + 1.0;
        _646 = as_type<int>(_1210);
    }
    int _1212 = _646;
    float _1214 = as_type<float>(_1212);
    if (!_1152)
    {
        _1192 = _1142;
    }
    float _1216 = _1192;
    float _1218 = _1216;
    if (_1158)
    {
        float _1220 = -_1142;
        float _1222 = _1220 + 1.0;
        _1112 = as_type<int>(_1222);
    }
    int _1224 = _1112;
    float _1226 = 1.0 / _1178;
    float _1228 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_1152)
    {
        float _1230 = _1196 ? as_type<float>(_1212) : _1142;
        _1218 = _1230;
    }
    float _1232 = _1218;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1236 = _1234 != 0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1244 = _1242 != 0;
    bool _1246 = _1196;
    if (_1158)
    {
        bool _1248 = _1154 > 0.5;
        _1246 = _1248;
    }
    bool _1250 = _1246;
    if (!_1158)
    {
        _1214 = _1142;
    }
    float _1252 = _1214;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1258 = _1252;
    if (_1158)
    {
        float _1260 = _1250 ? as_type<float>(_1224) : _1142;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1266 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1270 = _1268 != 0;
    float _1272 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1228);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1276 = _1274 != 0;
    float _1278 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1264);
    float _1280 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1266);
    bool _1282 = _1164 > 0.5;
    float _1284 = in.m_51.y;
    float _1286 = 1.0 / _1182;
    float _1288 = -_1204;
    float _1290 = _1288 + 1.0;
    float _1292 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1280);
    float _1294 = _1174 * _1226;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1300 = _1170 > 0.0;
    float _1302 = 1.0 / _1256;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1304;
    float _1308 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1278);
    int _1310 = _1282 ? as_type<int>(_1290) : as_type<int>(_1204);
    float _1312 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1272);
    bool _1314 = _1170 >= 0.0;
    bool _1316 = isnan(_1170);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1326 = _1138 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1330 = _1138 + _1328;
    float _1332 = 1.0 / _1298;
    float _1334 = _1168 * _1286;
    float _1336 = _1326 * _1202;
    float _1338 = _1308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1340;
    float _1344 = _1284 * 2.0;
    float _1346 = 1.0 / _1306;
    float _1348 = _1284 + _1154;
    float _1350 = _1330 * _1302;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1352;
    float _1356 = _1348 + (-1.0);
    float _1358 = _1312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1360 = 1.0 / _1342;
    float _1362 = _1186 * _1332;
    float _1364 = fma(_1354, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1366 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1368 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1370 = isnan(_1138);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = _1292 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1382 = exp2(_1206);
    float _1384 = _1270 ? as_type<float>(_1310) : _1204;
    float _1386 = _1190 * _1346;
    bool _1388 = _1284 > 0.5;
    float _1390 = _154 + _1284;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1400 = _1204;
    float _1402 = _1380;
    if (_1276)
    {
        float _1404 = _1388 ? _1290 : _1204;
        _1400 = _1404;
    }
    float _1406 = _1400;
    float _1408 = floor(_1344);
    bool _1410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(1.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1422 = 1.0 + _1420;
    float _1424 = _1200 * _1360;
    float _1426 = _1390 + (-1.0);
    float _1428 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = 1.0 / _1422;
    float _1432 = _1154 * 2.0;
    float _1434 = -_1382;
    float _1436 = _1434 + 1.0;
    bool _1438 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(0.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    float _1448 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1450 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1452 = _1322 ? 0 : 1;
    float _1454 = _1284 + (-0.5);
    float _1456 = floor(_1432);
    float _1458 = _1446 ? _1436 : 0.0;
    int _1460 = ~_1452;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    int _1466 = _1464;
    if (_1418)
    {
        float _1468 = _1458 * _1430;
        _134 = _1468;
    }
    float _1470 = _134;
    if (!_1300)
    {
        int _1472 = ~_1452;
        int _1474 = _1472 + 1;
        _1466 = _1474;
    }
    int _1476 = _1466;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1494 = _1408 > 0.0;
    float _1496 = fma(_1484, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1498 = _1456 > 0.0;
    float _1500 = fma(_1488, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1502 = _1456 >= 0.0;
    bool _1504 = isnan(_1456);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_1492, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1514;
    bool _1518 = _1408 >= 0.0;
    bool _1520 = isnan(_1408);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1544;
    float _1548 = fma(_1516, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1550 = fma(_1538, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1552 = fma(_1480, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1554 = fma(_1546, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1556 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1558 = isnan(_1138);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1572 = fma(_1542, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1574 = fma(_1530, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1576 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1578 = isnan(_1138);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -_1566;
    float _1590 = _1588 + 1.0;
    float _1592 = fma(_1534, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1594;
    float _1598 = fma(_1570, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1600;
    bool _1604 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1606 = isnan(_1138);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1586 * _1590;
    float _1618 = -_1586;
    float _1620 = _1618 + 1.0;
    float _1622 = fma(_1596, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1624 = fma(_1602, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1626 = fma(_1394, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _1628 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1630 = isnan(_1138);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = _1614 * _1620;
    float _1642 = -_1614;
    float _1644 = _1642 + 1.0;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1652 = _1650 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1654 = -_1638;
    float _1656 = _1654 + 1.0;
    float _1658 = _1638 * _1644;
    float _1660 = fma(_1648, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1662 = fma(_1652, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1664 = fma(_1398, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _1666 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1668 = isnan(_1138);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1674 = _1670 || _1672;
    float _1676 = float(_1674);
    float _1678 = -_1378;
    float _1680 = _1678 + 1.0;
    float _1682 = _1378 * _1656;
    bool _1684 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1686 = isnan(_1138);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1698 = _1676 * _1680;
    float _1700 = -_1676;
    float _1702 = _1700 + 1.0;
    bool _1704 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1706 = isnan(_1138);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    float _1716 = _1694 * _1702;
    float _1718 = -_1694;
    float _1720 = _1718 + 1.0;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1722;
    float _1726 = _1714 * _1720;
    float _1728 = -_1714;
    float _1730 = _1728 + 1.0;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1732;
    float _1736 = fma(_1724, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1738 = _1552 * _1726;
    float _1740 = _1364 * _1726;
    float _1742 = _1574 * _1726;
    bool _1744 = !_1240;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1750 = fma(_1734, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1738);
    int _1754 = abs(_1746);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1740);
    float _1758 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1742);
    float _1760 = fma(_1496, _1716, _1752);
    float _1762 = fma(_1500, _1716, _1756);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1766 = float(_1476);
    float _1768 = fma(_1512, _1716, _1758);
    float _1770 = fma(_1550, _1698, _1760);
    float _1772 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1774 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1776 = float(_1754);
    float _1778 = _1428 * _1748;
    bool _1780 = !_1244;
    int _1782 = _1780 ? 0 : 1;
    float _1784 = in.m_59.x;
    float _1786 = in.m_59.y;
    float _1788 = in.m_59.z;
    float _1790 = _1774 * _1696;
    float _1792 = _1776 * _1766;
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1796 = fma(_1548, _1698, _1762);
    bool _1798 = !_1236;
    int _1800 = _1798 ? 0 : 1;
    float _1802 = fma(_1554, _1698, _1768);
    float _1804 = _1772 * _1764;
    float _1806 = fma(_1572, _1682, _1770);
    int _1808 = abs(_1800);
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1812 = _1338 + _1810;
    int _1814 = abs(_1782);
    float _1816 = fma(_1592, _1682, _1796);
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1820 = _1358 + _1818;
    float _1822 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1824 = _1792 * (-2.0);
    float _1826 = fma(_1598, _1682, _1802);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1828;
    float _1832 = _1366 * _1794;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1836 = _1380 + _1834;
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1822);
    float _1840 = fma(_1622, _1658, _1806);
    float _1842 = fma(_1624, _1658, _1816);
    float _1844 = fma(_1824, _1786, _1786);
    float _1846 = fma(_1626, _1658, _1826);
    float _1848 = fma(_1830, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    int _1850 = _1510 ? 0 : 1;
    out.m_61.x = _1790;
    out.m_61.y = _1804;
    out.m_61.z = _1832;
    out.m_61.w = _1778;
    float _1852 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1838);
    float _1854 = fma(_1660, _1640, _1840);
    float _1856 = fma(_1662, _1640, _1842);
    float _1858 = fma(_1664, _1640, _1846);
    int _1860 = ~_1850;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = fma(_1736, _1616, _1854);
    int _1868 = _1864;
    float _1870 = _1832;
    float _1872 = _1736;
    float _1874 = _1750;
    if (!_1498)
    {
        int _1876 = ~_1850;
        int _1878 = _1876 + 1;
        _1868 = _1878;
    }
    int _1880 = _1868;
    float _1882 = fma(_1750, _1616, _1856);
    float _1884 = fma(_1848, _1616, _1858);
    bool _1886 = _1852 >= 0.0;
    float _1888 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1866);
    float _1890 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1882);
    float _1892 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1884);
    float _1894 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1844);
    float _1896 = _1812 * _1812;
    float _1898 = float(_1808);
    float _1900 = fma(_1450, _1824, _1450);
    float _1902 = float(_1880);
    float _1904 = fma(_1820, _1820, _1896);
    int _1906 = _1526 ? 0 : 1;
    float _1908 = _1888 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1910 = fma(_1836, _1836, _1904);
    float _1912 = _1898 * _1902;
    if (_1886)
    {
        _1870 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1914 = _1870;
    float _1916 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1918 = ~_1906;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1912 * (-2.0);
    float _1926 = rsqrt(_1910);
    float _1928 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1930 = _1922;
    int _1932 = as_type<int>(_1914);
    if (!_1494)
    {
        int _1934 = ~_1906;
        int _1936 = _1934 + 1;
        _1930 = _1936;
    }
    int _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1886)
    {
        float _1942 = _1914 * 5.0;
        _1932 = as_type<int>(_1942);
    }
    int _1944 = _1932;
    float _1946 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = float(_1814);
    if (_1886)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6032 = as_type<float>(_1944);
        out.gl_Position.z = _6032;
    }
    float _1954 = float(_1938);
    float _1956 = fma(_1448, _1924, _1448);
    float _1958 = fma(_1924, _1784, _1784);
    out.m_63.x = _1946;
    out.m_63.y = _1948;
    out.m_63.z = _1950;
    out.m_63.w = _1940;
    float _1960 = fma(_1900, _1470, _1894);
    float _1962 = _1952 * _1954;
    float _1964 = _154 + (-0.5);
    if (_1886)
    {
        out.m_47.x = 0.0;
    }
    float _1966 = _1812 * _1926;
    float _1968 = _1820 * _1926;
    if (_1886)
    {
        return out;
    }
    float _1970 = -_1966;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1338);
    float _1974 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1958);
    float _1976 = -_1968;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1358);
    float _1980 = _1836 * _1926;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1972 + _1982;
    float _1986 = fma(_1956, _1470, _1974);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1978 + _1988;
    float _1992 = _154 + _1154;
    float _1994 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1996 = -_1980;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1380);
    float _2000 = _1992 + (-1.0);
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1994);
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2006 = _1998 + _2004;
    float _2008 = _1962 * (-2.0);
    float _2010 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2012 = -_1966;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1812);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2002);
    float _2018 = fma(_2008, _1788, _1788);
    float _2020 = _1154 + (-0.5);
    float _2022 = fma(_2010, _2008, _2010);
    float _2024 = -_1968;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1820);
    bool _2028 = _2016 >= 0.0;
    float _2030 = _2014 * _2014;
    float _2032 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2018);
    float _2034 = -_1980;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1836);
    float _2038 = _1960 * 0.15915493667125701904296875;
    float _2040 = fma(_2026, _2026, _2030);
    float _2042 = fma(_2022, _1470, _2032);
    float _2044 = _1986 * 0.15915493667125701904296875;
    float _2046 = _2038 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    float _2050 = fma(_2036, _2036, _2040);
    float _2052 = _2042 * 0.15915493667125701904296875;
    float _2054 = _2018;
    float _2056 = _2014;
    if (_2028)
    {
        _2054 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2058 = _2054;
    int _2060 = as_type<int>(_2058);
    if (_2028)
    {
        out.m_47.x = 0.0;
    }
    float _2062 = _2038 * 6.283185482025146484375;
    float _2064 = cos(_2062);
    if (_2028)
    {
        float _2066 = _2058 * 5.0;
        _2060 = as_type<int>(_2066);
    }
    int _2068 = _2060;
    if (_2028)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6248 = as_type<float>(_2068);
        out.gl_Position.z = _6248;
    }
    float _2070 = _2044 * 6.283185482025146484375;
    float _2072 = sin(_2070);
    float _2074 = _2044 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _2052 * 6.283185482025146484375;
    float _2080 = sin(_2078);
    float _2082 = sqrt(_2050);
    if (_2028)
    {
        return out;
    }
    float _2084 = in.m_65.x;
    float _2086 = in.m_65.y;
    float _2088 = in.m_65.z;
    float _2090 = _2052 * 6.283185482025146484375;
    float _2092 = cos(_2090);
    float _2094 = _1926 * _2082;
    float _2096 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2098 = _2072 * _2048;
    float _2100 = _2076 * _2064;
    float _2102 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2104 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2106 = _2094 * _2096;
    float _2108 = _2072 * _2064;
    float _2110 = fma(_2080, _2100, _2098);
    float _2112 = fma(_2080, _2098, _2100);
    float _2114 = _2076 * _2048;
    float _2116 = _2094 * _2102;
    float _2118 = _2094 * _2104;
    float _2120 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2122 = _2064 * _2092;
    float _2124 = _2048 * _2092;
    float _2126 = _2076 * _2092;
    float _2128 = _2072 * _2092;
    float _2130 = -_2114;
    float _2132 = fma(_2080, _2108, _2130);
    float _2134 = -_2108;
    float _2136 = fma(_2080, _2114, _2134);
    float _2138 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2086);
    float _2142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2084);
    float _2144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2088);
    float _2146 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2148 = _2106 * _2140;
    float _2150 = _2118 * _2142;
    float _2152 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2154 = _2116 * _2144;
    float _2156 = _2126 * _2148;
    float _2158 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2160 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2162 = -_2148;
    float _2164 = _2080 * _2162;
    float _2166 = fma(_2110, _2150, _2156);
    float _2168 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2170 = -_2080;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2152);
    float _2174 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2158);
    float _2176 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2120);
    float _2178 = _2128 * _2148;
    float _2180 = fma(_2122, _2150, _2164);
    float _2182 = fma(_2136, _2154, _2166);
    float _2184 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2160);
    float _2186 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    float _2190 = -_2080;
    float _2192 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2146);
    float _2194 = -_2080;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2168);
    float _2198 = fma(_2132, _2150, _2178);
    float _2200 = fma(_2124, _2154, _2180);
    float _2202 = in.m_67.x;
    float _2204 = in.m_67.y;
    float _2206 = in.m_67.z;
    float _2208 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2210 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2212 = _2086 != 0.0;
    bool _2214 = isnan(_2086);
    bool _2216 = _2212 || _2214;
    bool _2218 = isnan(0.0);
    bool _2220 = _2216 || _2218;
    float _2222 = fma(_2112, _2154, _2198);
    float _2224 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2208);
    float _2226 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2210);
    bool _2228 = _2084 == 0.0;
    bool _2230 = !_2220;
    bool _2232 = _2228 && _2230;
    float _2234 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2224);
    float _2238 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2226);
    bool _2240 = _2088 == 0.0;
    bool _2242 = _2240 && _2232;
    float _2244 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2234);
    float _2246 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2248 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2250 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = _1358 + _2246;
    float _2256 = _1380 + _2248;
    float _2258 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2192);
    float _2260 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2264 = _2254 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2268 = _2256 + _2266;
    float _2270 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2272 = _2202;
    float _2274 = _2172;
    float _2276 = _2254;
    float _2278 = _2256;
    if (_2242)
    {
        _1872 = _2202;
    }
    float _2280 = _1872;
    float _2282 = in.m_69.x;
    float _2284 = in.m_69.y;
    float _2286 = in.m_69.z;
    float _2288 = in.m_69.w;
    float _2290 = _2264 * _2264;
    float _2292 = _2268 * _2268;
    float _2294 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2172);
    float _2296 = _2280;
    float _2298 = _2290;
    float _2300 = _2292;
    if (_2242)
    {
        _1874 = _2206;
    }
    float _2302 = _1874;
    float _2304 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2196);
    float _2306 = _2302;
    if (_2242)
    {
        _1402 = _2280;
    }
    float _2308 = _1402;
    float _2310 = _2290 + _2292;
    float _2312 = _2308;
    if (!_2242)
    {
        _2296 = _2202;
    }
    float _2314 = _2296;
    float _2316 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_2242)
    {
        _2272 = _2302;
    }
    float _2318 = _2272;
    float _2320 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2260);
    float _2322 = _2318;
    if (!_2242)
    {
        _2306 = _2206;
    }
    float _2324 = _2306;
    float _2326 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2316);
    float _2328 = sqrt(_2310);
    if (_2242)
    {
        _2056 = _2204;
    }
    float _2330 = _2056;
    float _2332 = _2330;
    if (!_2242)
    {
        float _2334 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2312 = _2334;
    }
    float _2336 = _2312;
    float _2338 = _2336;
    if (!_2242)
    {
        float _2340 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2324);
        _2322 = _2340;
    }
    float _2342 = _2322;
    float _2344 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    if (_2242)
    {
        _2274 = _2330;
    }
    float _2346 = _2274;
    float _2348 = _2346;
    if (!_2242)
    {
        _2332 = _2204;
    }
    float _2350 = _2332;
    float _2352 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2244);
    float _2354 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2356 = _2294 * _2284;
    float _2358 = _2258 * _2284;
    float _2360 = _2288;
    float _2362 = _2354;
    if (!_2242)
    {
        float _2364 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2350);
        _2348 = _2364;
    }
    float _2366 = _2348;
    float _2368 = _2286 * _2314;
    float _2370 = fma(_2184, _2282, _2356);
    float _2372 = _2282 * _2350;
    bool _2374 = _2328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2376 = _2284 * _2324;
    float _2378 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2380 = _2304 * _2284;
    float _2382 = fma(_2186, _2282, _2358);
    float _2384 = -_2372;
    float _2386 = fma(_2284, _2314, _2384);
    float _2388 = -_2368;
    float _2390 = fma(_2282, _2324, _2388);
    float _2392 = -_2376;
    float _2394 = fma(_2286, _2350, _2392);
    float _2396 = _1338 + _2378;
    float _2398 = fma(_2188, _2282, _2380);
    float _2400 = fma(_2320, _2286, _2370);
    float _2402 = fma(_2352, _2286, _2382);
    float _2404 = _2390 * _2288;
    float _2406 = _2394 * _2288;
    float _2408 = _2386 * _2288;
    float _2410 = fma(_2354, _2286, _2398);
    if (!_2374)
    {
        _2360 = _2396;
    }
    float _2412 = _2360;
    bool _2414 = !_2374;
    float _2416 = _2412;
    if (!_2414)
    {
        float _2418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2422 = _2328 + _2420;
        float _2424 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = rsqrt(_2310);
        float _2428 = _2422 * _2418;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2430 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = _2430 * 6.283185482025146484375;
        float _2438 = cos(_2436);
        float _2440 = fma(_2434, _2424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2442 = _2426 * _2440;
        float _2444 = fma(_2264, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2446 = _2438 + (-1.0);
        float _2448 = fma(_2268, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2452 = _2444 + _2450;
        float _2454 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _2448 + _2456;
        float _2460 = _2452 * _2452;
        float _2462 = fma(_2396, _2438, _2454);
        float _2464 = _2458 * _2458;
        _2416 = _2462;
        _2298 = _2460;
        _2300 = _2464;
        _2276 = _2444;
        _2278 = _2448;
    }
    float _2466 = _2416;
    float _2468 = _2298;
    float _2470 = _2300;
    float _2472 = _2276;
    float _2474 = _2278;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2478 = _2466 + _2476;
    float _2480 = _2294 * _2366;
    float _2482 = _2258 * _2366;
    float _2484 = _2304 * _2366;
    float _2486 = fma(_2478, _2478, _2468);
    float _2488 = _2404 * _2294;
    float _2490 = _2404 * _2258;
    float _2492 = _2404 * _2304;
    float _2494 = _2486 + _2470;
    float _2496 = fma(_2184, _2336, _2480);
    float _2498 = fma(_2186, _2336, _2482);
    float _2500 = fma(_2188, _2336, _2484);
    float _2502 = fma(_2406, _2184, _2488);
    float _2504 = fma(_2406, _2186, _2490);
    float _2506 = sqrt(_2494);
    float _2508 = fma(_2406, _2188, _2492);
    float _2510 = fma(_2320, _2342, _2496);
    float _2512 = fma(_2352, _2342, _2498);
    float _2514 = fma(_2354, _2342, _2500);
    float _2516 = fma(_2408, _2320, _2502);
    float _2518 = fma(_2408, _2352, _2504);
    float _2520 = fma(_2408, _2354, _2508);
    out.m_71.x = _2400;
    out.m_71.y = _2402;
    out.m_71.z = _2410;
    out.m_73.x = _2510;
    out.m_73.y = _2512;
    out.m_73.z = _2514;
    out.m_75.x = _2516;
    out.m_75.y = _2518;
    out.m_75.z = _2520;
    bool _2522 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2524 = isnan(_2506);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2530 = _2526 || _2528;
    float _2532 = _2520;
    if (!_2530)
    {
        _2362 = 1.0;
    }
    float _2534 = _2362;
    bool _2536 = !_2530;
    float _2538 = _2534;
    if (!_2536)
    {
        bool _2540 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2542 = isnan(_2506);
        bool _2544 = _2540 || _2542;
        bool _2546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2548 = _2544 || _2546;
        if (!_2548)
        {
            float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2552 = _2506 + _2550;
            float _2554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2556 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2554;
            float _2558 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2562 = 1.0 / _2556;
            float _2564 = _2552 * _2562;
            float _2566 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2538 = _2566;
            _2568 = true;
        }
        else
        {
            bool _2570 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2572 = isnan(_2506);
            bool _2574 = _2570 || _2572;
            bool _2576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2578 = _2574 || _2576;
            if (!_2578)
            {
                float _2580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2582 = _2506 + _2580;
                float _2584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2586 = _2584 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2588 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2590 = _2588 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2592 = 1.0 / _2586;
                float _2594 = _2582 * _2592;
                float _2596 = fma(_2594, _2590, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2538 = _2596;
                _2568 = true;
            }
            else
            {
                _2538 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2568 = false;
    float _2598 = _2538;
    float _2600 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2602 = _2466 + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2606 = _2472 + _2604;
    float _2608 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2610 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2612 = _2474 + _2610;
    float _2614 = fma(_2606, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2616 = -_1966;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2608);
    float _2620 = fma(_2612, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2622 = -_1968;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2614);
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2628 = _2618 + _2626;
    float _2630 = -_1980;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2620);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2624 + _2634;
    float _2638 = _2628 * _2628;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2642 = _2632 + _2640;
    float _2644 = fma(_2636, _2636, _2638);
    float _2646 = fma(_2642, _2642, _2644);
    float _2648 = rsqrt(_2646);
    float _2650 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2652 = _2636 * _2650;
    float _2654 = _2642 * _2650;
    float _2656 = _2652 * _2652;
    float _2658 = _2654 * _2654;
    float _2660 = _2656 + _2658;
    float _2662 = sqrt(_2660);
    bool _2664 = _2662 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2668 = _2662 + _2666;
    float _2670 = _2644;
    float _2672 = _2668;
    float _2674 = _2628;
    float _2676 = _2652;
    float _2678 = _2650;
    if (_2664)
    {
        float _2680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2680;
    }
    float _2682 = _2670;
    float _2684 = _2682;
    if (_2664)
    {
        float _2686 = _2668 * _2682;
        _2672 = _2686;
    }
    float _2688 = _2672;
    if (_2664)
    {
        float _2690 = rsqrt(_2660);
        _2684 = _2690;
    }
    float _2692 = _2684;
    float _2694 = _2692;
    if (_2664)
    {
        float _2696 = _2688 * 0.15915493667125701904296875;
        _2532 = _2696;
    }
    float _2698 = _2532;
    float _2700 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2702 = _2648;
    if (_2664)
    {
        float _2704 = _2698 * 6.283185482025146484375;
        float _2706 = sin(_2704);
        _2702 = _2706;
    }
    float _2708 = _2702;
    float _2710 = precise::max(0.0, _2700);
    float _2712 = _2642;
    float _2714 = _2710;
    if (_2664)
    {
        float _2716 = _2698 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        _2712 = _2718;
    }
    float _2720 = _2712;
    float _2722 = -_2650;
    float _2724 = -_2710;
    float _2726 = fma(_2628, _2722, _2724);
    float _2728 = _2726;
    if (_2664)
    {
        float _2730 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2674 = _2730;
    }
    float _2732 = _2674;
    float _2734 = _2708;
    float _2736 = _2732;
    if (_2664)
    {
        float _2738 = fma(_2708, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2734 = _2738;
    }
    float _2740 = _2734;
    if (!_2664)
    {
        _2736 = _2656;
    }
    float _2742 = _2736;
    float _2744 = _2742;
    if (_2664)
    {
        float _2746 = _2692 * _2740;
        _2338 = _2746;
    }
    float _2748 = _2338;
    if (!_2664)
    {
        _2694 = _2654;
    }
    float _2750 = _2694;
    float _2752 = sqrt(_2646);
    float _2754 = _2750;
    if (_2664)
    {
        float _2756 = _2720 + (-1.0);
        _2714 = _2756;
    }
    float _2758 = _2714;
    float _2760 = _2758;
    if (_2664)
    {
        float _2762 = _2652 * _2748;
        _2676 = _2762;
    }
    float _2764 = _2676;
    if (_2664)
    {
        float _2766 = _2654 * _2748;
        _2754 = _2766;
    }
    float _2768 = _2754;
    if (_2664)
    {
        float _2770 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2678 = _2770;
    }
    float _2772 = _2678;
    if (_2664)
    {
        float _2774 = _2764 * _2764;
        _2744 = _2774;
    }
    float _2776 = _2744;
    if (!_2664)
    {
        _2760 = _2658;
    }
    float _2778 = _2760;
    float _2780 = _2778;
    if (_2664)
    {
        float _2782 = _2768 * _2768;
        _2780 = _2782;
    }
    float _2784 = _2780;
    if (_2664)
    {
        float _2786 = fma(_2726, _2720, _2772);
        _2728 = _2786;
    }
    float _2788 = _2728;
    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2792 = fma(_2788, _2788, _2776);
    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2796 = fma(_2752, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2794);
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = _2792 + _2784;
    float _2802 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2804 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2806 = -_2798;
    float _2808 = _2806 + 1.0;
    float _2810 = rsqrt(_2800);
    float _2812 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2802);
    float _2814 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2816 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2804);
    float _2818 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2820 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2812);
    float _2822 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2814);
    float _2824 = abs(_2808);
    float _2826 = log2(_2824);
    float _2828 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2830 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2822);
    float _2832 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2816);
    float _2834 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2818);
    float _2836 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2838 = _2830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2840 = _2832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2842 = _2810 * _2764;
    float _2844 = _2810 * _2788;
    float _2846 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2848 = -_2836;
    float _2850 = fma(_2848, _2790, 1.0);
    float _2852 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2854 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2834);
    float _2856 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2846);
    float _2858 = _2810 * _2768;
    float _2860 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2862 = -_2852;
    float _2864 = fma(_2844, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2862);
    float _2866 = _2854 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2868 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2856);
    float _2870 = log2(_2850);
    float _2872 = -_2858;
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2864);
    float _2876 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2878 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2868);
    float _2880 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2882 = fma(_2874, -0.5, 0.5);
    float _2884 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2876);
    float _2886 = fma(_2874, 0.5, 0.5);
    float _2888 = exp2(_2860);
    float _2890 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2880);
    float _2892 = _2844 + 1.0;
    float _2894 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2884);
    float _2896 = fma(_2886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2898 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2890);
    float _2900 = 1.0 / _2878;
    float _2902 = fma(_2886, _2896, -0.212114393711090087890625);
    float _2904 = _2870 * 0.693147182464599609375;
    float _2906 = fma(_2886, _2902, 1.570728778839111328125);
    float _2908 = sqrt(_2882);
    float _2910 = -_2844;
    float _2912 = fma(_2888, _2892, _2910);
    float _2914 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2894);
    float _2916 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2898);
    float _2918 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2920 = fma(_2912, 0.5, 0.5);
    float _2922 = _2914 * _2900;
    float _2924 = _2916 * _2900;
    float _2926 = fma(_2922, 0.5, 0.5);
    float _2928 = fma(_2924, -0.5, 0.5);
    float _2930 = _2908 * 0.636619746685028076171875;
    float3 _7714 = float3(_2926, _2928, _2918);
    float _2932 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7714, float3(0.0), isnan(_7714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7714, float3(0.0), isnan(_7714)), level(0.0)).x;
    float _2934 = -_2906;
    float _2936 = fma(_2930, _2934, 1.0);
    float3 _7730 = float3(_2926, _2928, _2918);
    float4 _2939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7730, float3(0.0), isnan(_7730)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7730, float3(0.0), isnan(_7730)), level(0.0)).xyzw;
    float _2941 = _2939.x;
    float _2943 = _2939.y;
    float _2945 = _2939.z;
    float _2947 = _2939.w;
    float2 _7747 = float2(_2936, _2920);
    float3 _2951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7747, float2(0.0), isnan(_7747)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7747, float2(0.0), isnan(_7747)), level(0.0)).xyz;
    float _2953 = _2951.x;
    float _2955 = _2951.y;
    float _2957 = _2951.z;
    float _2959 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2961 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2963 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2965 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2961);
    float _2967 = exp2(_2959);
    float _2969 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2965);
    float _2971 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2969);
    float _2973 = _2971 + _2878;
    out.gl_Position.x = _2914;
    out.gl_Position.y = _2916;
    out.gl_Position.z = _2971;
    out.gl_Position.w = _2878;
    float _2975 = _2973 * 0.5;
    float _2977 = -_2967;
    float _2979 = _2977 + 1.0;
    float _2981 = _2963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2983 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2975;
    out.m_77.w = _2878;
    out.m_47.x = _2981;
    float _2985 = _2983 * _2932;
    float _2987 = -_2983;
    float _2989 = _2987 + 1.0;
    float _2991 = _2947 * _2985;
    float _2993 = _2957 * _2985;
    float _2995 = fma(_2953, _2991, _2941);
    float _2997 = fma(_2955, _2991, _2943);
    float _2999 = _2947 * _2989;
    float _3001 = fma(_2947, _2993, _2945);
    out.m_79.x = _2995;
    out.m_79.y = _2997;
    out.m_79.z = _3001;
    out.m_79.w = _2999;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2568 = false;
    bool _1130 = false;
    bool _664 = false;
    bool _388 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_114);
        out.gl_Position.z = _3058;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3128 = as_type<float>(_152);
        out.gl_Position.z = _3128;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_51.x;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = _158 * _156;
    float _174 = 0.0;
    if (!_170)
    {
        float _176 = _160 * _160;
        float _178 = _176 * 0.5;
        _174 = _178;
    }
    float _180 = _174;
    float _182 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _172);
    float _184 = _180;
    if (!_170)
    {
        float _186 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _182 * 6.283185482025146484375;
    float _198 = floor(_182);
    float _200 = _196 * 0.15915493667125701904296875;
    int _202 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _204 = _202 != 0;
    float _206 = _200 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = 1.4012984643248170709237295832899e-45;
    float _212 = _188;
    if (!_170)
    {
        _210 = _160;
    }
    float _214 = _210;
    float _216 = -_198;
    float _218 = _182 + _216;
    bool _220 = !_170;
    float _222 = _214;
    if (!_220)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = _160 * _226;
        float _236 = 1.0 / _230;
        float _238 = _232 * 0.693147182464599609375;
        float _240 = exp2(_234);
        float _242 = 1.0 / _238;
        float _244 = _240 + (-1.0);
        float _246 = -_244;
        float _248 = fma(_246, _242, _160);
        float _250 = _248 * _236;
        float _252 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _252;
    }
    float _254 = _212;
    bool _256 = !_170;
    if (!_256)
    {
        float _258 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _260 = log2(_258);
        float _262 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _264 = _262 + 1.0;
        float _266 = 1.0 / _264;
        float _268 = _160 * _260;
        float _270 = exp2(_268);
        float _272 = -_270;
        float _274 = _272 + 1.0;
        float _276 = _274 * _266;
        _222 = _276;
    }
    float _278 = _222;
    float _280 = in.m_53.w;
    float _282 = in.m_44.x;
    float _284 = in.m_44.y;
    float _286 = in.m_44.z;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _290 = _288 != 0;
    int _292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _294 = _292 != 0;
    float _296 = -_218;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _300 = _218 < 0.5;
    float _302 = float(_300);
    float _304 = fma(_208, 0.5, 0.5);
    float _306 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _308 = !_290;
    int _310 = _308 ? 0 : 1;
    bool _312 = !_204;
    int _314 = _312 ? 0 : 1;
    float _316 = -_302;
    float _318 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _320 = -_304;
    float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _324 = abs(_310);
    float _326 = fma(_278, _190, _306);
    int _328 = abs(_314);
    float _330 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _332 = !_294;
    int _334 = _332 ? 0 : 1;
    float _336 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _340 = fma(_278, _192, _330);
    int _342 = abs(_334);
    float _344 = fma(_278, _194, _336);
    float _346 = float(_324);
    float _348 = float(_328);
    float _350 = fma(_326, _280, _282);
    float _352 = abs(_298);
    float _354 = _346 * _352;
    float _356 = fma(_340, _280, _284);
    float _358 = fma(_344, _280, _286);
    float _360 = float(_342);
    float _362 = fma(_348, _322, _354);
    float _364 = abs(_318);
    float _366 = fma(_360, _364, _362);
    bool _368 = !_338;
    bool _370 = _290;
    float _386;
    if (!_368)
    {
        float _372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _374 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _376 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _378 = _376 * _372;
        float _380 = floor(_378);
        float _382 = -_380;
        float _384 = _378 + _382;
        _386 = _384;
        _388 = true;
    }
    else
    {
        float _390 = float(_98);
        float _392 = 1.0 / _390;
        float _394 = _132 * _392;
        _386 = _394;
    }
    _388 = false;
    float _396 = _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = _396 + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _396 + _402;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _408 = _396 + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _426 = 1.0 / _412;
    float _428 = 1.0 / _416;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    bool _434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _436 = 1.0 / _420;
    float _438 = _404 * _426;
    bool _440 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _442 = isnan(_396);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _452;
    float _456 = 1.0 / _424;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _460 = _396 + _458;
    float _462 = _400 * _436;
    float _464 = _460 * _428;
    bool _466 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _468 = isnan(_396);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    bool _478 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _480 = isnan(_396);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = fma(_432, _462, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _492 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _494 = isnan(_396);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_476;
    float _506 = _504 + 1.0;
    float _508 = _408 * _456;
    float _510 = -_488;
    float _512 = _510 + 1.0;
    bool _514 = _396 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _516 = isnan(_396);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _502 * _506;
    float _528 = -_502;
    float _530 = _528 + 1.0;
    float _532 = _450 * _512;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _534;
    float _538 = -_450;
    float _540 = _538 + 1.0;
    float _542 = _488 * _530;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _548 = fma(_536, _462, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _558 = _524 * _540;
    float _560 = fma(_454, _462, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _562 = fma(_546, _508, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _564 = fma(_552, _508, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _566 = fma(_556, _508, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _568 = _548 * _558;
    float _570 = _490 * _558;
    float _572 = -_524;
    float _574 = _572 + 1.0;
    float _576 = _560 * _558;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _578;
    float _582 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _568);
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _570);
    float _586 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    float _596 = fma(_580, _438, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _598 = fma(_562, _532, _582);
    float _600 = fma(_564, _532, _584);
    float _602 = fma(_566, _532, _586);
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _612 = fma(_590, _438, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _614 = fma(_594, _438, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _620 = fma(_596, _542, _598);
    float _622 = fma(_606, _464, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _624 = fma(_610, _464, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _626 = fma(_618, _464, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _628 = fma(_612, _542, _600);
    float _630 = fma(_614, _542, _602);
    float _632 = fma(_622, _526, _620);
    float _634 = fma(_624, _526, _628);
    float _636 = fma(_626, _526, _630);
    float _638 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].x, _632);
    float _640 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].y, _634);
    float _642 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[147].z, _636);
    bool _644 = !_434;
    int _646 = as_type<int>(_640);
    float _662;
    if (!_644)
    {
        float _648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _650 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _652 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _654 = _652 * _648;
        float _656 = floor(_654);
        float _658 = -_656;
        float _660 = _654 + _658;
        _662 = _660;
        _664 = true;
    }
    else
    {
        float _666 = float(_98);
        float _668 = 1.0 / _666;
        float _670 = _132 * _668;
        _662 = _670;
    }
    _664 = false;
    float _672 = _662;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _676 = _672 + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _680 = _672 + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _698 = 1.0 / _684;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _700;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _708 = 1.0 / _688;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _718;
    bool _722 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_672);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = 1.0 / _692;
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[114].w + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _742 = _672 + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _744;
    float _748 = -_732;
    float _750 = _748 + 1.0;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _754 = _742 * _698;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _758 = _672 + _756;
    float _760 = 1.0 / _702;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _764 = _672 + _762;
    float _766 = fma(_712, _754, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = _758 * _708;
    bool _770 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[114].w;
    bool _772 = isnan(_672);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[114].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    bool _782 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _784 = isnan(_672);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = fma(_716, _768, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = 1.0 / _738;
    float _798 = _676 * _734;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _802 = _672 + _800;
    float _804 = fma(_720, _798, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _806 = 1.0 / _706;
    float _808 = _764 * _760;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _812 = _672 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _822 = 1.0 / _696;
    float _824 = _812 * _796;
    float _826 = -_780;
    float _828 = _826 + 1.0;
    float _830 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _830;
    float _834 = fma(_816, _754, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _840 = fma(_820, _768, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _842 = fma(_832, _754, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _844 = _802 * _806;
    bool _846 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _848 = isnan(_672);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = fma(_838, _768, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _860 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _862 = isnan(_672);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    bool _872 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _874 = isnan(_672);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _856 * _828;
    float _886 = -_856;
    float _888 = _886 + 1.0;
    float _890 = _680 * _822;
    bool _892 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _894 = isnan(_672);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -_870;
    float _906 = _904 + 1.0;
    float _908 = _870 * _888;
    float _910 = -_882;
    float _912 = _910 + 1.0;
    float _914 = _902 * _906;
    float _916 = -_902;
    float _918 = _916 + 1.0;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _920;
    float _924 = _792 * _918;
    float _926 = -_792;
    float _928 = _926 + 1.0;
    float _930 = _882 * _928;
    float _932 = fma(_922, _798, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _934 = fma(_746, _798, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    bool _936 = _672 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _938 = isnan(_672);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = _732 * _912;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _956 = _954 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _962 = _946 * _750;
    float _964 = fma(_952, _890, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _966 = -_946;
    float _968 = _966 + 1.0;
    float _970 = fma(_956, _890, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _972 = _766 * _962;
    float _974 = _834 * _962;
    float _976 = _842 * _962;
    float _978 = fma(_960, _890, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].x, _972);
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].y, _974);
    float _984 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[107].z, _976);
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _986;
    float _990 = fma(_794, _948, _980);
    float _992 = fma(_840, _948, _982);
    float _994 = fma(_858, _948, _984);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _996;
    float _1000 = fma(_988, _808, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _1002 = fma(_932, _930, _990);
    float _1004 = fma(_804, _930, _992);
    float _1006 = fma(_934, _930, _994);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _1020;
    float _1024 = fma(_998, _808, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _1026 = fma(_964, _924, _1002);
    float _1028 = fma(_970, _924, _1004);
    float _1030 = fma(_978, _924, _1006);
    float _1032 = fma(_1010, _844, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _1034 = fma(_1014, _844, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _1036 = fma(_1018, _844, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _1038 = fma(_1022, _808, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _1040 = fma(_1024, _914, _1028);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[114].x + _1042;
    float _1046 = fma(_1000, _914, _1026);
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[114].y + _1048;
    float _1052 = fma(_1038, _914, _1030);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[114].z + _1054;
    float _1058 = fma(_1044, _824, (*spvDescriptorSet0.vp_c9)._m0[113].x);
    float _1060 = fma(_1050, _824, (*spvDescriptorSet0.vp_c9)._m0[113].y);
    float _1062 = fma(_1032, _908, _1046);
    float _1064 = fma(_1056, _824, (*spvDescriptorSet0.vp_c9)._m0[113].z);
    float _1066 = fma(_1034, _908, _1040);
    float _1068 = fma(_1036, _908, _1052);
    float _1070 = fma(_1058, _884, _1062);
    float _1072 = fma(_1060, _884, _1066);
    float _1074 = fma(_1064, _884, _1068);
    float _1076 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].x, _1070);
    float _1078 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].y, _1072);
    float _1080 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[114].z, _1074);
    float _1082 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1086 = _1078 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1092 = in.m_53.x;
    float _1094 = in.m_53.y;
    float _1096 = in.m_53.z;
    float _1098 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1100 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _1090;
    out.m_55.y = _1098;
    out.m_55.z = _1100;
    out.m_55.w = _1084;
    float _1102 = _642 * _1096;
    float _1104 = _640 * _1094;
    float _1106 = _638 * _1092;
    bool _1108 = !_752;
    float _1110 = _1094;
    int _1112 = as_type<int>(_1100);
    float _1128;
    if (!_1108)
    {
        float _1114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1116 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1120 = _1118 * _1114;
        float _1122 = floor(_1120);
        float _1124 = -_1122;
        float _1126 = _1120 + _1124;
        _1128 = _1126;
        _1110 = _1114;
        _1130 = true;
    }
    else
    {
        float _1132 = float(_98);
        float _1134 = 1.0 / _1132;
        float _1136 = _132 * _1134;
        _1128 = _1136;
    }
    _1130 = false;
    float _1138 = _1128;
    float _1140 = _1110;
    float _1142 = in.m_57.x;
    float _1144 = _154 * 2.0;
    float _1146 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1148 = log2(_1146);
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    float _1154 = in.m_51.z;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1158 = _1156 != 0;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1160;
    float _1164 = in.m_51.w;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1168 = _1138 + _1166;
    float _1170 = floor(_1144);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1174 = _1138 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1186 = _1138 + _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1190 = _1138 + _1188;
    float _1192 = _1140;
    if (_1152)
    {
        bool _1194 = _154 > 0.5;
        _370 = _1194;
    }
    bool _1196 = _370;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1200 = _1138 + _1198;
    float _1202 = 1.0 / _1162;
    float _1204 = in.m_57.y;
    float _1206 = _1148 * _132;
    if (_1152)
    {
        float _1208 = -_1142;
        float _1210 = _1208 + 1.0;
        _646 = as_type<int>(_1210);
    }
    int _1212 = _646;
    float _1214 = as_type<float>(_1212);
    if (!_1152)
    {
        _1192 = _1142;
    }
    float _1216 = _1192;
    float _1218 = _1216;
    if (_1158)
    {
        float _1220 = -_1142;
        float _1222 = _1220 + 1.0;
        _1112 = as_type<int>(_1222);
    }
    int _1224 = _1112;
    float _1226 = 1.0 / _1178;
    float _1228 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (_1152)
    {
        float _1230 = _1196 ? as_type<float>(_1212) : _1142;
        _1218 = _1230;
    }
    float _1232 = _1218;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1236 = _1234 != 0;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1244 = _1242 != 0;
    bool _1246 = _1196;
    if (_1158)
    {
        bool _1248 = _1154 > 0.5;
        _1246 = _1248;
    }
    bool _1250 = _1246;
    if (!_1158)
    {
        _1214 = _1142;
    }
    float _1252 = _1214;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1258 = _1252;
    if (_1158)
    {
        float _1260 = _1250 ? as_type<float>(_1224) : _1142;
        _1258 = _1260;
    }
    float _1262 = _1258;
    float _1264 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1266 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1270 = _1268 != 0;
    float _1272 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1228);
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1276 = _1274 != 0;
    float _1278 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1264);
    float _1280 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1266);
    bool _1282 = _1164 > 0.5;
    float _1284 = in.m_51.y;
    float _1286 = 1.0 / _1182;
    float _1288 = -_1204;
    float _1290 = _1288 + 1.0;
    float _1292 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1280);
    float _1294 = _1174 * _1226;
    float _1296 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1300 = _1170 > 0.0;
    float _1302 = 1.0 / _1256;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1304;
    float _1308 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1278);
    int _1310 = _1282 ? as_type<int>(_1290) : as_type<int>(_1204);
    float _1312 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1272);
    bool _1314 = _1170 >= 0.0;
    bool _1316 = isnan(_1170);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1326 = _1138 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1330 = _1138 + _1328;
    float _1332 = 1.0 / _1298;
    float _1334 = _1168 * _1286;
    float _1336 = _1326 * _1202;
    float _1338 = _1308 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1340;
    float _1344 = _1284 * 2.0;
    float _1346 = 1.0 / _1306;
    float _1348 = _1284 + _1154;
    float _1350 = _1330 * _1302;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1352;
    float _1356 = _1348 + (-1.0);
    float _1358 = _1312 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1360 = 1.0 / _1342;
    float _1362 = _1186 * _1332;
    float _1364 = fma(_1354, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1366 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1368 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1370 = isnan(_1138);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1376 = _1372 || _1374;
    float _1378 = float(_1376);
    float _1380 = _1292 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1382 = exp2(_1206);
    float _1384 = _1270 ? as_type<float>(_1310) : _1204;
    float _1386 = _1190 * _1346;
    bool _1388 = _1284 > 0.5;
    float _1390 = _154 + _1284;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1398 = _1396 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1400 = _1204;
    float _1402 = _1380;
    if (_1276)
    {
        float _1404 = _1388 ? _1290 : _1204;
        _1400 = _1404;
    }
    float _1406 = _1400;
    float _1408 = floor(_1344);
    bool _1410 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1412 = isnan(1.0);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1422 = 1.0 + _1420;
    float _1424 = _1200 * _1360;
    float _1426 = _1390 + (-1.0);
    float _1428 = _1384 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = 1.0 / _1422;
    float _1432 = _1154 * 2.0;
    float _1434 = -_1382;
    float _1436 = _1434 + 1.0;
    bool _1438 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(0.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    float _1448 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1450 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1452 = _1322 ? 0 : 1;
    float _1454 = _1284 + (-0.5);
    float _1456 = floor(_1432);
    float _1458 = _1446 ? _1436 : 0.0;
    int _1460 = ~_1452;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    int _1466 = _1464;
    if (_1418)
    {
        float _1468 = _1458 * _1430;
        _134 = _1468;
    }
    float _1470 = _134;
    if (!_1300)
    {
        int _1472 = ~_1452;
        int _1474 = _1472 + 1;
        _1466 = _1474;
    }
    int _1476 = _1466;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1492 = _1490 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1494 = _1408 > 0.0;
    float _1496 = fma(_1484, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    bool _1498 = _1456 > 0.0;
    float _1500 = fma(_1488, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1502 = _1456 >= 0.0;
    bool _1504 = isnan(_1456);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan(0.0);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_1492, _1334, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1514;
    bool _1518 = _1408 >= 0.0;
    bool _1520 = isnan(_1408);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1534 = _1532 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1544;
    float _1548 = fma(_1516, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1550 = fma(_1538, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1552 = fma(_1480, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1554 = fma(_1546, _1336, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1556 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1558 = isnan(_1138);
    bool _1560 = _1556 || _1558;
    bool _1562 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1564 = _1560 || _1562;
    float _1566 = float(_1564);
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1570 = _1568 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1572 = fma(_1542, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1574 = fma(_1530, _1294, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1576 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1578 = isnan(_1138);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1584 = _1580 || _1582;
    float _1586 = float(_1584);
    float _1588 = -_1566;
    float _1590 = _1588 + 1.0;
    float _1592 = fma(_1534, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1594 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1596 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1594;
    float _1598 = fma(_1570, _1350, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1600;
    bool _1604 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1606 = isnan(_1138);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = _1586 * _1590;
    float _1618 = -_1586;
    float _1620 = _1618 + 1.0;
    float _1622 = fma(_1596, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1624 = fma(_1602, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1626 = fma(_1394, _1386, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    bool _1628 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1630 = isnan(_1138);
    bool _1632 = _1628 || _1630;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1636 = _1632 || _1634;
    float _1638 = float(_1636);
    float _1640 = _1614 * _1620;
    float _1642 = -_1614;
    float _1644 = _1642 + 1.0;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1648 = _1646 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1652 = _1650 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1654 = -_1638;
    float _1656 = _1654 + 1.0;
    float _1658 = _1638 * _1644;
    float _1660 = fma(_1648, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1662 = fma(_1652, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1664 = fma(_1398, _1362, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    bool _1666 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1668 = isnan(_1138);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1674 = _1670 || _1672;
    float _1676 = float(_1674);
    float _1678 = -_1378;
    float _1680 = _1678 + 1.0;
    float _1682 = _1378 * _1656;
    bool _1684 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1686 = isnan(_1138);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1692 = _1688 || _1690;
    float _1694 = float(_1692);
    float _1696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1698 = _1676 * _1680;
    float _1700 = -_1676;
    float _1702 = _1700 + 1.0;
    bool _1704 = _1138 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1706 = isnan(_1138);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    float _1716 = _1694 * _1702;
    float _1718 = -_1694;
    float _1720 = _1718 + 1.0;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1722;
    float _1726 = _1714 * _1720;
    float _1728 = -_1714;
    float _1730 = _1728 + 1.0;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1732;
    float _1736 = fma(_1724, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1738 = _1552 * _1726;
    float _1740 = _1364 * _1726;
    float _1742 = _1574 * _1726;
    bool _1744 = !_1240;
    int _1746 = _1744 ? 0 : 1;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1750 = fma(_1734, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1752 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1738);
    int _1754 = abs(_1746);
    float _1756 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1740);
    float _1758 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1742);
    float _1760 = fma(_1496, _1716, _1752);
    float _1762 = fma(_1500, _1716, _1756);
    float _1764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1766 = float(_1476);
    float _1768 = fma(_1512, _1716, _1758);
    float _1770 = fma(_1550, _1698, _1760);
    float _1772 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1774 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1776 = float(_1754);
    float _1778 = _1428 * _1748;
    bool _1780 = !_1244;
    int _1782 = _1780 ? 0 : 1;
    float _1784 = in.m_59.x;
    float _1786 = in.m_59.y;
    float _1788 = in.m_59.z;
    float _1790 = _1774 * _1696;
    float _1792 = _1776 * _1766;
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1796 = fma(_1548, _1698, _1762);
    bool _1798 = !_1236;
    int _1800 = _1798 ? 0 : 1;
    float _1802 = fma(_1554, _1698, _1768);
    float _1804 = _1772 * _1764;
    float _1806 = fma(_1572, _1682, _1770);
    int _1808 = abs(_1800);
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1812 = _1338 + _1810;
    int _1814 = abs(_1782);
    float _1816 = fma(_1592, _1682, _1796);
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1820 = _1358 + _1818;
    float _1822 = _1812 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1824 = _1792 * (-2.0);
    float _1826 = fma(_1598, _1682, _1802);
    float _1828 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1828;
    float _1832 = _1366 * _1794;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1836 = _1380 + _1834;
    float _1838 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1822);
    float _1840 = fma(_1622, _1658, _1806);
    float _1842 = fma(_1624, _1658, _1816);
    float _1844 = fma(_1824, _1786, _1786);
    float _1846 = fma(_1626, _1658, _1826);
    float _1848 = fma(_1830, _1424, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    int _1850 = _1510 ? 0 : 1;
    out.m_61.x = _1790;
    out.m_61.y = _1804;
    out.m_61.z = _1832;
    out.m_61.w = _1778;
    float _1852 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1838);
    float _1854 = fma(_1660, _1640, _1840);
    float _1856 = fma(_1662, _1640, _1842);
    float _1858 = fma(_1664, _1640, _1846);
    int _1860 = ~_1850;
    int _1862 = _1860 + 1;
    int _1864 = _1862 + 1;
    float _1866 = fma(_1736, _1616, _1854);
    int _1868 = _1864;
    float _1870 = _1832;
    float _1872 = _1736;
    float _1874 = _1750;
    if (!_1498)
    {
        int _1876 = ~_1850;
        int _1878 = _1876 + 1;
        _1868 = _1878;
    }
    int _1880 = _1868;
    float _1882 = fma(_1750, _1616, _1856);
    float _1884 = fma(_1848, _1616, _1858);
    bool _1886 = _1852 >= 0.0;
    float _1888 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1866);
    float _1890 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1882);
    float _1892 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1884);
    float _1894 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1844);
    float _1896 = _1812 * _1812;
    float _1898 = float(_1808);
    float _1900 = fma(_1450, _1824, _1450);
    float _1902 = float(_1880);
    float _1904 = fma(_1820, _1820, _1896);
    int _1906 = _1526 ? 0 : 1;
    float _1908 = _1888 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1910 = fma(_1836, _1836, _1904);
    float _1912 = _1898 * _1902;
    if (_1886)
    {
        _1870 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1914 = _1870;
    float _1916 = _1890 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1918 = ~_1906;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    float _1924 = _1912 * (-2.0);
    float _1926 = rsqrt(_1910);
    float _1928 = _1892 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1930 = _1922;
    int _1932 = as_type<int>(_1914);
    if (!_1494)
    {
        int _1934 = ~_1906;
        int _1936 = _1934 + 1;
        _1930 = _1936;
    }
    int _1938 = _1930;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1886)
    {
        float _1942 = _1914 * 5.0;
        _1932 = as_type<int>(_1942);
    }
    int _1944 = _1932;
    float _1946 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = float(_1814);
    if (_1886)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6032 = as_type<float>(_1944);
        out.gl_Position.z = _6032;
    }
    float _1954 = float(_1938);
    float _1956 = fma(_1448, _1924, _1448);
    float _1958 = fma(_1924, _1784, _1784);
    out.m_63.x = _1946;
    out.m_63.y = _1948;
    out.m_63.z = _1950;
    out.m_63.w = _1940;
    float _1960 = fma(_1900, _1470, _1894);
    float _1962 = _1952 * _1954;
    float _1964 = _154 + (-0.5);
    if (_1886)
    {
        out.m_47.x = 0.0;
    }
    float _1966 = _1812 * _1926;
    float _1968 = _1820 * _1926;
    if (_1886)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1970 = -_1966;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1338);
    float _1974 = fma(_1964, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1958);
    float _1976 = -_1968;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1358);
    float _1980 = _1836 * _1926;
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1972 + _1982;
    float _1986 = fma(_1956, _1470, _1974);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1990 = _1978 + _1988;
    float _1992 = _154 + _1154;
    float _1994 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1996 = -_1980;
    float _1998 = fma(_1996, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1380);
    float _2000 = _1992 + (-1.0);
    float _2002 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1994);
    float _2004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2006 = _1998 + _2004;
    float _2008 = _1962 * (-2.0);
    float _2010 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2012 = -_1966;
    float _2014 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1812);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2002);
    float _2018 = fma(_2008, _1788, _1788);
    float _2020 = _1154 + (-0.5);
    float _2022 = fma(_2010, _2008, _2010);
    float _2024 = -_1968;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1820);
    bool _2028 = _2016 >= 0.0;
    float _2030 = _2014 * _2014;
    float _2032 = fma(_2020, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2018);
    float _2034 = -_1980;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1836);
    float _2038 = _1960 * 0.15915493667125701904296875;
    float _2040 = fma(_2026, _2026, _2030);
    float _2042 = fma(_2022, _1470, _2032);
    float _2044 = _1986 * 0.15915493667125701904296875;
    float _2046 = _2038 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    float _2050 = fma(_2036, _2036, _2040);
    float _2052 = _2042 * 0.15915493667125701904296875;
    float _2054 = _2018;
    float _2056 = _2014;
    if (_2028)
    {
        _2054 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2058 = _2054;
    int _2060 = as_type<int>(_2058);
    if (_2028)
    {
        out.m_47.x = 0.0;
    }
    float _2062 = _2038 * 6.283185482025146484375;
    float _2064 = cos(_2062);
    if (_2028)
    {
        float _2066 = _2058 * 5.0;
        _2060 = as_type<int>(_2066);
    }
    int _2068 = _2060;
    if (_2028)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6248 = as_type<float>(_2068);
        out.gl_Position.z = _6248;
    }
    float _2070 = _2044 * 6.283185482025146484375;
    float _2072 = sin(_2070);
    float _2074 = _2044 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    float _2078 = _2052 * 6.283185482025146484375;
    float _2080 = sin(_2078);
    float _2082 = sqrt(_2050);
    if (_2028)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2084 = in.m_65.x;
    float _2086 = in.m_65.y;
    float _2088 = in.m_65.z;
    float _2090 = _2052 * 6.283185482025146484375;
    float _2092 = cos(_2090);
    float _2094 = _1926 * _2082;
    float _2096 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2098 = _2072 * _2048;
    float _2100 = _2076 * _2064;
    float _2102 = _1102 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2104 = _1106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2106 = _2094 * _2096;
    float _2108 = _2072 * _2064;
    float _2110 = fma(_2080, _2100, _2098);
    float _2112 = fma(_2080, _2098, _2100);
    float _2114 = _2076 * _2048;
    float _2116 = _2094 * _2102;
    float _2118 = _2094 * _2104;
    float _2120 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2122 = _2064 * _2092;
    float _2124 = _2048 * _2092;
    float _2126 = _2076 * _2092;
    float _2128 = _2072 * _2092;
    float _2130 = -_2114;
    float _2132 = fma(_2080, _2108, _2130);
    float _2134 = -_2108;
    float _2136 = fma(_2080, _2114, _2134);
    float _2138 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2140 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2086);
    float _2142 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2084);
    float _2144 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2088);
    float _2146 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2148 = _2106 * _2140;
    float _2150 = _2118 * _2142;
    float _2152 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2154 = _2116 * _2144;
    float _2156 = _2126 * _2148;
    float _2158 = _2110 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2160 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2138);
    float _2162 = -_2148;
    float _2164 = _2080 * _2162;
    float _2166 = fma(_2110, _2150, _2156);
    float _2168 = _2126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2170 = -_2080;
    float _2172 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2152);
    float _2174 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2158);
    float _2176 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2120);
    float _2178 = _2128 * _2148;
    float _2180 = fma(_2122, _2150, _2164);
    float _2182 = fma(_2136, _2154, _2166);
    float _2184 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2160);
    float _2186 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2174);
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2176);
    float _2190 = -_2080;
    float _2192 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2146);
    float _2194 = -_2080;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2168);
    float _2198 = fma(_2132, _2150, _2178);
    float _2200 = fma(_2124, _2154, _2180);
    float _2202 = in.m_67.x;
    float _2204 = in.m_67.y;
    float _2206 = in.m_67.z;
    float _2208 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2210 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2212 = _2086 != 0.0;
    bool _2214 = isnan(_2086);
    bool _2216 = _2212 || _2214;
    bool _2218 = isnan(0.0);
    bool _2220 = _2216 || _2218;
    float _2222 = fma(_2112, _2154, _2198);
    float _2224 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2208);
    float _2226 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2210);
    bool _2228 = _2084 == 0.0;
    bool _2230 = !_2220;
    bool _2232 = _2228 && _2230;
    float _2234 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2236 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2224);
    float _2238 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2226);
    bool _2240 = _2088 == 0.0;
    bool _2242 = _2240 && _2232;
    float _2244 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2234);
    float _2246 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2248 = _2238 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2250 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2252 = _2136 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2254 = _1358 + _2246;
    float _2256 = _1380 + _2248;
    float _2258 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2192);
    float _2260 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2250);
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2264 = _2254 + _2262;
    float _2266 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2268 = _2256 + _2266;
    float _2270 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2252);
    float _2272 = _2202;
    float _2274 = _2172;
    float _2276 = _2254;
    float _2278 = _2256;
    if (_2242)
    {
        _1872 = _2202;
    }
    float _2280 = _1872;
    float _2282 = in.m_69.x;
    float _2284 = in.m_69.y;
    float _2286 = in.m_69.z;
    float _2288 = in.m_69.w;
    float _2290 = _2264 * _2264;
    float _2292 = _2268 * _2268;
    float _2294 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2172);
    float _2296 = _2280;
    float _2298 = _2290;
    float _2300 = _2292;
    if (_2242)
    {
        _1874 = _2206;
    }
    float _2302 = _1874;
    float _2304 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2196);
    float _2306 = _2302;
    if (_2242)
    {
        _1402 = _2280;
    }
    float _2308 = _1402;
    float _2310 = _2290 + _2292;
    float _2312 = _2308;
    if (!_2242)
    {
        _2296 = _2202;
    }
    float _2314 = _2296;
    float _2316 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_2242)
    {
        _2272 = _2302;
    }
    float _2318 = _2272;
    float _2320 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2260);
    float _2322 = _2318;
    if (!_2242)
    {
        _2306 = _2206;
    }
    float _2324 = _2306;
    float _2326 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2316);
    float _2328 = sqrt(_2310);
    if (_2242)
    {
        _2056 = _2204;
    }
    float _2330 = _2056;
    float _2332 = _2330;
    if (!_2242)
    {
        float _2334 = fma(_2084, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2314);
        _2312 = _2334;
    }
    float _2336 = _2312;
    float _2338 = _2336;
    if (!_2242)
    {
        float _2340 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2324);
        _2322 = _2340;
    }
    float _2342 = _2322;
    float _2344 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2326);
    if (_2242)
    {
        _2274 = _2330;
    }
    float _2346 = _2274;
    float _2348 = _2346;
    if (!_2242)
    {
        _2332 = _2204;
    }
    float _2350 = _2332;
    float _2352 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2244);
    float _2354 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2356 = _2294 * _2284;
    float _2358 = _2258 * _2284;
    float _2360 = _2288;
    float _2362 = _2354;
    if (!_2242)
    {
        float _2364 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2350);
        _2348 = _2364;
    }
    float _2366 = _2348;
    float _2368 = _2286 * _2314;
    float _2370 = fma(_2184, _2282, _2356);
    float _2372 = _2282 * _2350;
    bool _2374 = _2328 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2376 = _2284 * _2324;
    float _2378 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2380 = _2304 * _2284;
    float _2382 = fma(_2186, _2282, _2358);
    float _2384 = -_2372;
    float _2386 = fma(_2284, _2314, _2384);
    float _2388 = -_2368;
    float _2390 = fma(_2282, _2324, _2388);
    float _2392 = -_2376;
    float _2394 = fma(_2286, _2350, _2392);
    float _2396 = _1338 + _2378;
    float _2398 = fma(_2188, _2282, _2380);
    float _2400 = fma(_2320, _2286, _2370);
    float _2402 = fma(_2352, _2286, _2382);
    float _2404 = _2390 * _2288;
    float _2406 = _2394 * _2288;
    float _2408 = _2386 * _2288;
    float _2410 = fma(_2354, _2286, _2398);
    if (!_2374)
    {
        _2360 = _2396;
    }
    float _2412 = _2360;
    bool _2414 = !_2374;
    float _2416 = _2412;
    if (!_2414)
    {
        float _2418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2422 = _2328 + _2420;
        float _2424 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = rsqrt(_2310);
        float _2428 = _2422 * _2418;
        float _2430 = _2428 * 0.15915493667125701904296875;
        float _2432 = _2430 * 6.283185482025146484375;
        float _2434 = sin(_2432);
        float _2436 = _2430 * 6.283185482025146484375;
        float _2438 = cos(_2436);
        float _2440 = fma(_2434, _2424, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2442 = _2426 * _2440;
        float _2444 = fma(_2264, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2446 = _2438 + (-1.0);
        float _2448 = fma(_2268, _2442, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2452 = _2444 + _2450;
        float _2454 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2458 = _2448 + _2456;
        float _2460 = _2452 * _2452;
        float _2462 = fma(_2396, _2438, _2454);
        float _2464 = _2458 * _2458;
        _2416 = _2462;
        _2298 = _2460;
        _2300 = _2464;
        _2276 = _2444;
        _2278 = _2448;
    }
    float _2466 = _2416;
    float _2468 = _2298;
    float _2470 = _2300;
    float _2472 = _2276;
    float _2474 = _2278;
    float _2476 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2478 = _2466 + _2476;
    float _2480 = _2294 * _2366;
    float _2482 = _2258 * _2366;
    float _2484 = _2304 * _2366;
    float _2486 = fma(_2478, _2478, _2468);
    float _2488 = _2404 * _2294;
    float _2490 = _2404 * _2258;
    float _2492 = _2404 * _2304;
    float _2494 = _2486 + _2470;
    float _2496 = fma(_2184, _2336, _2480);
    float _2498 = fma(_2186, _2336, _2482);
    float _2500 = fma(_2188, _2336, _2484);
    float _2502 = fma(_2406, _2184, _2488);
    float _2504 = fma(_2406, _2186, _2490);
    float _2506 = sqrt(_2494);
    float _2508 = fma(_2406, _2188, _2492);
    float _2510 = fma(_2320, _2342, _2496);
    float _2512 = fma(_2352, _2342, _2498);
    float _2514 = fma(_2354, _2342, _2500);
    float _2516 = fma(_2408, _2320, _2502);
    float _2518 = fma(_2408, _2352, _2504);
    float _2520 = fma(_2408, _2354, _2508);
    out.m_71.x = _2400;
    out.m_71.y = _2402;
    out.m_71.z = _2410;
    out.m_73.x = _2510;
    out.m_73.y = _2512;
    out.m_73.z = _2514;
    out.m_75.x = _2516;
    out.m_75.y = _2518;
    out.m_75.z = _2520;
    bool _2522 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2524 = isnan(_2506);
    bool _2526 = _2522 || _2524;
    bool _2528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2530 = _2526 || _2528;
    float _2532 = _2520;
    if (!_2530)
    {
        _2362 = 1.0;
    }
    float _2534 = _2362;
    bool _2536 = !_2530;
    float _2538 = _2534;
    if (!_2536)
    {
        bool _2540 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2542 = isnan(_2506);
        bool _2544 = _2540 || _2542;
        bool _2546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2548 = _2544 || _2546;
        if (!_2548)
        {
            float _2550 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2552 = _2506 + _2550;
            float _2554 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2556 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2554;
            float _2558 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2562 = 1.0 / _2556;
            float _2564 = _2552 * _2562;
            float _2566 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2538 = _2566;
            _2568 = true;
        }
        else
        {
            bool _2570 = _2506 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2572 = isnan(_2506);
            bool _2574 = _2570 || _2572;
            bool _2576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2578 = _2574 || _2576;
            if (!_2578)
            {
                float _2580 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2582 = _2506 + _2580;
                float _2584 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2586 = _2584 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2588 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2590 = _2588 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2592 = 1.0 / _2586;
                float _2594 = _2582 * _2592;
                float _2596 = fma(_2594, _2590, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2538 = _2596;
                _2568 = true;
            }
            else
            {
                _2538 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2568 = false;
    float _2598 = _2538;
    float _2600 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2602 = _2466 + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2606 = _2472 + _2604;
    float _2608 = fma(_2602, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2610 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2612 = _2474 + _2610;
    float _2614 = fma(_2606, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2616 = -_1966;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2608);
    float _2620 = fma(_2612, _2598, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2622 = -_1968;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2614);
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2628 = _2618 + _2626;
    float _2630 = -_1980;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2620);
    float _2634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2636 = _2624 + _2634;
    float _2638 = _2628 * _2628;
    float _2640 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2642 = _2632 + _2640;
    float _2644 = fma(_2636, _2636, _2638);
    float _2646 = fma(_2642, _2642, _2644);
    float _2648 = rsqrt(_2646);
    float _2650 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2652 = _2636 * _2650;
    float _2654 = _2642 * _2650;
    float _2656 = _2652 * _2652;
    float _2658 = _2654 * _2654;
    float _2660 = _2656 + _2658;
    float _2662 = sqrt(_2660);
    bool _2664 = _2662 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2668 = _2662 + _2666;
    float _2670 = _2644;
    float _2672 = _2668;
    float _2674 = _2628;
    float _2676 = _2652;
    float _2678 = _2650;
    if (_2664)
    {
        float _2680 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2670 = _2680;
    }
    float _2682 = _2670;
    float _2684 = _2682;
    if (_2664)
    {
        float _2686 = _2668 * _2682;
        _2672 = _2686;
    }
    float _2688 = _2672;
    if (_2664)
    {
        float _2690 = rsqrt(_2660);
        _2684 = _2690;
    }
    float _2692 = _2684;
    float _2694 = _2692;
    if (_2664)
    {
        float _2696 = _2688 * 0.15915493667125701904296875;
        _2532 = _2696;
    }
    float _2698 = _2532;
    float _2700 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2702 = _2648;
    if (_2664)
    {
        float _2704 = _2698 * 6.283185482025146484375;
        float _2706 = sin(_2704);
        _2702 = _2706;
    }
    float _2708 = _2702;
    float _2710 = precise::max(0.0, _2700);
    float _2712 = _2642;
    float _2714 = _2710;
    if (_2664)
    {
        float _2716 = _2698 * 6.283185482025146484375;
        float _2718 = cos(_2716);
        _2712 = _2718;
    }
    float _2720 = _2712;
    float _2722 = -_2650;
    float _2724 = -_2710;
    float _2726 = fma(_2628, _2722, _2724);
    float _2728 = _2726;
    if (_2664)
    {
        float _2730 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2674 = _2730;
    }
    float _2732 = _2674;
    float _2734 = _2708;
    float _2736 = _2732;
    if (_2664)
    {
        float _2738 = fma(_2708, _2732, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2734 = _2738;
    }
    float _2740 = _2734;
    if (!_2664)
    {
        _2736 = _2656;
    }
    float _2742 = _2736;
    float _2744 = _2742;
    if (_2664)
    {
        float _2746 = _2692 * _2740;
        _2338 = _2746;
    }
    float _2748 = _2338;
    if (!_2664)
    {
        _2694 = _2654;
    }
    float _2750 = _2694;
    float _2752 = sqrt(_2646);
    float _2754 = _2750;
    if (_2664)
    {
        float _2756 = _2720 + (-1.0);
        _2714 = _2756;
    }
    float _2758 = _2714;
    float _2760 = _2758;
    if (_2664)
    {
        float _2762 = _2652 * _2748;
        _2676 = _2762;
    }
    float _2764 = _2676;
    if (_2664)
    {
        float _2766 = _2654 * _2748;
        _2754 = _2766;
    }
    float _2768 = _2754;
    if (_2664)
    {
        float _2770 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2678 = _2770;
    }
    float _2772 = _2678;
    if (_2664)
    {
        float _2774 = _2764 * _2764;
        _2744 = _2774;
    }
    float _2776 = _2744;
    if (!_2664)
    {
        _2760 = _2658;
    }
    float _2778 = _2760;
    float _2780 = _2778;
    if (_2664)
    {
        float _2782 = _2768 * _2768;
        _2780 = _2782;
    }
    float _2784 = _2780;
    if (_2664)
    {
        float _2786 = fma(_2726, _2720, _2772);
        _2728 = _2786;
    }
    float _2788 = _2728;
    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2792 = fma(_2788, _2788, _2776);
    float _2794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2796 = fma(_2752, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2794);
    float _2798 = precise::clamp(_2796, 0.0, 1.0);
    float _2800 = _2792 + _2784;
    float _2802 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2804 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2806 = -_2798;
    float _2808 = _2806 + 1.0;
    float _2810 = rsqrt(_2800);
    float _2812 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2802);
    float _2814 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2816 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2804);
    float _2818 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2820 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2812);
    float _2822 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2814);
    float _2824 = abs(_2808);
    float _2826 = log2(_2824);
    float _2828 = _2820 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2830 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2822);
    float _2832 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2816);
    float _2834 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2818);
    float _2836 = _2828 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2838 = _2830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2840 = _2832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2842 = _2810 * _2764;
    float _2844 = _2810 * _2788;
    float _2846 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2848 = -_2836;
    float _2850 = fma(_2848, _2790, 1.0);
    float _2852 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2854 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2834);
    float _2856 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2846);
    float _2858 = _2810 * _2768;
    float _2860 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2862 = -_2852;
    float _2864 = fma(_2844, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2862);
    float _2866 = _2854 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2868 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2856);
    float _2870 = log2(_2850);
    float _2872 = -_2858;
    float _2874 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2864);
    float _2876 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2878 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2868);
    float _2880 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2882 = fma(_2874, -0.5, 0.5);
    float _2884 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2876);
    float _2886 = fma(_2874, 0.5, 0.5);
    float _2888 = exp2(_2860);
    float _2890 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2880);
    float _2892 = _2844 + 1.0;
    float _2894 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2884);
    float _2896 = fma(_2886, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2898 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2890);
    float _2900 = 1.0 / _2878;
    float _2902 = fma(_2886, _2896, -0.212114393711090087890625);
    float _2904 = _2870 * 0.693147182464599609375;
    float _2906 = fma(_2886, _2902, 1.570728778839111328125);
    float _2908 = sqrt(_2882);
    float _2910 = -_2844;
    float _2912 = fma(_2888, _2892, _2910);
    float _2914 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2894);
    float _2916 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2898);
    float _2918 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2920 = fma(_2912, 0.5, 0.5);
    float _2922 = _2914 * _2900;
    float _2924 = _2916 * _2900;
    float _2926 = fma(_2922, 0.5, 0.5);
    float _2928 = fma(_2924, -0.5, 0.5);
    float _2930 = _2908 * 0.636619746685028076171875;
    float3 _7714 = float3(_2926, _2928, _2918);
    float _2932 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7714, float3(0.0), isnan(_7714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7714, float3(0.0), isnan(_7714)), level(0.0)).x;
    float _2934 = -_2906;
    float _2936 = fma(_2930, _2934, 1.0);
    float3 _7730 = float3(_2926, _2928, _2918);
    float4 _2939 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7730, float3(0.0), isnan(_7730)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7730, float3(0.0), isnan(_7730)), level(0.0)).xyzw;
    float _2941 = _2939.x;
    float _2943 = _2939.y;
    float _2945 = _2939.z;
    float _2947 = _2939.w;
    float2 _7747 = float2(_2936, _2920);
    float3 _2951 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7747, float2(0.0), isnan(_7747)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7747, float2(0.0), isnan(_7747)), level(0.0)).xyz;
    float _2953 = _2951.x;
    float _2955 = _2951.y;
    float _2957 = _2951.z;
    float _2959 = _2826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2961 = _2838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2963 = _366 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2965 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2961);
    float _2967 = exp2(_2959);
    float _2969 = fma(_2828, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2965);
    float _2971 = fma(_2866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2969);
    float _2973 = _2971 + _2878;
    out.gl_Position.x = _2914;
    out.gl_Position.y = _2916;
    out.gl_Position.z = _2971;
    out.gl_Position.w = _2878;
    float _2975 = _2973 * 0.5;
    float _2977 = -_2967;
    float _2979 = _2977 + 1.0;
    float _2981 = _2963 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2983 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2975;
    out.m_77.w = _2878;
    out.m_47.x = _2981;
    float _2985 = _2983 * _2932;
    float _2987 = -_2983;
    float _2989 = _2987 + 1.0;
    float _2991 = _2947 * _2985;
    float _2993 = _2957 * _2985;
    float _2995 = fma(_2953, _2991, _2941);
    float _2997 = fma(_2955, _2991, _2943);
    float _2999 = _2947 * _2989;
    float _3001 = fma(_2947, _2993, _2945);
    out.m_79.x = _2995;
    out.m_79.y = _2997;
    out.m_79.z = _3001;
    out.m_79.w = _2999;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

