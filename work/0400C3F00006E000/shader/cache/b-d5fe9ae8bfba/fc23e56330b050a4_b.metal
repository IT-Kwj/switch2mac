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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_91 [[user(locn14)]];
    float4 m_95 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2337 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2636 = as_type<float>(_134);
        out.gl_Position.z = _2636;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2705 = as_type<float>(_172);
        out.gl_Position.z = _2705;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_55.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _236;
    float _248 = 1.0 / _240;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = _262 * _266;
    float _274 = _212 * _246;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    bool _280 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _282 = isnan(_204);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_262;
    float _294 = _292 + 1.0;
    float _296 = fma(_270, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = _232 * _248;
    bool _302 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_204);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = fma(_316, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = -_312;
    float _326 = _324 + 1.0;
    float _328 = _312 * _294;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _338 = _290 * _326;
    float _340 = -_290;
    float _342 = _340 + 1.0;
    float _344 = fma(_320, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _346 = fma(_332, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _348 = _296 * _338;
    float _350 = _298 * _338;
    float _352 = _322 * _338;
    float _354 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _356 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _350);
    float _358 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = fma(_336, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_344, _328, _354);
    float _376 = fma(_362, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_366, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_346, _328, _356);
    float _382 = fma(_372, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_368, _328, _358);
    float _386 = fma(_376, _272, _374);
    float _388 = fma(_378, _272, _380);
    float _390 = fma(_382, _272, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_55.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _152 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_55.z;
    float _430 = in.m_55.w;
    float _432 = in.m_55.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _436 = _434 != 0;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_436)
    {
        float _442 = in.m_55.x;
        _440 = _442;
    }
    float _444 = _440;
    float _446 = _428 * 2.0;
    float _448 = _432 * 2.0;
    float _450 = _432 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _452 = floor(_446);
    float _454 = fma(_450, -2.0, _438);
    int _456 = as_type<int>(_450);
    if (_436)
    {
        _456 = 0;
    }
    int _458 = _456;
    float _460 = floor(_448);
    bool _462 = _452 >= 0.0;
    bool _464 = isnan(_452);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    bool _472 = _452 > 0.0;
    float _474 = _452;
    int _476 = _458;
    if (_436)
    {
        _474 = _432;
    }
    float _478 = _474;
    int _480 = _470 ? 0 : 1;
    bool _482 = _460 >= 0.0;
    bool _484 = isnan(_460);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _460 > 0.0;
    int _494 = _490 ? 0 : 1;
    float _496 = _460;
    float _498 = _444;
    float _500 = _478;
    if (_436)
    {
        _496 = _444;
    }
    float _502 = _496;
    float _504 = _502;
    if (!_436)
    {
        float _506 = in.m_55.x;
        float _508 = _432 * 3.1415927410125732421875;
        float _510 = _508 * 0.15915493667125701904296875;
        float _512 = _510 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _506 * 3.1415927410125732421875;
        float _518 = _516 * 0.15915493667125701904296875;
        float _520 = _518 * 6.283185482025146484375;
        float _522 = sin(_520);
        _476 = 1;
        _498 = _506;
        _500 = _514;
        _504 = _522;
    }
    int _524 = _476;
    float _526 = _498;
    float _528 = _500;
    float _530 = _504;
    bool _532 = _524 != 1;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _536 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _538 = ~_494;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _526 * 2.0;
    int _546 = _542;
    if (!_492)
    {
        int _548 = ~_494;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    float _554 = -_534;
    float _556 = fma(_536, 2.0, _554);
    float _558 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _454);
    float _560 = floor(_544);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _566 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[93].w, _562);
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _578 = _576 != 0;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _582 = _528 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _584 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[93].z, _564);
    float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _588 = log2(_586);
    float _590 = _530 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _594 = _432 + _526;
    float _596 = fma(_582, -2.0, _580);
    int _598 = ~_480;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = -_592;
    float _606 = fma(_590, 2.0, _604);
    float _608 = _594 + (-1.0);
    float _610 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _526);
    int _612 = _602;
    float _614 = _590;
    float _616 = _594;
    if (!_472)
    {
        int _618 = ~_480;
        int _620 = _618 + 1;
        _612 = _620;
    }
    int _622 = _612;
    float _624 = _428 + _526;
    if (!_532)
    {
        _614 = _432;
    }
    float _626 = _614;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _630 = _626;
    if (!_532)
    {
        _616 = _428;
    }
    float _632 = _616;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _636 = _624 + (-1.0);
    float _638 = _632;
    if (_532)
    {
        _630 = _526;
    }
    float _640 = _630;
    float _642 = _588 * _152;
    float _644 = _640;
    if (_532)
    {
        _638 = _432;
    }
    float _646 = _638;
    float _648 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[83].z, _628);
    bool _652 = _560 > 0.0;
    float _654 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[83].w, _634);
    bool _656 = _560 >= 0.0;
    bool _658 = isnan(_560);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _668 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _654);
    float _670 = _646;
    if (!_532)
    {
        _644 = _432;
    }
    float _672 = _644;
    float _674 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].z, _584);
    float _676 = _672;
    if (!_532)
    {
        _670 = _428;
    }
    float _678 = _670;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _682 = exp2(_642);
    float _684 = _678;
    if (_532)
    {
        _676 = _526;
    }
    float _686 = _676;
    float _688 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].w, _566);
    if (_532)
    {
        _684 = _432;
    }
    float _690 = _684;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _694 = !_570;
    int _696 = _694 ? 0 : 1;
    float _698 = _686 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _700 = _664 ? 0 : 1;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _704 = -_692;
    float _706 = fma(_698, 2.0, _704);
    int _708 = abs(_696);
    float _710 = fma(_702, -2.0, _680);
    int _712 = ~_700;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = in.m_57.x;
    float _720 = in.m_57.y;
    float _722 = in.m_57.z;
    int _724 = _716;
    if (!_652)
    {
        int _726 = ~_700;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = -_682;
    float _734 = _732 + 1.0;
    bool _736 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _738 = isnan(1.0);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _744 = _740 || _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _748 = 1.0 + _746;
    float _750 = float(_622);
    float _752 = -_152;
    float _754 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[76].x, _556);
    float _756 = float(_708);
    float _758 = -_152;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[91].x, _606);
    float _762 = 1.0 / _748;
    float _764 = _756 * _750;
    bool _766 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _774 = _770 || _772;
    float _776 = in.m_59.x;
    float _778 = in.m_59.y;
    float _780 = in.m_59.z;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _786 = _774 ? _734 : 0.0;
    float _788 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _650);
    float _790 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _782);
    float _792 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[78].w, _784);
    bool _794 = !_574;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[91].y, _596);
    float _800 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _790);
    bool _802 = !_578;
    int _804 = _802 ? 0 : 1;
    float _806 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _792);
    float _808 = -_152;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _706);
    float _812 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _710);
    int _814 = abs(_796);
    float _816 = _800;
    float _818 = _788;
    if (_744)
    {
        float _820 = _786 * _762;
        _156 = _820;
    }
    float _822 = _156;
    float _824 = _764 * (-2.0);
    int _826 = abs(_804);
    float _828 = _526 + (-0.5);
    float _830 = float(_552);
    float _832 = fma(_648, _824, _648);
    float _834 = fma(_824, _718, _718);
    float _836 = float(_826);
    float _838 = _610 + _780;
    float _840 = float(_814);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    float _844 = float(_730);
    float _846 = _836 * _830;
    float _848 = _838 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _850 = fma(_832, _822, _842);
    float _852 = _432 + _428;
    float _854 = _840 * _844;
    float _856 = _846 * (-2.0);
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _848 * 0.15915493667125701904296875;
    float _866 = _428 + (-0.5);
    float _868 = fma(_856, _722, _722);
    float _870 = in.m_63.x;
    float _872 = _854 * (-2.0);
    float _874 = _852 + (-1.0);
    float _876 = _864 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[196].z, _868);
    float _882 = fma(_872, _720, _720);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _886 = _432 + (-0.5);
    float _888 = fma(_666, _856, _666);
    float _890 = _850 * 0.15915493667125701904296875;
    float _892 = fma(_884, _872, _884);
    float _894 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[196].y, _882);
    float _896 = fma(_888, _822, _880);
    float _898 = _890 * 6.283185482025146484375;
    float _900 = sin(_898);
    float _902 = fma(_892, _822, _894);
    float _904 = _896 * 0.15915493667125701904296875;
    float _906 = _902 * 0.15915493667125701904296875;
    float _908 = _396 * _862;
    float _910 = _878 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _912 = _890 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _870 * _870;
    float _918 = _394 * _860;
    float _920 = _392 * _858;
    float _922 = fma(_910, 0.300000011920928955078125, _776);
    float _924 = fma(_910, _916, _778);
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _928 = in.m_48.x;
    float _930 = in.m_48.y;
    float _932 = in.m_48.z;
    float _934 = _906 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _922);
    float _946 = _926 * _940;
    float _948 = _906 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _944 * _938;
    float _954 = _904 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _924);
    float _960 = _958 * _942;
    float _962 = _900 * _936;
    float _964 = _930 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _966 = _904 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _914 * _950;
    float _972 = _900 * _950;
    float _974 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[6].x, _964);
    float _976 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[6].z, _974);
    float _978 = _914 * _956;
    float _980 = _914 * _936;
    float _982 = _900 * _956;
    float _984 = _950 * _956;
    float _986 = _936 * _956;
    float _988 = _976 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _990 = fma(_968, _970, _962);
    float _992 = fma(_968, _962, _970);
    float _994 = _960 * _978;
    float _996 = -_980;
    float _998 = fma(_968, _972, _996);
    float _1000 = -_972;
    float _1002 = fma(_968, _980, _1000);
    float _1004 = -_960;
    float _1006 = _968 * _1004;
    float _1008 = fma(_990, _952, _994);
    float _1010 = _960 * _982;
    float _1012 = _930 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1014 = fma(_952, _984, _1006);
    float _1016 = fma(_946, _1002, _1008);
    float _1018 = fma(_952, _998, _1010);
    float _1020 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1012);
    float _1022 = fma(_946, _986, _1014);
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1028 = fma(_992, _946, _1018);
    float _1030 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1020);
    float _1032 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1024);
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1026);
    float _1036 = _930 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1032);
    float _1042 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1034);
    float _1044 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1036);
    float _1046 = _988 + _1040;
    float _1048 = _1038 + _1042;
    float _1050 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1044);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1054 = _1046 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1058 = _1048 + _1056;
    float _1060 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1054 * _1054;
    float _1064 = fma(_1058, _1058, _1062);
    float _1066 = sqrt(_1064);
    bool _1068 = _1066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1072 = _1066 + _1070;
    float _1074 = _1030;
    float _1076 = _1072;
    float _1078 = _1024;
    float _1080 = _1050;
    float _1082 = _932;
    float _1084 = _1042;
    float _1086 = _988;
    float _1088 = _780;
    if (_1068)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1074 = _1090;
    }
    float _1092 = _1074;
    if (_1068)
    {
        float _1094 = _1072 * _1092;
        _1076 = _1094;
    }
    float _1096 = _1076;
    if (_1068)
    {
        float _1098 = _1096 * 0.15915493667125701904296875;
        _1078 = _1098;
    }
    float _1100 = _1078;
    float _1102 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1104 = _1092;
    if (_1068)
    {
        float _1106 = _1100 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        _1104 = _1108;
    }
    float _1110 = _1104;
    float _1112 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1102);
    float _1114 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1112);
    float _1116 = _928;
    if (_1068)
    {
        float _1118 = _1100 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        _1116 = _1120;
    }
    float _1122 = _1116;
    float _1124 = _1060 + _1114;
    float _1126 = _1124;
    if (_1068)
    {
        float _1128 = _1124 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1080 = _1128;
    }
    float _1130 = _1080;
    float _1132 = _1102;
    float _1134 = _1130;
    if (_1068)
    {
        float _1136 = rsqrt(_1064);
        _1132 = _1136;
    }
    float _1138 = _1132;
    if (_1068)
    {
        float _1140 = _1110 + (-1.0);
        _1082 = _1140;
    }
    float _1142 = _1082;
    float _1144 = _1142;
    if (_1068)
    {
        float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = _1122;
    float _1152 = _1148;
    if (_1068)
    {
        float _1154 = fma(_1122, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1084 = _1154;
    }
    float _1156 = _1084;
    if (!_1068)
    {
        _1134 = _1124;
    }
    float _1158 = _1134;
    float _1160 = _1158;
    if (_1068)
    {
        float _1162 = fma(_1124, _1110, _1148);
        _1160 = _1162;
    }
    float _1164 = _1160;
    if (!_1068)
    {
        _1150 = _1048;
    }
    float _1166 = _1150;
    float _1168 = _1166;
    if (!_1068)
    {
        _1152 = _1046;
    }
    float _1170 = _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1164 + _1172;
    float _1176 = _1138;
    float _1178 = _1170;
    float _1180 = _1174;
    if (_1068)
    {
        float _1182 = _1138 * _1156;
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = _1174 * _1174;
    if (_1068)
    {
        float _1188 = fma(_1058, _1184, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1168 = _1188;
    }
    float _1190 = _1168;
    if (_1068)
    {
        float _1192 = fma(_1054, _1184, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1178 = _1192;
    }
    float _1194 = _1178;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1190 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1194 + _1200;
    float _1204 = fma(_1198, _1198, _1186);
    float _1206 = fma(_1202, _1202, _1204);
    float _1208 = rsqrt(_1206);
    float _1210 = sqrt(_1206);
    float _1212 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1214 = _1198 * _1212;
    float _1216 = _1202 * _1212;
    float _1218 = _1214 * _1214;
    float _1220 = _1216 * _1216;
    float _1222 = _1218 + _1220;
    float _1224 = sqrt(_1222);
    bool _1226 = _1224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1224 + _1228;
    float _1232 = _1204;
    float _1234 = _1230;
    float _1236 = _1214;
    if (_1226)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = _1240;
    if (_1226)
    {
        float _1244 = _1230 * _1240;
        _1234 = _1244;
    }
    float _1246 = _1234;
    if (_1226)
    {
        float _1248 = rsqrt(_1222);
        _1242 = _1248;
    }
    float _1250 = _1242;
    float _1252 = _1250;
    if (_1226)
    {
        float _1254 = _1246 * 0.15915493667125701904296875;
        _1126 = _1254;
    }
    float _1256 = _1126;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = _1208;
    float _1262 = _1256;
    if (_1226)
    {
        float _1264 = _1256 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        _1260 = _1266;
    }
    float _1268 = _1260;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1272 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1270);
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = precise::max(0.0, _1258);
    float _1278 = -_1274;
    float _1280 = _1278 + 1.0;
    float _1282 = _1202;
    if (_1226)
    {
        float _1284 = _1256 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = -_1212;
    float _1292 = -_1276;
    float _1294 = fma(_1174, _1290, _1292);
    float _1296 = _1294;
    if (_1226)
    {
        float _1298 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1180 = _1298;
    }
    float _1300 = _1180;
    float _1302 = abs(_1280);
    float _1304 = log2(_1302);
    float _1306 = _1268;
    float _1308 = _1300;
    if (_1226)
    {
        float _1310 = fma(_1268, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1312;
    if (!_1226)
    {
        _1262 = _1216;
    }
    float _1316 = _1262;
    float _1318 = _1316;
    if (_1226)
    {
        float _1320 = _1250 * _1312;
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = _1288;
    if (_1226)
    {
        float _1326 = _1288 + (-1.0);
        _1308 = _1326;
    }
    float _1328 = _1308;
    float _1330 = _1328;
    if (_1226)
    {
        float _1332 = _1214 * _1322;
        _1236 = _1332;
    }
    float _1334 = _1236;
    if (_1226)
    {
        float _1336 = _1216 * _1322;
        _1318 = _1336;
    }
    float _1338 = _1318;
    float _1340 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1226)
    {
        float _1342 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1342;
    }
    float _1344 = _1252;
    if (!_1226)
    {
        _1330 = _1218;
    }
    float _1346 = _1330;
    float _1348 = _1346;
    if (_1226)
    {
        float _1350 = _1334 * _1334;
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1340);
    if (_1226)
    {
        float _1356 = fma(_1294, _1288, _1344);
        _1296 = _1356;
    }
    float _1358 = _1296;
    if (!_1226)
    {
        _1324 = _1220;
    }
    float _1360 = _1324;
    float _1362 = _1360;
    if (_1226)
    {
        float _1364 = _1338 * _1338;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1370 = fma(_1358, _1358, _1352);
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1374 = _1370 + _1366;
    float _1376 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1380 = rsqrt(_1374);
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1384 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1386 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1382);
    float _1388 = floor(_1378);
    float _1390 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1392 = _1380 * _1334;
    float _1394 = _1380 * _1338;
    float _1396 = _1380 * _1358;
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1402 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1404 = floor(_1384);
    float _1406 = -_1400;
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1406);
    float _1410 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = -_1402;
    float _1414 = fma(_1412, _1398, 1.0);
    float _1416 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1418 = -_1394;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1408);
    float _1422 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1424 = -_1388;
    float _1426 = _1378 + _1424;
    float _1428 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1416);
    float _1430 = fma(_1420, -0.5, 0.5);
    float _1432 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1434 = fma(_1420, 0.5, 0.5);
    float _1436 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1428);
    float _1438 = log2(_1414);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1442 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1448 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = -_1404;
    float _1454 = _1384 + _1452;
    float _1456 = sqrt(_1430);
    float _1458 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1462 = fma(_1434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1464 = _1396 + 1.0;
    float _1466 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1470 = fma(_1434, _1462, -0.212114393711090087890625);
    float _1472 = exp2(_1446);
    float _1474 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float2 _4798 = float2(_1426, _1454);
    float _1478 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4798, float2(0.0), isnan(_4798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4798, float2(0.0), isnan(_4798)), level(0.0)).x;
    float _1480 = fma(_1434, _1470, 1.570728778839111328125);
    float _1482 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1474);
    float _1484 = 1.0 / _1468;
    float _1486 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1488 = _1438 * 0.693147182464599609375;
    float _1490 = _1456 * 0.636619746685028076171875;
    float _1492 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1486);
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1496 = -_1480;
    float _1498 = fma(_1490, _1496, 1.0);
    float _1500 = -_1396;
    float _1502 = fma(_1472, _1464, _1500);
    float _1504 = fma(_1190, 6.2500002968590706586837768554688e-05, 0.5);
    float _1506 = fma(_1194, 6.2500002968590706586837768554688e-05, 0.5);
    float _1508 = _1476 * _1484;
    float _1510 = _1492 * _1484;
    float _1512 = fma(_1502, 0.5, 0.5);
    float _1514 = fma(_1508, 0.5, 0.5);
    float _1516 = fma(_1510, -0.5, 0.5);
    float3 _4868 = float3(_1514, _1516, _1494);
    float _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).x;
    float3 _4879 = float3(_1514, _1516, _1494);
    float4 _1521 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4879, float3(0.0), isnan(_4879)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4879, float3(0.0), isnan(_4879)), level(0.0)).xyzw;
    float _1523 = _1521.x;
    float _1525 = _1521.y;
    float _1527 = _1521.z;
    float _1529 = _1521.w;
    float2 _4895 = float2(_1498, _1512);
    float3 _1533 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4895, float2(0.0), isnan(_4895)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4895, float2(0.0), isnan(_4895)), level(0.0)).xyz;
    float _1535 = _1533.x;
    float _1537 = _1533.y;
    float _1539 = _1533.z;
    float2 _4909 = float2(_1504, _1506);
    float3 _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4909, float2(0.0), isnan(_4909)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4909, float2(0.0), isnan(_4909)), level(0.0)).xyz;
    float _1543 = _1541.x;
    float _1545 = _1541.y;
    float _1547 = _1541.z;
    float _1549 = in.m_65.y;
    bool _1551 = _428 > 0.5;
    float _1553 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _870;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1557 = _1555 != 0;
    out.m_69.x = _1190;
    out.m_69.y = _1164;
    out.m_69.z = _1194;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1565 = _1563 != 0;
    bool _1567 = _430 > 0.5;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1575 = _1573 != 0;
    float _1577 = 1.0 / _1561;
    float _1579 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1583 = _1581 != 0;
    float _1585 = 0.0;
    bool _1587 = _1583;
    bool _1589 = _1567;
    float _1591 = _1468;
    float _1593 = _1492;
    if (_1557)
    {
        float _1595 = in.m_55.x;
        _1585 = _1595;
    }
    float _1597 = _1585;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1599;
    bool _1603 = _432 > 0.5;
    float _1605 = -_1549;
    float _1607 = _1605 + 1.0;
    float _1609 = 1.0 / _1571;
    float _1611 = 0.0;
    float _1613 = _1549;
    if (_1565)
    {
        float _1615 = in.m_55.z;
        _1611 = _1615;
    }
    float _1617 = _1611;
    float _1619 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1623 = _1621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1625 = _1551 ? as_type<int>(_1607) : as_type<int>(_1549);
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1631 = _1629 != 0;
    float _1633 = _1601 * _1577;
    float _1635 = _1575 ? as_type<float>(_1625) : _1549;
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1641 = _1639 != 0;
    float _1643 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1619);
    float _1645 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1649 = _1603 ? as_type<int>(_1607) : as_type<int>(_1549);
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1653 = _1623 * _1609;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1657 = _1583 ? as_type<float>(_1649) : _1549;
    float _1659 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1557)
    {
        bool _1661 = _1597 > 0.5;
        _1587 = _1661;
    }
    bool _1663 = _1587;
    float _1665 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1667 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1671 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1647);
    float _1673 = in.m_65.x;
    if (_1641)
    {
        float _1675 = _1567 ? _1607 : _1549;
        _1613 = _1675;
    }
    float _1677 = _1613;
    float _1679 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1671);
    out.m_71.x = _1659;
    out.m_71.y = _1665;
    out.m_71.z = _1645;
    int _1681 = as_type<int>(_1679);
    if (_1565)
    {
        bool _1683 = _1617 > 0.5;
        _1589 = _1683;
    }
    bool _1685 = _1589;
    float _1687 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1689 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1693 = fma(_1657, _1687, -0.5);
    float _1695 = _1689 + _1667;
    float _1697 = -_558;
    float _1699 = fma(_806, _1693, _1697);
    float _1701 = 1.0 / _1667;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1705 = _426 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1709 = _426 + _1707;
    float _1711 = fma(_1633, _1705, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1713 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1715 = isnan(_426);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = fma(_1653, _1709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1727 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1729 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1731 = isnan(_426);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1743 = -_1723;
    float _1745 = _1743 + 1.0;
    float _1747 = fma(_1635, _1727, -0.5);
    bool _1749 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1751 = isnan(_426);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1711;
    float _1763 = _1673;
    if (_1631)
    {
        float _1765 = -_1673;
        float _1767 = _1765 + 1.0;
        _1681 = as_type<int>(_1767);
    }
    int _1769 = _1681;
    float _1771 = _1739 * _1745;
    float _1773 = _1695 * _1701;
    float _1775 = _1773 * 0.5;
    float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1779 = -_1739;
    float _1781 = _1779 + 1.0;
    float _1783 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1785 = -_1759;
    float _1787 = _1785 + 1.0;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1789);
    float _1793 = _1759 * _1781;
    int _1795 = as_type<int>(_1781);
    int _1797 = as_type<int>(_1775);
    if (_1557)
    {
        float _1799 = -_1673;
        float _1801 = _1799 + 1.0;
        _1795 = as_type<int>(_1801);
    }
    int _1803 = _1795;
    if (_1565)
    {
        float _1805 = -_1673;
        float _1807 = _1805 + 1.0;
        _1797 = as_type<int>(_1807);
    }
    int _1809 = _1797;
    float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1813 = _1711 * _1793;
    if (!_1557)
    {
        _1086 = _1673;
    }
    float _1815 = _1086;
    float _1817 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1819 = _1815;
    if (!_1565)
    {
        _1761 = _1673;
    }
    float _1821 = _1761;
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1813);
    float _1825 = _1821;
    if (_1557)
    {
        float _1827 = _1663 ? as_type<float>(_1803) : _1673;
        _1819 = _1827;
    }
    float _1829 = _1819;
    float _1831 = -_798;
    float _1833 = fma(_688, _1747, _1831);
    float _1835 = 1.0 / _1791;
    if (_1565)
    {
        float _1837 = _1685 ? as_type<float>(_1809) : _1673;
        _1825 = _1837;
    }
    float _1839 = _1825;
    float _1841 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (_1631)
    {
        float _1843 = _1603 ? as_type<float>(_1769) : _1673;
        _1763 = _1843;
    }
    float _1845 = _1763;
    float _1847 = fma(_1725, _1771, _1823);
    bool _1849 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1851 = isnan(0.5);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1817, _1839, -0.5);
    bool _1861 = _924 != 0.0;
    bool _1863 = isnan(_924);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan(0.0);
    bool _1869 = _1865 || _1867;
    float _1871 = fma(_1841, _1845, -0.5);
    float _1873 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1847);
    float _1875 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1877 = fma(_674, _1871, _760);
    bool _1879 = _922 == 0.0;
    bool _1881 = !_1869;
    bool _1883 = _1879 && _1881;
    float _1885 = in.m_73.x;
    float _1887 = in.m_73.y;
    float _1889 = in.m_73.z;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1893 = _1835 * _1891;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1897 = _780 == 0.0;
    bool _1899 = _1897 && _1883;
    float _1901 = abs(_1893);
    float _1903 = log2(_1901);
    float _1905 = fma(_1875, _1829, -0.5);
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (!_1857)
    {
        _1911 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1913 = _1911;
    float _1915 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1917 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1919 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1921 = _1873 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1923 = fma(_800, _1905, _754);
    float _1925 = _1917;
    float _1927 = _1915;
    if (!_1857)
    {
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1931 = _1913 + _1929;
        _816 = _1931;
    }
    float _1933 = _816;
    float _1935 = _1877 + 0.5;
    float _1937 = _1833 + 0.5;
    float _1939 = fma(_788, _1859, _810);
    out.m_75.x = _1915;
    out.m_75.y = _1917;
    out.m_75.z = _1919;
    out.m_75.w = _1921;
    float _1941 = _1933;
    float _1943 = _1937;
    if (!_1857)
    {
        float _1945 = 1.0 / _1933;
        _818 = _1945;
    }
    float _1947 = _818;
    float _1949 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_77.x = _1935;
    out.m_77.y = _1937;
    float _1951 = fma(_1783, _1677, -0.5);
    float _1953 = _1923 + 0.5;
    float _1955 = _1939 + 0.5;
    float _1957 = _1885;
    float _1959 = _1887;
    if (!_1899)
    {
        float _1961 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1885);
        _1957 = _1961;
    }
    float _1963 = _1957;
    float _1965 = exp2(_1949);
    if (_1857)
    {
        _1941 = 1.0;
    }
    float _1967 = _1941;
    float _1969 = -_812;
    float _1971 = fma(_668, _1951, _1969);
    float _1973 = _1699 + 0.5;
    float _1975 = _1967;
    if (_1899)
    {
        _1925 = _1889;
    }
    float _1977 = _1925;
    float _1979 = _1971 + 0.5;
    float _1981 = _1977;
    if (_1899)
    {
        _1927 = _1887;
    }
    float _1983 = _1927;
    float _1985 = _1983;
    if (!_1899)
    {
        float _1987 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1985 = _1987;
    }
    float _1989 = _1985;
    if (_1899)
    {
        _1943 = _1977;
    }
    float _1991 = _1943;
    float _1993 = exp2(_1553);
    float _1995 = _1991;
    if (!_1899)
    {
        _1981 = _1889;
    }
    float _1997 = _1981;
    float _1999 = _978 * _1989;
    float _2001 = _1997;
    if (!_1899)
    {
        _1959 = _1989;
    }
    float _2003 = _1959;
    out.m_79.x = _1953;
    out.m_79.y = _1973;
    out.m_79.z = _1955;
    out.m_79.w = _1979;
    if (!_1899)
    {
        float _2005 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (!_1857)
    {
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2011 = _1893 + _2009;
        _1088 = _2011;
    }
    float _2013 = _1088;
    float _2015 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    if (!_1857)
    {
        float _2019 = _2013 * _1947;
        float _2021 = precise::clamp(_2019, 0.0, 1.0);
        _1975 = _2021;
    }
    float _2023 = _1975;
    if (!_1899)
    {
        _2001 = _2007;
    }
    float _2025 = _2001;
    float _2027 = _2003 * _2003;
    float _2029 = fma(_2017, -2.0, 3.0);
    float _2031 = _2017 * _2017;
    bool _2033 = _1893 <= 8000.0;
    bool _2035 = isnan(_1893);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(8000.0);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = fma(_2025, _2025, _2027);
    float _2047 = fma(_990, _1963, _1999);
    float _2049 = _2031 * _2029;
    float _2051 = -_1989;
    float _2053 = _968 * _2051;
    float _2055 = _982 * _1989;
    float _2057 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2059 = rsqrt(_2045);
    float _2061 = -_2049;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_984, _1963, _2053);
    float _2067 = fma(_998, _1963, _2055);
    float _2069 = _990 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2071 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2049);
    float _2073 = fma(_986, _2007, _2065);
    float _2075 = fma(_1002, _2007, _2047);
    float _2077 = fma(_992, _2007, _2067);
    float _2079 = _2043 * _2071;
    float _2081 = _990 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2083 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2069);
    float _2085 = _990 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2087 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2057);
    float _2089 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2081);
    float _2091 = -_1993;
    float _2093 = _2091 + 1.0;
    float _2095 = _2059 * _2003;
    float _2097 = _2059 * _2025;
    float _2099 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2083);
    float _2101 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2089);
    float _2103 = -_2095;
    float _2105 = _1002 * _2103;
    float _2107 = -_2095;
    float _2109 = _986 * _2107;
    float _2111 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2085);
    float _2113 = -_2095;
    float _2115 = _992 * _2113;
    float _2117 = fma(_978, _2097, _2105);
    float _2119 = -_968;
    float _2121 = fma(_2119, _2097, _2109);
    float _2123 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2111);
    float _2125 = in.m_81.x;
    float _2127 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2129 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2131 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2133 = fma(_982, _2097, _2115);
    float _2135 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2127);
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2129);
    float _2139 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2131);
    out.m_83.x = _2123;
    out.m_83.y = _2099;
    out.m_83.z = _2101;
    float _2141 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2087);
    float _2143 = _1476 + _1468;
    float _2145 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2149 = _2143 * 0.5;
    bool _2151 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2153 = isnan(_1210);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2159 = _2155 || _2157;
    float _2161 = _2147 + _1468;
    out.gl_Position.x = _1476;
    out.gl_Position.y = _1492;
    out.gl_Position.z = _2147;
    out.gl_Position.w = _1468;
    float _2163 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2135);
    float _2165 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2167 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2139);
    float _2169 = _1468 * 0.5;
    float _2171 = _2161 * 0.5;
    float _2173 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2175 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2177 = fma(_1492, -0.5, _2169);
    float _2179 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2181 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2183 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2173);
    out.m_85.x = _2149;
    out.m_85.y = _2177;
    out.m_85.z = _2171;
    out.m_85.w = _1468;
    float _2185 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2175);
    float _2187 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2181);
    float _2189 = -_2145;
    float _2191 = _2189 + 1.0;
    float _2193 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2183);
    float _2195 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2185);
    float _2197 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2187);
    out.m_87.x = _2163;
    out.m_87.y = _2165;
    out.m_87.z = _2167;
    float _2199 = _2147;
    float _2201 = _2165;
    float _2203 = _2163;
    float _2205 = _2191;
    if (!_2159)
    {
        _1591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2207 = _1591;
    float _2209 = _2207;
    float _2211 = _2207;
    if (!_2159)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2213 = _2199;
    out.m_89.x = _2193;
    out.m_89.y = _2195;
    out.m_89.z = _2197;
    float _2215 = _2213;
    float _2217 = _2213;
    if (!_2159)
    {
        _1593 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2219 = _1593;
    float _2221 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2223 = _2219;
    float _2225 = _2219;
    if (!_2159)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2227 = _2201;
    float _2229 = _2227;
    float _2231 = _2227;
    if (!_2159)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2233 = _2203;
    float _2235 = -_1478;
    float _2237 = _2235 + 1.0;
    float _2239 = _2237 * _2179;
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = -_2241;
    float _2245 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2247 = _2245 * _2125;
    float _2249 = _2247 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _2249;
    float _2251 = _2145 * _1518;
    float _2253 = _1529 * _2191;
    float _2255 = _2233;
    float _2257 = _2233;
    if (!_2159)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2259 = _2205;
    float _2261 = _1529 * _2251;
    float _2263 = _1539 * _2251;
    float _2265 = fma(_1535, _2261, _1523);
    float _2267 = fma(_1537, _2261, _1525);
    float _2269 = fma(_1529, _2263, _1527);
    out.m_93.x = _1543;
    out.m_93.y = _1545;
    out.m_93.z = _1547;
    out.m_95.x = _2265;
    out.m_95.y = _2267;
    out.m_95.z = _2269;
    out.m_95.w = _2253;
    bool _2271 = !_2159;
    float _2273 = _2259;
    float _2275 = _2259;
    if (!_2271)
    {
        bool _2277 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2279 = isnan(_1210);
        bool _2281 = _2277 || _2279;
        bool _2283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2285 = _2281 || _2283;
        if (!_2285)
        {
            float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2289 = _1210 + _2287;
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2299 = 1.0 / _2293;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2317 = _2289 * _2299;
            float _2319 = precise::clamp(_2317, 0.0, 1.0);
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2325 = fma(_2319, _2297, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2327 = fma(_2319, _2303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2329 = fma(_2319, _2323, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2331 = fma(_2319, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2333 = fma(_2319, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2335 = fma(_2319, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2257 = _2329;
            _2225 = _2333;
            _2231 = _2327;
            _2217 = _2325;
            _2211 = _2331;
            _2275 = _2335;
            _2337 = true;
        }
        else
        {
            bool _2339 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2341 = isnan(_1210);
            bool _2343 = _2339 || _2341;
            bool _2345 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2347 = _2343 || _2345;
            if (!_2347)
            {
                _2229 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2349 = _2229;
            _2231 = _2349;
            if (!_2347)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2351 = _2255;
            _2257 = _2351;
            if (!_2347)
            {
                _2209 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2353 = _2209;
            _2211 = _2353;
            if (!_2347)
            {
                _2215 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2355 = _2215;
            _2217 = _2355;
            if (!_2347)
            {
                _2223 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2357 = _2223;
            _2225 = _2357;
            if (!_2347)
            {
                _2273 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2359 = _2273;
            bool _2361 = !_2347;
            _2275 = _2359;
            if (!_2361)
            {
                bool _2363 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2365 = isnan(_1210);
                bool _2367 = _2363 || _2365;
                bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2371 = _2367 || _2369;
                if (!_2371)
                {
                    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2375 = _1210 + _2373;
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2385 = 1.0 / _2379;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2403 = _2375 * _2385;
                    float _2405 = precise::clamp(_2403, 0.0, 1.0);
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2411 = fma(_2405, _2383, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2413 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2415 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2257 = _2415;
                    _2225 = _2419;
                    _2231 = _2413;
                    _2217 = _2411;
                    _2211 = _2417;
                    _2275 = _2421;
                    _2337 = true;
                }
                else
                {
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2225 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2231 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2217 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2211 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2275 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2337 = false;
    float _2423 = _2257;
    float _2425 = _2225;
    float _2427 = _2231;
    float _2429 = _2217;
    float _2431 = _2211;
    float _2433 = _2275;
    float _2435 = fma(_2195, -0.5, 0.5);
    float _2437 = precise::clamp(_2435, 0.0, 1.0);
    float _2439 = -_2423;
    float _2441 = _2439 + _2425;
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    out.m_97.x = 0.0;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = fma(_2437, _2441, _2423);
    float _2453 = fma(_2437, _2445, _2427);
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = _2451 * 0.586610972881317138671875;
    float _2459 = fma(_2437, _2449, _2431);
    float _2461 = _2221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = fma(_2453, 0.298911988735198974609375, _2457);
    bool _2465 = _2023 > 0.0;
    bool _2467 = isnan(_2023);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.0);
    bool _2473 = _2469 || _2471;
    float _2475 = fma(_2459, 0.114477999508380889892578125, _2463);
    out.m_51.x = _2461;
    float _2477 = -_2475;
    float _2479 = _2451 + _2477;
    float _2481 = -_2475;
    float _2483 = _2453 + _2481;
    float _2485 = -_2475;
    float _2487 = _2459 + _2485;
    float _2489 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    float _2491 = fma(_2483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    float _2493 = fma(_2487, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    bool _2495 = !_2455;
    if (!_2495)
    {
        float _2497 = -_1164;
        float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2501 = -_1190;
        float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2505 = -_1194;
        float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2509 = _2499 * _2499;
        float _2511 = fma(_2503, _2503, _2509);
        float _2513 = fma(_2507, _2507, _2511);
        float _2515 = sqrt(_2513);
        float _2517 = rsqrt(_2513);
        float _2519 = -_2515;
        float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2523 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2525 = precise::clamp(_2523, 0.0, 1.0);
        float _2527 = _2503 * _2517;
        float _2529 = _2499 * _2517;
        float _2531 = abs(_2525);
        float _2533 = log2(_2531);
        float _2535 = _2507 * _2517;
        float _2537 = _2527 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2539 = _2195 * _2529;
        float _2541 = -_2529;
        float _2543 = -_2537;
        float _2545 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2543);
        float _2547 = fma(_2193, _2527, _2539);
        float _2549 = -_2535;
        float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2545);
        float _2553 = fma(_2197, _2535, _2547);
        float _2555 = precise::clamp(_2553, 0.0, 1.0);
        float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2559 = _2551 + _2557;
        float _2561 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2563 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2565 = precise::clamp(_2563, 0.0, 1.0);
        float _2567 = exp2(_2561);
        float _2569 = _2567 * _2565;
        float _2571 = _2555 * _2569;
        float _2573 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2575 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2577 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2573;
        out.m_97.y = _2575;
        out.m_97.z = _2577;
    }
    out.m_99.x = _2491;
    out.m_99.y = _2489;
    out.m_99.z = _2493;
    if (_2473)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2579 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2579;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2337 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2636 = as_type<float>(_134);
        out.gl_Position.z = _2636;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2705 = as_type<float>(_172);
        out.gl_Position.z = _2705;
    }
    if (_166)
    {
        return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_55.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _236;
    float _248 = 1.0 / _240;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = _262 * _266;
    float _274 = _212 * _246;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    bool _280 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _282 = isnan(_204);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_262;
    float _294 = _292 + 1.0;
    float _296 = fma(_270, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = _232 * _248;
    bool _302 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_204);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = fma(_316, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = -_312;
    float _326 = _324 + 1.0;
    float _328 = _312 * _294;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _338 = _290 * _326;
    float _340 = -_290;
    float _342 = _340 + 1.0;
    float _344 = fma(_320, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _346 = fma(_332, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _348 = _296 * _338;
    float _350 = _298 * _338;
    float _352 = _322 * _338;
    float _354 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _356 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _350);
    float _358 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = fma(_336, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_344, _328, _354);
    float _376 = fma(_362, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_366, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_346, _328, _356);
    float _382 = fma(_372, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_368, _328, _358);
    float _386 = fma(_376, _272, _374);
    float _388 = fma(_378, _272, _380);
    float _390 = fma(_382, _272, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_55.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _152 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_55.z;
    float _430 = in.m_55.w;
    float _432 = in.m_55.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _436 = _434 != 0;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_436)
    {
        float _442 = in.m_55.x;
        _440 = _442;
    }
    float _444 = _440;
    float _446 = _428 * 2.0;
    float _448 = _432 * 2.0;
    float _450 = _432 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _452 = floor(_446);
    float _454 = fma(_450, -2.0, _438);
    int _456 = as_type<int>(_450);
    if (_436)
    {
        _456 = 0;
    }
    int _458 = _456;
    float _460 = floor(_448);
    bool _462 = _452 >= 0.0;
    bool _464 = isnan(_452);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    bool _472 = _452 > 0.0;
    float _474 = _452;
    int _476 = _458;
    if (_436)
    {
        _474 = _432;
    }
    float _478 = _474;
    int _480 = _470 ? 0 : 1;
    bool _482 = _460 >= 0.0;
    bool _484 = isnan(_460);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _460 > 0.0;
    int _494 = _490 ? 0 : 1;
    float _496 = _460;
    float _498 = _444;
    float _500 = _478;
    if (_436)
    {
        _496 = _444;
    }
    float _502 = _496;
    float _504 = _502;
    if (!_436)
    {
        float _506 = in.m_55.x;
        float _508 = _432 * 3.1415927410125732421875;
        float _510 = _508 * 0.15915493667125701904296875;
        float _512 = _510 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _506 * 3.1415927410125732421875;
        float _518 = _516 * 0.15915493667125701904296875;
        float _520 = _518 * 6.283185482025146484375;
        float _522 = sin(_520);
        _476 = 1;
        _498 = _506;
        _500 = _514;
        _504 = _522;
    }
    int _524 = _476;
    float _526 = _498;
    float _528 = _500;
    float _530 = _504;
    bool _532 = _524 != 1;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _536 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _538 = ~_494;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _526 * 2.0;
    int _546 = _542;
    if (!_492)
    {
        int _548 = ~_494;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    float _554 = -_534;
    float _556 = fma(_536, 2.0, _554);
    float _558 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _454);
    float _560 = floor(_544);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _566 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[93].w, _562);
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _578 = _576 != 0;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _582 = _528 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _584 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[93].z, _564);
    float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _588 = log2(_586);
    float _590 = _530 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _594 = _432 + _526;
    float _596 = fma(_582, -2.0, _580);
    int _598 = ~_480;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = -_592;
    float _606 = fma(_590, 2.0, _604);
    float _608 = _594 + (-1.0);
    float _610 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _526);
    int _612 = _602;
    float _614 = _590;
    float _616 = _594;
    if (!_472)
    {
        int _618 = ~_480;
        int _620 = _618 + 1;
        _612 = _620;
    }
    int _622 = _612;
    float _624 = _428 + _526;
    if (!_532)
    {
        _614 = _432;
    }
    float _626 = _614;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _630 = _626;
    if (!_532)
    {
        _616 = _428;
    }
    float _632 = _616;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _636 = _624 + (-1.0);
    float _638 = _632;
    if (_532)
    {
        _630 = _526;
    }
    float _640 = _630;
    float _642 = _588 * _152;
    float _644 = _640;
    if (_532)
    {
        _638 = _432;
    }
    float _646 = _638;
    float _648 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[83].z, _628);
    bool _652 = _560 > 0.0;
    float _654 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[83].w, _634);
    bool _656 = _560 >= 0.0;
    bool _658 = isnan(_560);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _668 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _654);
    float _670 = _646;
    if (!_532)
    {
        _644 = _432;
    }
    float _672 = _644;
    float _674 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].z, _584);
    float _676 = _672;
    if (!_532)
    {
        _670 = _428;
    }
    float _678 = _670;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _682 = exp2(_642);
    float _684 = _678;
    if (_532)
    {
        _676 = _526;
    }
    float _686 = _676;
    float _688 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].w, _566);
    if (_532)
    {
        _684 = _432;
    }
    float _690 = _684;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _694 = !_570;
    int _696 = _694 ? 0 : 1;
    float _698 = _686 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _700 = _664 ? 0 : 1;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _704 = -_692;
    float _706 = fma(_698, 2.0, _704);
    int _708 = abs(_696);
    float _710 = fma(_702, -2.0, _680);
    int _712 = ~_700;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = in.m_57.x;
    float _720 = in.m_57.y;
    float _722 = in.m_57.z;
    int _724 = _716;
    if (!_652)
    {
        int _726 = ~_700;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = -_682;
    float _734 = _732 + 1.0;
    bool _736 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _738 = isnan(1.0);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _744 = _740 || _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _748 = 1.0 + _746;
    float _750 = float(_622);
    float _752 = -_152;
    float _754 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[76].x, _556);
    float _756 = float(_708);
    float _758 = -_152;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[91].x, _606);
    float _762 = 1.0 / _748;
    float _764 = _756 * _750;
    bool _766 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _774 = _770 || _772;
    float _776 = in.m_59.x;
    float _778 = in.m_59.y;
    float _780 = in.m_59.z;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _786 = _774 ? _734 : 0.0;
    float _788 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _650);
    float _790 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _782);
    float _792 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[78].w, _784);
    bool _794 = !_574;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[91].y, _596);
    float _800 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _790);
    bool _802 = !_578;
    int _804 = _802 ? 0 : 1;
    float _806 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _792);
    float _808 = -_152;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _706);
    float _812 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _710);
    int _814 = abs(_796);
    float _816 = _800;
    float _818 = _788;
    if (_744)
    {
        float _820 = _786 * _762;
        _156 = _820;
    }
    float _822 = _156;
    float _824 = _764 * (-2.0);
    int _826 = abs(_804);
    float _828 = _526 + (-0.5);
    float _830 = float(_552);
    float _832 = fma(_648, _824, _648);
    float _834 = fma(_824, _718, _718);
    float _836 = float(_826);
    float _838 = _610 + _780;
    float _840 = float(_814);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    float _844 = float(_730);
    float _846 = _836 * _830;
    float _848 = _838 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _850 = fma(_832, _822, _842);
    float _852 = _432 + _428;
    float _854 = _840 * _844;
    float _856 = _846 * (-2.0);
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _848 * 0.15915493667125701904296875;
    float _866 = _428 + (-0.5);
    float _868 = fma(_856, _722, _722);
    float _870 = in.m_63.x;
    float _872 = _854 * (-2.0);
    float _874 = _852 + (-1.0);
    float _876 = _864 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[196].z, _868);
    float _882 = fma(_872, _720, _720);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _886 = _432 + (-0.5);
    float _888 = fma(_666, _856, _666);
    float _890 = _850 * 0.15915493667125701904296875;
    float _892 = fma(_884, _872, _884);
    float _894 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[196].y, _882);
    float _896 = fma(_888, _822, _880);
    float _898 = _890 * 6.283185482025146484375;
    float _900 = sin(_898);
    float _902 = fma(_892, _822, _894);
    float _904 = _896 * 0.15915493667125701904296875;
    float _906 = _902 * 0.15915493667125701904296875;
    float _908 = _396 * _862;
    float _910 = _878 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _912 = _890 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _870 * _870;
    float _918 = _394 * _860;
    float _920 = _392 * _858;
    float _922 = fma(_910, 0.300000011920928955078125, _776);
    float _924 = fma(_910, _916, _778);
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _928 = in.m_48.x;
    float _930 = in.m_48.y;
    float _932 = in.m_48.z;
    float _934 = _906 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _922);
    float _946 = _926 * _940;
    float _948 = _906 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _944 * _938;
    float _954 = _904 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _924);
    float _960 = _958 * _942;
    float _962 = _900 * _936;
    float _964 = _930 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _966 = _904 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _914 * _950;
    float _972 = _900 * _950;
    float _974 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[6].x, _964);
    float _976 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[6].z, _974);
    float _978 = _914 * _956;
    float _980 = _914 * _936;
    float _982 = _900 * _956;
    float _984 = _950 * _956;
    float _986 = _936 * _956;
    float _988 = _976 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _990 = fma(_968, _970, _962);
    float _992 = fma(_968, _962, _970);
    float _994 = _960 * _978;
    float _996 = -_980;
    float _998 = fma(_968, _972, _996);
    float _1000 = -_972;
    float _1002 = fma(_968, _980, _1000);
    float _1004 = -_960;
    float _1006 = _968 * _1004;
    float _1008 = fma(_990, _952, _994);
    float _1010 = _960 * _982;
    float _1012 = _930 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1014 = fma(_952, _984, _1006);
    float _1016 = fma(_946, _1002, _1008);
    float _1018 = fma(_952, _998, _1010);
    float _1020 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1012);
    float _1022 = fma(_946, _986, _1014);
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1028 = fma(_992, _946, _1018);
    float _1030 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1020);
    float _1032 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1024);
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1026);
    float _1036 = _930 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1032);
    float _1042 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1034);
    float _1044 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1036);
    float _1046 = _988 + _1040;
    float _1048 = _1038 + _1042;
    float _1050 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1044);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1054 = _1046 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1058 = _1048 + _1056;
    float _1060 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1054 * _1054;
    float _1064 = fma(_1058, _1058, _1062);
    float _1066 = sqrt(_1064);
    bool _1068 = _1066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1072 = _1066 + _1070;
    float _1074 = _1030;
    float _1076 = _1072;
    float _1078 = _1024;
    float _1080 = _1050;
    float _1082 = _932;
    float _1084 = _1042;
    float _1086 = _988;
    float _1088 = _780;
    if (_1068)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1074 = _1090;
    }
    float _1092 = _1074;
    if (_1068)
    {
        float _1094 = _1072 * _1092;
        _1076 = _1094;
    }
    float _1096 = _1076;
    if (_1068)
    {
        float _1098 = _1096 * 0.15915493667125701904296875;
        _1078 = _1098;
    }
    float _1100 = _1078;
    float _1102 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1104 = _1092;
    if (_1068)
    {
        float _1106 = _1100 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        _1104 = _1108;
    }
    float _1110 = _1104;
    float _1112 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1102);
    float _1114 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1112);
    float _1116 = _928;
    if (_1068)
    {
        float _1118 = _1100 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        _1116 = _1120;
    }
    float _1122 = _1116;
    float _1124 = _1060 + _1114;
    float _1126 = _1124;
    if (_1068)
    {
        float _1128 = _1124 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1080 = _1128;
    }
    float _1130 = _1080;
    float _1132 = _1102;
    float _1134 = _1130;
    if (_1068)
    {
        float _1136 = rsqrt(_1064);
        _1132 = _1136;
    }
    float _1138 = _1132;
    if (_1068)
    {
        float _1140 = _1110 + (-1.0);
        _1082 = _1140;
    }
    float _1142 = _1082;
    float _1144 = _1142;
    if (_1068)
    {
        float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = _1122;
    float _1152 = _1148;
    if (_1068)
    {
        float _1154 = fma(_1122, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1084 = _1154;
    }
    float _1156 = _1084;
    if (!_1068)
    {
        _1134 = _1124;
    }
    float _1158 = _1134;
    float _1160 = _1158;
    if (_1068)
    {
        float _1162 = fma(_1124, _1110, _1148);
        _1160 = _1162;
    }
    float _1164 = _1160;
    if (!_1068)
    {
        _1150 = _1048;
    }
    float _1166 = _1150;
    float _1168 = _1166;
    if (!_1068)
    {
        _1152 = _1046;
    }
    float _1170 = _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1164 + _1172;
    float _1176 = _1138;
    float _1178 = _1170;
    float _1180 = _1174;
    if (_1068)
    {
        float _1182 = _1138 * _1156;
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = _1174 * _1174;
    if (_1068)
    {
        float _1188 = fma(_1058, _1184, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1168 = _1188;
    }
    float _1190 = _1168;
    if (_1068)
    {
        float _1192 = fma(_1054, _1184, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1178 = _1192;
    }
    float _1194 = _1178;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1190 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1194 + _1200;
    float _1204 = fma(_1198, _1198, _1186);
    float _1206 = fma(_1202, _1202, _1204);
    float _1208 = rsqrt(_1206);
    float _1210 = sqrt(_1206);
    float _1212 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1214 = _1198 * _1212;
    float _1216 = _1202 * _1212;
    float _1218 = _1214 * _1214;
    float _1220 = _1216 * _1216;
    float _1222 = _1218 + _1220;
    float _1224 = sqrt(_1222);
    bool _1226 = _1224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1224 + _1228;
    float _1232 = _1204;
    float _1234 = _1230;
    float _1236 = _1214;
    if (_1226)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = _1240;
    if (_1226)
    {
        float _1244 = _1230 * _1240;
        _1234 = _1244;
    }
    float _1246 = _1234;
    if (_1226)
    {
        float _1248 = rsqrt(_1222);
        _1242 = _1248;
    }
    float _1250 = _1242;
    float _1252 = _1250;
    if (_1226)
    {
        float _1254 = _1246 * 0.15915493667125701904296875;
        _1126 = _1254;
    }
    float _1256 = _1126;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = _1208;
    float _1262 = _1256;
    if (_1226)
    {
        float _1264 = _1256 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        _1260 = _1266;
    }
    float _1268 = _1260;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1272 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1270);
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = precise::max(0.0, _1258);
    float _1278 = -_1274;
    float _1280 = _1278 + 1.0;
    float _1282 = _1202;
    if (_1226)
    {
        float _1284 = _1256 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = -_1212;
    float _1292 = -_1276;
    float _1294 = fma(_1174, _1290, _1292);
    float _1296 = _1294;
    if (_1226)
    {
        float _1298 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1180 = _1298;
    }
    float _1300 = _1180;
    float _1302 = abs(_1280);
    float _1304 = log2(_1302);
    float _1306 = _1268;
    float _1308 = _1300;
    if (_1226)
    {
        float _1310 = fma(_1268, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1312;
    if (!_1226)
    {
        _1262 = _1216;
    }
    float _1316 = _1262;
    float _1318 = _1316;
    if (_1226)
    {
        float _1320 = _1250 * _1312;
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = _1288;
    if (_1226)
    {
        float _1326 = _1288 + (-1.0);
        _1308 = _1326;
    }
    float _1328 = _1308;
    float _1330 = _1328;
    if (_1226)
    {
        float _1332 = _1214 * _1322;
        _1236 = _1332;
    }
    float _1334 = _1236;
    if (_1226)
    {
        float _1336 = _1216 * _1322;
        _1318 = _1336;
    }
    float _1338 = _1318;
    float _1340 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1226)
    {
        float _1342 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1342;
    }
    float _1344 = _1252;
    if (!_1226)
    {
        _1330 = _1218;
    }
    float _1346 = _1330;
    float _1348 = _1346;
    if (_1226)
    {
        float _1350 = _1334 * _1334;
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1340);
    if (_1226)
    {
        float _1356 = fma(_1294, _1288, _1344);
        _1296 = _1356;
    }
    float _1358 = _1296;
    if (!_1226)
    {
        _1324 = _1220;
    }
    float _1360 = _1324;
    float _1362 = _1360;
    if (_1226)
    {
        float _1364 = _1338 * _1338;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1370 = fma(_1358, _1358, _1352);
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1374 = _1370 + _1366;
    float _1376 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1380 = rsqrt(_1374);
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1384 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1386 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1382);
    float _1388 = floor(_1378);
    float _1390 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1392 = _1380 * _1334;
    float _1394 = _1380 * _1338;
    float _1396 = _1380 * _1358;
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1402 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1404 = floor(_1384);
    float _1406 = -_1400;
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1406);
    float _1410 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = -_1402;
    float _1414 = fma(_1412, _1398, 1.0);
    float _1416 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1418 = -_1394;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1408);
    float _1422 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1424 = -_1388;
    float _1426 = _1378 + _1424;
    float _1428 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1416);
    float _1430 = fma(_1420, -0.5, 0.5);
    float _1432 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1434 = fma(_1420, 0.5, 0.5);
    float _1436 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1428);
    float _1438 = log2(_1414);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1442 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1448 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = -_1404;
    float _1454 = _1384 + _1452;
    float _1456 = sqrt(_1430);
    float _1458 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1462 = fma(_1434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1464 = _1396 + 1.0;
    float _1466 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1470 = fma(_1434, _1462, -0.212114393711090087890625);
    float _1472 = exp2(_1446);
    float _1474 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float2 _4798 = float2(_1426, _1454);
    float _1478 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4798, float2(0.0), isnan(_4798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4798, float2(0.0), isnan(_4798)), level(0.0)).x;
    float _1480 = fma(_1434, _1470, 1.570728778839111328125);
    float _1482 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1474);
    float _1484 = 1.0 / _1468;
    float _1486 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1488 = _1438 * 0.693147182464599609375;
    float _1490 = _1456 * 0.636619746685028076171875;
    float _1492 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1486);
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1496 = -_1480;
    float _1498 = fma(_1490, _1496, 1.0);
    float _1500 = -_1396;
    float _1502 = fma(_1472, _1464, _1500);
    float _1504 = fma(_1190, 6.2500002968590706586837768554688e-05, 0.5);
    float _1506 = fma(_1194, 6.2500002968590706586837768554688e-05, 0.5);
    float _1508 = _1476 * _1484;
    float _1510 = _1492 * _1484;
    float _1512 = fma(_1502, 0.5, 0.5);
    float _1514 = fma(_1508, 0.5, 0.5);
    float _1516 = fma(_1510, -0.5, 0.5);
    float3 _4868 = float3(_1514, _1516, _1494);
    float _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).x;
    float3 _4879 = float3(_1514, _1516, _1494);
    float4 _1521 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4879, float3(0.0), isnan(_4879)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4879, float3(0.0), isnan(_4879)), level(0.0)).xyzw;
    float _1523 = _1521.x;
    float _1525 = _1521.y;
    float _1527 = _1521.z;
    float _1529 = _1521.w;
    float2 _4895 = float2(_1498, _1512);
    float3 _1533 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4895, float2(0.0), isnan(_4895)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4895, float2(0.0), isnan(_4895)), level(0.0)).xyz;
    float _1535 = _1533.x;
    float _1537 = _1533.y;
    float _1539 = _1533.z;
    float2 _4909 = float2(_1504, _1506);
    float3 _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4909, float2(0.0), isnan(_4909)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4909, float2(0.0), isnan(_4909)), level(0.0)).xyz;
    float _1543 = _1541.x;
    float _1545 = _1541.y;
    float _1547 = _1541.z;
    float _1549 = in.m_65.y;
    bool _1551 = _428 > 0.5;
    float _1553 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _870;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1557 = _1555 != 0;
    out.m_69.x = _1190;
    out.m_69.y = _1164;
    out.m_69.z = _1194;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1565 = _1563 != 0;
    bool _1567 = _430 > 0.5;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1575 = _1573 != 0;
    float _1577 = 1.0 / _1561;
    float _1579 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1583 = _1581 != 0;
    float _1585 = 0.0;
    bool _1587 = _1583;
    bool _1589 = _1567;
    float _1591 = _1468;
    float _1593 = _1492;
    if (_1557)
    {
        float _1595 = in.m_55.x;
        _1585 = _1595;
    }
    float _1597 = _1585;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1599;
    bool _1603 = _432 > 0.5;
    float _1605 = -_1549;
    float _1607 = _1605 + 1.0;
    float _1609 = 1.0 / _1571;
    float _1611 = 0.0;
    float _1613 = _1549;
    if (_1565)
    {
        float _1615 = in.m_55.z;
        _1611 = _1615;
    }
    float _1617 = _1611;
    float _1619 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1623 = _1621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1625 = _1551 ? as_type<int>(_1607) : as_type<int>(_1549);
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1631 = _1629 != 0;
    float _1633 = _1601 * _1577;
    float _1635 = _1575 ? as_type<float>(_1625) : _1549;
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1641 = _1639 != 0;
    float _1643 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1619);
    float _1645 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1649 = _1603 ? as_type<int>(_1607) : as_type<int>(_1549);
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1653 = _1623 * _1609;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1657 = _1583 ? as_type<float>(_1649) : _1549;
    float _1659 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1557)
    {
        bool _1661 = _1597 > 0.5;
        _1587 = _1661;
    }
    bool _1663 = _1587;
    float _1665 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1667 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1671 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1647);
    float _1673 = in.m_65.x;
    if (_1641)
    {
        float _1675 = _1567 ? _1607 : _1549;
        _1613 = _1675;
    }
    float _1677 = _1613;
    float _1679 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1671);
    out.m_71.x = _1659;
    out.m_71.y = _1665;
    out.m_71.z = _1645;
    int _1681 = as_type<int>(_1679);
    if (_1565)
    {
        bool _1683 = _1617 > 0.5;
        _1589 = _1683;
    }
    bool _1685 = _1589;
    float _1687 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1689 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1693 = fma(_1657, _1687, -0.5);
    float _1695 = _1689 + _1667;
    float _1697 = -_558;
    float _1699 = fma(_806, _1693, _1697);
    float _1701 = 1.0 / _1667;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1705 = _426 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1709 = _426 + _1707;
    float _1711 = fma(_1633, _1705, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1713 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1715 = isnan(_426);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = fma(_1653, _1709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1727 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1729 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1731 = isnan(_426);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1743 = -_1723;
    float _1745 = _1743 + 1.0;
    float _1747 = fma(_1635, _1727, -0.5);
    bool _1749 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1751 = isnan(_426);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1711;
    float _1763 = _1673;
    if (_1631)
    {
        float _1765 = -_1673;
        float _1767 = _1765 + 1.0;
        _1681 = as_type<int>(_1767);
    }
    int _1769 = _1681;
    float _1771 = _1739 * _1745;
    float _1773 = _1695 * _1701;
    float _1775 = _1773 * 0.5;
    float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1779 = -_1739;
    float _1781 = _1779 + 1.0;
    float _1783 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1785 = -_1759;
    float _1787 = _1785 + 1.0;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1789);
    float _1793 = _1759 * _1781;
    int _1795 = as_type<int>(_1781);
    int _1797 = as_type<int>(_1775);
    if (_1557)
    {
        float _1799 = -_1673;
        float _1801 = _1799 + 1.0;
        _1795 = as_type<int>(_1801);
    }
    int _1803 = _1795;
    if (_1565)
    {
        float _1805 = -_1673;
        float _1807 = _1805 + 1.0;
        _1797 = as_type<int>(_1807);
    }
    int _1809 = _1797;
    float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1813 = _1711 * _1793;
    if (!_1557)
    {
        _1086 = _1673;
    }
    float _1815 = _1086;
    float _1817 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1819 = _1815;
    if (!_1565)
    {
        _1761 = _1673;
    }
    float _1821 = _1761;
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1813);
    float _1825 = _1821;
    if (_1557)
    {
        float _1827 = _1663 ? as_type<float>(_1803) : _1673;
        _1819 = _1827;
    }
    float _1829 = _1819;
    float _1831 = -_798;
    float _1833 = fma(_688, _1747, _1831);
    float _1835 = 1.0 / _1791;
    if (_1565)
    {
        float _1837 = _1685 ? as_type<float>(_1809) : _1673;
        _1825 = _1837;
    }
    float _1839 = _1825;
    float _1841 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (_1631)
    {
        float _1843 = _1603 ? as_type<float>(_1769) : _1673;
        _1763 = _1843;
    }
    float _1845 = _1763;
    float _1847 = fma(_1725, _1771, _1823);
    bool _1849 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1851 = isnan(0.5);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1817, _1839, -0.5);
    bool _1861 = _924 != 0.0;
    bool _1863 = isnan(_924);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan(0.0);
    bool _1869 = _1865 || _1867;
    float _1871 = fma(_1841, _1845, -0.5);
    float _1873 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1847);
    float _1875 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1877 = fma(_674, _1871, _760);
    bool _1879 = _922 == 0.0;
    bool _1881 = !_1869;
    bool _1883 = _1879 && _1881;
    float _1885 = in.m_73.x;
    float _1887 = in.m_73.y;
    float _1889 = in.m_73.z;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1893 = _1835 * _1891;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1897 = _780 == 0.0;
    bool _1899 = _1897 && _1883;
    float _1901 = abs(_1893);
    float _1903 = log2(_1901);
    float _1905 = fma(_1875, _1829, -0.5);
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (!_1857)
    {
        _1911 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1913 = _1911;
    float _1915 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1917 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1919 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1921 = _1873 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1923 = fma(_800, _1905, _754);
    float _1925 = _1917;
    float _1927 = _1915;
    if (!_1857)
    {
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1931 = _1913 + _1929;
        _816 = _1931;
    }
    float _1933 = _816;
    float _1935 = _1877 + 0.5;
    float _1937 = _1833 + 0.5;
    float _1939 = fma(_788, _1859, _810);
    out.m_75.x = _1915;
    out.m_75.y = _1917;
    out.m_75.z = _1919;
    out.m_75.w = _1921;
    float _1941 = _1933;
    float _1943 = _1937;
    if (!_1857)
    {
        float _1945 = 1.0 / _1933;
        _818 = _1945;
    }
    float _1947 = _818;
    float _1949 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_77.x = _1935;
    out.m_77.y = _1937;
    float _1951 = fma(_1783, _1677, -0.5);
    float _1953 = _1923 + 0.5;
    float _1955 = _1939 + 0.5;
    float _1957 = _1885;
    float _1959 = _1887;
    if (!_1899)
    {
        float _1961 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1885);
        _1957 = _1961;
    }
    float _1963 = _1957;
    float _1965 = exp2(_1949);
    if (_1857)
    {
        _1941 = 1.0;
    }
    float _1967 = _1941;
    float _1969 = -_812;
    float _1971 = fma(_668, _1951, _1969);
    float _1973 = _1699 + 0.5;
    float _1975 = _1967;
    if (_1899)
    {
        _1925 = _1889;
    }
    float _1977 = _1925;
    float _1979 = _1971 + 0.5;
    float _1981 = _1977;
    if (_1899)
    {
        _1927 = _1887;
    }
    float _1983 = _1927;
    float _1985 = _1983;
    if (!_1899)
    {
        float _1987 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1985 = _1987;
    }
    float _1989 = _1985;
    if (_1899)
    {
        _1943 = _1977;
    }
    float _1991 = _1943;
    float _1993 = exp2(_1553);
    float _1995 = _1991;
    if (!_1899)
    {
        _1981 = _1889;
    }
    float _1997 = _1981;
    float _1999 = _978 * _1989;
    float _2001 = _1997;
    if (!_1899)
    {
        _1959 = _1989;
    }
    float _2003 = _1959;
    out.m_79.x = _1953;
    out.m_79.y = _1973;
    out.m_79.z = _1955;
    out.m_79.w = _1979;
    if (!_1899)
    {
        float _2005 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (!_1857)
    {
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2011 = _1893 + _2009;
        _1088 = _2011;
    }
    float _2013 = _1088;
    float _2015 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    if (!_1857)
    {
        float _2019 = _2013 * _1947;
        float _2021 = precise::clamp(_2019, 0.0, 1.0);
        _1975 = _2021;
    }
    float _2023 = _1975;
    if (!_1899)
    {
        _2001 = _2007;
    }
    float _2025 = _2001;
    float _2027 = _2003 * _2003;
    float _2029 = fma(_2017, -2.0, 3.0);
    float _2031 = _2017 * _2017;
    bool _2033 = _1893 <= 8000.0;
    bool _2035 = isnan(_1893);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(8000.0);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = fma(_2025, _2025, _2027);
    float _2047 = fma(_990, _1963, _1999);
    float _2049 = _2031 * _2029;
    float _2051 = -_1989;
    float _2053 = _968 * _2051;
    float _2055 = _982 * _1989;
    float _2057 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2059 = rsqrt(_2045);
    float _2061 = -_2049;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_984, _1963, _2053);
    float _2067 = fma(_998, _1963, _2055);
    float _2069 = _990 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2071 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2049);
    float _2073 = fma(_986, _2007, _2065);
    float _2075 = fma(_1002, _2007, _2047);
    float _2077 = fma(_992, _2007, _2067);
    float _2079 = _2043 * _2071;
    float _2081 = _990 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2083 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2069);
    float _2085 = _990 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2087 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2057);
    float _2089 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2081);
    float _2091 = -_1993;
    float _2093 = _2091 + 1.0;
    float _2095 = _2059 * _2003;
    float _2097 = _2059 * _2025;
    float _2099 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2083);
    float _2101 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2089);
    float _2103 = -_2095;
    float _2105 = _1002 * _2103;
    float _2107 = -_2095;
    float _2109 = _986 * _2107;
    float _2111 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2085);
    float _2113 = -_2095;
    float _2115 = _992 * _2113;
    float _2117 = fma(_978, _2097, _2105);
    float _2119 = -_968;
    float _2121 = fma(_2119, _2097, _2109);
    float _2123 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2111);
    float _2125 = in.m_81.x;
    float _2127 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2129 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2131 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2133 = fma(_982, _2097, _2115);
    float _2135 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2127);
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2129);
    float _2139 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2131);
    out.m_83.x = _2123;
    out.m_83.y = _2099;
    out.m_83.z = _2101;
    float _2141 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2087);
    float _2143 = _1476 + _1468;
    float _2145 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2149 = _2143 * 0.5;
    bool _2151 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2153 = isnan(_1210);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2159 = _2155 || _2157;
    float _2161 = _2147 + _1468;
    out.gl_Position.x = _1476;
    out.gl_Position.y = _1492;
    out.gl_Position.z = _2147;
    out.gl_Position.w = _1468;
    float _2163 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2135);
    float _2165 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2167 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2139);
    float _2169 = _1468 * 0.5;
    float _2171 = _2161 * 0.5;
    float _2173 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2175 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2177 = fma(_1492, -0.5, _2169);
    float _2179 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2181 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2183 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2173);
    out.m_85.x = _2149;
    out.m_85.y = _2177;
    out.m_85.z = _2171;
    out.m_85.w = _1468;
    float _2185 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2175);
    float _2187 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2181);
    float _2189 = -_2145;
    float _2191 = _2189 + 1.0;
    float _2193 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2183);
    float _2195 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2185);
    float _2197 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2187);
    out.m_87.x = _2163;
    out.m_87.y = _2165;
    out.m_87.z = _2167;
    float _2199 = _2147;
    float _2201 = _2165;
    float _2203 = _2163;
    float _2205 = _2191;
    if (!_2159)
    {
        _1591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2207 = _1591;
    float _2209 = _2207;
    float _2211 = _2207;
    if (!_2159)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2213 = _2199;
    out.m_89.x = _2193;
    out.m_89.y = _2195;
    out.m_89.z = _2197;
    float _2215 = _2213;
    float _2217 = _2213;
    if (!_2159)
    {
        _1593 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2219 = _1593;
    float _2221 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2223 = _2219;
    float _2225 = _2219;
    if (!_2159)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2227 = _2201;
    float _2229 = _2227;
    float _2231 = _2227;
    if (!_2159)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2233 = _2203;
    float _2235 = -_1478;
    float _2237 = _2235 + 1.0;
    float _2239 = _2237 * _2179;
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = -_2241;
    float _2245 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2247 = _2245 * _2125;
    float _2249 = _2247 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _2249;
    float _2251 = _2145 * _1518;
    float _2253 = _1529 * _2191;
    float _2255 = _2233;
    float _2257 = _2233;
    if (!_2159)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2259 = _2205;
    float _2261 = _1529 * _2251;
    float _2263 = _1539 * _2251;
    float _2265 = fma(_1535, _2261, _1523);
    float _2267 = fma(_1537, _2261, _1525);
    float _2269 = fma(_1529, _2263, _1527);
    out.m_93.x = _1543;
    out.m_93.y = _1545;
    out.m_93.z = _1547;
    out.m_95.x = _2265;
    out.m_95.y = _2267;
    out.m_95.z = _2269;
    out.m_95.w = _2253;
    bool _2271 = !_2159;
    float _2273 = _2259;
    float _2275 = _2259;
    if (!_2271)
    {
        bool _2277 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2279 = isnan(_1210);
        bool _2281 = _2277 || _2279;
        bool _2283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2285 = _2281 || _2283;
        if (!_2285)
        {
            float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2289 = _1210 + _2287;
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2299 = 1.0 / _2293;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2317 = _2289 * _2299;
            float _2319 = precise::clamp(_2317, 0.0, 1.0);
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2325 = fma(_2319, _2297, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2327 = fma(_2319, _2303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2329 = fma(_2319, _2323, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2331 = fma(_2319, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2333 = fma(_2319, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2335 = fma(_2319, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2257 = _2329;
            _2225 = _2333;
            _2231 = _2327;
            _2217 = _2325;
            _2211 = _2331;
            _2275 = _2335;
            _2337 = true;
        }
        else
        {
            bool _2339 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2341 = isnan(_1210);
            bool _2343 = _2339 || _2341;
            bool _2345 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2347 = _2343 || _2345;
            if (!_2347)
            {
                _2229 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2349 = _2229;
            _2231 = _2349;
            if (!_2347)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2351 = _2255;
            _2257 = _2351;
            if (!_2347)
            {
                _2209 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2353 = _2209;
            _2211 = _2353;
            if (!_2347)
            {
                _2215 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2355 = _2215;
            _2217 = _2355;
            if (!_2347)
            {
                _2223 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2357 = _2223;
            _2225 = _2357;
            if (!_2347)
            {
                _2273 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2359 = _2273;
            bool _2361 = !_2347;
            _2275 = _2359;
            if (!_2361)
            {
                bool _2363 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2365 = isnan(_1210);
                bool _2367 = _2363 || _2365;
                bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2371 = _2367 || _2369;
                if (!_2371)
                {
                    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2375 = _1210 + _2373;
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2385 = 1.0 / _2379;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2403 = _2375 * _2385;
                    float _2405 = precise::clamp(_2403, 0.0, 1.0);
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2411 = fma(_2405, _2383, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2413 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2415 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2257 = _2415;
                    _2225 = _2419;
                    _2231 = _2413;
                    _2217 = _2411;
                    _2211 = _2417;
                    _2275 = _2421;
                    _2337 = true;
                }
                else
                {
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2225 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2231 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2217 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2211 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2275 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2337 = false;
    float _2423 = _2257;
    float _2425 = _2225;
    float _2427 = _2231;
    float _2429 = _2217;
    float _2431 = _2211;
    float _2433 = _2275;
    float _2435 = fma(_2195, -0.5, 0.5);
    float _2437 = precise::clamp(_2435, 0.0, 1.0);
    float _2439 = -_2423;
    float _2441 = _2439 + _2425;
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    out.m_97.x = 0.0;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = fma(_2437, _2441, _2423);
    float _2453 = fma(_2437, _2445, _2427);
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = _2451 * 0.586610972881317138671875;
    float _2459 = fma(_2437, _2449, _2431);
    float _2461 = _2221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = fma(_2453, 0.298911988735198974609375, _2457);
    bool _2465 = _2023 > 0.0;
    bool _2467 = isnan(_2023);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.0);
    bool _2473 = _2469 || _2471;
    float _2475 = fma(_2459, 0.114477999508380889892578125, _2463);
    out.m_51.x = _2461;
    float _2477 = -_2475;
    float _2479 = _2451 + _2477;
    float _2481 = -_2475;
    float _2483 = _2453 + _2481;
    float _2485 = -_2475;
    float _2487 = _2459 + _2485;
    float _2489 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    float _2491 = fma(_2483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    float _2493 = fma(_2487, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    bool _2495 = !_2455;
    if (!_2495)
    {
        float _2497 = -_1164;
        float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2501 = -_1190;
        float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2505 = -_1194;
        float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2509 = _2499 * _2499;
        float _2511 = fma(_2503, _2503, _2509);
        float _2513 = fma(_2507, _2507, _2511);
        float _2515 = sqrt(_2513);
        float _2517 = rsqrt(_2513);
        float _2519 = -_2515;
        float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2523 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2525 = precise::clamp(_2523, 0.0, 1.0);
        float _2527 = _2503 * _2517;
        float _2529 = _2499 * _2517;
        float _2531 = abs(_2525);
        float _2533 = log2(_2531);
        float _2535 = _2507 * _2517;
        float _2537 = _2527 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2539 = _2195 * _2529;
        float _2541 = -_2529;
        float _2543 = -_2537;
        float _2545 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2543);
        float _2547 = fma(_2193, _2527, _2539);
        float _2549 = -_2535;
        float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2545);
        float _2553 = fma(_2197, _2535, _2547);
        float _2555 = precise::clamp(_2553, 0.0, 1.0);
        float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2559 = _2551 + _2557;
        float _2561 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2563 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2565 = precise::clamp(_2563, 0.0, 1.0);
        float _2567 = exp2(_2561);
        float _2569 = _2567 * _2565;
        float _2571 = _2555 * _2569;
        float _2573 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2575 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2577 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2573;
        out.m_97.y = _2575;
        out.m_97.z = _2577;
    }
    out.m_99.x = _2491;
    out.m_99.y = _2489;
    out.m_99.z = _2493;
    if (_2473)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2579 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2579;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2337 = false;
    bool _418 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2636 = as_type<float>(_134);
        out.gl_Position.z = _2636;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2705 = as_type<float>(_172);
        out.gl_Position.z = _2705;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_55.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _152 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _236;
    float _248 = 1.0 / _240;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _268;
    float _272 = _262 * _266;
    float _274 = _212 * _246;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    bool _280 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _282 = isnan(_204);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_262;
    float _294 = _292 + 1.0;
    float _296 = fma(_270, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = _232 * _248;
    bool _302 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_204);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _322 = fma(_316, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = -_312;
    float _326 = _324 + 1.0;
    float _328 = _312 * _294;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _338 = _290 * _326;
    float _340 = -_290;
    float _342 = _340 + 1.0;
    float _344 = fma(_320, _300, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _346 = fma(_332, _300, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _348 = _296 * _338;
    float _350 = _298 * _338;
    float _352 = _322 * _338;
    float _354 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].x, _348);
    float _356 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].y, _350);
    float _358 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[143].z, _352);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = fma(_336, _300, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = fma(_344, _328, _354);
    float _376 = fma(_362, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_366, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _380 = fma(_346, _328, _356);
    float _382 = fma(_372, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_368, _328, _358);
    float _386 = fma(_376, _272, _374);
    float _388 = fma(_378, _272, _380);
    float _390 = fma(_382, _272, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_55.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _152 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_55.z;
    float _430 = in.m_55.w;
    float _432 = in.m_55.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _436 = _434 != 0;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_436)
    {
        float _442 = in.m_55.x;
        _440 = _442;
    }
    float _444 = _440;
    float _446 = _428 * 2.0;
    float _448 = _432 * 2.0;
    float _450 = _432 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _452 = floor(_446);
    float _454 = fma(_450, -2.0, _438);
    int _456 = as_type<int>(_450);
    if (_436)
    {
        _456 = 0;
    }
    int _458 = _456;
    float _460 = floor(_448);
    bool _462 = _452 >= 0.0;
    bool _464 = isnan(_452);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    bool _472 = _452 > 0.0;
    float _474 = _452;
    int _476 = _458;
    if (_436)
    {
        _474 = _432;
    }
    float _478 = _474;
    int _480 = _470 ? 0 : 1;
    bool _482 = _460 >= 0.0;
    bool _484 = isnan(_460);
    bool _486 = _482 || _484;
    bool _488 = isnan(0.0);
    bool _490 = _486 || _488;
    bool _492 = _460 > 0.0;
    int _494 = _490 ? 0 : 1;
    float _496 = _460;
    float _498 = _444;
    float _500 = _478;
    if (_436)
    {
        _496 = _444;
    }
    float _502 = _496;
    float _504 = _502;
    if (!_436)
    {
        float _506 = in.m_55.x;
        float _508 = _432 * 3.1415927410125732421875;
        float _510 = _508 * 0.15915493667125701904296875;
        float _512 = _510 * 6.283185482025146484375;
        float _514 = sin(_512);
        float _516 = _506 * 3.1415927410125732421875;
        float _518 = _516 * 0.15915493667125701904296875;
        float _520 = _518 * 6.283185482025146484375;
        float _522 = sin(_520);
        _476 = 1;
        _498 = _506;
        _500 = _514;
        _504 = _522;
    }
    int _524 = _476;
    float _526 = _498;
    float _528 = _500;
    float _530 = _504;
    bool _532 = _524 != 1;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _536 = _526 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _538 = ~_494;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _526 * 2.0;
    int _546 = _542;
    if (!_492)
    {
        int _548 = ~_494;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    float _554 = -_534;
    float _556 = fma(_536, 2.0, _554);
    float _558 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[76].y, _454);
    float _560 = floor(_544);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _566 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[93].w, _562);
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _574 = _572 != 0;
    int _576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _578 = _576 != 0;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _582 = _528 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _584 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[93].z, _564);
    float _586 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _588 = log2(_586);
    float _590 = _530 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _594 = _432 + _526;
    float _596 = fma(_582, -2.0, _580);
    int _598 = ~_480;
    int _600 = _598 + 1;
    int _602 = _600 + 1;
    float _604 = -_592;
    float _606 = fma(_590, 2.0, _604);
    float _608 = _594 + (-1.0);
    float _610 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[191].x, _526);
    int _612 = _602;
    float _614 = _590;
    float _616 = _594;
    if (!_472)
    {
        int _618 = ~_480;
        int _620 = _618 + 1;
        _612 = _620;
    }
    int _622 = _612;
    float _624 = _428 + _526;
    if (!_532)
    {
        _614 = _432;
    }
    float _626 = _614;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _630 = _626;
    if (!_532)
    {
        _616 = _428;
    }
    float _632 = _616;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _636 = _624 + (-1.0);
    float _638 = _632;
    if (_532)
    {
        _630 = _526;
    }
    float _640 = _630;
    float _642 = _588 * _152;
    float _644 = _640;
    if (_532)
    {
        _638 = _432;
    }
    float _646 = _638;
    float _648 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _650 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[83].z, _628);
    bool _652 = _560 > 0.0;
    float _654 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[83].w, _634);
    bool _656 = _560 >= 0.0;
    bool _658 = isnan(_560);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _668 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].w, _654);
    float _670 = _646;
    if (!_532)
    {
        _644 = _432;
    }
    float _672 = _644;
    float _674 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].z, _584);
    float _676 = _672;
    if (!_532)
    {
        _670 = _428;
    }
    float _678 = _670;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _682 = exp2(_642);
    float _684 = _678;
    if (_532)
    {
        _676 = _526;
    }
    float _686 = _676;
    float _688 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[92].w, _566);
    if (_532)
    {
        _684 = _432;
    }
    float _690 = _684;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _694 = !_570;
    int _696 = _694 ? 0 : 1;
    float _698 = _686 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _700 = _664 ? 0 : 1;
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _704 = -_692;
    float _706 = fma(_698, 2.0, _704);
    int _708 = abs(_696);
    float _710 = fma(_702, -2.0, _680);
    int _712 = ~_700;
    int _714 = _712 + 1;
    int _716 = _714 + 1;
    float _718 = in.m_57.x;
    float _720 = in.m_57.y;
    float _722 = in.m_57.z;
    int _724 = _716;
    if (!_652)
    {
        int _726 = ~_700;
        int _728 = _726 + 1;
        _724 = _728;
    }
    int _730 = _724;
    float _732 = -_682;
    float _734 = _732 + 1.0;
    bool _736 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _738 = isnan(1.0);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _744 = _740 || _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _748 = 1.0 + _746;
    float _750 = float(_622);
    float _752 = -_152;
    float _754 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[76].x, _556);
    float _756 = float(_708);
    float _758 = -_152;
    float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[91].x, _606);
    float _762 = 1.0 / _748;
    float _764 = _756 * _750;
    bool _766 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _768 = isnan(0.0);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _774 = _770 || _772;
    float _776 = in.m_59.x;
    float _778 = in.m_59.y;
    float _780 = in.m_59.z;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _786 = _774 ? _734 : 0.0;
    float _788 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[82].z, _650);
    float _790 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[78].z, _782);
    float _792 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[78].w, _784);
    bool _794 = !_574;
    int _796 = _794 ? 0 : 1;
    float _798 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[91].y, _596);
    float _800 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].z, _790);
    bool _802 = !_578;
    int _804 = _802 ? 0 : 1;
    float _806 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[77].w, _792);
    float _808 = -_152;
    float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[81].x, _706);
    float _812 = fma(_152, (*spvDescriptorSet0.vp_c9)._m0[81].y, _710);
    int _814 = abs(_796);
    float _816 = _800;
    float _818 = _788;
    if (_744)
    {
        float _820 = _786 * _762;
        _156 = _820;
    }
    float _822 = _156;
    float _824 = _764 * (-2.0);
    int _826 = abs(_804);
    float _828 = _526 + (-0.5);
    float _830 = float(_552);
    float _832 = fma(_648, _824, _648);
    float _834 = fma(_824, _718, _718);
    float _836 = float(_826);
    float _838 = _610 + _780;
    float _840 = float(_814);
    float _842 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    float _844 = float(_730);
    float _846 = _836 * _830;
    float _848 = _838 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _850 = fma(_832, _822, _842);
    float _852 = _432 + _428;
    float _854 = _840 * _844;
    float _856 = _846 * (-2.0);
    float _858 = in.m_61.x;
    float _860 = in.m_61.y;
    float _862 = in.m_61.z;
    float _864 = _848 * 0.15915493667125701904296875;
    float _866 = _428 + (-0.5);
    float _868 = fma(_856, _722, _722);
    float _870 = in.m_63.x;
    float _872 = _854 * (-2.0);
    float _874 = _852 + (-1.0);
    float _876 = _864 * 6.283185482025146484375;
    float _878 = sin(_876);
    float _880 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[196].z, _868);
    float _882 = fma(_872, _720, _720);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _886 = _432 + (-0.5);
    float _888 = fma(_666, _856, _666);
    float _890 = _850 * 0.15915493667125701904296875;
    float _892 = fma(_884, _872, _884);
    float _894 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[196].y, _882);
    float _896 = fma(_888, _822, _880);
    float _898 = _890 * 6.283185482025146484375;
    float _900 = sin(_898);
    float _902 = fma(_892, _822, _894);
    float _904 = _896 * 0.15915493667125701904296875;
    float _906 = _902 * 0.15915493667125701904296875;
    float _908 = _396 * _862;
    float _910 = _878 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _912 = _890 * 6.283185482025146484375;
    float _914 = cos(_912);
    float _916 = _870 * _870;
    float _918 = _394 * _860;
    float _920 = _392 * _858;
    float _922 = fma(_910, 0.300000011920928955078125, _776);
    float _924 = fma(_910, _916, _778);
    float _926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _928 = in.m_48.x;
    float _930 = in.m_48.y;
    float _932 = in.m_48.z;
    float _934 = _906 * 6.283185482025146484375;
    float _936 = sin(_934);
    float _938 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _940 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _942 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _944 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _922);
    float _946 = _926 * _940;
    float _948 = _906 * 6.283185482025146484375;
    float _950 = cos(_948);
    float _952 = _944 * _938;
    float _954 = _904 * 6.283185482025146484375;
    float _956 = cos(_954);
    float _958 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _924);
    float _960 = _958 * _942;
    float _962 = _900 * _936;
    float _964 = _930 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _966 = _904 * 6.283185482025146484375;
    float _968 = sin(_966);
    float _970 = _914 * _950;
    float _972 = _900 * _950;
    float _974 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[6].x, _964);
    float _976 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[6].z, _974);
    float _978 = _914 * _956;
    float _980 = _914 * _936;
    float _982 = _900 * _956;
    float _984 = _950 * _956;
    float _986 = _936 * _956;
    float _988 = _976 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _990 = fma(_968, _970, _962);
    float _992 = fma(_968, _962, _970);
    float _994 = _960 * _978;
    float _996 = -_980;
    float _998 = fma(_968, _972, _996);
    float _1000 = -_972;
    float _1002 = fma(_968, _980, _1000);
    float _1004 = -_960;
    float _1006 = _968 * _1004;
    float _1008 = fma(_990, _952, _994);
    float _1010 = _960 * _982;
    float _1012 = _930 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1014 = fma(_952, _984, _1006);
    float _1016 = fma(_946, _1002, _1008);
    float _1018 = fma(_952, _998, _1010);
    float _1020 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1012);
    float _1022 = fma(_946, _986, _1014);
    float _1024 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1026 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1028 = fma(_992, _946, _1018);
    float _1030 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1020);
    float _1032 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1024);
    float _1034 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1026);
    float _1036 = _930 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1038 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1032);
    float _1042 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1034);
    float _1044 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1036);
    float _1046 = _988 + _1040;
    float _1048 = _1038 + _1042;
    float _1050 = fma(_932, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1044);
    float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1054 = _1046 + _1052;
    float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1058 = _1048 + _1056;
    float _1060 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1054 * _1054;
    float _1064 = fma(_1058, _1058, _1062);
    float _1066 = sqrt(_1064);
    bool _1068 = _1066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1072 = _1066 + _1070;
    float _1074 = _1030;
    float _1076 = _1072;
    float _1078 = _1024;
    float _1080 = _1050;
    float _1082 = _932;
    float _1084 = _1042;
    float _1086 = _988;
    float _1088 = _780;
    if (_1068)
    {
        float _1090 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1074 = _1090;
    }
    float _1092 = _1074;
    if (_1068)
    {
        float _1094 = _1072 * _1092;
        _1076 = _1094;
    }
    float _1096 = _1076;
    if (_1068)
    {
        float _1098 = _1096 * 0.15915493667125701904296875;
        _1078 = _1098;
    }
    float _1100 = _1078;
    float _1102 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1104 = _1092;
    if (_1068)
    {
        float _1106 = _1100 * 6.283185482025146484375;
        float _1108 = cos(_1106);
        _1104 = _1108;
    }
    float _1110 = _1104;
    float _1112 = fma(_1022, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1102);
    float _1114 = fma(_1028, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1112);
    float _1116 = _928;
    if (_1068)
    {
        float _1118 = _1100 * 6.283185482025146484375;
        float _1120 = sin(_1118);
        _1116 = _1120;
    }
    float _1122 = _1116;
    float _1124 = _1060 + _1114;
    float _1126 = _1124;
    if (_1068)
    {
        float _1128 = _1124 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1080 = _1128;
    }
    float _1130 = _1080;
    float _1132 = _1102;
    float _1134 = _1130;
    if (_1068)
    {
        float _1136 = rsqrt(_1064);
        _1132 = _1136;
    }
    float _1138 = _1132;
    if (_1068)
    {
        float _1140 = _1110 + (-1.0);
        _1082 = _1140;
    }
    float _1142 = _1082;
    float _1144 = _1142;
    if (_1068)
    {
        float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1144 = _1146;
    }
    float _1148 = _1144;
    float _1150 = _1122;
    float _1152 = _1148;
    if (_1068)
    {
        float _1154 = fma(_1122, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1084 = _1154;
    }
    float _1156 = _1084;
    if (!_1068)
    {
        _1134 = _1124;
    }
    float _1158 = _1134;
    float _1160 = _1158;
    if (_1068)
    {
        float _1162 = fma(_1124, _1110, _1148);
        _1160 = _1162;
    }
    float _1164 = _1160;
    if (!_1068)
    {
        _1150 = _1048;
    }
    float _1166 = _1150;
    float _1168 = _1166;
    if (!_1068)
    {
        _1152 = _1046;
    }
    float _1170 = _1152;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1164 + _1172;
    float _1176 = _1138;
    float _1178 = _1170;
    float _1180 = _1174;
    if (_1068)
    {
        float _1182 = _1138 * _1156;
        _1176 = _1182;
    }
    float _1184 = _1176;
    float _1186 = _1174 * _1174;
    if (_1068)
    {
        float _1188 = fma(_1058, _1184, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1168 = _1188;
    }
    float _1190 = _1168;
    if (_1068)
    {
        float _1192 = fma(_1054, _1184, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1178 = _1192;
    }
    float _1194 = _1178;
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1198 = _1190 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1202 = _1194 + _1200;
    float _1204 = fma(_1198, _1198, _1186);
    float _1206 = fma(_1202, _1202, _1204);
    float _1208 = rsqrt(_1206);
    float _1210 = sqrt(_1206);
    float _1212 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1214 = _1198 * _1212;
    float _1216 = _1202 * _1212;
    float _1218 = _1214 * _1214;
    float _1220 = _1216 * _1216;
    float _1222 = _1218 + _1220;
    float _1224 = sqrt(_1222);
    bool _1226 = _1224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1228 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1224 + _1228;
    float _1232 = _1204;
    float _1234 = _1230;
    float _1236 = _1214;
    if (_1226)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = _1240;
    if (_1226)
    {
        float _1244 = _1230 * _1240;
        _1234 = _1244;
    }
    float _1246 = _1234;
    if (_1226)
    {
        float _1248 = rsqrt(_1222);
        _1242 = _1248;
    }
    float _1250 = _1242;
    float _1252 = _1250;
    if (_1226)
    {
        float _1254 = _1246 * 0.15915493667125701904296875;
        _1126 = _1254;
    }
    float _1256 = _1126;
    float _1258 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1260 = _1208;
    float _1262 = _1256;
    if (_1226)
    {
        float _1264 = _1256 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        _1260 = _1266;
    }
    float _1268 = _1260;
    float _1270 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1272 = fma(_1210, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1270);
    float _1274 = precise::clamp(_1272, 0.0, 1.0);
    float _1276 = precise::max(0.0, _1258);
    float _1278 = -_1274;
    float _1280 = _1278 + 1.0;
    float _1282 = _1202;
    if (_1226)
    {
        float _1284 = _1256 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1282 = _1286;
    }
    float _1288 = _1282;
    float _1290 = -_1212;
    float _1292 = -_1276;
    float _1294 = fma(_1174, _1290, _1292);
    float _1296 = _1294;
    if (_1226)
    {
        float _1298 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1180 = _1298;
    }
    float _1300 = _1180;
    float _1302 = abs(_1280);
    float _1304 = log2(_1302);
    float _1306 = _1268;
    float _1308 = _1300;
    if (_1226)
    {
        float _1310 = fma(_1268, _1300, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1312;
    if (!_1226)
    {
        _1262 = _1216;
    }
    float _1316 = _1262;
    float _1318 = _1316;
    if (_1226)
    {
        float _1320 = _1250 * _1312;
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = _1288;
    if (_1226)
    {
        float _1326 = _1288 + (-1.0);
        _1308 = _1326;
    }
    float _1328 = _1308;
    float _1330 = _1328;
    if (_1226)
    {
        float _1332 = _1214 * _1322;
        _1236 = _1332;
    }
    float _1334 = _1236;
    if (_1226)
    {
        float _1336 = _1216 * _1322;
        _1318 = _1336;
    }
    float _1338 = _1318;
    float _1340 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1226)
    {
        float _1342 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1252 = _1342;
    }
    float _1344 = _1252;
    if (!_1226)
    {
        _1330 = _1218;
    }
    float _1346 = _1330;
    float _1348 = _1346;
    if (_1226)
    {
        float _1350 = _1334 * _1334;
        _1348 = _1350;
    }
    float _1352 = _1348;
    float _1354 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1340);
    if (_1226)
    {
        float _1356 = fma(_1294, _1288, _1344);
        _1296 = _1356;
    }
    float _1358 = _1296;
    if (!_1226)
    {
        _1324 = _1220;
    }
    float _1360 = _1324;
    float _1362 = _1360;
    if (_1226)
    {
        float _1364 = _1338 * _1338;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1354);
    float _1370 = fma(_1358, _1358, _1352);
    float _1372 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1374 = _1370 + _1366;
    float _1376 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = fma(_1038, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1380 = rsqrt(_1374);
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1384 = fma(_988, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1386 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1382);
    float _1388 = floor(_1378);
    float _1390 = _1386 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1392 = _1380 * _1334;
    float _1394 = _1380 * _1338;
    float _1396 = _1380 * _1358;
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1400 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1402 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1404 = floor(_1384);
    float _1406 = -_1400;
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1406);
    float _1410 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = -_1402;
    float _1414 = fma(_1412, _1398, 1.0);
    float _1416 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1418 = -_1394;
    float _1420 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1408);
    float _1422 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1424 = -_1388;
    float _1426 = _1378 + _1424;
    float _1428 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1416);
    float _1430 = fma(_1420, -0.5, 0.5);
    float _1432 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1434 = fma(_1420, 0.5, 0.5);
    float _1436 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1428);
    float _1438 = log2(_1414);
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1442 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1444 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1448 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1442);
    float _1452 = -_1404;
    float _1454 = _1384 + _1452;
    float _1456 = sqrt(_1430);
    float _1458 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1462 = fma(_1434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1464 = _1396 + 1.0;
    float _1466 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1460);
    float _1470 = fma(_1434, _1462, -0.212114393711090087890625);
    float _1472 = exp2(_1446);
    float _1474 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1476 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float2 _4798 = float2(_1426, _1454);
    float _1478 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4798, float2(0.0), isnan(_4798)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4798, float2(0.0), isnan(_4798)), level(0.0)).x;
    float _1480 = fma(_1434, _1470, 1.570728778839111328125);
    float _1482 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1474);
    float _1484 = 1.0 / _1468;
    float _1486 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1488 = _1438 * 0.693147182464599609375;
    float _1490 = _1456 * 0.636619746685028076171875;
    float _1492 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1486);
    float _1494 = _1488 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1496 = -_1480;
    float _1498 = fma(_1490, _1496, 1.0);
    float _1500 = -_1396;
    float _1502 = fma(_1472, _1464, _1500);
    float _1504 = fma(_1190, 6.2500002968590706586837768554688e-05, 0.5);
    float _1506 = fma(_1194, 6.2500002968590706586837768554688e-05, 0.5);
    float _1508 = _1476 * _1484;
    float _1510 = _1492 * _1484;
    float _1512 = fma(_1502, 0.5, 0.5);
    float _1514 = fma(_1508, 0.5, 0.5);
    float _1516 = fma(_1510, -0.5, 0.5);
    float3 _4868 = float3(_1514, _1516, _1494);
    float _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4868, float3(0.0), isnan(_4868)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4868, float3(0.0), isnan(_4868)), level(0.0)).x;
    float3 _4879 = float3(_1514, _1516, _1494);
    float4 _1521 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4879, float3(0.0), isnan(_4879)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4879, float3(0.0), isnan(_4879)), level(0.0)).xyzw;
    float _1523 = _1521.x;
    float _1525 = _1521.y;
    float _1527 = _1521.z;
    float _1529 = _1521.w;
    float2 _4895 = float2(_1498, _1512);
    float3 _1533 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4895, float2(0.0), isnan(_4895)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4895, float2(0.0), isnan(_4895)), level(0.0)).xyz;
    float _1535 = _1533.x;
    float _1537 = _1533.y;
    float _1539 = _1533.z;
    float2 _4909 = float2(_1504, _1506);
    float3 _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4909, float2(0.0), isnan(_4909)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4909, float2(0.0), isnan(_4909)), level(0.0)).xyz;
    float _1543 = _1541.x;
    float _1545 = _1541.y;
    float _1547 = _1541.z;
    float _1549 = in.m_65.y;
    bool _1551 = _428 > 0.5;
    float _1553 = _1304 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_67.x = _870;
    int _1555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1557 = _1555 != 0;
    out.m_69.x = _1190;
    out.m_69.y = _1164;
    out.m_69.z = _1194;
    float _1559 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1561 = _1559 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1565 = _1563 != 0;
    bool _1567 = _430 > 0.5;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1571 = _1569 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1575 = _1573 != 0;
    float _1577 = 1.0 / _1561;
    float _1579 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1583 = _1581 != 0;
    float _1585 = 0.0;
    bool _1587 = _1583;
    bool _1589 = _1567;
    float _1591 = _1468;
    float _1593 = _1492;
    if (_1557)
    {
        float _1595 = in.m_55.x;
        _1585 = _1595;
    }
    float _1597 = _1585;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1599;
    bool _1603 = _432 > 0.5;
    float _1605 = -_1549;
    float _1607 = _1605 + 1.0;
    float _1609 = 1.0 / _1571;
    float _1611 = 0.0;
    float _1613 = _1549;
    if (_1565)
    {
        float _1615 = in.m_55.z;
        _1611 = _1615;
    }
    float _1617 = _1611;
    float _1619 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1579);
    float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1623 = _1621 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1625 = _1551 ? as_type<int>(_1607) : as_type<int>(_1549);
    float _1627 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1631 = _1629 != 0;
    float _1633 = _1601 * _1577;
    float _1635 = _1575 ? as_type<float>(_1625) : _1549;
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1641 = _1639 != 0;
    float _1643 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1619);
    float _1645 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1649 = _1603 ? as_type<int>(_1607) : as_type<int>(_1549);
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1653 = _1623 * _1609;
    float _1655 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1657 = _1583 ? as_type<float>(_1649) : _1549;
    float _1659 = _1651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1557)
    {
        bool _1661 = _1597 > 0.5;
        _1587 = _1661;
    }
    bool _1663 = _1587;
    float _1665 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1667 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1669 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1671 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1647);
    float _1673 = in.m_65.x;
    if (_1641)
    {
        float _1675 = _1567 ? _1607 : _1549;
        _1613 = _1675;
    }
    float _1677 = _1613;
    float _1679 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1671);
    out.m_71.x = _1659;
    out.m_71.y = _1665;
    out.m_71.z = _1645;
    int _1681 = as_type<int>(_1679);
    if (_1565)
    {
        bool _1683 = _1617 > 0.5;
        _1589 = _1683;
    }
    bool _1685 = _1589;
    float _1687 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1689 = _1679 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1693 = fma(_1657, _1687, -0.5);
    float _1695 = _1689 + _1667;
    float _1697 = -_558;
    float _1699 = fma(_806, _1693, _1697);
    float _1701 = 1.0 / _1667;
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1705 = _426 + _1703;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1709 = _426 + _1707;
    float _1711 = fma(_1633, _1705, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1713 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1715 = isnan(_426);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1721 = _1717 || _1719;
    float _1723 = float(_1721);
    float _1725 = fma(_1653, _1709, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1727 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1729 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1731 = isnan(_426);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    float _1741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1743 = -_1723;
    float _1745 = _1743 + 1.0;
    float _1747 = fma(_1635, _1727, -0.5);
    bool _1749 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1751 = isnan(_426);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1711;
    float _1763 = _1673;
    if (_1631)
    {
        float _1765 = -_1673;
        float _1767 = _1765 + 1.0;
        _1681 = as_type<int>(_1767);
    }
    int _1769 = _1681;
    float _1771 = _1739 * _1745;
    float _1773 = _1695 * _1701;
    float _1775 = _1773 * 0.5;
    float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1779 = -_1739;
    float _1781 = _1779 + 1.0;
    float _1783 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1785 = -_1759;
    float _1787 = _1785 + 1.0;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1791 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1789);
    float _1793 = _1759 * _1781;
    int _1795 = as_type<int>(_1781);
    int _1797 = as_type<int>(_1775);
    if (_1557)
    {
        float _1799 = -_1673;
        float _1801 = _1799 + 1.0;
        _1795 = as_type<int>(_1801);
    }
    int _1803 = _1795;
    if (_1565)
    {
        float _1805 = -_1673;
        float _1807 = _1805 + 1.0;
        _1797 = as_type<int>(_1807);
    }
    int _1809 = _1797;
    float _1811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1813 = _1711 * _1793;
    if (!_1557)
    {
        _1086 = _1673;
    }
    float _1815 = _1086;
    float _1817 = _1741 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1819 = _1815;
    if (!_1565)
    {
        _1761 = _1673;
    }
    float _1821 = _1761;
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1813);
    float _1825 = _1821;
    if (_1557)
    {
        float _1827 = _1663 ? as_type<float>(_1803) : _1673;
        _1819 = _1827;
    }
    float _1829 = _1819;
    float _1831 = -_798;
    float _1833 = fma(_688, _1747, _1831);
    float _1835 = 1.0 / _1791;
    if (_1565)
    {
        float _1837 = _1685 ? as_type<float>(_1809) : _1673;
        _1825 = _1837;
    }
    float _1839 = _1825;
    float _1841 = _1777 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (_1631)
    {
        float _1843 = _1603 ? as_type<float>(_1769) : _1673;
        _1763 = _1843;
    }
    float _1845 = _1763;
    float _1847 = fma(_1725, _1771, _1823);
    bool _1849 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1851 = isnan(0.5);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1817, _1839, -0.5);
    bool _1861 = _924 != 0.0;
    bool _1863 = isnan(_924);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan(0.0);
    bool _1869 = _1865 || _1867;
    float _1871 = fma(_1841, _1845, -0.5);
    float _1873 = fma(_1723, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1847);
    float _1875 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1877 = fma(_674, _1871, _760);
    bool _1879 = _922 == 0.0;
    bool _1881 = !_1869;
    bool _1883 = _1879 && _1881;
    float _1885 = in.m_73.x;
    float _1887 = in.m_73.y;
    float _1889 = in.m_73.z;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1893 = _1835 * _1891;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1897 = _780 == 0.0;
    bool _1899 = _1897 && _1883;
    float _1901 = abs(_1893);
    float _1903 = log2(_1901);
    float _1905 = fma(_1875, _1829, -0.5);
    float _1907 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[107].z;
    if (!_1857)
    {
        _1911 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1913 = _1911;
    float _1915 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1917 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1919 = _1909 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1921 = _1873 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1923 = fma(_800, _1905, _754);
    float _1925 = _1917;
    float _1927 = _1915;
    if (!_1857)
    {
        float _1929 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1931 = _1913 + _1929;
        _816 = _1931;
    }
    float _1933 = _816;
    float _1935 = _1877 + 0.5;
    float _1937 = _1833 + 0.5;
    float _1939 = fma(_788, _1859, _810);
    out.m_75.x = _1915;
    out.m_75.y = _1917;
    out.m_75.z = _1919;
    out.m_75.w = _1921;
    float _1941 = _1933;
    float _1943 = _1937;
    if (!_1857)
    {
        float _1945 = 1.0 / _1933;
        _818 = _1945;
    }
    float _1947 = _818;
    float _1949 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_77.x = _1935;
    out.m_77.y = _1937;
    float _1951 = fma(_1783, _1677, -0.5);
    float _1953 = _1923 + 0.5;
    float _1955 = _1939 + 0.5;
    float _1957 = _1885;
    float _1959 = _1887;
    if (!_1899)
    {
        float _1961 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1885);
        _1957 = _1961;
    }
    float _1963 = _1957;
    float _1965 = exp2(_1949);
    if (_1857)
    {
        _1941 = 1.0;
    }
    float _1967 = _1941;
    float _1969 = -_812;
    float _1971 = fma(_668, _1951, _1969);
    float _1973 = _1699 + 0.5;
    float _1975 = _1967;
    if (_1899)
    {
        _1925 = _1889;
    }
    float _1977 = _1925;
    float _1979 = _1971 + 0.5;
    float _1981 = _1977;
    if (_1899)
    {
        _1927 = _1887;
    }
    float _1983 = _1927;
    float _1985 = _1983;
    if (!_1899)
    {
        float _1987 = fma(_924, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1887);
        _1985 = _1987;
    }
    float _1989 = _1985;
    if (_1899)
    {
        _1943 = _1977;
    }
    float _1991 = _1943;
    float _1993 = exp2(_1553);
    float _1995 = _1991;
    if (!_1899)
    {
        _1981 = _1889;
    }
    float _1997 = _1981;
    float _1999 = _978 * _1989;
    float _2001 = _1997;
    if (!_1899)
    {
        _1959 = _1989;
    }
    float _2003 = _1959;
    out.m_79.x = _1953;
    out.m_79.y = _1973;
    out.m_79.z = _1955;
    out.m_79.w = _1979;
    if (!_1899)
    {
        float _2005 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _1995 = _2005;
    }
    float _2007 = _1995;
    if (!_1857)
    {
        float _2009 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2011 = _1893 + _2009;
        _1088 = _2011;
    }
    float _2013 = _1088;
    float _2015 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2017 = precise::clamp(_2015, 0.0, 1.0);
    if (!_1857)
    {
        float _2019 = _2013 * _1947;
        float _2021 = precise::clamp(_2019, 0.0, 1.0);
        _1975 = _2021;
    }
    float _2023 = _1975;
    if (!_1899)
    {
        _2001 = _2007;
    }
    float _2025 = _2001;
    float _2027 = _2003 * _2003;
    float _2029 = fma(_2017, -2.0, 3.0);
    float _2031 = _2017 * _2017;
    bool _2033 = _1893 <= 8000.0;
    bool _2035 = isnan(_1893);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(8000.0);
    bool _2041 = _2037 || _2039;
    float _2043 = float(_2041);
    float _2045 = fma(_2025, _2025, _2027);
    float _2047 = fma(_990, _1963, _1999);
    float _2049 = _2031 * _2029;
    float _2051 = -_1989;
    float _2053 = _968 * _2051;
    float _2055 = _982 * _1989;
    float _2057 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2059 = rsqrt(_2045);
    float _2061 = -_2049;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_984, _1963, _2053);
    float _2067 = fma(_998, _1963, _2055);
    float _2069 = _990 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2071 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2049);
    float _2073 = fma(_986, _2007, _2065);
    float _2075 = fma(_1002, _2007, _2047);
    float _2077 = fma(_992, _2007, _2067);
    float _2079 = _2043 * _2071;
    float _2081 = _990 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2083 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2069);
    float _2085 = _990 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2087 = fma(_1440, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2057);
    float _2089 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2081);
    float _2091 = -_1993;
    float _2093 = _2091 + 1.0;
    float _2095 = _2059 * _2003;
    float _2097 = _2059 * _2025;
    float _2099 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2083);
    float _2101 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2089);
    float _2103 = -_2095;
    float _2105 = _1002 * _2103;
    float _2107 = -_2095;
    float _2109 = _986 * _2107;
    float _2111 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2085);
    float _2113 = -_2095;
    float _2115 = _992 * _2113;
    float _2117 = fma(_978, _2097, _2105);
    float _2119 = -_968;
    float _2121 = fma(_2119, _2097, _2109);
    float _2123 = fma(_998, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2111);
    float _2125 = in.m_81.x;
    float _2127 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2129 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2131 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2133 = fma(_982, _2097, _2115);
    float _2135 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2127);
    float _2137 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2129);
    float _2139 = fma(_2121, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2131);
    out.m_83.x = _2123;
    out.m_83.y = _2099;
    out.m_83.z = _2101;
    float _2141 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2087);
    float _2143 = _1476 + _1468;
    float _2145 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2147 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2149 = _2143 * 0.5;
    bool _2151 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2153 = isnan(_1210);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2159 = _2155 || _2157;
    float _2161 = _2147 + _1468;
    out.gl_Position.x = _1476;
    out.gl_Position.y = _1492;
    out.gl_Position.z = _2147;
    out.gl_Position.w = _1468;
    float _2163 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2135);
    float _2165 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2137);
    float _2167 = fma(_2133, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2139);
    float _2169 = _1468 * 0.5;
    float _2171 = _2161 * 0.5;
    float _2173 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2175 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2177 = fma(_1492, -0.5, _2169);
    float _2179 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2181 = _2075 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2183 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2173);
    out.m_85.x = _2149;
    out.m_85.y = _2177;
    out.m_85.z = _2171;
    out.m_85.w = _1468;
    float _2185 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2175);
    float _2187 = fma(_2073, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2181);
    float _2189 = -_2145;
    float _2191 = _2189 + 1.0;
    float _2193 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2183);
    float _2195 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2185);
    float _2197 = fma(_2077, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2187);
    out.m_87.x = _2163;
    out.m_87.y = _2165;
    out.m_87.z = _2167;
    float _2199 = _2147;
    float _2201 = _2165;
    float _2203 = _2163;
    float _2205 = _2191;
    if (!_2159)
    {
        _1591 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2207 = _1591;
    float _2209 = _2207;
    float _2211 = _2207;
    if (!_2159)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2213 = _2199;
    out.m_89.x = _2193;
    out.m_89.y = _2195;
    out.m_89.z = _2197;
    float _2215 = _2213;
    float _2217 = _2213;
    if (!_2159)
    {
        _1593 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2219 = _1593;
    float _2221 = _2023 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2223 = _2219;
    float _2225 = _2219;
    if (!_2159)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2227 = _2201;
    float _2229 = _2227;
    float _2231 = _2227;
    if (!_2159)
    {
        _2203 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2233 = _2203;
    float _2235 = -_1478;
    float _2237 = _2235 + 1.0;
    float _2239 = _2237 * _2179;
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = -_2241;
    float _2245 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2247 = _2245 * _2125;
    float _2249 = _2247 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _2249;
    float _2251 = _2145 * _1518;
    float _2253 = _1529 * _2191;
    float _2255 = _2233;
    float _2257 = _2233;
    if (!_2159)
    {
        _2205 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2259 = _2205;
    float _2261 = _1529 * _2251;
    float _2263 = _1539 * _2251;
    float _2265 = fma(_1535, _2261, _1523);
    float _2267 = fma(_1537, _2261, _1525);
    float _2269 = fma(_1529, _2263, _1527);
    out.m_93.x = _1543;
    out.m_93.y = _1545;
    out.m_93.z = _1547;
    out.m_95.x = _2265;
    out.m_95.y = _2267;
    out.m_95.z = _2269;
    out.m_95.w = _2253;
    bool _2271 = !_2159;
    float _2273 = _2259;
    float _2275 = _2259;
    if (!_2271)
    {
        bool _2277 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2279 = isnan(_1210);
        bool _2281 = _2277 || _2279;
        bool _2283 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2285 = _2281 || _2283;
        if (!_2285)
        {
            float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2289 = _1210 + _2287;
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2299 = 1.0 / _2293;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2317 = _2289 * _2299;
            float _2319 = precise::clamp(_2317, 0.0, 1.0);
            float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2325 = fma(_2319, _2297, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2327 = fma(_2319, _2303, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2329 = fma(_2319, _2323, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2331 = fma(_2319, _2307, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2333 = fma(_2319, _2311, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2335 = fma(_2319, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2257 = _2329;
            _2225 = _2333;
            _2231 = _2327;
            _2217 = _2325;
            _2211 = _2331;
            _2275 = _2335;
            _2337 = true;
        }
        else
        {
            bool _2339 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2341 = isnan(_1210);
            bool _2343 = _2339 || _2341;
            bool _2345 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2347 = _2343 || _2345;
            if (!_2347)
            {
                _2229 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2349 = _2229;
            _2231 = _2349;
            if (!_2347)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2351 = _2255;
            _2257 = _2351;
            if (!_2347)
            {
                _2209 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2353 = _2209;
            _2211 = _2353;
            if (!_2347)
            {
                _2215 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2355 = _2215;
            _2217 = _2355;
            if (!_2347)
            {
                _2223 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2357 = _2223;
            _2225 = _2357;
            if (!_2347)
            {
                _2273 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2359 = _2273;
            bool _2361 = !_2347;
            _2275 = _2359;
            if (!_2361)
            {
                bool _2363 = _1210 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2365 = isnan(_1210);
                bool _2367 = _2363 || _2365;
                bool _2369 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2371 = _2367 || _2369;
                if (!_2371)
                {
                    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2375 = _1210 + _2373;
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2385 = 1.0 / _2379;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2403 = _2375 * _2385;
                    float _2405 = precise::clamp(_2403, 0.0, 1.0);
                    float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2409 = _2407 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2411 = fma(_2405, _2383, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2413 = fma(_2405, _2389, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2415 = fma(_2405, _2409, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2417 = fma(_2405, _2393, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2419 = fma(_2405, _2397, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2421 = fma(_2405, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2257 = _2415;
                    _2225 = _2419;
                    _2231 = _2413;
                    _2217 = _2411;
                    _2211 = _2417;
                    _2275 = _2421;
                    _2337 = true;
                }
                else
                {
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2225 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2231 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2217 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2211 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2275 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2337 = false;
    float _2423 = _2257;
    float _2425 = _2225;
    float _2427 = _2231;
    float _2429 = _2217;
    float _2431 = _2211;
    float _2433 = _2275;
    float _2435 = fma(_2195, -0.5, 0.5);
    float _2437 = precise::clamp(_2435, 0.0, 1.0);
    float _2439 = -_2423;
    float _2441 = _2439 + _2425;
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    out.m_97.x = 0.0;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    float _2451 = fma(_2437, _2441, _2423);
    float _2453 = fma(_2437, _2445, _2427);
    bool _2455 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2457 = _2451 * 0.586610972881317138671875;
    float _2459 = fma(_2437, _2449, _2431);
    float _2461 = _2221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2463 = fma(_2453, 0.298911988735198974609375, _2457);
    bool _2465 = _2023 > 0.0;
    bool _2467 = isnan(_2023);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan(0.0);
    bool _2473 = _2469 || _2471;
    float _2475 = fma(_2459, 0.114477999508380889892578125, _2463);
    out.m_51.x = _2461;
    float _2477 = -_2475;
    float _2479 = _2451 + _2477;
    float _2481 = -_2475;
    float _2483 = _2453 + _2481;
    float _2485 = -_2475;
    float _2487 = _2459 + _2485;
    float _2489 = fma(_2479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    float _2491 = fma(_2483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    float _2493 = fma(_2487, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2475);
    bool _2495 = !_2455;
    if (!_2495)
    {
        float _2497 = -_1164;
        float _2499 = _2497 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2501 = -_1190;
        float _2503 = _2501 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2505 = -_1194;
        float _2507 = _2505 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2509 = _2499 * _2499;
        float _2511 = fma(_2503, _2503, _2509);
        float _2513 = fma(_2507, _2507, _2511);
        float _2515 = sqrt(_2513);
        float _2517 = rsqrt(_2513);
        float _2519 = -_2515;
        float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2523 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2525 = precise::clamp(_2523, 0.0, 1.0);
        float _2527 = _2503 * _2517;
        float _2529 = _2499 * _2517;
        float _2531 = abs(_2525);
        float _2533 = log2(_2531);
        float _2535 = _2507 * _2517;
        float _2537 = _2527 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2539 = _2195 * _2529;
        float _2541 = -_2529;
        float _2543 = -_2537;
        float _2545 = fma(_2541, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2543);
        float _2547 = fma(_2193, _2527, _2539);
        float _2549 = -_2535;
        float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2545);
        float _2553 = fma(_2197, _2535, _2547);
        float _2555 = precise::clamp(_2553, 0.0, 1.0);
        float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2559 = _2551 + _2557;
        float _2561 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2563 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2565 = precise::clamp(_2563, 0.0, 1.0);
        float _2567 = exp2(_2561);
        float _2569 = _2567 * _2565;
        float _2571 = _2555 * _2569;
        float _2573 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2575 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2577 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2573;
        out.m_97.y = _2575;
        out.m_97.z = _2577;
    }
    out.m_99.x = _2491;
    out.m_99.y = _2489;
    out.m_99.z = _2493;
    if (_2473)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2579 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2579;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

