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
    float4 m_63 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2110 = false;
    bool _858 = false;
    bool _620 = false;
    bool _400 = false;
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
        float _2870 = as_type<float>(_114);
        out.gl_Position.z = _2870;
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
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2939 = as_type<float>(_152);
        out.gl_Position.z = _2939;
    }
    if (_146)
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
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 0.0;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = _188 * 6.283185482025146484375;
    float _198 = floor(_188);
    float _200 = _196 * 0.15915493667125701904296875;
    float _202 = _200 * 6.283185482025146484375;
    float _204 = cos(_202);
    float _206 = -_198;
    float _208 = _188 + _206;
    bool _210 = _208 < 0.5;
    float _212 = float(_210);
    float _214 = fma(_204, 0.5, 0.5);
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = -_208;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = -_212;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_214;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _296 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _304 = _302 != 0;
    float _306 = in.m_53.w;
    float _308 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _314 = in.m_44.x;
    float _316 = in.m_44.y;
    float _318 = in.m_44.z;
    float _320 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    bool _322 = !_174;
    int _324 = _322 ? 0 : 1;
    float _326 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _328 = !_300;
    int _330 = _328 ? 0 : 1;
    float _332 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].y, _310);
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _312);
    int _336 = abs(_324);
    float _338 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].x, _320);
    int _340 = abs(_330);
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].y, _332);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _346 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].z, _334);
    bool _348 = !_304;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_274, _288, _338);
    float _354 = float(_340);
    float _356 = fma(_274, _290, _342);
    int _358 = abs(_350);
    float _360 = fma(_274, _292, _346);
    float _362 = float(_336);
    float _364 = abs(_278);
    float _366 = _354 * _364;
    float _368 = float(_358);
    float _370 = fma(_352, _306, _314);
    float _372 = fma(_356, _306, _316);
    float _374 = fma(_362, _286, _366);
    float _376 = fma(_360, _306, _318);
    float _378 = abs(_282);
    float _380 = fma(_368, _378, _374);
    bool _382 = !_344;
    float _398;
    if (!_382)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _386 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_98);
        float _404 = 1.0 / _402;
        float _406 = _132 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = _408 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _408 + _414;
    bool _418 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _436 = _408 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _446 = 1.0 / _432;
    bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _450 = 1.0 / _444;
    float _452 = 1.0 / _440;
    float _454 = _412 * _446;
    bool _456 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_428;
    float _470 = _468 + 1.0;
    float _472 = _466 * _470;
    float _474 = _416 * _450;
    bool _476 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_408);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _494 = isnan(_408);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_466;
    float _506 = _504 + 1.0;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = -_486;
    float _514 = _512 + 1.0;
    float _516 = _436 * _452;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = _502 * _514;
    float _528 = fma(_490, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = fma(_520, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _532 = fma(_524, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _534 = _486 * _506;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = _530 * _526;
    float _546 = _532 * _526;
    float _548 = _528 * _526;
    float _550 = -_502;
    float _552 = _550 + 1.0;
    float _554 = fma(_510, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_538, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_542, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _546);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _544);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _564;
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _574;
    float _578 = fma(_554, _534, _560);
    float _580 = fma(_566, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _582 = fma(_572, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _584 = fma(_556, _534, _562);
    float _586 = fma(_576, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _588 = fma(_558, _534, _568);
    float _590 = fma(_580, _472, _578);
    float _592 = fma(_582, _472, _584);
    float _594 = fma(_586, _472, _588);
    float _596 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].x, _590);
    float _598 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].y, _592);
    float _600 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].z, _594);
    bool _602 = !_448;
    float _618;
    if (!_602)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _606 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_98);
        float _624 = 1.0 / _622;
        float _626 = _132 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_53.x;
    float _632 = in.m_53.y;
    float _634 = in.m_53.z;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _638 = _628 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _628 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _652;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _646;
    bool _670 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _672 = 1.0 / _650;
    float _674 = 1.0 / _654;
    float _676 = _600 * _634;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _628 + _678;
    float _682 = _598 * _632;
    float _684 = _596 * _630;
    float _686 = _680 * _668;
    float _688 = -_666;
    float _690 = _688 + 1.0;
    float _692 = _638 * _672;
    bool _694 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _696 = isnan(_628);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _706;
    bool _710 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_628);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    bool _722 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _724 = isnan(_628);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _704 * _690;
    float _736 = -_704;
    float _738 = _736 + 1.0;
    float _740 = _642 * _674;
    float _742 = -_720;
    float _744 = _742 + 1.0;
    float _746 = fma(_708, _686, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _748 = _720 * _738;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _750;
    float _754 = _732 * _744;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _764 = fma(_752, _686, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _766 = _746 * _754;
    float _768 = fma(_758, _686, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = _764 * _754;
    float _776 = _768 * _754;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _788;
    float _792 = fma(_780, _692, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _794 = fma(_784, _692, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _796 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _766);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _798;
    float _802 = fma(_762, _692, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _804 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _776);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _806;
    float _810 = fma(_792, _748, _786);
    float _812 = fma(_790, _740, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _814 = fma(_800, _740, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _816 = fma(_794, _748, _796);
    float _818 = fma(_808, _740, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _820 = fma(_802, _748, _804);
    float _822 = fma(_812, _734, _810);
    float _824 = fma(_814, _734, _816);
    float _826 = fma(_818, _734, _820);
    float _828 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].x, _822);
    float _830 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].y, _824);
    float _832 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].z, _826);
    bool _834 = !_670;
    bool _836 = _670;
    int _838 = as_type<int>(_814);
    float _854;
    float _856;
    if (!_834)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _842 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _846 = _844 * _840;
        float _848 = floor(_846);
        float _850 = -_848;
        float _852 = _846 + _850;
        _854 = _852;
        _856 = _846;
        _858 = true;
    }
    else
    {
        float _860 = float(_98);
        float _862 = 1.0 / _860;
        float _864 = _132 * _862;
        _854 = _864;
        _856 = _860;
    }
    _858 = false;
    float _866 = _854;
    float _868 = _856;
    float _870 = in.m_55.x;
    float _872 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _874 = log2(_872);
    float _876 = _154 * 2.0;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _880 = _878 != 0;
    float _882 = in.m_51.w;
    float _884 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _886 = _830 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _888 = in.m_55.y;
    float _890 = floor(_876);
    float _892 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _894 = in.m_51.y;
    float _896 = _868;
    if (_880)
    {
        bool _898 = _154 > 0.5;
        _836 = _898;
    }
    bool _900 = _836;
    float _902 = in.m_51.z;
    float _904 = _874 * _132;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_880)
    {
        float _908 = -_870;
        float _910 = _908 + 1.0;
        _838 = as_type<int>(_910);
    }
    int _912 = _838;
    if (!_880)
    {
        _896 = _870;
    }
    float _914 = _896;
    float _916 = exp2(_904);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _928 = _926 != 0;
    float _930 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _932 = _914;
    if (_880)
    {
        float _934 = _900 ? as_type<float>(_912) : _870;
        _932 = _934;
    }
    float _936 = _932;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _940 = _938 != 0;
    float _942 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _930);
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _946 = _944 != 0;
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _952 = _950 != 0;
    float _954 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _956 = _882 > 0.5;
    float _958 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = -_888;
    float _962 = _960 + 1.0;
    float _964 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _966 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _968 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    int _970 = _956 ? as_type<int>(_962) : as_type<int>(_888);
    float _972 = _894 * 2.0;
    bool _974 = _894 > 0.5;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _980 = _946 ? as_type<float>(_970) : _888;
    float _982 = -_916;
    float _984 = _982 + 1.0;
    bool _986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(1.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _998 = 1.0 + _996;
    float _1000 = _888;
    int _1002 = as_type<int>(_962);
    bool _1004 = _952;
    float _1006 = _978;
    if (_952)
    {
        float _1008 = _974 ? _962 : _888;
        _1000 = _1008;
    }
    float _1010 = _1000;
    float _1012 = 1.0 / _978;
    if (_940)
    {
        float _1014 = -_870;
        float _1016 = _1014 + 1.0;
        _1002 = as_type<int>(_1016);
    }
    int _1018 = _1002;
    if (_940)
    {
        bool _1020 = _902 > 0.5;
        _1004 = _1020;
    }
    bool _1022 = _1004;
    float _1024 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _1026 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _966);
    float _1028 = _894 + _902;
    float _1030 = _968 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1032 = 1.0 / _998;
    if (!_940)
    {
        _1006 = _870;
    }
    float _1034 = _1006;
    float _1036 = _1028 + (-1.0);
    float _1038 = _1034;
    if (_940)
    {
        float _1040 = _1022 ? as_type<float>(_1018) : _870;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1044;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = _154 + _902;
    float _1060 = floor(_972);
    float _1062 = _1056 ? _984 : 0.0;
    float _1064 = _902 * 2.0;
    float _1066 = _1046 * _1012;
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1072 = _866 + _1070;
    float _1074 = _1058 + (-1.0);
    bool _1076 = _890 > 0.0;
    float _1078 = _1042;
    if (_994)
    {
        float _1080 = _1062 * _1032;
        _136 = _1080;
    }
    float _1082 = _136;
    bool _1084 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1086 = isnan(_866);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = fma(_1066, _1072, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1098 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1100 = isnan(_866);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = floor(_1064);
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1114 = _1030 + _1112;
    float _1116 = -_1094;
    float _1118 = _1116 + 1.0;
    bool _1120 = _890 >= 0.0;
    bool _1122 = isnan(_890);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1132 = _1060 > 0.0;
    float _1134 = _1108 * _1118;
    bool _1136 = _1060 >= 0.0;
    bool _1138 = isnan(_1060);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1148 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1152 = _1128 ? 0 : 1;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1156 = _1146 + _1154;
    float _1158 = _1096 * _1134;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1148 + _1160;
    int _1164 = _1144 ? 0 : 1;
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1150);
    float _1168 = -_1108;
    float _1170 = _1168 + 1.0;
    float _1172 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1174 = ~_1152;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1166);
    int _1182 = _1178;
    float _1184 = _1146;
    if (!_1076)
    {
        int _1186 = ~_1152;
        int _1188 = _1186 + 1;
        _1182 = _1188;
    }
    int _1190 = _1182;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1158);
    int _1194 = ~_1164;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = _1172 * _906;
    int _1202 = _1198;
    if (!_1132)
    {
        int _1204 = ~_1164;
        int _1206 = _1204 + 1;
        _1202 = _1206;
    }
    int _1208 = _1202;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1212 = _1110 > 0.0;
    float _1214 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1192);
    bool _1216 = _1110 >= 0.0;
    bool _1218 = isnan(_1110);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    float _1226 = _902 + (-0.5);
    bool _1228 = !_924;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = in.m_57.x;
    float _1234 = in.m_57.y;
    float _1236 = in.m_57.z;
    bool _1238 = _1180 >= 0.0;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1242 = !_928;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1248 = abs(_1230);
    float _1250 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1252 = abs(_1244);
    float _1254 = _1246 * _948;
    float _1256 = _1250 * _1210;
    float _1258 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = float(_1248);
    if (_1238)
    {
        out.m_47.x = 0.0;
    }
    float _1262 = float(_1190);
    float _1264 = _894 + (-0.5);
    int _1266 = _1224 ? 0 : 1;
    float _1268 = _1258 * _1240;
    float _1270 = float(_1252);
    float _1272 = _1260 * _1262;
    int _1274 = ~_1266;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _1278;
    if (!_1212)
    {
        int _1282 = ~_1266;
        int _1284 = _1282 + 1;
        _1280 = _1284;
    }
    int _1286 = _1280;
    out.m_59.x = _1256;
    out.m_59.y = _1254;
    out.m_59.z = _1268;
    out.m_59.w = _1200;
    float _1288 = _1272 * (-2.0);
    float _1290 = float(_1208);
    if (_1238)
    {
        _1078 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1292 = _1078;
    float _1294 = fma(_1288, _1234, _1234);
    float _1296 = fma(_1068, _1288, _1068);
    float _1298 = _1270 * _1290;
    float _1300 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1294);
    float _1302 = _1298 * (-2.0);
    int _1304 = as_type<int>(_1292);
    if (_1238)
    {
        float _1306 = _1292 * 5.0;
        _1304 = as_type<int>(_1306);
    }
    int _1308 = _1304;
    float _1310 = _1114 * _1114;
    float _1312 = fma(_1130, _1302, _1130);
    float _1314 = fma(_1302, _1236, _1236);
    float _1316 = fma(_1156, _1156, _1310);
    if (_1238)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4769 = as_type<float>(_1308);
        out.gl_Position.z = _4769;
    }
    float _1318 = fma(_1162, _1162, _1316);
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1328 = !_920;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = rsqrt(_1318);
    float _1334 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1348 = abs(_1330);
    out.m_61.x = _1334;
    out.m_61.y = _1336;
    out.m_61.z = _1338;
    out.m_61.w = _1324;
    float _1350 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1314);
    float _1352 = fma(_1296, _1082, _1300);
    float _1354 = float(_1348);
    out.m_63.x = _1340;
    out.m_63.y = _1342;
    out.m_63.z = _1344;
    out.m_63.w = _1346;
    float _1356 = _1114 * _1332;
    float _1358 = _1156 * _1332;
    float _1360 = _1162 * _1332;
    float _1362 = -_1356;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1114);
    if (_1238)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1366 = -_1356;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1370 = -_1358;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1374 = -_1358;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1378 = _1364 * _1364;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1382 = _1368 + _1380;
    float _1384 = float(_1286);
    float _1386 = _1352 * 0.15915493667125701904296875;
    float _1388 = -_1360;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1376 + _1392;
    float _1396 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1354 * _1384;
    float _1400 = _154 + _894;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1404 = _1390 + _1402;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1396);
    float _1408 = fma(_1312, _1082, _1350);
    float _1410 = _1400 + (-1.0);
    float _1412 = _1398 * (-2.0);
    float _1414 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1406);
    float _1416 = _154 + (-0.5);
    float _1418 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1420 = fma(_1412, _1232, _1232);
    float _1422 = fma(_1372, _1372, _1378);
    bool _1424 = _1414 >= 0.0;
    float _1426 = fma(_1418, _1412, _1418);
    float _1428 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1420);
    float _1430 = -_1360;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1162);
    float _1434 = _1408 * 0.15915493667125701904296875;
    float _1436 = _1386 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = fma(_1426, _1082, _1428);
    float _1442 = fma(_1432, _1432, _1422);
    float _1444 = _1440 * 0.15915493667125701904296875;
    float _1446 = _1398;
    if (_1424)
    {
        _1446 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1448 = _1446;
    float _1450 = _1386 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    int _1454 = as_type<int>(_1448);
    if (_1424)
    {
        out.m_47.x = 0.0;
    }
    if (_1424)
    {
        float _1456 = _1448 * 5.0;
        _1454 = as_type<int>(_1456);
    }
    int _1458 = _1454;
    float _1460 = sqrt(_1442);
    if (_1424)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5045 = as_type<float>(_1458);
        out.gl_Position.z = _5045;
    }
    float _1462 = _1434 * 6.283185482025146484375;
    float _1464 = sin(_1462);
    float _1466 = _1434 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1444 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    if (_1424)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1474 = -_1030;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = -_1146;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1482 = -_1148;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _1332 * _1460;
    float _1488 = _1476 * _1476;
    float _1490 = in.m_65.x;
    float _1492 = in.m_65.y;
    float _1494 = in.m_65.z;
    float _1496 = _1444 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = _1452 * _1468;
    float _1502 = fma(_1480, _1480, _1488);
    float _1504 = _1438 * _1464;
    float _1506 = _1452 * _1464;
    float _1508 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1510 = fma(_1484, _1484, _1502);
    float _1512 = fma(_1472, _1504, _1500);
    float _1514 = fma(_1472, _1500, _1504);
    float _1516 = _1438 * _1468;
    float _1518 = rsqrt(_1510);
    float _1520 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1522 = _1486 * _1508;
    float _1524 = -_1516;
    float _1526 = fma(_1472, _1506, _1524);
    float _1528 = _1486 * _1520;
    float _1530 = _1464 * _1498;
    float _1532 = _1468 * _1498;
    float _1534 = _1438 * _1498;
    float _1536 = _1452 * _1498;
    float _1538 = -_1506;
    float _1540 = fma(_1472, _1516, _1538);
    float _1542 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1490);
    bool _1546 = _1492 != 0.0;
    bool _1548 = isnan(_1492);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = _1486 * _1542;
    float _1558 = _1480 * _1518;
    float _1560 = _1484 * _1518;
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1492);
    float _1564 = _1544 * _1522;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1568 = _1558 * _1566;
    float _1570 = _1476 * _1518;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1574 = _1560 * _1572;
    float _1576 = in.m_67.x;
    float _1578 = in.m_67.y;
    float _1580 = in.m_67.z;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1584 = -_1568;
    float _1586 = fma(_1560, _1582, _1584);
    float _1588 = _1562 * _1556;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1592 = _1570 * _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1596 = -_1574;
    float _1598 = fma(_1570, _1594, _1596);
    float _1600 = _1586 * _1586;
    float _1602 = _1540 * _1588;
    float _1604 = _1532 * _1588;
    float _1606 = _1514 * _1588;
    bool _1608 = _1490 == 0.0;
    bool _1610 = !_1554;
    bool _1612 = _1608 && _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1616 = -_1592;
    float _1618 = fma(_1558, _1614, _1616);
    float _1620 = fma(_1598, _1598, _1600);
    float _1622 = fma(_1512, _1564, _1602);
    float _1624 = fma(_1530, _1564, _1604);
    float _1626 = fma(_1526, _1564, _1606);
    bool _1628 = _1494 == 0.0;
    bool _1630 = _1628 && _1612;
    float _1632 = in.m_69.x;
    float _1634 = in.m_69.y;
    float _1636 = in.m_69.z;
    float _1638 = in.m_69.w;
    float _1640 = fma(_1618, _1618, _1620);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1648 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1650;
    float _1654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1494);
    float _1656 = _1644 * _1644;
    float _1658 = rsqrt(_1640);
    float _1660 = _1654 * _1528;
    float _1662 = fma(_1648, _1648, _1656);
    float _1664 = 0.0;
    float _1666 = _1528;
    float _1668 = _1576;
    float _1670 = _1662;
    if (_1630)
    {
        _1664 = _1576;
    }
    float _1672 = _1664;
    float _1674 = 0.0;
    float _1676 = _1672;
    if (_1630)
    {
        _1674 = _1578;
    }
    float _1678 = _1674;
    float _1680 = fma(_1652, _1652, _1662);
    float _1682 = 0.0;
    float _1684 = _1678;
    if (_1630)
    {
        _1682 = _1580;
    }
    float _1686 = _1682;
    float _1688 = _1686;
    if (_1630)
    {
        _1666 = _1672;
    }
    float _1690 = _1666;
    float _1692 = sqrt(_1680);
    float _1694 = _1690;
    if (!_1630)
    {
        _1676 = _1576;
    }
    float _1696 = _1676;
    if (_1630)
    {
        _1668 = _1678;
    }
    float _1698 = _1668;
    float _1700 = _1586 * _1658;
    float _1702 = _1698;
    if (_1630)
    {
        _1670 = _1686;
    }
    float _1704 = _1670;
    float _1706 = _1704;
    if (!_1630)
    {
        float _1708 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1696);
        _1694 = _1708;
    }
    float _1710 = _1694;
    if (!_1630)
    {
        _1684 = _1578;
    }
    float _1712 = _1684;
    float _1714 = fma(_1534, _1660, _1622);
    if (!_1630)
    {
        _1688 = _1580;
    }
    float _1716 = _1688;
    float _1718 = -_1472;
    float _1720 = fma(_1718, _1660, _1624);
    float _1722 = fma(_1536, _1660, _1626);
    float _1724 = _1598 * _1658;
    float _1726 = _1636 * _1696;
    if (!_1630)
    {
        float _1728 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1716);
        _1706 = _1728;
    }
    float _1730 = _1706;
    float _1732 = _1618 * _1658;
    float _1734 = _1560 * _1700;
    float _1736 = _1570 * _1724;
    float _1738 = -_1726;
    float _1740 = fma(_1632, _1716, _1738);
    float _1742 = _1634 * _1716;
    float _1744 = -_1734;
    float _1746 = fma(_1570, _1732, _1744);
    if (!_1630)
    {
        float _1748 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1712);
        _1702 = _1748;
    }
    float _1750 = _1702;
    float _1752 = -_1736;
    float _1754 = fma(_1558, _1700, _1752);
    float _1756 = rsqrt(_1680);
    float _1758 = -_1742;
    float _1760 = fma(_1636, _1712, _1758);
    float _1762 = _1746 * _1720;
    float _1764 = precise::max(_1692, 10.0);
    float _1766 = _1754 * _1720;
    float _1768 = _1632 * _1712;
    float _1770 = fma(_1724, _1714, _1762);
    float _1772 = precise::min(_1764, 50.0);
    float _1774 = fma(_1732, _1714, _1766);
    float _1776 = _1692 * 0.039999999105930328369140625;
    float _1778 = fma(_1558, _1722, _1770);
    float _1780 = -_1768;
    float _1782 = fma(_1634, _1696, _1780);
    float _1784 = fma(_1560, _1722, _1774);
    float _1786 = fma(_1772, 0.25, -2.5);
    float _1788 = precise::max(_1776, 1.0);
    float _1790 = _1146 + _1778;
    float _1792 = _1148 + _1784;
    float _1794 = _1756 * _1786;
    float _1796 = precise::min(_1788, 2.0);
    float _1798 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1800 = _1790 + _1798;
    float _1802 = _1740 * _1638;
    float _1804 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1806 = _1792 + _1804;
    float _1808 = _1760 * _1638;
    float _1810 = _1558 * _1732;
    float _1812 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1814 = fma(_1806, _1796, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1816 = _1782 * _1638;
    float _1818 = -_1810;
    float _1820 = fma(_1560, _1724, _1818);
    float _1822 = -_1794;
    float _1824 = fma(_1648, _1822, _1812);
    float _1826 = -_1794;
    float _1828 = fma(_1652, _1826, _1814);
    float _1830 = _1530 * _1746;
    float _1832 = _1530 * _1820;
    float _1834 = _1532 * _1746;
    float _1836 = _1532 * _1820;
    float _1838 = _1530 * _1754;
    float _1840 = _1532 * _1754;
    float _1842 = -_1746;
    float _1844 = _1472 * _1842;
    float _1846 = -_1754;
    float _1848 = _1472 * _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1852 = _1824 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1856 = _1828 + _1854;
    float _1858 = -_1820;
    float _1860 = _1472 * _1858;
    float _1862 = _1820 * _1720;
    float _1864 = _1852 * _1852;
    float _1866 = _1856 * _1856;
    float _1868 = fma(_1512, _1724, _1830);
    float _1870 = fma(_1512, _1700, _1832);
    float _1872 = fma(_1512, _1732, _1838);
    float _1874 = _1864 + _1866;
    float _1876 = fma(_1540, _1724, _1834);
    float _1878 = fma(_1540, _1700, _1836);
    float _1880 = fma(_1540, _1732, _1840);
    float _1882 = fma(_1700, _1714, _1862);
    float _1884 = sqrt(_1874);
    float _1886 = fma(_1534, _1724, _1844);
    float _1888 = fma(_1534, _1700, _1860);
    float _1890 = fma(_1570, _1722, _1882);
    float _1892 = fma(_1534, _1732, _1848);
    float _1894 = fma(_1514, _1558, _1876);
    float _1896 = fma(_1514, _1560, _1880);
    float _1898 = _1030 + _1890;
    float _1900 = fma(_1514, _1570, _1878);
    float _1902 = fma(_1526, _1570, _1870);
    float _1904 = fma(_1526, _1558, _1868);
    float _1906 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1908 = _1898 + _1906;
    float _1910 = fma(_1536, _1570, _1888);
    float _1912 = fma(_1526, _1560, _1872);
    float _1914 = fma(_1536, _1558, _1886);
    float _1916 = fma(_1908, _1796, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1918 = _1884 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1920 = _1894 * _1634;
    float _1922 = _1900 * _1634;
    float _1924 = _1896 * _1634;
    float _1926 = fma(_1536, _1560, _1892);
    float _1928 = _1900 * _1750;
    float _1930 = _1894 * _1750;
    float _1932 = _1802 * _1894;
    float _1934 = _1802 * _1900;
    float _1936 = _1896 * _1750;
    float _1938 = _1802 * _1896;
    float _1940 = -_1794;
    float _1942 = fma(_1644, _1940, _1916);
    bool _1944 = !_1918;
    float _1946 = _1942;
    float _1948 = _1864;
    float _1950 = _1866;
    float _1952 = _1824;
    float _1954 = _1828;
    float _1956 = _1816;
    if (!_1944)
    {
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1962 = _1884 + _1960;
        float _1964 = rsqrt(_1874);
        float _1966 = _1962 * _1958;
        float _1968 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = _1966 * 0.15915493667125701904296875;
        float _1972 = _1970 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = _1970 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = fma(_1974, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1982 = _1964 * _1980;
        float _1984 = fma(_1852, _1982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1986 = _1978 + (-1.0);
        float _1988 = fma(_1856, _1982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1992 = _1984 + _1990;
        float _1994 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1998 = _1988 + _1996;
        float _2000 = _1992 * _1992;
        float _2002 = fma(_1942, _1978, _1994);
        float _2004 = _1998 * _1998;
        _1946 = _2002;
        _1948 = _2000;
        _1950 = _2004;
        _1952 = _1984;
        _1954 = _1988;
    }
    float _2006 = _1946;
    float _2008 = _1948;
    float _2010 = _1950;
    float _2012 = _1952;
    float _2014 = _1954;
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2018 = _2006 + _2016;
    float _2020 = fma(_1904, _1710, _1930);
    float _2022 = fma(_1808, _1904, _1932);
    float _2024 = fma(_1904, _1632, _1920);
    float _2026 = fma(_2018, _2018, _2008);
    float _2028 = fma(_1902, _1632, _1922);
    float _2030 = fma(_1912, _1632, _1924);
    float _2032 = fma(_1902, _1710, _1928);
    float _2034 = _2026 + _2010;
    float _2036 = fma(_1912, _1710, _1936);
    float _2038 = fma(_1808, _1902, _1934);
    float _2040 = fma(_1808, _1912, _1938);
    float _2042 = fma(_1914, _1636, _2024);
    float _2044 = fma(_1914, _1730, _2020);
    float _2046 = sqrt(_2034);
    float _2048 = fma(_1816, _1914, _2022);
    float _2050 = fma(_1910, _1636, _2028);
    float _2052 = fma(_1910, _1730, _2032);
    float _2054 = fma(_1816, _1910, _2038);
    float _2056 = fma(_1816, _1926, _2040);
    float _2058 = fma(_1926, _1730, _2036);
    float _2060 = fma(_1926, _1636, _2030);
    out.m_63.x = _1340;
    out.m_63.y = _1342;
    out.m_63.z = _1344;
    out.m_63.w = _1346;
    out.m_61.x = _1334;
    out.m_61.y = _1336;
    out.m_61.z = _1338;
    out.m_61.w = _1324;
    out.m_71.x = _2048;
    out.m_71.y = _2054;
    out.m_71.z = _2056;
    bool _2062 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2064 = isnan(_2046);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2070 = _2066 || _2068;
    out.m_73.x = _2044;
    out.m_73.y = _2052;
    out.m_73.z = _2058;
    out.m_75.x = _2042;
    out.m_75.y = _2050;
    out.m_75.z = _2060;
    float _2072 = _2060;
    float _2074 = _2048;
    if (!_2070)
    {
        _1956 = 1.0;
    }
    float _2076 = _1956;
    bool _2078 = !_2070;
    float _2080 = _2076;
    if (!_2078)
    {
        bool _2082 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2084 = isnan(_2046);
        bool _2086 = _2082 || _2084;
        bool _2088 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2090 = _2086 || _2088;
        if (!_2090)
        {
            float _2092 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2094 = _2046 + _2092;
            float _2096 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2098 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2096;
            float _2100 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2102 = _2100 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2104 = 1.0 / _2098;
            float _2106 = _2094 * _2104;
            float _2108 = fma(_2106, _2102, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2080 = _2108;
            _2110 = true;
        }
        else
        {
            bool _2112 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2114 = isnan(_2046);
            bool _2116 = _2112 || _2114;
            bool _2118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2120 = _2116 || _2118;
            if (!_2120)
            {
                float _2122 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2124 = _2046 + _2122;
                float _2126 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2128 = _2126 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2130 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2132 = _2130 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2134 = 1.0 / _2128;
                float _2136 = _2124 * _2134;
                float _2138 = fma(_2136, _2132, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2080 = _2138;
                _2110 = true;
            }
            else
            {
                _2080 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2110 = false;
    float _2140 = _2080;
    float _2142 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2146 = _2012 + _2144;
    float _2148 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2142);
    float _2150 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2152 = _2006 + _2150;
    bool _2154 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan(0.5);
    bool _2162 = _2158 || _2160;
    float _2164 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2148);
    float _2166 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2168 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(0.5);
    bool _2176 = _2172 || _2174;
    float _2178 = fma(_2152, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2180 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2182 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2166);
    float _2184 = 1.0 / _2180;
    float _2186 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2182);
    float _2188 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2176)
    {
        _2190 = 1.0;
    }
    float _2192 = _2190;
    float _2194 = _2188 + _2180;
    float _2196 = _2194 * _2184;
    float _2198 = _2196 * 0.5;
    float _2200 = -_1356;
    float _2202 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2178);
    float _2204 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2206 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2204);
    float _2208 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2210 = _2014 + _2208;
    float _2212 = fma(_2146, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2214 = 1.0 / _2206;
    float _2216 = fma(_2210, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2218 = -_1358;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2212);
    float _2222 = -_1360;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2216);
    float _2226 = _2212;
    float _2228 = _2202;
    float _2230 = _2220;
    float _2232 = _2224;
    float _2234 = _2192;
    if (!_2162)
    {
        float _2236 = _1382 * _1382;
        float _2238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2240 = -_1148;
        float _2242 = _2240 + _2216;
        float _2244 = fma(_1394, _1394, _2236);
        float _2246 = fma(_1404, _1404, _2244);
        float _2248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2250 = sqrt(_2246);
        float _2252 = 1.0 / _1486;
        float _2254 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2256 = precise::min(_2250, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2258 = _2256 * _2238;
        float _2260 = -_1030;
        float _2262 = _2260 + _2178;
        float _2264 = _2258 * _2252;
        float _2266 = -_1146;
        float _2268 = _2266 + _2212;
        float _2270 = _2254 * _2264;
        float _2272 = _2242 * _2264;
        float _2274 = fma(_2268, _2270, _1376);
        float _2276 = fma(_2262, _2270, _1368);
        float _2278 = fma(_2254, _2272, _1390);
        _2226 = _2270;
        _2228 = _2276;
        _2230 = _2274;
        _2232 = _2278;
    }
    float _2280 = _2226;
    float _2282 = _2228;
    float _2284 = _2230;
    float _2286 = _2232;
    float _2288 = _2280;
    if (_2176)
    {
        _2288 = 1.0;
    }
    float _2290 = _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2294 = _2214 * _2292;
    float _2296 = _2290;
    float _2298 = _2294;
    if (!_2176)
    {
        float _2300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = cos(_2304);
        float _2308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2302 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = 1.0 / _2306;
        float _2318 = _2310 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        float _2322 = _2314 * _2316;
        float _2324 = _2310 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2330 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2328;
        float _2332 = _2320 * _2322;
        float _2334 = 1.0 / _2330;
        float _2336 = 1.0 / _2332;
        float _2338 = _2326 * _2336;
        float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2342 = fma(_2294, _2338, _2340);
        float _2344 = _2342 * _2334;
        float _2346 = precise::clamp(_2344, 0.0, 1.0);
        _2072 = _2302;
        _2234 = _2346;
    }
    float _2348 = _2072;
    float _2350 = _2234;
    float _2352 = _2348;
    if (!_2176)
    {
        float _2354 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2356 = _2354 * 0.15915493667125701904296875;
        float _2358 = _2356 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        float _2362 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2364 = _2362 * 0.15915493667125701904296875;
        float _2366 = _2356 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        float _2370 = 1.0 / _2360;
        float _2372 = _2364 * 6.283185482025146484375;
        float _2374 = cos(_2372);
        float _2376 = _2368 * _2370;
        float _2378 = _2364 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = _2374 * _2376;
        float _2384 = 1.0 / _2382;
        float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2388 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2386;
        float _2390 = 1.0 / _2388;
        float _2392 = _2380 * _2384;
        float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2396 = fma(_2294, _2392, _2394);
        float _2398 = _2396 * _2390;
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -_2400;
        float _2404 = _2402 + 1.0;
        _2352 = _2382;
        _2296 = _2404;
    }
    float _2406 = _2352;
    float _2408 = _2296;
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2412 = _2282 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2284 + _2414;
    float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2420 = _2286 + _2418;
    float _2422 = _2412 * _2412;
    float _2424 = fma(_2416, _2416, _2422);
    float _2426 = fma(_2420, _2420, _2424);
    float _2428 = rsqrt(_2426);
    float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2432 = _2416 * _2430;
    float _2434 = _2420 * _2430;
    float _2436 = _2432 * _2432;
    float _2438 = _2434 * _2434;
    float _2440 = _2436 + _2438;
    float _2442 = sqrt(_2440);
    bool _2444 = _2442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2448 = _2442 + _2446;
    float _2450 = _2420;
    float _2452 = _2440;
    float _2454 = _2448;
    float _2456 = _2432;
    if (_2444)
    {
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2458;
    }
    float _2460 = _2450;
    if (_2444)
    {
        float _2462 = rsqrt(_2440);
        _2452 = _2462;
    }
    float _2464 = _2452;
    float _2466 = _2464;
    if (_2444)
    {
        float _2468 = _2448 * _2460;
        _2454 = _2468;
    }
    float _2470 = _2454;
    if (_2444)
    {
        float _2472 = _2470 * 0.15915493667125701904296875;
        _2074 = _2472;
    }
    float _2474 = _2074;
    float _2476 = _2428;
    if (_2444)
    {
        float _2478 = _2474 * 6.283185482025146484375;
        float _2480 = sin(_2478);
        _2476 = _2480;
    }
    float _2482 = _2476;
    float _2484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2486 = precise::max(0.0, _2484);
    float _2488 = _2406;
    float _2490 = _2486;
    float _2492 = _2484;
    if (_2444)
    {
        float _2494 = _2474 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        _2488 = _2496;
    }
    float _2498 = _2488;
    float _2500 = -_2430;
    float _2502 = -_2486;
    float _2504 = fma(_2412, _2500, _2502);
    if (_2444)
    {
        float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2490 = _2506;
    }
    float _2508 = _2490;
    float _2510 = sqrt(_2426);
    float _2512 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2514 = _2482;
    float _2516 = _2508;
    if (_2444)
    {
        float _2518 = fma(_2482, _2508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2514 = _2518;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2444)
    {
        _2516 = _2434;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (_2444)
    {
        float _2528 = _2498 + (-1.0);
        _2492 = _2528;
    }
    float _2530 = _2492;
    float _2532 = _2530;
    if (_2444)
    {
        float _2534 = _2464 * _2520;
        _1184 = _2534;
    }
    float _2536 = _1184;
    if (!_2444)
    {
        _2522 = _2504;
    }
    float _2538 = _2522;
    float _2540 = _2538;
    if (_2444)
    {
        float _2542 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2542;
    }
    float _2544 = _2298;
    if (_2444)
    {
        float _2546 = _2432 * _2536;
        _2456 = _2546;
    }
    float _2548 = _2456;
    if (!_2444)
    {
        _2466 = _2436;
    }
    float _2550 = _2466;
    float _2552 = _2550;
    if (_2444)
    {
        float _2554 = _2434 * _2536;
        _2526 = _2554;
    }
    float _2556 = _2526;
    if (_2444)
    {
        float _2558 = fma(_2504, _2498, _2544);
        _2540 = _2558;
    }
    float _2560 = _2540;
    if (_2444)
    {
        float _2562 = _2548 * _2548;
        _2552 = _2562;
    }
    float _2564 = _2552;
    if (!_2444)
    {
        _2532 = _2438;
    }
    float _2566 = _2532;
    float _2568 = _2566;
    if (_2444)
    {
        float _2570 = _2556 * _2556;
        _2568 = _2570;
    }
    float _2572 = _2568;
    float _2574 = fma(_2560, _2560, _2564);
    float _2576 = _2574 + _2572;
    float _2578 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2582 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2580);
    float _2584 = precise::clamp(_2582, 0.0, 1.0);
    float _2586 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2588 = rsqrt(_2576);
    float _2590 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2578);
    float _2592 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2594 = -_2584;
    float _2596 = _2594 + 1.0;
    float _2598 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2600 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2590);
    float _2602 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2592);
    float _2604 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2598);
    float _2606 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2608 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2602);
    float _2610 = abs(_2596);
    float _2612 = log2(_2610);
    float _2614 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2604);
    float _2616 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2512);
    float _2618 = _2608 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2620 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2622 = _2588 * _2548;
    float _2624 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2626 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2628 = _2588 * _2560;
    float _2630 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2632 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2616);
    float _2634 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2626);
    float _2636 = _2588 * _2556;
    float _2638 = -_2630;
    float _2640 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2638);
    float _2642 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2644 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2634);
    float _2646 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2648 = -_2636;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2640);
    float _2652 = -_2620;
    float _2654 = fma(_2652, _2586, 1.0);
    float _2656 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2644);
    float _2658 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2660 = fma(_2650, -0.5, 0.5);
    float _2662 = exp2(_2646);
    float _2664 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2666 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2658);
    float _2668 = fma(_2650, 0.5, 0.5);
    float _2670 = _2628 + 1.0;
    float _2672 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2664);
    float _2674 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2666);
    float _2676 = fma(_2668, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2678 = log2(_2654);
    float _2680 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2672);
    float _2682 = fma(_2668, _2676, -0.212114393711090087890625);
    float _2684 = fma(_2668, _2682, 1.570728778839111328125);
    float _2686 = 1.0 / _2656;
    float _2688 = -_2628;
    float _2690 = fma(_2662, _2670, _2688);
    float _2692 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2674);
    float _2694 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2680);
    float _2696 = fma(_2690, 0.5, 0.5);
    float _2698 = sqrt(_2660);
    float _2700 = _2678 * 0.693147182464599609375;
    float _2702 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2704 = _2692 * _2686;
    float _2706 = _2694 * _2686;
    float _2708 = fma(_2704, 0.5, 0.5);
    float _2710 = fma(_2706, -0.5, 0.5);
    float _2712 = _2698 * 0.636619746685028076171875;
    float _2714 = -_2684;
    float _2716 = fma(_2712, _2714, 1.0);
    float3 _7053 = float3(_2708, _2710, _2702);
    float _2718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7053, float3(0.0), isnan(_7053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7053, float3(0.0), isnan(_7053)), level(0.0)).x;
    float3 _7064 = float3(_2708, _2710, _2702);
    float4 _2721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7064, float3(0.0), isnan(_7064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7064, float3(0.0), isnan(_7064)), level(0.0)).xyzw;
    float _2723 = _2721.x;
    float _2725 = _2721.y;
    float _2727 = _2721.z;
    float _2729 = _2721.w;
    float2 _7081 = float2(_2716, _2696);
    float3 _2733 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7081, float2(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7081, float2(0.0), isnan(_7081)), level(0.0)).xyz;
    float _2735 = _2733.x;
    float _2737 = _2733.y;
    float _2739 = _2733.z;
    float _2741 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2743 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2745 = _2350 * _2408;
    bool _2747 = _2350 > 0.0;
    bool _2749 = isnan(_2350);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(0.0);
    bool _2755 = _2751 || _2753;
    float _2757 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2743);
    float _2759 = exp2(_2741);
    float _2761 = _2745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2763 = _2408 <= 0.0;
    bool _2765 = !_2755;
    bool _2767 = _2763 || _2765;
    float _2769 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2757);
    float _2771 = _2656 * 0.5;
    float _2773 = _380 * _2761;
    float _2775 = _2692 + _2656;
    float _2777 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2769);
    float _2779 = fma(_2694, -0.5, _2771);
    float _2781 = _2775 * 0.5;
    float _2783 = _2777 + _2656;
    out.gl_Position.x = _2692;
    out.gl_Position.y = _2694;
    out.gl_Position.z = _2777;
    out.gl_Position.w = _2656;
    float _2785 = _2773 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2787 = _2783 * 0.5;
    float _2789 = -_2759;
    float _2791 = _2789 + 1.0;
    out.m_47.x = _2785;
    float _2793 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = _2781;
    out.m_77.y = _2779;
    out.m_77.z = _2787;
    out.m_77.w = _2656;
    float _2795 = -_2793;
    float _2797 = _2795 + 1.0;
    float _2799 = _2793 * _2718;
    float _2801 = _2729 * _2797;
    float _2803 = _2729 * _2799;
    float _2805 = _2739 * _2799;
    float _2807 = fma(_2735, _2803, _2723);
    float _2809 = fma(_2737, _2803, _2725);
    float _2811 = fma(_2729, _2805, _2727);
    out.m_79.x = _2807;
    out.m_79.y = _2809;
    out.m_79.z = _2811;
    out.m_79.w = _2801;
    if (!_2767)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2813;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2110 = false;
    bool _858 = false;
    bool _620 = false;
    bool _400 = false;
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
        float _2870 = as_type<float>(_114);
        out.gl_Position.z = _2870;
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
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2939 = as_type<float>(_152);
        out.gl_Position.z = _2939;
    }
    if (_146)
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
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 0.0;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = _188 * 6.283185482025146484375;
    float _198 = floor(_188);
    float _200 = _196 * 0.15915493667125701904296875;
    float _202 = _200 * 6.283185482025146484375;
    float _204 = cos(_202);
    float _206 = -_198;
    float _208 = _188 + _206;
    bool _210 = _208 < 0.5;
    float _212 = float(_210);
    float _214 = fma(_204, 0.5, 0.5);
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = -_208;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = -_212;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_214;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _296 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _304 = _302 != 0;
    float _306 = in.m_53.w;
    float _308 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _314 = in.m_44.x;
    float _316 = in.m_44.y;
    float _318 = in.m_44.z;
    float _320 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    bool _322 = !_174;
    int _324 = _322 ? 0 : 1;
    float _326 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _328 = !_300;
    int _330 = _328 ? 0 : 1;
    float _332 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].y, _310);
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _312);
    int _336 = abs(_324);
    float _338 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].x, _320);
    int _340 = abs(_330);
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].y, _332);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _346 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].z, _334);
    bool _348 = !_304;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_274, _288, _338);
    float _354 = float(_340);
    float _356 = fma(_274, _290, _342);
    int _358 = abs(_350);
    float _360 = fma(_274, _292, _346);
    float _362 = float(_336);
    float _364 = abs(_278);
    float _366 = _354 * _364;
    float _368 = float(_358);
    float _370 = fma(_352, _306, _314);
    float _372 = fma(_356, _306, _316);
    float _374 = fma(_362, _286, _366);
    float _376 = fma(_360, _306, _318);
    float _378 = abs(_282);
    float _380 = fma(_368, _378, _374);
    bool _382 = !_344;
    float _398;
    if (!_382)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _386 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_98);
        float _404 = 1.0 / _402;
        float _406 = _132 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = _408 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _408 + _414;
    bool _418 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _436 = _408 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _446 = 1.0 / _432;
    bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _450 = 1.0 / _444;
    float _452 = 1.0 / _440;
    float _454 = _412 * _446;
    bool _456 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_428;
    float _470 = _468 + 1.0;
    float _472 = _466 * _470;
    float _474 = _416 * _450;
    bool _476 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_408);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _494 = isnan(_408);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_466;
    float _506 = _504 + 1.0;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = -_486;
    float _514 = _512 + 1.0;
    float _516 = _436 * _452;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = _502 * _514;
    float _528 = fma(_490, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = fma(_520, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _532 = fma(_524, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _534 = _486 * _506;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = _530 * _526;
    float _546 = _532 * _526;
    float _548 = _528 * _526;
    float _550 = -_502;
    float _552 = _550 + 1.0;
    float _554 = fma(_510, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_538, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_542, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _546);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _544);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _564;
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _574;
    float _578 = fma(_554, _534, _560);
    float _580 = fma(_566, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _582 = fma(_572, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _584 = fma(_556, _534, _562);
    float _586 = fma(_576, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _588 = fma(_558, _534, _568);
    float _590 = fma(_580, _472, _578);
    float _592 = fma(_582, _472, _584);
    float _594 = fma(_586, _472, _588);
    float _596 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].x, _590);
    float _598 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].y, _592);
    float _600 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].z, _594);
    bool _602 = !_448;
    float _618;
    if (!_602)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _606 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_98);
        float _624 = 1.0 / _622;
        float _626 = _132 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_53.x;
    float _632 = in.m_53.y;
    float _634 = in.m_53.z;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _638 = _628 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _628 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _652;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _646;
    bool _670 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _672 = 1.0 / _650;
    float _674 = 1.0 / _654;
    float _676 = _600 * _634;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _628 + _678;
    float _682 = _598 * _632;
    float _684 = _596 * _630;
    float _686 = _680 * _668;
    float _688 = -_666;
    float _690 = _688 + 1.0;
    float _692 = _638 * _672;
    bool _694 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _696 = isnan(_628);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _706;
    bool _710 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_628);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    bool _722 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _724 = isnan(_628);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _704 * _690;
    float _736 = -_704;
    float _738 = _736 + 1.0;
    float _740 = _642 * _674;
    float _742 = -_720;
    float _744 = _742 + 1.0;
    float _746 = fma(_708, _686, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _748 = _720 * _738;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _750;
    float _754 = _732 * _744;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _764 = fma(_752, _686, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _766 = _746 * _754;
    float _768 = fma(_758, _686, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = _764 * _754;
    float _776 = _768 * _754;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _788;
    float _792 = fma(_780, _692, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _794 = fma(_784, _692, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _796 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _766);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _798;
    float _802 = fma(_762, _692, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _804 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _776);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _806;
    float _810 = fma(_792, _748, _786);
    float _812 = fma(_790, _740, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _814 = fma(_800, _740, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _816 = fma(_794, _748, _796);
    float _818 = fma(_808, _740, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _820 = fma(_802, _748, _804);
    float _822 = fma(_812, _734, _810);
    float _824 = fma(_814, _734, _816);
    float _826 = fma(_818, _734, _820);
    float _828 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].x, _822);
    float _830 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].y, _824);
    float _832 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].z, _826);
    bool _834 = !_670;
    bool _836 = _670;
    int _838 = as_type<int>(_814);
    float _854;
    float _856;
    if (!_834)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _842 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _846 = _844 * _840;
        float _848 = floor(_846);
        float _850 = -_848;
        float _852 = _846 + _850;
        _854 = _852;
        _856 = _846;
        _858 = true;
    }
    else
    {
        float _860 = float(_98);
        float _862 = 1.0 / _860;
        float _864 = _132 * _862;
        _854 = _864;
        _856 = _860;
    }
    _858 = false;
    float _866 = _854;
    float _868 = _856;
    float _870 = in.m_55.x;
    float _872 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _874 = log2(_872);
    float _876 = _154 * 2.0;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _880 = _878 != 0;
    float _882 = in.m_51.w;
    float _884 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _886 = _830 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _888 = in.m_55.y;
    float _890 = floor(_876);
    float _892 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _894 = in.m_51.y;
    float _896 = _868;
    if (_880)
    {
        bool _898 = _154 > 0.5;
        _836 = _898;
    }
    bool _900 = _836;
    float _902 = in.m_51.z;
    float _904 = _874 * _132;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_880)
    {
        float _908 = -_870;
        float _910 = _908 + 1.0;
        _838 = as_type<int>(_910);
    }
    int _912 = _838;
    if (!_880)
    {
        _896 = _870;
    }
    float _914 = _896;
    float _916 = exp2(_904);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _928 = _926 != 0;
    float _930 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _932 = _914;
    if (_880)
    {
        float _934 = _900 ? as_type<float>(_912) : _870;
        _932 = _934;
    }
    float _936 = _932;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _940 = _938 != 0;
    float _942 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _930);
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _946 = _944 != 0;
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _952 = _950 != 0;
    float _954 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _956 = _882 > 0.5;
    float _958 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = -_888;
    float _962 = _960 + 1.0;
    float _964 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _966 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _968 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    int _970 = _956 ? as_type<int>(_962) : as_type<int>(_888);
    float _972 = _894 * 2.0;
    bool _974 = _894 > 0.5;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _980 = _946 ? as_type<float>(_970) : _888;
    float _982 = -_916;
    float _984 = _982 + 1.0;
    bool _986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(1.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _998 = 1.0 + _996;
    float _1000 = _888;
    int _1002 = as_type<int>(_962);
    bool _1004 = _952;
    float _1006 = _978;
    if (_952)
    {
        float _1008 = _974 ? _962 : _888;
        _1000 = _1008;
    }
    float _1010 = _1000;
    float _1012 = 1.0 / _978;
    if (_940)
    {
        float _1014 = -_870;
        float _1016 = _1014 + 1.0;
        _1002 = as_type<int>(_1016);
    }
    int _1018 = _1002;
    if (_940)
    {
        bool _1020 = _902 > 0.5;
        _1004 = _1020;
    }
    bool _1022 = _1004;
    float _1024 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _1026 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _966);
    float _1028 = _894 + _902;
    float _1030 = _968 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1032 = 1.0 / _998;
    if (!_940)
    {
        _1006 = _870;
    }
    float _1034 = _1006;
    float _1036 = _1028 + (-1.0);
    float _1038 = _1034;
    if (_940)
    {
        float _1040 = _1022 ? as_type<float>(_1018) : _870;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1044;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = _154 + _902;
    float _1060 = floor(_972);
    float _1062 = _1056 ? _984 : 0.0;
    float _1064 = _902 * 2.0;
    float _1066 = _1046 * _1012;
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1072 = _866 + _1070;
    float _1074 = _1058 + (-1.0);
    bool _1076 = _890 > 0.0;
    float _1078 = _1042;
    if (_994)
    {
        float _1080 = _1062 * _1032;
        _136 = _1080;
    }
    float _1082 = _136;
    bool _1084 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1086 = isnan(_866);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = fma(_1066, _1072, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1098 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1100 = isnan(_866);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = floor(_1064);
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1114 = _1030 + _1112;
    float _1116 = -_1094;
    float _1118 = _1116 + 1.0;
    bool _1120 = _890 >= 0.0;
    bool _1122 = isnan(_890);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1132 = _1060 > 0.0;
    float _1134 = _1108 * _1118;
    bool _1136 = _1060 >= 0.0;
    bool _1138 = isnan(_1060);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1148 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1152 = _1128 ? 0 : 1;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1156 = _1146 + _1154;
    float _1158 = _1096 * _1134;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1148 + _1160;
    int _1164 = _1144 ? 0 : 1;
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1150);
    float _1168 = -_1108;
    float _1170 = _1168 + 1.0;
    float _1172 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1174 = ~_1152;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1166);
    int _1182 = _1178;
    float _1184 = _1146;
    if (!_1076)
    {
        int _1186 = ~_1152;
        int _1188 = _1186 + 1;
        _1182 = _1188;
    }
    int _1190 = _1182;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1158);
    int _1194 = ~_1164;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = _1172 * _906;
    int _1202 = _1198;
    if (!_1132)
    {
        int _1204 = ~_1164;
        int _1206 = _1204 + 1;
        _1202 = _1206;
    }
    int _1208 = _1202;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1212 = _1110 > 0.0;
    float _1214 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1192);
    bool _1216 = _1110 >= 0.0;
    bool _1218 = isnan(_1110);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    float _1226 = _902 + (-0.5);
    bool _1228 = !_924;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = in.m_57.x;
    float _1234 = in.m_57.y;
    float _1236 = in.m_57.z;
    bool _1238 = _1180 >= 0.0;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1242 = !_928;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1248 = abs(_1230);
    float _1250 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1252 = abs(_1244);
    float _1254 = _1246 * _948;
    float _1256 = _1250 * _1210;
    float _1258 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = float(_1248);
    if (_1238)
    {
        out.m_47.x = 0.0;
    }
    float _1262 = float(_1190);
    float _1264 = _894 + (-0.5);
    int _1266 = _1224 ? 0 : 1;
    float _1268 = _1258 * _1240;
    float _1270 = float(_1252);
    float _1272 = _1260 * _1262;
    int _1274 = ~_1266;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _1278;
    if (!_1212)
    {
        int _1282 = ~_1266;
        int _1284 = _1282 + 1;
        _1280 = _1284;
    }
    int _1286 = _1280;
    out.m_59.x = _1256;
    out.m_59.y = _1254;
    out.m_59.z = _1268;
    out.m_59.w = _1200;
    float _1288 = _1272 * (-2.0);
    float _1290 = float(_1208);
    if (_1238)
    {
        _1078 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1292 = _1078;
    float _1294 = fma(_1288, _1234, _1234);
    float _1296 = fma(_1068, _1288, _1068);
    float _1298 = _1270 * _1290;
    float _1300 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1294);
    float _1302 = _1298 * (-2.0);
    int _1304 = as_type<int>(_1292);
    if (_1238)
    {
        float _1306 = _1292 * 5.0;
        _1304 = as_type<int>(_1306);
    }
    int _1308 = _1304;
    float _1310 = _1114 * _1114;
    float _1312 = fma(_1130, _1302, _1130);
    float _1314 = fma(_1302, _1236, _1236);
    float _1316 = fma(_1156, _1156, _1310);
    if (_1238)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4769 = as_type<float>(_1308);
        out.gl_Position.z = _4769;
    }
    float _1318 = fma(_1162, _1162, _1316);
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1328 = !_920;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = rsqrt(_1318);
    float _1334 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1348 = abs(_1330);
    out.m_61.x = _1334;
    out.m_61.y = _1336;
    out.m_61.z = _1338;
    out.m_61.w = _1324;
    float _1350 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1314);
    float _1352 = fma(_1296, _1082, _1300);
    float _1354 = float(_1348);
    out.m_63.x = _1340;
    out.m_63.y = _1342;
    out.m_63.z = _1344;
    out.m_63.w = _1346;
    float _1356 = _1114 * _1332;
    float _1358 = _1156 * _1332;
    float _1360 = _1162 * _1332;
    float _1362 = -_1356;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1114);
    if (_1238)
    {
        return out;
    }
    float _1366 = -_1356;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1370 = -_1358;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1374 = -_1358;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1378 = _1364 * _1364;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1382 = _1368 + _1380;
    float _1384 = float(_1286);
    float _1386 = _1352 * 0.15915493667125701904296875;
    float _1388 = -_1360;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1376 + _1392;
    float _1396 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1354 * _1384;
    float _1400 = _154 + _894;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1404 = _1390 + _1402;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1396);
    float _1408 = fma(_1312, _1082, _1350);
    float _1410 = _1400 + (-1.0);
    float _1412 = _1398 * (-2.0);
    float _1414 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1406);
    float _1416 = _154 + (-0.5);
    float _1418 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1420 = fma(_1412, _1232, _1232);
    float _1422 = fma(_1372, _1372, _1378);
    bool _1424 = _1414 >= 0.0;
    float _1426 = fma(_1418, _1412, _1418);
    float _1428 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1420);
    float _1430 = -_1360;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1162);
    float _1434 = _1408 * 0.15915493667125701904296875;
    float _1436 = _1386 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = fma(_1426, _1082, _1428);
    float _1442 = fma(_1432, _1432, _1422);
    float _1444 = _1440 * 0.15915493667125701904296875;
    float _1446 = _1398;
    if (_1424)
    {
        _1446 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1448 = _1446;
    float _1450 = _1386 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    int _1454 = as_type<int>(_1448);
    if (_1424)
    {
        out.m_47.x = 0.0;
    }
    if (_1424)
    {
        float _1456 = _1448 * 5.0;
        _1454 = as_type<int>(_1456);
    }
    int _1458 = _1454;
    float _1460 = sqrt(_1442);
    if (_1424)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5045 = as_type<float>(_1458);
        out.gl_Position.z = _5045;
    }
    float _1462 = _1434 * 6.283185482025146484375;
    float _1464 = sin(_1462);
    float _1466 = _1434 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1444 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    if (_1424)
    {
        return out;
    }
    float _1474 = -_1030;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = -_1146;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1482 = -_1148;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _1332 * _1460;
    float _1488 = _1476 * _1476;
    float _1490 = in.m_65.x;
    float _1492 = in.m_65.y;
    float _1494 = in.m_65.z;
    float _1496 = _1444 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = _1452 * _1468;
    float _1502 = fma(_1480, _1480, _1488);
    float _1504 = _1438 * _1464;
    float _1506 = _1452 * _1464;
    float _1508 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1510 = fma(_1484, _1484, _1502);
    float _1512 = fma(_1472, _1504, _1500);
    float _1514 = fma(_1472, _1500, _1504);
    float _1516 = _1438 * _1468;
    float _1518 = rsqrt(_1510);
    float _1520 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1522 = _1486 * _1508;
    float _1524 = -_1516;
    float _1526 = fma(_1472, _1506, _1524);
    float _1528 = _1486 * _1520;
    float _1530 = _1464 * _1498;
    float _1532 = _1468 * _1498;
    float _1534 = _1438 * _1498;
    float _1536 = _1452 * _1498;
    float _1538 = -_1506;
    float _1540 = fma(_1472, _1516, _1538);
    float _1542 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1490);
    bool _1546 = _1492 != 0.0;
    bool _1548 = isnan(_1492);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = _1486 * _1542;
    float _1558 = _1480 * _1518;
    float _1560 = _1484 * _1518;
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1492);
    float _1564 = _1544 * _1522;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1568 = _1558 * _1566;
    float _1570 = _1476 * _1518;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1574 = _1560 * _1572;
    float _1576 = in.m_67.x;
    float _1578 = in.m_67.y;
    float _1580 = in.m_67.z;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1584 = -_1568;
    float _1586 = fma(_1560, _1582, _1584);
    float _1588 = _1562 * _1556;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1592 = _1570 * _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1596 = -_1574;
    float _1598 = fma(_1570, _1594, _1596);
    float _1600 = _1586 * _1586;
    float _1602 = _1540 * _1588;
    float _1604 = _1532 * _1588;
    float _1606 = _1514 * _1588;
    bool _1608 = _1490 == 0.0;
    bool _1610 = !_1554;
    bool _1612 = _1608 && _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1616 = -_1592;
    float _1618 = fma(_1558, _1614, _1616);
    float _1620 = fma(_1598, _1598, _1600);
    float _1622 = fma(_1512, _1564, _1602);
    float _1624 = fma(_1530, _1564, _1604);
    float _1626 = fma(_1526, _1564, _1606);
    bool _1628 = _1494 == 0.0;
    bool _1630 = _1628 && _1612;
    float _1632 = in.m_69.x;
    float _1634 = in.m_69.y;
    float _1636 = in.m_69.z;
    float _1638 = in.m_69.w;
    float _1640 = fma(_1618, _1618, _1620);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1648 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1650;
    float _1654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1494);
    float _1656 = _1644 * _1644;
    float _1658 = rsqrt(_1640);
    float _1660 = _1654 * _1528;
    float _1662 = fma(_1648, _1648, _1656);
    float _1664 = 0.0;
    float _1666 = _1528;
    float _1668 = _1576;
    float _1670 = _1662;
    if (_1630)
    {
        _1664 = _1576;
    }
    float _1672 = _1664;
    float _1674 = 0.0;
    float _1676 = _1672;
    if (_1630)
    {
        _1674 = _1578;
    }
    float _1678 = _1674;
    float _1680 = fma(_1652, _1652, _1662);
    float _1682 = 0.0;
    float _1684 = _1678;
    if (_1630)
    {
        _1682 = _1580;
    }
    float _1686 = _1682;
    float _1688 = _1686;
    if (_1630)
    {
        _1666 = _1672;
    }
    float _1690 = _1666;
    float _1692 = sqrt(_1680);
    float _1694 = _1690;
    if (!_1630)
    {
        _1676 = _1576;
    }
    float _1696 = _1676;
    if (_1630)
    {
        _1668 = _1678;
    }
    float _1698 = _1668;
    float _1700 = _1586 * _1658;
    float _1702 = _1698;
    if (_1630)
    {
        _1670 = _1686;
    }
    float _1704 = _1670;
    float _1706 = _1704;
    if (!_1630)
    {
        float _1708 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1696);
        _1694 = _1708;
    }
    float _1710 = _1694;
    if (!_1630)
    {
        _1684 = _1578;
    }
    float _1712 = _1684;
    float _1714 = fma(_1534, _1660, _1622);
    if (!_1630)
    {
        _1688 = _1580;
    }
    float _1716 = _1688;
    float _1718 = -_1472;
    float _1720 = fma(_1718, _1660, _1624);
    float _1722 = fma(_1536, _1660, _1626);
    float _1724 = _1598 * _1658;
    float _1726 = _1636 * _1696;
    if (!_1630)
    {
        float _1728 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1716);
        _1706 = _1728;
    }
    float _1730 = _1706;
    float _1732 = _1618 * _1658;
    float _1734 = _1560 * _1700;
    float _1736 = _1570 * _1724;
    float _1738 = -_1726;
    float _1740 = fma(_1632, _1716, _1738);
    float _1742 = _1634 * _1716;
    float _1744 = -_1734;
    float _1746 = fma(_1570, _1732, _1744);
    if (!_1630)
    {
        float _1748 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1712);
        _1702 = _1748;
    }
    float _1750 = _1702;
    float _1752 = -_1736;
    float _1754 = fma(_1558, _1700, _1752);
    float _1756 = rsqrt(_1680);
    float _1758 = -_1742;
    float _1760 = fma(_1636, _1712, _1758);
    float _1762 = _1746 * _1720;
    float _1764 = precise::max(_1692, 10.0);
    float _1766 = _1754 * _1720;
    float _1768 = _1632 * _1712;
    float _1770 = fma(_1724, _1714, _1762);
    float _1772 = precise::min(_1764, 50.0);
    float _1774 = fma(_1732, _1714, _1766);
    float _1776 = _1692 * 0.039999999105930328369140625;
    float _1778 = fma(_1558, _1722, _1770);
    float _1780 = -_1768;
    float _1782 = fma(_1634, _1696, _1780);
    float _1784 = fma(_1560, _1722, _1774);
    float _1786 = fma(_1772, 0.25, -2.5);
    float _1788 = precise::max(_1776, 1.0);
    float _1790 = _1146 + _1778;
    float _1792 = _1148 + _1784;
    float _1794 = _1756 * _1786;
    float _1796 = precise::min(_1788, 2.0);
    float _1798 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1800 = _1790 + _1798;
    float _1802 = _1740 * _1638;
    float _1804 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1806 = _1792 + _1804;
    float _1808 = _1760 * _1638;
    float _1810 = _1558 * _1732;
    float _1812 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1814 = fma(_1806, _1796, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1816 = _1782 * _1638;
    float _1818 = -_1810;
    float _1820 = fma(_1560, _1724, _1818);
    float _1822 = -_1794;
    float _1824 = fma(_1648, _1822, _1812);
    float _1826 = -_1794;
    float _1828 = fma(_1652, _1826, _1814);
    float _1830 = _1530 * _1746;
    float _1832 = _1530 * _1820;
    float _1834 = _1532 * _1746;
    float _1836 = _1532 * _1820;
    float _1838 = _1530 * _1754;
    float _1840 = _1532 * _1754;
    float _1842 = -_1746;
    float _1844 = _1472 * _1842;
    float _1846 = -_1754;
    float _1848 = _1472 * _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1852 = _1824 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1856 = _1828 + _1854;
    float _1858 = -_1820;
    float _1860 = _1472 * _1858;
    float _1862 = _1820 * _1720;
    float _1864 = _1852 * _1852;
    float _1866 = _1856 * _1856;
    float _1868 = fma(_1512, _1724, _1830);
    float _1870 = fma(_1512, _1700, _1832);
    float _1872 = fma(_1512, _1732, _1838);
    float _1874 = _1864 + _1866;
    float _1876 = fma(_1540, _1724, _1834);
    float _1878 = fma(_1540, _1700, _1836);
    float _1880 = fma(_1540, _1732, _1840);
    float _1882 = fma(_1700, _1714, _1862);
    float _1884 = sqrt(_1874);
    float _1886 = fma(_1534, _1724, _1844);
    float _1888 = fma(_1534, _1700, _1860);
    float _1890 = fma(_1570, _1722, _1882);
    float _1892 = fma(_1534, _1732, _1848);
    float _1894 = fma(_1514, _1558, _1876);
    float _1896 = fma(_1514, _1560, _1880);
    float _1898 = _1030 + _1890;
    float _1900 = fma(_1514, _1570, _1878);
    float _1902 = fma(_1526, _1570, _1870);
    float _1904 = fma(_1526, _1558, _1868);
    float _1906 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1908 = _1898 + _1906;
    float _1910 = fma(_1536, _1570, _1888);
    float _1912 = fma(_1526, _1560, _1872);
    float _1914 = fma(_1536, _1558, _1886);
    float _1916 = fma(_1908, _1796, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1918 = _1884 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1920 = _1894 * _1634;
    float _1922 = _1900 * _1634;
    float _1924 = _1896 * _1634;
    float _1926 = fma(_1536, _1560, _1892);
    float _1928 = _1900 * _1750;
    float _1930 = _1894 * _1750;
    float _1932 = _1802 * _1894;
    float _1934 = _1802 * _1900;
    float _1936 = _1896 * _1750;
    float _1938 = _1802 * _1896;
    float _1940 = -_1794;
    float _1942 = fma(_1644, _1940, _1916);
    bool _1944 = !_1918;
    float _1946 = _1942;
    float _1948 = _1864;
    float _1950 = _1866;
    float _1952 = _1824;
    float _1954 = _1828;
    float _1956 = _1816;
    if (!_1944)
    {
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1962 = _1884 + _1960;
        float _1964 = rsqrt(_1874);
        float _1966 = _1962 * _1958;
        float _1968 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = _1966 * 0.15915493667125701904296875;
        float _1972 = _1970 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = _1970 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = fma(_1974, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1982 = _1964 * _1980;
        float _1984 = fma(_1852, _1982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1986 = _1978 + (-1.0);
        float _1988 = fma(_1856, _1982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1992 = _1984 + _1990;
        float _1994 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1998 = _1988 + _1996;
        float _2000 = _1992 * _1992;
        float _2002 = fma(_1942, _1978, _1994);
        float _2004 = _1998 * _1998;
        _1946 = _2002;
        _1948 = _2000;
        _1950 = _2004;
        _1952 = _1984;
        _1954 = _1988;
    }
    float _2006 = _1946;
    float _2008 = _1948;
    float _2010 = _1950;
    float _2012 = _1952;
    float _2014 = _1954;
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2018 = _2006 + _2016;
    float _2020 = fma(_1904, _1710, _1930);
    float _2022 = fma(_1808, _1904, _1932);
    float _2024 = fma(_1904, _1632, _1920);
    float _2026 = fma(_2018, _2018, _2008);
    float _2028 = fma(_1902, _1632, _1922);
    float _2030 = fma(_1912, _1632, _1924);
    float _2032 = fma(_1902, _1710, _1928);
    float _2034 = _2026 + _2010;
    float _2036 = fma(_1912, _1710, _1936);
    float _2038 = fma(_1808, _1902, _1934);
    float _2040 = fma(_1808, _1912, _1938);
    float _2042 = fma(_1914, _1636, _2024);
    float _2044 = fma(_1914, _1730, _2020);
    float _2046 = sqrt(_2034);
    float _2048 = fma(_1816, _1914, _2022);
    float _2050 = fma(_1910, _1636, _2028);
    float _2052 = fma(_1910, _1730, _2032);
    float _2054 = fma(_1816, _1910, _2038);
    float _2056 = fma(_1816, _1926, _2040);
    float _2058 = fma(_1926, _1730, _2036);
    float _2060 = fma(_1926, _1636, _2030);
    out.m_63.x = _1340;
    out.m_63.y = _1342;
    out.m_63.z = _1344;
    out.m_63.w = _1346;
    out.m_61.x = _1334;
    out.m_61.y = _1336;
    out.m_61.z = _1338;
    out.m_61.w = _1324;
    out.m_71.x = _2048;
    out.m_71.y = _2054;
    out.m_71.z = _2056;
    bool _2062 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2064 = isnan(_2046);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2070 = _2066 || _2068;
    out.m_73.x = _2044;
    out.m_73.y = _2052;
    out.m_73.z = _2058;
    out.m_75.x = _2042;
    out.m_75.y = _2050;
    out.m_75.z = _2060;
    float _2072 = _2060;
    float _2074 = _2048;
    if (!_2070)
    {
        _1956 = 1.0;
    }
    float _2076 = _1956;
    bool _2078 = !_2070;
    float _2080 = _2076;
    if (!_2078)
    {
        bool _2082 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2084 = isnan(_2046);
        bool _2086 = _2082 || _2084;
        bool _2088 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2090 = _2086 || _2088;
        if (!_2090)
        {
            float _2092 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2094 = _2046 + _2092;
            float _2096 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2098 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2096;
            float _2100 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2102 = _2100 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2104 = 1.0 / _2098;
            float _2106 = _2094 * _2104;
            float _2108 = fma(_2106, _2102, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2080 = _2108;
            _2110 = true;
        }
        else
        {
            bool _2112 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2114 = isnan(_2046);
            bool _2116 = _2112 || _2114;
            bool _2118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2120 = _2116 || _2118;
            if (!_2120)
            {
                float _2122 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2124 = _2046 + _2122;
                float _2126 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2128 = _2126 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2130 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2132 = _2130 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2134 = 1.0 / _2128;
                float _2136 = _2124 * _2134;
                float _2138 = fma(_2136, _2132, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2080 = _2138;
                _2110 = true;
            }
            else
            {
                _2080 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2110 = false;
    float _2140 = _2080;
    float _2142 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2146 = _2012 + _2144;
    float _2148 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2142);
    float _2150 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2152 = _2006 + _2150;
    bool _2154 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan(0.5);
    bool _2162 = _2158 || _2160;
    float _2164 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2148);
    float _2166 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2168 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(0.5);
    bool _2176 = _2172 || _2174;
    float _2178 = fma(_2152, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2180 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2182 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2166);
    float _2184 = 1.0 / _2180;
    float _2186 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2182);
    float _2188 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2176)
    {
        _2190 = 1.0;
    }
    float _2192 = _2190;
    float _2194 = _2188 + _2180;
    float _2196 = _2194 * _2184;
    float _2198 = _2196 * 0.5;
    float _2200 = -_1356;
    float _2202 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2178);
    float _2204 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2206 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2204);
    float _2208 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2210 = _2014 + _2208;
    float _2212 = fma(_2146, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2214 = 1.0 / _2206;
    float _2216 = fma(_2210, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2218 = -_1358;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2212);
    float _2222 = -_1360;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2216);
    float _2226 = _2212;
    float _2228 = _2202;
    float _2230 = _2220;
    float _2232 = _2224;
    float _2234 = _2192;
    if (!_2162)
    {
        float _2236 = _1382 * _1382;
        float _2238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2240 = -_1148;
        float _2242 = _2240 + _2216;
        float _2244 = fma(_1394, _1394, _2236);
        float _2246 = fma(_1404, _1404, _2244);
        float _2248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2250 = sqrt(_2246);
        float _2252 = 1.0 / _1486;
        float _2254 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2256 = precise::min(_2250, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2258 = _2256 * _2238;
        float _2260 = -_1030;
        float _2262 = _2260 + _2178;
        float _2264 = _2258 * _2252;
        float _2266 = -_1146;
        float _2268 = _2266 + _2212;
        float _2270 = _2254 * _2264;
        float _2272 = _2242 * _2264;
        float _2274 = fma(_2268, _2270, _1376);
        float _2276 = fma(_2262, _2270, _1368);
        float _2278 = fma(_2254, _2272, _1390);
        _2226 = _2270;
        _2228 = _2276;
        _2230 = _2274;
        _2232 = _2278;
    }
    float _2280 = _2226;
    float _2282 = _2228;
    float _2284 = _2230;
    float _2286 = _2232;
    float _2288 = _2280;
    if (_2176)
    {
        _2288 = 1.0;
    }
    float _2290 = _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2294 = _2214 * _2292;
    float _2296 = _2290;
    float _2298 = _2294;
    if (!_2176)
    {
        float _2300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = cos(_2304);
        float _2308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2302 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = 1.0 / _2306;
        float _2318 = _2310 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        float _2322 = _2314 * _2316;
        float _2324 = _2310 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2330 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2328;
        float _2332 = _2320 * _2322;
        float _2334 = 1.0 / _2330;
        float _2336 = 1.0 / _2332;
        float _2338 = _2326 * _2336;
        float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2342 = fma(_2294, _2338, _2340);
        float _2344 = _2342 * _2334;
        float _2346 = precise::clamp(_2344, 0.0, 1.0);
        _2072 = _2302;
        _2234 = _2346;
    }
    float _2348 = _2072;
    float _2350 = _2234;
    float _2352 = _2348;
    if (!_2176)
    {
        float _2354 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2356 = _2354 * 0.15915493667125701904296875;
        float _2358 = _2356 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        float _2362 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2364 = _2362 * 0.15915493667125701904296875;
        float _2366 = _2356 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        float _2370 = 1.0 / _2360;
        float _2372 = _2364 * 6.283185482025146484375;
        float _2374 = cos(_2372);
        float _2376 = _2368 * _2370;
        float _2378 = _2364 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = _2374 * _2376;
        float _2384 = 1.0 / _2382;
        float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2388 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2386;
        float _2390 = 1.0 / _2388;
        float _2392 = _2380 * _2384;
        float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2396 = fma(_2294, _2392, _2394);
        float _2398 = _2396 * _2390;
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -_2400;
        float _2404 = _2402 + 1.0;
        _2352 = _2382;
        _2296 = _2404;
    }
    float _2406 = _2352;
    float _2408 = _2296;
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2412 = _2282 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2284 + _2414;
    float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2420 = _2286 + _2418;
    float _2422 = _2412 * _2412;
    float _2424 = fma(_2416, _2416, _2422);
    float _2426 = fma(_2420, _2420, _2424);
    float _2428 = rsqrt(_2426);
    float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2432 = _2416 * _2430;
    float _2434 = _2420 * _2430;
    float _2436 = _2432 * _2432;
    float _2438 = _2434 * _2434;
    float _2440 = _2436 + _2438;
    float _2442 = sqrt(_2440);
    bool _2444 = _2442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2448 = _2442 + _2446;
    float _2450 = _2420;
    float _2452 = _2440;
    float _2454 = _2448;
    float _2456 = _2432;
    if (_2444)
    {
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2458;
    }
    float _2460 = _2450;
    if (_2444)
    {
        float _2462 = rsqrt(_2440);
        _2452 = _2462;
    }
    float _2464 = _2452;
    float _2466 = _2464;
    if (_2444)
    {
        float _2468 = _2448 * _2460;
        _2454 = _2468;
    }
    float _2470 = _2454;
    if (_2444)
    {
        float _2472 = _2470 * 0.15915493667125701904296875;
        _2074 = _2472;
    }
    float _2474 = _2074;
    float _2476 = _2428;
    if (_2444)
    {
        float _2478 = _2474 * 6.283185482025146484375;
        float _2480 = sin(_2478);
        _2476 = _2480;
    }
    float _2482 = _2476;
    float _2484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2486 = precise::max(0.0, _2484);
    float _2488 = _2406;
    float _2490 = _2486;
    float _2492 = _2484;
    if (_2444)
    {
        float _2494 = _2474 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        _2488 = _2496;
    }
    float _2498 = _2488;
    float _2500 = -_2430;
    float _2502 = -_2486;
    float _2504 = fma(_2412, _2500, _2502);
    if (_2444)
    {
        float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2490 = _2506;
    }
    float _2508 = _2490;
    float _2510 = sqrt(_2426);
    float _2512 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2514 = _2482;
    float _2516 = _2508;
    if (_2444)
    {
        float _2518 = fma(_2482, _2508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2514 = _2518;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2444)
    {
        _2516 = _2434;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (_2444)
    {
        float _2528 = _2498 + (-1.0);
        _2492 = _2528;
    }
    float _2530 = _2492;
    float _2532 = _2530;
    if (_2444)
    {
        float _2534 = _2464 * _2520;
        _1184 = _2534;
    }
    float _2536 = _1184;
    if (!_2444)
    {
        _2522 = _2504;
    }
    float _2538 = _2522;
    float _2540 = _2538;
    if (_2444)
    {
        float _2542 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2542;
    }
    float _2544 = _2298;
    if (_2444)
    {
        float _2546 = _2432 * _2536;
        _2456 = _2546;
    }
    float _2548 = _2456;
    if (!_2444)
    {
        _2466 = _2436;
    }
    float _2550 = _2466;
    float _2552 = _2550;
    if (_2444)
    {
        float _2554 = _2434 * _2536;
        _2526 = _2554;
    }
    float _2556 = _2526;
    if (_2444)
    {
        float _2558 = fma(_2504, _2498, _2544);
        _2540 = _2558;
    }
    float _2560 = _2540;
    if (_2444)
    {
        float _2562 = _2548 * _2548;
        _2552 = _2562;
    }
    float _2564 = _2552;
    if (!_2444)
    {
        _2532 = _2438;
    }
    float _2566 = _2532;
    float _2568 = _2566;
    if (_2444)
    {
        float _2570 = _2556 * _2556;
        _2568 = _2570;
    }
    float _2572 = _2568;
    float _2574 = fma(_2560, _2560, _2564);
    float _2576 = _2574 + _2572;
    float _2578 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2582 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2580);
    float _2584 = precise::clamp(_2582, 0.0, 1.0);
    float _2586 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2588 = rsqrt(_2576);
    float _2590 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2578);
    float _2592 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2594 = -_2584;
    float _2596 = _2594 + 1.0;
    float _2598 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2600 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2590);
    float _2602 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2592);
    float _2604 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2598);
    float _2606 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2608 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2602);
    float _2610 = abs(_2596);
    float _2612 = log2(_2610);
    float _2614 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2604);
    float _2616 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2512);
    float _2618 = _2608 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2620 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2622 = _2588 * _2548;
    float _2624 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2626 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2628 = _2588 * _2560;
    float _2630 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2632 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2616);
    float _2634 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2626);
    float _2636 = _2588 * _2556;
    float _2638 = -_2630;
    float _2640 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2638);
    float _2642 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2644 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2634);
    float _2646 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2648 = -_2636;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2640);
    float _2652 = -_2620;
    float _2654 = fma(_2652, _2586, 1.0);
    float _2656 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2644);
    float _2658 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2660 = fma(_2650, -0.5, 0.5);
    float _2662 = exp2(_2646);
    float _2664 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2666 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2658);
    float _2668 = fma(_2650, 0.5, 0.5);
    float _2670 = _2628 + 1.0;
    float _2672 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2664);
    float _2674 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2666);
    float _2676 = fma(_2668, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2678 = log2(_2654);
    float _2680 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2672);
    float _2682 = fma(_2668, _2676, -0.212114393711090087890625);
    float _2684 = fma(_2668, _2682, 1.570728778839111328125);
    float _2686 = 1.0 / _2656;
    float _2688 = -_2628;
    float _2690 = fma(_2662, _2670, _2688);
    float _2692 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2674);
    float _2694 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2680);
    float _2696 = fma(_2690, 0.5, 0.5);
    float _2698 = sqrt(_2660);
    float _2700 = _2678 * 0.693147182464599609375;
    float _2702 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2704 = _2692 * _2686;
    float _2706 = _2694 * _2686;
    float _2708 = fma(_2704, 0.5, 0.5);
    float _2710 = fma(_2706, -0.5, 0.5);
    float _2712 = _2698 * 0.636619746685028076171875;
    float _2714 = -_2684;
    float _2716 = fma(_2712, _2714, 1.0);
    float3 _7053 = float3(_2708, _2710, _2702);
    float _2718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7053, float3(0.0), isnan(_7053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7053, float3(0.0), isnan(_7053)), level(0.0)).x;
    float3 _7064 = float3(_2708, _2710, _2702);
    float4 _2721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7064, float3(0.0), isnan(_7064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7064, float3(0.0), isnan(_7064)), level(0.0)).xyzw;
    float _2723 = _2721.x;
    float _2725 = _2721.y;
    float _2727 = _2721.z;
    float _2729 = _2721.w;
    float2 _7081 = float2(_2716, _2696);
    float3 _2733 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7081, float2(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7081, float2(0.0), isnan(_7081)), level(0.0)).xyz;
    float _2735 = _2733.x;
    float _2737 = _2733.y;
    float _2739 = _2733.z;
    float _2741 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2743 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2745 = _2350 * _2408;
    bool _2747 = _2350 > 0.0;
    bool _2749 = isnan(_2350);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(0.0);
    bool _2755 = _2751 || _2753;
    float _2757 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2743);
    float _2759 = exp2(_2741);
    float _2761 = _2745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2763 = _2408 <= 0.0;
    bool _2765 = !_2755;
    bool _2767 = _2763 || _2765;
    float _2769 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2757);
    float _2771 = _2656 * 0.5;
    float _2773 = _380 * _2761;
    float _2775 = _2692 + _2656;
    float _2777 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2769);
    float _2779 = fma(_2694, -0.5, _2771);
    float _2781 = _2775 * 0.5;
    float _2783 = _2777 + _2656;
    out.gl_Position.x = _2692;
    out.gl_Position.y = _2694;
    out.gl_Position.z = _2777;
    out.gl_Position.w = _2656;
    float _2785 = _2773 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2787 = _2783 * 0.5;
    float _2789 = -_2759;
    float _2791 = _2789 + 1.0;
    out.m_47.x = _2785;
    float _2793 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = _2781;
    out.m_77.y = _2779;
    out.m_77.z = _2787;
    out.m_77.w = _2656;
    float _2795 = -_2793;
    float _2797 = _2795 + 1.0;
    float _2799 = _2793 * _2718;
    float _2801 = _2729 * _2797;
    float _2803 = _2729 * _2799;
    float _2805 = _2739 * _2799;
    float _2807 = fma(_2735, _2803, _2723);
    float _2809 = fma(_2737, _2803, _2725);
    float _2811 = fma(_2729, _2805, _2727);
    out.m_79.x = _2807;
    out.m_79.y = _2809;
    out.m_79.z = _2811;
    out.m_79.w = _2801;
    if (!_2767)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2813;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2110 = false;
    bool _858 = false;
    bool _620 = false;
    bool _400 = false;
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
        float _2870 = as_type<float>(_114);
        out.gl_Position.z = _2870;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = _132;
    if (_128)
    {
        float _138 = float(_98);
        _134 = _138;
    }
    float _140 = _134;
    bool _142 = _132 >= _140;
    bool _144 = !_128;
    bool _146 = _142 || _144;
    if (_146)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _108;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2939 = as_type<float>(_152);
        out.gl_Position.z = _2939;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    int _172 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _174 = _172 != 0;
    float _176 = _158 * _156;
    float _178 = 0.0;
    float _180 = _160;
    if (!_170)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[20].x, _176);
    float _190 = _186;
    if (!_170)
    {
        float _192 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    float _196 = _188 * 6.283185482025146484375;
    float _198 = floor(_188);
    float _200 = _196 * 0.15915493667125701904296875;
    float _202 = _200 * 6.283185482025146484375;
    float _204 = cos(_202);
    float _206 = -_198;
    float _208 = _188 + _206;
    bool _210 = _208 < 0.5;
    float _212 = float(_210);
    float _214 = fma(_204, 0.5, 0.5);
    bool _216 = !_170;
    float _218 = _194;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _160 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _160);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_170;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _160 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _180 = _272;
    }
    float _274 = _180;
    float _276 = -_208;
    float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _280 = -_212;
    float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _284 = -_214;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = in.m_49.x;
    float _290 = in.m_49.y;
    float _292 = in.m_49.z;
    float _294 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _296 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _304 = _302 != 0;
    float _306 = in.m_53.w;
    float _308 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _310 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _312 = _294 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _314 = in.m_44.x;
    float _316 = in.m_44.y;
    float _318 = in.m_44.z;
    float _320 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].x, _308);
    bool _322 = !_174;
    int _324 = _322 ? 0 : 1;
    float _326 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _328 = !_300;
    int _330 = _328 ? 0 : 1;
    float _332 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].y, _310);
    float _334 = fma(_296, (*spvDescriptorSet0.vp_c10)._m0[8].z, _312);
    int _336 = abs(_324);
    float _338 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].x, _320);
    int _340 = abs(_330);
    float _342 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].y, _332);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _346 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[10].z, _334);
    bool _348 = !_304;
    int _350 = _348 ? 0 : 1;
    float _352 = fma(_274, _288, _338);
    float _354 = float(_340);
    float _356 = fma(_274, _290, _342);
    int _358 = abs(_350);
    float _360 = fma(_274, _292, _346);
    float _362 = float(_336);
    float _364 = abs(_278);
    float _366 = _354 * _364;
    float _368 = float(_358);
    float _370 = fma(_352, _306, _314);
    float _372 = fma(_356, _306, _316);
    float _374 = fma(_362, _286, _366);
    float _376 = fma(_360, _306, _318);
    float _378 = abs(_282);
    float _380 = fma(_368, _378, _374);
    bool _382 = !_344;
    float _398;
    if (!_382)
    {
        float _384 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _386 = _154 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _388 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _390 = _388 * _384;
        float _392 = floor(_390);
        float _394 = -_392;
        float _396 = _390 + _394;
        _398 = _396;
        _400 = true;
    }
    else
    {
        float _402 = float(_98);
        float _404 = 1.0 / _402;
        float _406 = _132 * _404;
        _398 = _406;
    }
    _400 = false;
    float _408 = _398;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _412 = _408 + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _416 = _408 + _414;
    bool _418 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _420 = isnan(_408);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _436 = _408 + _434;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _446 = 1.0 / _432;
    bool _448 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _450 = 1.0 / _444;
    float _452 = 1.0 / _440;
    float _454 = _412 * _446;
    bool _456 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _458 = isnan(_408);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -_428;
    float _470 = _468 + 1.0;
    float _472 = _466 * _470;
    float _474 = _416 * _450;
    bool _476 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _478 = isnan(_408);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _488;
    bool _492 = _408 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _494 = isnan(_408);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -_466;
    float _506 = _504 + 1.0;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = -_486;
    float _514 = _512 + 1.0;
    float _516 = _436 * _452;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _522;
    float _526 = _502 * _514;
    float _528 = fma(_490, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _530 = fma(_520, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _532 = fma(_524, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _534 = _486 * _506;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = _530 * _526;
    float _546 = _532 * _526;
    float _548 = _528 * _526;
    float _550 = -_502;
    float _552 = _550 + 1.0;
    float _554 = fma(_510, _474, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _556 = fma(_538, _474, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _558 = fma(_542, _474, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _560 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].x, _546);
    float _562 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].y, _544);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _564;
    float _568 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[143].z, _548);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _574;
    float _578 = fma(_554, _534, _560);
    float _580 = fma(_566, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _582 = fma(_572, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _584 = fma(_556, _534, _562);
    float _586 = fma(_576, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _588 = fma(_558, _534, _568);
    float _590 = fma(_580, _472, _578);
    float _592 = fma(_582, _472, _584);
    float _594 = fma(_586, _472, _588);
    float _596 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].x, _590);
    float _598 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].y, _592);
    float _600 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[146].z, _594);
    bool _602 = !_448;
    float _618;
    if (!_602)
    {
        float _604 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _606 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _608 = fma(_606, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _610 = _608 * _604;
        float _612 = floor(_610);
        float _614 = -_612;
        float _616 = _610 + _614;
        _618 = _616;
        _620 = true;
    }
    else
    {
        float _622 = float(_98);
        float _624 = 1.0 / _622;
        float _626 = _132 * _624;
        _618 = _626;
    }
    _620 = false;
    float _628 = _618;
    float _630 = in.m_53.x;
    float _632 = in.m_53.y;
    float _634 = in.m_53.z;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _638 = _628 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _642 = _628 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _652;
    bool _656 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _658 = isnan(_628);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _646;
    bool _670 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _672 = 1.0 / _650;
    float _674 = 1.0 / _654;
    float _676 = _600 * _634;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _628 + _678;
    float _682 = _598 * _632;
    float _684 = _596 * _630;
    float _686 = _680 * _668;
    float _688 = -_666;
    float _690 = _688 + 1.0;
    float _692 = _638 * _672;
    bool _694 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _696 = isnan(_628);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _706;
    bool _710 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _712 = isnan(_628);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    bool _722 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _724 = isnan(_628);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = _704 * _690;
    float _736 = -_704;
    float _738 = _736 + 1.0;
    float _740 = _642 * _674;
    float _742 = -_720;
    float _744 = _742 + 1.0;
    float _746 = fma(_708, _686, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _748 = _720 * _738;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _750;
    float _754 = _732 * _744;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _764 = fma(_752, _686, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _766 = _746 * _754;
    float _768 = fma(_758, _686, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _770 = -_732;
    float _772 = _770 + 1.0;
    float _774 = _764 * _754;
    float _776 = _768 * _754;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _786 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _788;
    float _792 = fma(_780, _692, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _794 = fma(_784, _692, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _796 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _766);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _798;
    float _802 = fma(_762, _692, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _804 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _776);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _806;
    float _810 = fma(_792, _748, _786);
    float _812 = fma(_790, _740, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _814 = fma(_800, _740, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _816 = fma(_794, _748, _796);
    float _818 = fma(_808, _740, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _820 = fma(_802, _748, _804);
    float _822 = fma(_812, _734, _810);
    float _824 = fma(_814, _734, _816);
    float _826 = fma(_818, _734, _820);
    float _828 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].x, _822);
    float _830 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].y, _824);
    float _832 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].z, _826);
    bool _834 = !_670;
    bool _836 = _670;
    int _838 = as_type<int>(_814);
    float _854;
    float _856;
    if (!_834)
    {
        float _840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _842 = _154 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _846 = _844 * _840;
        float _848 = floor(_846);
        float _850 = -_848;
        float _852 = _846 + _850;
        _854 = _852;
        _856 = _846;
        _858 = true;
    }
    else
    {
        float _860 = float(_98);
        float _862 = 1.0 / _860;
        float _864 = _132 * _862;
        _854 = _864;
        _856 = _860;
    }
    _858 = false;
    float _866 = _854;
    float _868 = _856;
    float _870 = in.m_55.x;
    float _872 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _874 = log2(_872);
    float _876 = _154 * 2.0;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _880 = _878 != 0;
    float _882 = in.m_51.w;
    float _884 = _828 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _886 = _830 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _888 = in.m_55.y;
    float _890 = floor(_876);
    float _892 = _832 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _894 = in.m_51.y;
    float _896 = _868;
    if (_880)
    {
        bool _898 = _154 > 0.5;
        _836 = _898;
    }
    bool _900 = _836;
    float _902 = in.m_51.z;
    float _904 = _874 * _132;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_880)
    {
        float _908 = -_870;
        float _910 = _908 + 1.0;
        _838 = as_type<int>(_910);
    }
    int _912 = _838;
    if (!_880)
    {
        _896 = _870;
    }
    float _914 = _896;
    float _916 = exp2(_904);
    int _918 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _920 = _918 != 0;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _928 = _926 != 0;
    float _930 = _372 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _932 = _914;
    if (_880)
    {
        float _934 = _900 ? as_type<float>(_912) : _870;
        _932 = _934;
    }
    float _936 = _932;
    int _938 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _940 = _938 != 0;
    float _942 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[5].x, _930);
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _946 = _944 != 0;
    float _948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _952 = _950 != 0;
    float _954 = _372 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _956 = _882 > 0.5;
    float _958 = _372 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = -_888;
    float _962 = _960 + 1.0;
    float _964 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _966 = fma(_370, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _968 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[5].z, _942);
    int _970 = _956 ? as_type<int>(_962) : as_type<int>(_888);
    float _972 = _894 * 2.0;
    bool _974 = _894 > 0.5;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _980 = _946 ? as_type<float>(_970) : _888;
    float _982 = -_916;
    float _984 = _982 + 1.0;
    bool _986 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _988 = isnan(1.0);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _994 = _990 || _992;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _998 = 1.0 + _996;
    float _1000 = _888;
    int _1002 = as_type<int>(_962);
    bool _1004 = _952;
    float _1006 = _978;
    if (_952)
    {
        float _1008 = _974 ? _962 : _888;
        _1000 = _1008;
    }
    float _1010 = _1000;
    float _1012 = 1.0 / _978;
    if (_940)
    {
        float _1014 = -_870;
        float _1016 = _1014 + 1.0;
        _1002 = as_type<int>(_1016);
    }
    int _1018 = _1002;
    if (_940)
    {
        bool _1020 = _902 > 0.5;
        _1004 = _1020;
    }
    bool _1022 = _1004;
    float _1024 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[4].z, _964);
    float _1026 = fma(_376, (*spvDescriptorSet0.vp_c10)._m0[6].z, _966);
    float _1028 = _894 + _902;
    float _1030 = _968 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1032 = 1.0 / _998;
    if (!_940)
    {
        _1006 = _870;
    }
    float _1034 = _1006;
    float _1036 = _1028 + (-1.0);
    float _1038 = _1034;
    if (_940)
    {
        float _1040 = _1022 ? as_type<float>(_1018) : _870;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1044;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = _154 + _902;
    float _1060 = floor(_972);
    float _1062 = _1056 ? _984 : 0.0;
    float _1064 = _902 * 2.0;
    float _1066 = _1046 * _1012;
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1072 = _866 + _1070;
    float _1074 = _1058 + (-1.0);
    bool _1076 = _890 > 0.0;
    float _1078 = _1042;
    if (_994)
    {
        float _1080 = _1062 * _1032;
        _136 = _1080;
    }
    float _1082 = _136;
    bool _1084 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1086 = isnan(_866);
    bool _1088 = _1084 || _1086;
    bool _1090 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1092 = _1088 || _1090;
    float _1094 = float(_1092);
    float _1096 = fma(_1066, _1072, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1098 = _866 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1100 = isnan(_866);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = floor(_1064);
    float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1114 = _1030 + _1112;
    float _1116 = -_1094;
    float _1118 = _1116 + 1.0;
    bool _1120 = _890 >= 0.0;
    bool _1122 = isnan(_890);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1132 = _1060 > 0.0;
    float _1134 = _1108 * _1118;
    bool _1136 = _1060 >= 0.0;
    bool _1138 = isnan(_1060);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1148 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1150 = _1114 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1152 = _1128 ? 0 : 1;
    float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1156 = _1146 + _1154;
    float _1158 = _1096 * _1134;
    float _1160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1162 = _1148 + _1160;
    int _1164 = _1144 ? 0 : 1;
    float _1166 = fma(_1156, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1150);
    float _1168 = -_1108;
    float _1170 = _1168 + 1.0;
    float _1172 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1174 = ~_1152;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1166);
    int _1182 = _1178;
    float _1184 = _1146;
    if (!_1076)
    {
        int _1186 = ~_1152;
        int _1188 = _1186 + 1;
        _1182 = _1188;
    }
    int _1190 = _1182;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1158);
    int _1194 = ~_1164;
    int _1196 = _1194 + 1;
    int _1198 = _1196 + 1;
    float _1200 = _1172 * _906;
    int _1202 = _1198;
    if (!_1132)
    {
        int _1204 = ~_1164;
        int _1206 = _1204 + 1;
        _1202 = _1206;
    }
    int _1208 = _1202;
    float _1210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1212 = _1110 > 0.0;
    float _1214 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1192);
    bool _1216 = _1110 >= 0.0;
    bool _1218 = isnan(_1110);
    bool _1220 = _1216 || _1218;
    bool _1222 = isnan(0.0);
    bool _1224 = _1220 || _1222;
    float _1226 = _902 + (-0.5);
    bool _1228 = !_924;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = in.m_57.x;
    float _1234 = in.m_57.y;
    float _1236 = in.m_57.z;
    bool _1238 = _1180 >= 0.0;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1242 = !_928;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1248 = abs(_1230);
    float _1250 = _936 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1252 = abs(_1244);
    float _1254 = _1246 * _948;
    float _1256 = _1250 * _1210;
    float _1258 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1260 = float(_1248);
    if (_1238)
    {
        out.m_47.x = 0.0;
    }
    float _1262 = float(_1190);
    float _1264 = _894 + (-0.5);
    int _1266 = _1224 ? 0 : 1;
    float _1268 = _1258 * _1240;
    float _1270 = float(_1252);
    float _1272 = _1260 * _1262;
    int _1274 = ~_1266;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    int _1280 = _1278;
    if (!_1212)
    {
        int _1282 = ~_1266;
        int _1284 = _1282 + 1;
        _1280 = _1284;
    }
    int _1286 = _1280;
    out.m_59.x = _1256;
    out.m_59.y = _1254;
    out.m_59.z = _1268;
    out.m_59.w = _1200;
    float _1288 = _1272 * (-2.0);
    float _1290 = float(_1208);
    if (_1238)
    {
        _1078 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1292 = _1078;
    float _1294 = fma(_1288, _1234, _1234);
    float _1296 = fma(_1068, _1288, _1068);
    float _1298 = _1270 * _1290;
    float _1300 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1294);
    float _1302 = _1298 * (-2.0);
    int _1304 = as_type<int>(_1292);
    if (_1238)
    {
        float _1306 = _1292 * 5.0;
        _1304 = as_type<int>(_1306);
    }
    int _1308 = _1304;
    float _1310 = _1114 * _1114;
    float _1312 = fma(_1130, _1302, _1130);
    float _1314 = fma(_1302, _1236, _1236);
    float _1316 = fma(_1156, _1156, _1310);
    if (_1238)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4769 = as_type<float>(_1308);
        out.gl_Position.z = _4769;
    }
    float _1318 = fma(_1162, _1162, _1316);
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1328 = !_920;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = rsqrt(_1318);
    float _1334 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _886 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1348 = abs(_1330);
    out.m_61.x = _1334;
    out.m_61.y = _1336;
    out.m_61.z = _1338;
    out.m_61.w = _1324;
    float _1350 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1314);
    float _1352 = fma(_1296, _1082, _1300);
    float _1354 = float(_1348);
    out.m_63.x = _1340;
    out.m_63.y = _1342;
    out.m_63.z = _1344;
    out.m_63.w = _1346;
    float _1356 = _1114 * _1332;
    float _1358 = _1156 * _1332;
    float _1360 = _1162 * _1332;
    float _1362 = -_1356;
    float _1364 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1114);
    if (_1238)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1366 = -_1356;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1370 = -_1358;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    float _1374 = -_1358;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1146);
    float _1378 = _1364 * _1364;
    float _1380 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1382 = _1368 + _1380;
    float _1384 = float(_1286);
    float _1386 = _1352 * 0.15915493667125701904296875;
    float _1388 = -_1360;
    float _1390 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1148);
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1394 = _1376 + _1392;
    float _1396 = _1382 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1398 = _1354 * _1384;
    float _1400 = _154 + _894;
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1404 = _1390 + _1402;
    float _1406 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1396);
    float _1408 = fma(_1312, _1082, _1350);
    float _1410 = _1400 + (-1.0);
    float _1412 = _1398 * (-2.0);
    float _1414 = fma(_1404, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1406);
    float _1416 = _154 + (-0.5);
    float _1418 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1420 = fma(_1412, _1232, _1232);
    float _1422 = fma(_1372, _1372, _1378);
    bool _1424 = _1414 >= 0.0;
    float _1426 = fma(_1418, _1412, _1418);
    float _1428 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1420);
    float _1430 = -_1360;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1162);
    float _1434 = _1408 * 0.15915493667125701904296875;
    float _1436 = _1386 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    float _1440 = fma(_1426, _1082, _1428);
    float _1442 = fma(_1432, _1432, _1422);
    float _1444 = _1440 * 0.15915493667125701904296875;
    float _1446 = _1398;
    if (_1424)
    {
        _1446 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1448 = _1446;
    float _1450 = _1386 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    int _1454 = as_type<int>(_1448);
    if (_1424)
    {
        out.m_47.x = 0.0;
    }
    if (_1424)
    {
        float _1456 = _1448 * 5.0;
        _1454 = as_type<int>(_1456);
    }
    int _1458 = _1454;
    float _1460 = sqrt(_1442);
    if (_1424)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5045 = as_type<float>(_1458);
        out.gl_Position.z = _5045;
    }
    float _1462 = _1434 * 6.283185482025146484375;
    float _1464 = sin(_1462);
    float _1466 = _1434 * 6.283185482025146484375;
    float _1468 = cos(_1466);
    float _1470 = _1444 * 6.283185482025146484375;
    float _1472 = sin(_1470);
    if (_1424)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1474 = -_1030;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1478 = -_1146;
    float _1480 = _1478 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1482 = -_1148;
    float _1484 = _1482 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1486 = _1332 * _1460;
    float _1488 = _1476 * _1476;
    float _1490 = in.m_65.x;
    float _1492 = in.m_65.y;
    float _1494 = in.m_65.z;
    float _1496 = _1444 * 6.283185482025146484375;
    float _1498 = cos(_1496);
    float _1500 = _1452 * _1468;
    float _1502 = fma(_1480, _1480, _1488);
    float _1504 = _1438 * _1464;
    float _1506 = _1452 * _1464;
    float _1508 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1510 = fma(_1484, _1484, _1502);
    float _1512 = fma(_1472, _1504, _1500);
    float _1514 = fma(_1472, _1500, _1504);
    float _1516 = _1438 * _1468;
    float _1518 = rsqrt(_1510);
    float _1520 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1522 = _1486 * _1508;
    float _1524 = -_1516;
    float _1526 = fma(_1472, _1506, _1524);
    float _1528 = _1486 * _1520;
    float _1530 = _1464 * _1498;
    float _1532 = _1468 * _1498;
    float _1534 = _1438 * _1498;
    float _1536 = _1452 * _1498;
    float _1538 = -_1506;
    float _1540 = fma(_1472, _1516, _1538);
    float _1542 = _682 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1544 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1490);
    bool _1546 = _1492 != 0.0;
    bool _1548 = isnan(_1492);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    float _1556 = _1486 * _1542;
    float _1558 = _1480 * _1518;
    float _1560 = _1484 * _1518;
    float _1562 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1492);
    float _1564 = _1544 * _1522;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1568 = _1558 * _1566;
    float _1570 = _1476 * _1518;
    float _1572 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1574 = _1560 * _1572;
    float _1576 = in.m_67.x;
    float _1578 = in.m_67.y;
    float _1580 = in.m_67.z;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1584 = -_1568;
    float _1586 = fma(_1560, _1582, _1584);
    float _1588 = _1562 * _1556;
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1592 = _1570 * _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1596 = -_1574;
    float _1598 = fma(_1570, _1594, _1596);
    float _1600 = _1586 * _1586;
    float _1602 = _1540 * _1588;
    float _1604 = _1532 * _1588;
    float _1606 = _1514 * _1588;
    bool _1608 = _1490 == 0.0;
    bool _1610 = !_1554;
    bool _1612 = _1608 && _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1616 = -_1592;
    float _1618 = fma(_1558, _1614, _1616);
    float _1620 = fma(_1598, _1598, _1600);
    float _1622 = fma(_1512, _1564, _1602);
    float _1624 = fma(_1530, _1564, _1604);
    float _1626 = fma(_1526, _1564, _1606);
    bool _1628 = _1494 == 0.0;
    bool _1630 = _1628 && _1612;
    float _1632 = in.m_69.x;
    float _1634 = in.m_69.y;
    float _1636 = in.m_69.z;
    float _1638 = in.m_69.w;
    float _1640 = fma(_1618, _1618, _1620);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1648 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1646;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1650;
    float _1654 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1494);
    float _1656 = _1644 * _1644;
    float _1658 = rsqrt(_1640);
    float _1660 = _1654 * _1528;
    float _1662 = fma(_1648, _1648, _1656);
    float _1664 = 0.0;
    float _1666 = _1528;
    float _1668 = _1576;
    float _1670 = _1662;
    if (_1630)
    {
        _1664 = _1576;
    }
    float _1672 = _1664;
    float _1674 = 0.0;
    float _1676 = _1672;
    if (_1630)
    {
        _1674 = _1578;
    }
    float _1678 = _1674;
    float _1680 = fma(_1652, _1652, _1662);
    float _1682 = 0.0;
    float _1684 = _1678;
    if (_1630)
    {
        _1682 = _1580;
    }
    float _1686 = _1682;
    float _1688 = _1686;
    if (_1630)
    {
        _1666 = _1672;
    }
    float _1690 = _1666;
    float _1692 = sqrt(_1680);
    float _1694 = _1690;
    if (!_1630)
    {
        _1676 = _1576;
    }
    float _1696 = _1676;
    if (_1630)
    {
        _1668 = _1678;
    }
    float _1698 = _1668;
    float _1700 = _1586 * _1658;
    float _1702 = _1698;
    if (_1630)
    {
        _1670 = _1686;
    }
    float _1704 = _1670;
    float _1706 = _1704;
    if (!_1630)
    {
        float _1708 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1696);
        _1694 = _1708;
    }
    float _1710 = _1694;
    if (!_1630)
    {
        _1684 = _1578;
    }
    float _1712 = _1684;
    float _1714 = fma(_1534, _1660, _1622);
    if (!_1630)
    {
        _1688 = _1580;
    }
    float _1716 = _1688;
    float _1718 = -_1472;
    float _1720 = fma(_1718, _1660, _1624);
    float _1722 = fma(_1536, _1660, _1626);
    float _1724 = _1598 * _1658;
    float _1726 = _1636 * _1696;
    if (!_1630)
    {
        float _1728 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1716);
        _1706 = _1728;
    }
    float _1730 = _1706;
    float _1732 = _1618 * _1658;
    float _1734 = _1560 * _1700;
    float _1736 = _1570 * _1724;
    float _1738 = -_1726;
    float _1740 = fma(_1632, _1716, _1738);
    float _1742 = _1634 * _1716;
    float _1744 = -_1734;
    float _1746 = fma(_1570, _1732, _1744);
    if (!_1630)
    {
        float _1748 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1712);
        _1702 = _1748;
    }
    float _1750 = _1702;
    float _1752 = -_1736;
    float _1754 = fma(_1558, _1700, _1752);
    float _1756 = rsqrt(_1680);
    float _1758 = -_1742;
    float _1760 = fma(_1636, _1712, _1758);
    float _1762 = _1746 * _1720;
    float _1764 = precise::max(_1692, 10.0);
    float _1766 = _1754 * _1720;
    float _1768 = _1632 * _1712;
    float _1770 = fma(_1724, _1714, _1762);
    float _1772 = precise::min(_1764, 50.0);
    float _1774 = fma(_1732, _1714, _1766);
    float _1776 = _1692 * 0.039999999105930328369140625;
    float _1778 = fma(_1558, _1722, _1770);
    float _1780 = -_1768;
    float _1782 = fma(_1634, _1696, _1780);
    float _1784 = fma(_1560, _1722, _1774);
    float _1786 = fma(_1772, 0.25, -2.5);
    float _1788 = precise::max(_1776, 1.0);
    float _1790 = _1146 + _1778;
    float _1792 = _1148 + _1784;
    float _1794 = _1756 * _1786;
    float _1796 = precise::min(_1788, 2.0);
    float _1798 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1800 = _1790 + _1798;
    float _1802 = _1740 * _1638;
    float _1804 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1806 = _1792 + _1804;
    float _1808 = _1760 * _1638;
    float _1810 = _1558 * _1732;
    float _1812 = fma(_1800, _1796, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1814 = fma(_1806, _1796, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1816 = _1782 * _1638;
    float _1818 = -_1810;
    float _1820 = fma(_1560, _1724, _1818);
    float _1822 = -_1794;
    float _1824 = fma(_1648, _1822, _1812);
    float _1826 = -_1794;
    float _1828 = fma(_1652, _1826, _1814);
    float _1830 = _1530 * _1746;
    float _1832 = _1530 * _1820;
    float _1834 = _1532 * _1746;
    float _1836 = _1532 * _1820;
    float _1838 = _1530 * _1754;
    float _1840 = _1532 * _1754;
    float _1842 = -_1746;
    float _1844 = _1472 * _1842;
    float _1846 = -_1754;
    float _1848 = _1472 * _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1852 = _1824 + _1850;
    float _1854 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1856 = _1828 + _1854;
    float _1858 = -_1820;
    float _1860 = _1472 * _1858;
    float _1862 = _1820 * _1720;
    float _1864 = _1852 * _1852;
    float _1866 = _1856 * _1856;
    float _1868 = fma(_1512, _1724, _1830);
    float _1870 = fma(_1512, _1700, _1832);
    float _1872 = fma(_1512, _1732, _1838);
    float _1874 = _1864 + _1866;
    float _1876 = fma(_1540, _1724, _1834);
    float _1878 = fma(_1540, _1700, _1836);
    float _1880 = fma(_1540, _1732, _1840);
    float _1882 = fma(_1700, _1714, _1862);
    float _1884 = sqrt(_1874);
    float _1886 = fma(_1534, _1724, _1844);
    float _1888 = fma(_1534, _1700, _1860);
    float _1890 = fma(_1570, _1722, _1882);
    float _1892 = fma(_1534, _1732, _1848);
    float _1894 = fma(_1514, _1558, _1876);
    float _1896 = fma(_1514, _1560, _1880);
    float _1898 = _1030 + _1890;
    float _1900 = fma(_1514, _1570, _1878);
    float _1902 = fma(_1526, _1570, _1870);
    float _1904 = fma(_1526, _1558, _1868);
    float _1906 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1908 = _1898 + _1906;
    float _1910 = fma(_1536, _1570, _1888);
    float _1912 = fma(_1526, _1560, _1872);
    float _1914 = fma(_1536, _1558, _1886);
    float _1916 = fma(_1908, _1796, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    bool _1918 = _1884 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1920 = _1894 * _1634;
    float _1922 = _1900 * _1634;
    float _1924 = _1896 * _1634;
    float _1926 = fma(_1536, _1560, _1892);
    float _1928 = _1900 * _1750;
    float _1930 = _1894 * _1750;
    float _1932 = _1802 * _1894;
    float _1934 = _1802 * _1900;
    float _1936 = _1896 * _1750;
    float _1938 = _1802 * _1896;
    float _1940 = -_1794;
    float _1942 = fma(_1644, _1940, _1916);
    bool _1944 = !_1918;
    float _1946 = _1942;
    float _1948 = _1864;
    float _1950 = _1866;
    float _1952 = _1824;
    float _1954 = _1828;
    float _1956 = _1816;
    if (!_1944)
    {
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1962 = _1884 + _1960;
        float _1964 = rsqrt(_1874);
        float _1966 = _1962 * _1958;
        float _1968 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = _1966 * 0.15915493667125701904296875;
        float _1972 = _1970 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = _1970 * 6.283185482025146484375;
        float _1978 = cos(_1976);
        float _1980 = fma(_1974, _1968, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1982 = _1964 * _1980;
        float _1984 = fma(_1852, _1982, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1986 = _1978 + (-1.0);
        float _1988 = fma(_1856, _1982, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1992 = _1984 + _1990;
        float _1994 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1998 = _1988 + _1996;
        float _2000 = _1992 * _1992;
        float _2002 = fma(_1942, _1978, _1994);
        float _2004 = _1998 * _1998;
        _1946 = _2002;
        _1948 = _2000;
        _1950 = _2004;
        _1952 = _1984;
        _1954 = _1988;
    }
    float _2006 = _1946;
    float _2008 = _1948;
    float _2010 = _1950;
    float _2012 = _1952;
    float _2014 = _1954;
    float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2018 = _2006 + _2016;
    float _2020 = fma(_1904, _1710, _1930);
    float _2022 = fma(_1808, _1904, _1932);
    float _2024 = fma(_1904, _1632, _1920);
    float _2026 = fma(_2018, _2018, _2008);
    float _2028 = fma(_1902, _1632, _1922);
    float _2030 = fma(_1912, _1632, _1924);
    float _2032 = fma(_1902, _1710, _1928);
    float _2034 = _2026 + _2010;
    float _2036 = fma(_1912, _1710, _1936);
    float _2038 = fma(_1808, _1902, _1934);
    float _2040 = fma(_1808, _1912, _1938);
    float _2042 = fma(_1914, _1636, _2024);
    float _2044 = fma(_1914, _1730, _2020);
    float _2046 = sqrt(_2034);
    float _2048 = fma(_1816, _1914, _2022);
    float _2050 = fma(_1910, _1636, _2028);
    float _2052 = fma(_1910, _1730, _2032);
    float _2054 = fma(_1816, _1910, _2038);
    float _2056 = fma(_1816, _1926, _2040);
    float _2058 = fma(_1926, _1730, _2036);
    float _2060 = fma(_1926, _1636, _2030);
    out.m_63.x = _1340;
    out.m_63.y = _1342;
    out.m_63.z = _1344;
    out.m_63.w = _1346;
    out.m_61.x = _1334;
    out.m_61.y = _1336;
    out.m_61.z = _1338;
    out.m_61.w = _1324;
    out.m_71.x = _2048;
    out.m_71.y = _2054;
    out.m_71.z = _2056;
    bool _2062 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2064 = isnan(_2046);
    bool _2066 = _2062 || _2064;
    bool _2068 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2070 = _2066 || _2068;
    out.m_73.x = _2044;
    out.m_73.y = _2052;
    out.m_73.z = _2058;
    out.m_75.x = _2042;
    out.m_75.y = _2050;
    out.m_75.z = _2060;
    float _2072 = _2060;
    float _2074 = _2048;
    if (!_2070)
    {
        _1956 = 1.0;
    }
    float _2076 = _1956;
    bool _2078 = !_2070;
    float _2080 = _2076;
    if (!_2078)
    {
        bool _2082 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2084 = isnan(_2046);
        bool _2086 = _2082 || _2084;
        bool _2088 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2090 = _2086 || _2088;
        if (!_2090)
        {
            float _2092 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2094 = _2046 + _2092;
            float _2096 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2098 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2096;
            float _2100 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2102 = _2100 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2104 = 1.0 / _2098;
            float _2106 = _2094 * _2104;
            float _2108 = fma(_2106, _2102, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2080 = _2108;
            _2110 = true;
        }
        else
        {
            bool _2112 = _2046 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2114 = isnan(_2046);
            bool _2116 = _2112 || _2114;
            bool _2118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2120 = _2116 || _2118;
            if (!_2120)
            {
                float _2122 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2124 = _2046 + _2122;
                float _2126 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2128 = _2126 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2130 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2132 = _2130 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2134 = 1.0 / _2128;
                float _2136 = _2124 * _2134;
                float _2138 = fma(_2136, _2132, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2080 = _2138;
                _2110 = true;
            }
            else
            {
                _2080 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2110 = false;
    float _2140 = _2080;
    float _2142 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2144 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2146 = _2012 + _2144;
    float _2148 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2142);
    float _2150 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2152 = _2006 + _2150;
    bool _2154 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2158 = _2154 || _2156;
    bool _2160 = isnan(0.5);
    bool _2162 = _2158 || _2160;
    float _2164 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2148);
    float _2166 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2168 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2170 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2172 = _2168 || _2170;
    bool _2174 = isnan(0.5);
    bool _2176 = _2172 || _2174;
    float _2178 = fma(_2152, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2180 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2182 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2166);
    float _2184 = 1.0 / _2180;
    float _2186 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2182);
    float _2188 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2176)
    {
        _2190 = 1.0;
    }
    float _2192 = _2190;
    float _2194 = _2188 + _2180;
    float _2196 = _2194 * _2184;
    float _2198 = _2196 * 0.5;
    float _2200 = -_1356;
    float _2202 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2178);
    float _2204 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2206 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2204);
    float _2208 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2210 = _2014 + _2208;
    float _2212 = fma(_2146, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2214 = 1.0 / _2206;
    float _2216 = fma(_2210, _2140, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2218 = -_1358;
    float _2220 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2212);
    float _2222 = -_1360;
    float _2224 = fma(_2222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2216);
    float _2226 = _2212;
    float _2228 = _2202;
    float _2230 = _2220;
    float _2232 = _2224;
    float _2234 = _2192;
    if (!_2162)
    {
        float _2236 = _1382 * _1382;
        float _2238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2240 = -_1148;
        float _2242 = _2240 + _2216;
        float _2244 = fma(_1394, _1394, _2236);
        float _2246 = fma(_1404, _1404, _2244);
        float _2248 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2250 = sqrt(_2246);
        float _2252 = 1.0 / _1486;
        float _2254 = _2248 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2256 = precise::min(_2250, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2258 = _2256 * _2238;
        float _2260 = -_1030;
        float _2262 = _2260 + _2178;
        float _2264 = _2258 * _2252;
        float _2266 = -_1146;
        float _2268 = _2266 + _2212;
        float _2270 = _2254 * _2264;
        float _2272 = _2242 * _2264;
        float _2274 = fma(_2268, _2270, _1376);
        float _2276 = fma(_2262, _2270, _1368);
        float _2278 = fma(_2254, _2272, _1390);
        _2226 = _2270;
        _2228 = _2276;
        _2230 = _2274;
        _2232 = _2278;
    }
    float _2280 = _2226;
    float _2282 = _2228;
    float _2284 = _2230;
    float _2286 = _2232;
    float _2288 = _2280;
    if (_2176)
    {
        _2288 = 1.0;
    }
    float _2290 = _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2294 = _2214 * _2292;
    float _2296 = _2290;
    float _2298 = _2294;
    if (!_2176)
    {
        float _2300 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = cos(_2304);
        float _2308 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2310 = _2308 * 0.15915493667125701904296875;
        float _2312 = _2302 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = 1.0 / _2306;
        float _2318 = _2310 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        float _2322 = _2314 * _2316;
        float _2324 = _2310 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2330 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2328;
        float _2332 = _2320 * _2322;
        float _2334 = 1.0 / _2330;
        float _2336 = 1.0 / _2332;
        float _2338 = _2326 * _2336;
        float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2342 = fma(_2294, _2338, _2340);
        float _2344 = _2342 * _2334;
        float _2346 = precise::clamp(_2344, 0.0, 1.0);
        _2072 = _2302;
        _2234 = _2346;
    }
    float _2348 = _2072;
    float _2350 = _2234;
    float _2352 = _2348;
    if (!_2176)
    {
        float _2354 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2356 = _2354 * 0.15915493667125701904296875;
        float _2358 = _2356 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        float _2362 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2364 = _2362 * 0.15915493667125701904296875;
        float _2366 = _2356 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        float _2370 = 1.0 / _2360;
        float _2372 = _2364 * 6.283185482025146484375;
        float _2374 = cos(_2372);
        float _2376 = _2368 * _2370;
        float _2378 = _2364 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = _2374 * _2376;
        float _2384 = 1.0 / _2382;
        float _2386 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2388 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2386;
        float _2390 = 1.0 / _2388;
        float _2392 = _2380 * _2384;
        float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2396 = fma(_2294, _2392, _2394);
        float _2398 = _2396 * _2390;
        float _2400 = precise::clamp(_2398, 0.0, 1.0);
        float _2402 = -_2400;
        float _2404 = _2402 + 1.0;
        _2352 = _2382;
        _2296 = _2404;
    }
    float _2406 = _2352;
    float _2408 = _2296;
    float _2410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2412 = _2282 + _2410;
    float _2414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2416 = _2284 + _2414;
    float _2418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2420 = _2286 + _2418;
    float _2422 = _2412 * _2412;
    float _2424 = fma(_2416, _2416, _2422);
    float _2426 = fma(_2420, _2420, _2424);
    float _2428 = rsqrt(_2426);
    float _2430 = _2428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2432 = _2416 * _2430;
    float _2434 = _2420 * _2430;
    float _2436 = _2432 * _2432;
    float _2438 = _2434 * _2434;
    float _2440 = _2436 + _2438;
    float _2442 = sqrt(_2440);
    bool _2444 = _2442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2448 = _2442 + _2446;
    float _2450 = _2420;
    float _2452 = _2440;
    float _2454 = _2448;
    float _2456 = _2432;
    if (_2444)
    {
        float _2458 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2450 = _2458;
    }
    float _2460 = _2450;
    if (_2444)
    {
        float _2462 = rsqrt(_2440);
        _2452 = _2462;
    }
    float _2464 = _2452;
    float _2466 = _2464;
    if (_2444)
    {
        float _2468 = _2448 * _2460;
        _2454 = _2468;
    }
    float _2470 = _2454;
    if (_2444)
    {
        float _2472 = _2470 * 0.15915493667125701904296875;
        _2074 = _2472;
    }
    float _2474 = _2074;
    float _2476 = _2428;
    if (_2444)
    {
        float _2478 = _2474 * 6.283185482025146484375;
        float _2480 = sin(_2478);
        _2476 = _2480;
    }
    float _2482 = _2476;
    float _2484 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2486 = precise::max(0.0, _2484);
    float _2488 = _2406;
    float _2490 = _2486;
    float _2492 = _2484;
    if (_2444)
    {
        float _2494 = _2474 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        _2488 = _2496;
    }
    float _2498 = _2488;
    float _2500 = -_2430;
    float _2502 = -_2486;
    float _2504 = fma(_2412, _2500, _2502);
    if (_2444)
    {
        float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2490 = _2506;
    }
    float _2508 = _2490;
    float _2510 = sqrt(_2426);
    float _2512 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2514 = _2482;
    float _2516 = _2508;
    if (_2444)
    {
        float _2518 = fma(_2482, _2508, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2514 = _2518;
    }
    float _2520 = _2514;
    float _2522 = _2520;
    if (!_2444)
    {
        _2516 = _2434;
    }
    float _2524 = _2516;
    float _2526 = _2524;
    if (_2444)
    {
        float _2528 = _2498 + (-1.0);
        _2492 = _2528;
    }
    float _2530 = _2492;
    float _2532 = _2530;
    if (_2444)
    {
        float _2534 = _2464 * _2520;
        _1184 = _2534;
    }
    float _2536 = _1184;
    if (!_2444)
    {
        _2522 = _2504;
    }
    float _2538 = _2522;
    float _2540 = _2538;
    if (_2444)
    {
        float _2542 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2298 = _2542;
    }
    float _2544 = _2298;
    if (_2444)
    {
        float _2546 = _2432 * _2536;
        _2456 = _2546;
    }
    float _2548 = _2456;
    if (!_2444)
    {
        _2466 = _2436;
    }
    float _2550 = _2466;
    float _2552 = _2550;
    if (_2444)
    {
        float _2554 = _2434 * _2536;
        _2526 = _2554;
    }
    float _2556 = _2526;
    if (_2444)
    {
        float _2558 = fma(_2504, _2498, _2544);
        _2540 = _2558;
    }
    float _2560 = _2540;
    if (_2444)
    {
        float _2562 = _2548 * _2548;
        _2552 = _2562;
    }
    float _2564 = _2552;
    if (!_2444)
    {
        _2532 = _2438;
    }
    float _2566 = _2532;
    float _2568 = _2566;
    if (_2444)
    {
        float _2570 = _2556 * _2556;
        _2568 = _2570;
    }
    float _2572 = _2568;
    float _2574 = fma(_2560, _2560, _2564);
    float _2576 = _2574 + _2572;
    float _2578 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2582 = fma(_2510, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2580);
    float _2584 = precise::clamp(_2582, 0.0, 1.0);
    float _2586 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2588 = rsqrt(_2576);
    float _2590 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2578);
    float _2592 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2594 = -_2584;
    float _2596 = _2594 + 1.0;
    float _2598 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2600 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2590);
    float _2602 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2592);
    float _2604 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2598);
    float _2606 = _2600 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2608 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2602);
    float _2610 = abs(_2596);
    float _2612 = log2(_2610);
    float _2614 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2604);
    float _2616 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2512);
    float _2618 = _2608 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2620 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2622 = _2588 * _2548;
    float _2624 = _2614 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2626 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2628 = _2588 * _2560;
    float _2630 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2632 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2616);
    float _2634 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2626);
    float _2636 = _2588 * _2556;
    float _2638 = -_2630;
    float _2640 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2638);
    float _2642 = _2632 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2644 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2634);
    float _2646 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2648 = -_2636;
    float _2650 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2640);
    float _2652 = -_2620;
    float _2654 = fma(_2652, _2586, 1.0);
    float _2656 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2644);
    float _2658 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2660 = fma(_2650, -0.5, 0.5);
    float _2662 = exp2(_2646);
    float _2664 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2666 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2658);
    float _2668 = fma(_2650, 0.5, 0.5);
    float _2670 = _2628 + 1.0;
    float _2672 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2664);
    float _2674 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2666);
    float _2676 = fma(_2668, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2678 = log2(_2654);
    float _2680 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2672);
    float _2682 = fma(_2668, _2676, -0.212114393711090087890625);
    float _2684 = fma(_2668, _2682, 1.570728778839111328125);
    float _2686 = 1.0 / _2656;
    float _2688 = -_2628;
    float _2690 = fma(_2662, _2670, _2688);
    float _2692 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2674);
    float _2694 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2680);
    float _2696 = fma(_2690, 0.5, 0.5);
    float _2698 = sqrt(_2660);
    float _2700 = _2678 * 0.693147182464599609375;
    float _2702 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2704 = _2692 * _2686;
    float _2706 = _2694 * _2686;
    float _2708 = fma(_2704, 0.5, 0.5);
    float _2710 = fma(_2706, -0.5, 0.5);
    float _2712 = _2698 * 0.636619746685028076171875;
    float _2714 = -_2684;
    float _2716 = fma(_2712, _2714, 1.0);
    float3 _7053 = float3(_2708, _2710, _2702);
    float _2718 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7053, float3(0.0), isnan(_7053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7053, float3(0.0), isnan(_7053)), level(0.0)).x;
    float3 _7064 = float3(_2708, _2710, _2702);
    float4 _2721 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7064, float3(0.0), isnan(_7064)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7064, float3(0.0), isnan(_7064)), level(0.0)).xyzw;
    float _2723 = _2721.x;
    float _2725 = _2721.y;
    float _2727 = _2721.z;
    float _2729 = _2721.w;
    float2 _7081 = float2(_2716, _2696);
    float3 _2733 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7081, float2(0.0), isnan(_7081)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7081, float2(0.0), isnan(_7081)), level(0.0)).xyz;
    float _2735 = _2733.x;
    float _2737 = _2733.y;
    float _2739 = _2733.z;
    float _2741 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2743 = _2618 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2745 = _2350 * _2408;
    bool _2747 = _2350 > 0.0;
    bool _2749 = isnan(_2350);
    bool _2751 = _2747 || _2749;
    bool _2753 = isnan(0.0);
    bool _2755 = _2751 || _2753;
    float _2757 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2743);
    float _2759 = exp2(_2741);
    float _2761 = _2745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2763 = _2408 <= 0.0;
    bool _2765 = !_2755;
    bool _2767 = _2763 || _2765;
    float _2769 = fma(_2606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2757);
    float _2771 = _2656 * 0.5;
    float _2773 = _380 * _2761;
    float _2775 = _2692 + _2656;
    float _2777 = fma(_2642, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2769);
    float _2779 = fma(_2694, -0.5, _2771);
    float _2781 = _2775 * 0.5;
    float _2783 = _2777 + _2656;
    out.gl_Position.x = _2692;
    out.gl_Position.y = _2694;
    out.gl_Position.z = _2777;
    out.gl_Position.w = _2656;
    float _2785 = _2773 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2787 = _2783 * 0.5;
    float _2789 = -_2759;
    float _2791 = _2789 + 1.0;
    out.m_47.x = _2785;
    float _2793 = _2791 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.x = _2781;
    out.m_77.y = _2779;
    out.m_77.z = _2787;
    out.m_77.w = _2656;
    float _2795 = -_2793;
    float _2797 = _2795 + 1.0;
    float _2799 = _2793 * _2718;
    float _2801 = _2729 * _2797;
    float _2803 = _2729 * _2799;
    float _2805 = _2739 * _2799;
    float _2807 = fma(_2735, _2803, _2723);
    float _2809 = fma(_2737, _2803, _2725);
    float _2811 = fma(_2729, _2805, _2727);
    out.m_79.x = _2807;
    out.m_79.y = _2809;
    out.m_79.z = _2811;
    out.m_79.w = _2801;
    if (!_2767)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2813 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2813;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

