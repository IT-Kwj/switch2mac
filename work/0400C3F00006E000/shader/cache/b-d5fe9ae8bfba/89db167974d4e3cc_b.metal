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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _414 = false;
    bool _174 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2049 = as_type<float>(_112);
        out.gl_Position.z = _2049;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_150);
        out.gl_Position.z = _2119;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _154 = !_152;
    float _172;
    if (!_154)
    {
        float _156 = in.m_49.x;
        float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _162 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _164 = _162 * _158;
        float _166 = floor(_164);
        float _168 = -_166;
        float _170 = _164 + _168;
        _172 = _170;
        _174 = true;
    }
    else
    {
        float _176 = float(_96);
        float _178 = 1.0 / _176;
        float _180 = _130 * _178;
        _172 = _180;
    }
    _174 = false;
    float _182 = _172;
    float _184 = in.m_49.x;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _188 = _182 + _186;
    bool _190 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _192 = isnan(_182);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _182 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _182 + _218;
    float _222 = 1.0 / _204;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = 1.0 / _216;
    float _228 = 1.0 / _212;
    float _230 = _188 * _222;
    bool _232 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = isnan(_182);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_200;
    float _246 = _244 + 1.0;
    float _248 = _242 * _246;
    float _250 = _208 * _226;
    bool _252 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_182);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_242;
    float _266 = _264 + 1.0;
    bool _268 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _270 = isnan(_182);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _288 = -_262;
    float _290 = _288 + 1.0;
    float _292 = _262 * _266;
    float _294 = _220 * _228;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _310 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = _278 * _290;
    float _314 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = fma(_282, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = -_278;
    float _320 = _318 + 1.0;
    float _322 = _310 * _312;
    float _324 = _308 * _184;
    float _326 = _314 * _312;
    float _328 = _316 * _312;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_286, _250, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].y, _326);
    float _340 = trunc(_324);
    int _342 = int(_340);
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].z, _328);
    float _346 = fma(_334, _292, _336);
    float _348 = fma(_306, _250, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _354;
    float _358 = fma(_332, _250, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _360;
    float _364 = fma(_348, _292, _338);
    float _366 = fma(_352, _230, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _368 = fma(_356, _230, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _370 = fma(_362, _230, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _372 = fma(_358, _292, _344);
    float _374 = fma(_366, _248, _346);
    float _376 = fma(_368, _248, _364);
    float _378 = fma(_370, _248, _372);
    float _380 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].x, _374);
    float _382 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].y, _376);
    int _384 = _342 << 4;
    int _386 = _384 + 1712;
    float _388 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].z, _378);
    bool _390 = !_224;
    bool _392 = _224;
    int _394 = as_type<int>(_250);
    float _396 = _378;
    float _412;
    if (!_390)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _184 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_96);
        float _418 = 1.0 / _416;
        float _420 = _130 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_49.w;
    float _426 = _184 * 2.0;
    float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _430 = log2(_428);
    float _432 = in.m_51.x;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _440 = _438 != 0;
    float _442 = in.m_49.z;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = in.m_51.y;
    float _454 = floor(_426);
    float _456 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _458 = in.m_49.y;
    int _460 = as_type<int>(_426);
    if (_436)
    {
        bool _462 = _184 > 0.5;
        _392 = _462;
    }
    bool _464 = _392;
    float _466 = _456 * _184;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _430 * _130;
    bool _474 = _424 > 0.5;
    float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _478 = in.m_42.x;
    float _480 = in.m_42.y;
    float _482 = in.m_42.z;
    float _484 = _432;
    if (_436)
    {
        float _486 = -_432;
        float _488 = _486 + 1.0;
        _460 = as_type<int>(_488);
    }
    int _490 = _460;
    if (_440)
    {
        float _492 = -_432;
        float _494 = _492 + 1.0;
        _394 = as_type<int>(_494);
    }
    int _496 = _394;
    if (!_436)
    {
        _396 = _432;
    }
    float _498 = _396;
    bool _500 = false;
    float _502 = _498;
    if (_440)
    {
        bool _504 = _442 > 0.5;
        _500 = _504;
    }
    bool _506 = _500;
    float _508 = 1.0 / _470;
    if (_436)
    {
        float _510 = _464 ? as_type<float>(_490) : _432;
        _502 = _510;
    }
    float _512 = _502;
    float _514 = -_452;
    float _516 = _514 + 1.0;
    float _518 = _452;
    if (_440)
    {
        float _520 = _506 ? as_type<float>(_496) : _432;
        _484 = _520;
    }
    float _522 = _484;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = _458 * 2.0;
    float _538 = trunc(_466);
    int _540 = int(_538);
    int _542 = _474 ? as_type<int>(_516) : as_type<int>(_452);
    bool _544 = _454 > 0.0;
    bool _546 = _454 >= 0.0;
    bool _548 = isnan(_454);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = exp2(_472);
    float _558 = _480 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _560 = _480 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _562 = _480 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _564;
    float _568 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
    float _570 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].x, _560);
    float _572 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
    float _574 = _458 + _442;
    float _576 = _566 * _508;
    float _578 = _446 ? as_type<float>(_542) : _452;
    float _580 = _574 + (-1.0);
    bool _582 = _458 > 0.5;
    float _584 = floor(_536);
    int _586 = _540 << 4;
    int _588 = _586 + 1968;
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _592 = _554 ? 0 : 1;
    float _594 = _442 * 2.0;
    if (_450)
    {
        float _596 = _582 ? _516 : _452;
        _518 = _596;
    }
    float _598 = _518;
    uint _601 = uint(int(uint(_588) >> uint(2)));
    uint _603 = uint(int(uint(int(_601)) >> uint(2)));
    int _605 = int(_601) & 3;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[int(_603)][_605];
    int _609 = int(_601) + 1;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    int _613 = _609 & 3;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[int(_611)][_613];
    int _617 = ~_592;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = _184 + _458;
    int _625 = _621;
    if (!_544)
    {
        int _627 = ~_592;
        int _629 = _627 + 1;
        _625 = _629;
    }
    int _631 = _625;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _635 = _422 + _633;
    bool _637 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _639 = isnan(_422);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_556;
    float _651 = _649 + 1.0;
    bool _653 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_422);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    int _665 = _588 + 8;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = floor(_594);
    float _677 = fma(_576, _635, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = _623 + (-1.0);
    bool _685 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _687 = isnan(1.0);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _693 = _689 || _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _697 = 1.0 + _695;
    float _699 = _647 * _681;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = 1.0 / _697;
    float _715 = _677 * _699;
    float _717 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[5].z, _570);
    int _719 = _386 + 8;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[int(_723)][_725];
    float _729 = _711 ? _651 : 0.0;
    float _731 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[6].z, _572);
    bool _733 = _675 > 0.0;
    float _735 = _717 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _737 = _675 >= 0.0;
    bool _739 = isnan(_675);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
    float _749 = -_647;
    float _751 = _749 + 1.0;
    uint _753 = uint(int(uint(_386) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[int(_763)][_765];
    int _769 = _745 ? 0 : 1;
    float _771 = _747 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _773 = _584 > 0.0;
    float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_693)
    {
        float _777 = _729 * _713;
        _132 = _777;
    }
    float _779 = _132;
    bool _781 = !_530;
    int _783 = _781 ? 0 : 1;
    float _785 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    int _787 = ~_769;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    float _793 = _731 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _795 = abs(_783);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _735 + _797;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _803 = _791;
    if (!_733)
    {
        int _805 = ~_769;
        int _807 = _805 + 1;
        _803 = _807;
    }
    int _809 = _803;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _813 = _771 + _811;
    bool _815 = _584 >= 0.0;
    bool _817 = isnan(_584);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = _799 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _827 = _607 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _829 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _831 = _823 ? 0 : 1;
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[28].x, _825);
    float _835 = float(_795);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _839 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _673 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _845 = float(_631);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _793 + _847;
    int _851 = ~_831;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _578 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _861 = _855;
    if (!_773)
    {
        int _863 = ~_831;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = _598 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _871 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _873 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].z, _833);
    out.m_53.x = _839;
    out.m_53.y = _841;
    out.m_53.z = _857;
    out.m_53.w = _837;
    float _875 = _835 * _845;
    float _877 = _859 * _476;
    float _879 = _869 * _775;
    float _881 = _871 * _801;
    float _883 = in.m_55.x;
    float _885 = in.m_55.y;
    float _887 = in.m_55.z;
    float _889 = _799 * _799;
    bool _891 = !_534;
    int _893 = _891 ? 0 : 1;
    float _895 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[116].x, _785);
    bool _897 = _873 >= 0.0;
    float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _901 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = fma(_813, _813, _889);
    int _905 = abs(_893);
    float _907 = _522 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _909 = !_526;
    int _911 = _909 ? 0 : 1;
    float _913 = fma(_849, _849, _903);
    float _915 = float(_809);
    float _917 = _895 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _919 = abs(_911);
    float _921 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _923 = float(_905);
    float _925 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _927 = float(_919);
    float _929 = _875 * (-2.0);
    float _931 = float(_867);
    float _933 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _927 * _915;
    float _939 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = rsqrt(_913);
    float _943 = _923 * _931;
    float _945 = _923;
    if (_897)
    {
        _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _947 = _945;
    float _949 = _907 * _899;
    float _951 = _937 * (-2.0);
    float _953 = fma(_929, _885, _885);
    int _955 = as_type<int>(_947);
    float _957 = _887;
    if (_897)
    {
        float _959 = _947 * 5.0;
        _955 = as_type<int>(_959);
    }
    int _961 = _955;
    out.m_57.x = _933;
    out.m_57.y = _935;
    out.m_57.z = _939;
    out.m_57.w = _917;
    float _963 = fma(_701, _951, _701);
    float _965 = fma(_951, _883, _883);
    float _967 = _458 + (-0.5);
    out.m_59.x = _881;
    out.m_59.y = _879;
    out.m_59.z = _949;
    out.m_59.w = _877;
    float _969 = fma(_590, _929, _590);
    if (_897)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3427 = as_type<float>(_961);
        out.gl_Position.z = _3427;
    }
    float _971 = _813 * _941;
    if (_897)
    {
        out.m_45.x = 0.0;
    }
    float _973 = _799 * _941;
    float _975 = _973;
    if (_897)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _977 = -_973;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _981 = _849 * _941;
    float _983 = -_971;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[196].y, _953);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _991 = _979 + _989;
    float _993 = -_981;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _999 = _985 + _997;
    float _1001 = fma(_969, _779, _987);
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _995 + _1005;
    float _1009 = _184 + (-0.5);
    float _1011 = -_973;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _799);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1003);
    float _1017 = _184 + _442;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[196].x, _965);
    float _1021 = _1001 * 0.15915493667125701904296875;
    float _1023 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1015);
    float _1025 = -_971;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _813);
    float _1029 = fma(_963, _779, _1019);
    float _1031 = _1017 + (-1.0);
    float _1033 = -_981;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    bool _1037 = _1023 >= 0.0;
    float _1039 = _1013 * _1013;
    float _1041 = _1021 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    float _1045 = _1029 * 0.15915493667125701904296875;
    float _1047 = fma(_1027, _1027, _1039);
    float _1049 = _943 * (-2.0);
    float _1051 = _442 + (-0.5);
    float _1053 = fma(_1035, _1035, _1047);
    float _1055 = _1021 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    float _1059 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1061 = fma(_1049, _887, _887);
    float _1063 = _999;
    float _1065 = _1007;
    if (_1037)
    {
        _957 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1067 = _957;
    int _1069 = as_type<int>(_1067);
    if (_1037)
    {
        out.m_45.x = 0.0;
    }
    float _1071 = fma(_1059, _1049, _1059);
    float _1073 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1061);
    float _1075 = _1045 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = in.m_61.x;
    float _1081 = in.m_61.y;
    float _1083 = in.m_61.z;
    if (_1037)
    {
        float _1085 = _1067 * 5.0;
        _1069 = as_type<int>(_1085);
    }
    int _1087 = _1069;
    float _1089 = fma(_1071, _779, _1073);
    float _1091 = _1045 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    if (_1037)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3643 = as_type<float>(_1087);
        out.gl_Position.z = _3643;
    }
    float _1095 = _1089 * 0.15915493667125701904296875;
    float _1097 = sqrt(_1053);
    if (_1037)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1099 = in.m_63.x;
    float _1101 = in.m_63.y;
    float _1103 = in.m_63.z;
    float _1105 = _1095 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    float _1109 = _382 * _1081;
    float _1111 = _380 * _1079;
    float _1113 = _941 * _1097;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1117 = _1093 * _1057;
    float _1119 = _1093 * _1043;
    float _1121 = _1095 * 6.283185482025146484375;
    float _1123 = sin(_1121);
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1127 = _388 * _1083;
    float _1129 = _1077 * _1043;
    float _1131 = _1077 * _1057;
    bool _1133 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1135 = isnan(0.5);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1141 = _1137 || _1139;
    float _1143 = _1093 * _1107;
    float _1145 = _1113 * _1115;
    float _1147 = _1077 * _1107;
    float _1149 = _1057 * _1107;
    float _1151 = _1113 * _1125;
    float _1153 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1155 = _1043 * _1107;
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1101);
    float _1159 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1099);
    float _1161 = fma(_1123, _1117, _1129);
    float _1163 = _1157 * _1145;
    float _1165 = _1113 * _1153;
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1103);
    float _1169 = _1159 * _1151;
    float _1171 = _1143 * _1163;
    float _1173 = -_1131;
    float _1175 = fma(_1123, _1119, _1173);
    float _1177 = _1167 * _1165;
    float _1179 = -_1163;
    float _1181 = _1123 * _1179;
    float _1183 = fma(_1161, _1169, _1171);
    float _1185 = -_1119;
    float _1187 = fma(_1123, _1131, _1185);
    float _1189 = _1147 * _1163;
    float _1191 = fma(_1149, _1169, _1181);
    float _1193 = fma(_1175, _1177, _1183);
    float _1195 = fma(_1123, _1129, _1117);
    float _1197 = fma(_1187, _1169, _1189);
    float _1199 = fma(_1155, _1177, _1191);
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1205 = fma(_1195, _1177, _1197);
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1209 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1201);
    float _1211 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1203);
    float _1213 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1207);
    float _1215 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1209);
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1211);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1221 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1227 = _793 + _1221;
    float _1229 = _771 + _1223;
    float _1231 = _735 + _1225;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1227 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1239 = _1229 + _1237;
    float _1241 = _1235 * _1235;
    float _1243 = fma(_1239, _1239, _1241);
    float _1245 = sqrt(_1243);
    bool _1247 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1249 = _1225;
    float _1251 = _1229;
    float _1253 = _1227;
    float _1255 = _1207;
    if (!_1247)
    {
        _1249 = _1229;
    }
    float _1257 = _1249;
    float _1259 = _1257;
    if (!_1247)
    {
        _1251 = _1227;
    }
    float _1261 = _1251;
    float _1263 = _1261;
    if (!_1247)
    {
        _1253 = _1231;
    }
    float _1265 = _1253;
    bool _1267 = !_1247;
    float _1269 = _1265;
    if (!_1267)
    {
        float _1271 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1275 = _1245 + _1273;
        float _1277 = rsqrt(_1243);
        float _1279 = _1275 * _1271;
        float _1281 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = _1279 * 0.15915493667125701904296875;
        float _1285 = _1283 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = _1283 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1287 + (-1.0);
        float _1295 = fma(_1291, _1281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1297 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = _1277 * _1295;
        float _1301 = fma(_1231, _1287, _1297);
        float _1303 = fma(_1239, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1305 = fma(_1235, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1259 = _1303;
        _1269 = _1301;
        _1263 = _1305;
    }
    float _1307 = _1259;
    float _1309 = _1269;
    float _1311 = _1263;
    float _1313 = -_971;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1317 = -_973;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1321 = -_981;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1311);
    float _1325 = _1319;
    float _1327 = _1323;
    float _1329 = _1307;
    if (_1141)
    {
        _975 = _1315;
    }
    float _1331 = _975;
    float _1333 = _1331;
    if (!_1141)
    {
        float _1335 = _991 * _991;
        float _1337 = 1.0 / _1113;
        float _1339 = -_793;
        float _1341 = _1339 + _1311;
        float _1343 = fma(_999, _999, _1335);
        float _1345 = fma(_1007, _1007, _1343);
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1349 = -_735;
        float _1351 = _1349 + _1309;
        float _1353 = sqrt(_1345);
        float _1355 = precise::min(_1353, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1347;
        float _1359 = -_771;
        float _1361 = _1359 + _1307;
        float _1363 = _1357 * _1337;
        float _1365 = fma(_1361, _1363, _985);
        float _1367 = fma(_1351, _1363, _979);
        float _1369 = fma(_1341, _1363, _995);
        _1325 = _1367;
        _1333 = _1365;
        _1327 = _1369;
        _1063 = _1353;
        _1065 = _1351;
    }
    float _1371 = _1325;
    float _1373 = _1333;
    float _1375 = _1327;
    float _1377 = _1063;
    float _1379 = _1065;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1383 = _1371 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1387 = _1373 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = _1375 + _1389;
    float _1393 = _1383 * _1383;
    float _1395 = fma(_1387, _1387, _1393);
    float _1397 = fma(_1391, _1391, _1395);
    float _1399 = rsqrt(_1397);
    float _1401 = sqrt(_1397);
    float _1403 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1405 = _1387 * _1403;
    float _1407 = _1391 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 * _1407;
    float _1413 = _1409 + _1411;
    float _1415 = sqrt(_1413);
    bool _1417 = _1415 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1421 = _1415 + _1419;
    float _1423 = _1399;
    float _1425 = _1413;
    float _1427 = _1421;
    float _1429 = _1377;
    float _1431 = _1383;
    float _1433 = _1379;
    if (_1417)
    {
        float _1435 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1423 = _1435;
    }
    float _1437 = _1423;
    if (_1417)
    {
        float _1439 = rsqrt(_1413);
        _1425 = _1439;
    }
    float _1441 = _1425;
    float _1443 = _1441;
    if (_1417)
    {
        float _1445 = _1421 * _1437;
        _1427 = _1445;
    }
    float _1447 = _1427;
    if (_1417)
    {
        float _1449 = _1447 * 0.15915493667125701904296875;
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = _1391;
    if (_1417)
    {
        float _1455 = _1451 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        _1453 = _1457;
    }
    float _1459 = _1453;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1463 = precise::max(0.0, _1461);
    float _1465 = _1437;
    float _1467 = _1463;
    if (_1417)
    {
        float _1469 = _1451 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        _1465 = _1471;
    }
    float _1473 = _1465;
    float _1475 = -_1403;
    float _1477 = -_1463;
    float _1479 = fma(_1383, _1475, _1477);
    if (_1417)
    {
        float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1431 = _1481;
    }
    float _1483 = _1431;
    float _1485 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1487 = _1483;
    float _1489 = _1459;
    if (_1417)
    {
        float _1491 = fma(_1459, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1487 = _1491;
    }
    float _1493 = _1487;
    float _1495 = _1493;
    if (!_1417)
    {
        _1489 = _1405;
    }
    float _1497 = _1489;
    float _1499 = _1497;
    float _1501 = _1473;
    if (_1417)
    {
        float _1503 = _1473 + (-1.0);
        _1467 = _1503;
    }
    float _1505 = _1467;
    float _1507 = _1505;
    if (_1417)
    {
        float _1509 = _1441 * _1493;
        _1329 = _1509;
    }
    float _1511 = _1329;
    if (!_1417)
    {
        _1495 = _1479;
    }
    float _1513 = _1495;
    float _1515 = _1513;
    if (_1417)
    {
        float _1517 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1517;
    }
    float _1519 = _1433;
    if (_1417)
    {
        float _1521 = _1405 * _1511;
        _1499 = _1521;
    }
    float _1523 = _1499;
    if (!_1417)
    {
        _1507 = _1407;
    }
    float _1525 = _1507;
    float _1527 = _1525;
    if (_1417)
    {
        float _1529 = _1407 * _1511;
        _1527 = _1529;
    }
    float _1531 = _1527;
    if (!_1417)
    {
        _1443 = _1409;
    }
    float _1533 = _1443;
    float _1535 = _1533;
    if (_1417)
    {
        float _1537 = fma(_1479, _1473, _1519);
        _1515 = _1537;
    }
    float _1539 = _1515;
    if (_1417)
    {
        float _1541 = _1523 * _1523;
        _1535 = _1541;
    }
    float _1543 = _1535;
    if (!_1417)
    {
        _1501 = _1411;
    }
    float _1545 = _1501;
    float _1547 = _1545;
    if (_1417)
    {
        float _1549 = _1531 * _1531;
        _1547 = _1549;
    }
    float _1551 = _1547;
    float _1553 = fma(_1539, _1539, _1543);
    float _1555 = _1553 + _1551;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1559 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1557);
    float _1561 = precise::clamp(_1559, 0.0, 1.0);
    float _1563 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1485);
    float _1565 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1567 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1569 = -_1561;
    float _1571 = _1569 + 1.0;
    float _1573 = rsqrt(_1555);
    float _1575 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1577 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1579 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1565);
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1585 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1577);
    float _1587 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1589 = abs(_1571);
    float _1591 = log2(_1589);
    float _1593 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1595 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1587);
    float _1599 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1601 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1603 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1605 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1607 = _1573 * _1523;
    float _1609 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1611 = _1573 * _1539;
    float _1613 = _1573 * _1531;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1617 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1609);
    float _1619 = -_1599;
    float _1621 = fma(_1619, _1567, 1.0);
    float _1623 = -_1615;
    float _1625 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1623);
    float _1627 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1629 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1631 = log2(_1621);
    float _1633 = -_1613;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1625);
    float _1637 = _1611 + 1.0;
    float _1639 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1629);
    float _1641 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1643 = fma(_1635, -0.5, 0.5);
    float _1645 = fma(_1635, 0.5, 0.5);
    float _1647 = exp2(_1627);
    float _1649 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1651 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1641);
    float _1653 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1649);
    float _1655 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1657 = 1.0 / _1639;
    float _1659 = fma(_1645, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1661 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1653);
    float _1663 = _1631 * 0.693147182464599609375;
    float _1665 = fma(_1645, _1659, -0.212114393711090087890625);
    float _1667 = sqrt(_1643);
    float _1669 = -_1611;
    float _1671 = fma(_1647, _1637, _1669);
    float _1673 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1655);
    float _1675 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1661);
    float _1677 = fma(_1645, _1665, 1.570728778839111328125);
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1681 = fma(_1671, 0.5, 0.5);
    float _1683 = _1673 * _1657;
    float _1685 = _1675 * _1657;
    float _1687 = fma(_1683, 0.5, 0.5);
    float _1689 = fma(_1685, -0.5, 0.5);
    float _1691 = _1667 * 0.636619746685028076171875;
    float3 _4618 = float3(_1687, _1689, _1679);
    float _1693 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).x;
    float _1695 = -_1677;
    float _1697 = fma(_1691, _1695, 1.0);
    float3 _4634 = float3(_1687, _1689, _1679);
    float4 _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4634, float3(0.0), isnan(_4634)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4634, float3(0.0), isnan(_4634)), level(0.0)).xyzw;
    float _1702 = _1700.x;
    float _1704 = _1700.y;
    float _1706 = _1700.z;
    float _1708 = _1700.w;
    float2 _4651 = float2(_1697, _1681);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4651, float2(0.0), isnan(_4651)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4651, float2(0.0), isnan(_4651)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1722 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1724 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1726 = _1101 != 0.0;
    bool _1728 = isnan(_1101);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1720);
    float _1738 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1722);
    float _1740 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1742 = in.m_65.x;
    float _1744 = in.m_65.y;
    float _1746 = in.m_65.z;
    bool _1748 = _1099 == 0.0;
    bool _1750 = !_1734;
    bool _1752 = _1748 && _1750;
    float _1754 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1736);
    float _1756 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1738);
    float _1758 = in.m_67.x;
    float _1760 = in.m_67.y;
    float _1762 = in.m_67.z;
    float _1764 = in.m_67.w;
    bool _1766 = _1103 == 0.0;
    bool _1768 = _1766 && _1752;
    float _1770 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1740);
    float _1772 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1774 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1776 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1778 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1780 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1782 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1784 = -_1123;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1772);
    float _1788 = -_1123;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1774);
    float _1792 = -_1123;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1776);
    float _1796 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1778);
    float _1798 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1780);
    float _1800 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1782);
    float _1802 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1786);
    float _1804 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1790);
    float _1806 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1794);
    float _1808 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1796);
    float _1810 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1812 = _1778;
    float _1814 = _1796;
    float _1816 = _1782;
    float _1818 = _1790;
    float _1820 = _1798;
    if (_1768)
    {
        _1812 = _1742;
    }
    float _1822 = _1812;
    float _1824 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1798);
    float _1826 = _1822;
    if (_1768)
    {
        _1255 = _1744;
    }
    float _1828 = _1255;
    float _1830 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1800);
    float _1832 = _1828;
    if (_1768)
    {
        _1814 = _1822;
    }
    float _1834 = _1814;
    float _1836 = _1806 * _1760;
    float _1838 = _1834;
    if (!_1768)
    {
        _1826 = _1742;
    }
    float _1840 = _1826;
    float _1842 = exp2(_1810);
    if (_1768)
    {
        _1816 = _1746;
    }
    float _1844 = _1816;
    float _1846 = fma(_1770, _1758, _1836);
    float _1848 = _1844;
    if (_1768)
    {
        _1818 = _1828;
    }
    float _1850 = _1818;
    float _1852 = _1850;
    if (!_1768)
    {
        float _1854 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1840);
        _1838 = _1854;
    }
    float _1856 = _1838;
    if (!_1768)
    {
        _1832 = _1744;
    }
    float _1858 = _1832;
    float _1860 = _1802 * _1760;
    if (_1768)
    {
        _1820 = _1844;
    }
    float _1862 = _1820;
    float _1864 = _1762 * _1840;
    float _1866 = _1862;
    if (!_1768)
    {
        _1848 = _1746;
    }
    float _1868 = _1848;
    float _1870 = _1804 * _1760;
    float _1872 = fma(_1754, _1758, _1860);
    float _1874 = _1758 * _1858;
    if (!_1768)
    {
        float _1876 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1858);
        _1852 = _1876;
    }
    float _1878 = _1852;
    float _1880 = fma(_1756, _1758, _1870);
    float _1882 = -_1864;
    float _1884 = fma(_1758, _1868, _1882);
    float _1886 = -_1874;
    float _1888 = fma(_1760, _1840, _1886);
    float _1890 = _1760 * _1868;
    float _1892 = fma(_1808, _1762, _1880);
    if (!_1768)
    {
        float _1894 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1868);
        _1866 = _1894;
    }
    float _1896 = _1866;
    float _1898 = _1884 * _1764;
    float _1900 = fma(_1830, _1762, _1846);
    float _1902 = _1888 * _1764;
    float _1904 = _1804 * _1878;
    float _1906 = _1802 * _1878;
    float _1908 = _1806 * _1878;
    float _1910 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1912 = fma(_1756, _1856, _1904);
    float _1914 = fma(_1754, _1856, _1906);
    float _1916 = fma(_1770, _1856, _1908);
    float _1918 = fma(_1824, _1762, _1872);
    float _1920 = -_1890;
    float _1922 = fma(_1762, _1858, _1920);
    float _1924 = -_1842;
    float _1926 = _1924 + 1.0;
    float _1928 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1910);
    float _1930 = fma(_1808, _1896, _1912);
    float _1932 = fma(_1824, _1896, _1914);
    float _1934 = fma(_1830, _1896, _1916);
    float _1936 = _1922 * _1764;
    float _1938 = _1898 * _1806;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1942 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1928);
    out.m_69.x = _1918;
    out.m_69.y = _1892;
    out.m_69.z = _1900;
    float _1944 = _1898 * _1804;
    out.m_71.x = _1932;
    out.m_71.y = _1930;
    out.m_71.z = _1934;
    float _1946 = fma(_1936, _1756, _1944);
    float _1948 = _1898 * _1802;
    float _1950 = fma(_1936, _1770, _1938);
    float _1952 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1942);
    float _1954 = _1639 * 0.5;
    float _1956 = fma(_1936, _1754, _1948);
    float _1958 = fma(_1902, _1830, _1950);
    float _1960 = fma(_1675, -0.5, _1954);
    float _1962 = _1952 + _1639;
    float _1964 = _1673 + _1639;
    float _1966 = -_1940;
    float _1968 = _1966 + 1.0;
    float _1970 = fma(_1902, _1824, _1956);
    float _1972 = fma(_1902, _1808, _1946);
    float _1974 = _1962 * 0.5;
    float _1976 = _1964 * 0.5;
    float _1978 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _1952;
    out.gl_Position.w = _1639;
    out.m_73.x = _1970;
    out.m_73.y = _1972;
    out.m_73.z = _1958;
    out.m_75.x = _1976;
    out.m_75.y = _1960;
    out.m_75.z = _1974;
    out.m_75.w = _1639;
    out.m_45.x = _1978;
    float _1980 = _1940 * _1693;
    float _1982 = _1708 * _1980;
    float _1984 = _1708 * _1968;
    float _1986 = _1718 * _1980;
    float _1988 = fma(_1714, _1982, _1702);
    float _1990 = fma(_1716, _1982, _1704);
    float _1992 = fma(_1708, _1986, _1706);
    out.m_77.x = _1988;
    out.m_77.y = _1990;
    out.m_77.z = _1992;
    out.m_77.w = _1984;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _414 = false;
    bool _174 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2049 = as_type<float>(_112);
        out.gl_Position.z = _2049;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_150);
        out.gl_Position.z = _2119;
    }
    if (_142)
    {
        return out;
    }
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _154 = !_152;
    float _172;
    if (!_154)
    {
        float _156 = in.m_49.x;
        float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _162 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _164 = _162 * _158;
        float _166 = floor(_164);
        float _168 = -_166;
        float _170 = _164 + _168;
        _172 = _170;
        _174 = true;
    }
    else
    {
        float _176 = float(_96);
        float _178 = 1.0 / _176;
        float _180 = _130 * _178;
        _172 = _180;
    }
    _174 = false;
    float _182 = _172;
    float _184 = in.m_49.x;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _188 = _182 + _186;
    bool _190 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _192 = isnan(_182);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _182 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _182 + _218;
    float _222 = 1.0 / _204;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = 1.0 / _216;
    float _228 = 1.0 / _212;
    float _230 = _188 * _222;
    bool _232 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = isnan(_182);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_200;
    float _246 = _244 + 1.0;
    float _248 = _242 * _246;
    float _250 = _208 * _226;
    bool _252 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_182);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_242;
    float _266 = _264 + 1.0;
    bool _268 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _270 = isnan(_182);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _288 = -_262;
    float _290 = _288 + 1.0;
    float _292 = _262 * _266;
    float _294 = _220 * _228;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _310 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = _278 * _290;
    float _314 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = fma(_282, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = -_278;
    float _320 = _318 + 1.0;
    float _322 = _310 * _312;
    float _324 = _308 * _184;
    float _326 = _314 * _312;
    float _328 = _316 * _312;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_286, _250, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].y, _326);
    float _340 = trunc(_324);
    int _342 = int(_340);
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].z, _328);
    float _346 = fma(_334, _292, _336);
    float _348 = fma(_306, _250, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _354;
    float _358 = fma(_332, _250, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _360;
    float _364 = fma(_348, _292, _338);
    float _366 = fma(_352, _230, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _368 = fma(_356, _230, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _370 = fma(_362, _230, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _372 = fma(_358, _292, _344);
    float _374 = fma(_366, _248, _346);
    float _376 = fma(_368, _248, _364);
    float _378 = fma(_370, _248, _372);
    float _380 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].x, _374);
    float _382 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].y, _376);
    int _384 = _342 << 4;
    int _386 = _384 + 1712;
    float _388 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].z, _378);
    bool _390 = !_224;
    bool _392 = _224;
    int _394 = as_type<int>(_250);
    float _396 = _378;
    float _412;
    if (!_390)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _184 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_96);
        float _418 = 1.0 / _416;
        float _420 = _130 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_49.w;
    float _426 = _184 * 2.0;
    float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _430 = log2(_428);
    float _432 = in.m_51.x;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _440 = _438 != 0;
    float _442 = in.m_49.z;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = in.m_51.y;
    float _454 = floor(_426);
    float _456 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _458 = in.m_49.y;
    int _460 = as_type<int>(_426);
    if (_436)
    {
        bool _462 = _184 > 0.5;
        _392 = _462;
    }
    bool _464 = _392;
    float _466 = _456 * _184;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _430 * _130;
    bool _474 = _424 > 0.5;
    float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _478 = in.m_42.x;
    float _480 = in.m_42.y;
    float _482 = in.m_42.z;
    float _484 = _432;
    if (_436)
    {
        float _486 = -_432;
        float _488 = _486 + 1.0;
        _460 = as_type<int>(_488);
    }
    int _490 = _460;
    if (_440)
    {
        float _492 = -_432;
        float _494 = _492 + 1.0;
        _394 = as_type<int>(_494);
    }
    int _496 = _394;
    if (!_436)
    {
        _396 = _432;
    }
    float _498 = _396;
    bool _500 = false;
    float _502 = _498;
    if (_440)
    {
        bool _504 = _442 > 0.5;
        _500 = _504;
    }
    bool _506 = _500;
    float _508 = 1.0 / _470;
    if (_436)
    {
        float _510 = _464 ? as_type<float>(_490) : _432;
        _502 = _510;
    }
    float _512 = _502;
    float _514 = -_452;
    float _516 = _514 + 1.0;
    float _518 = _452;
    if (_440)
    {
        float _520 = _506 ? as_type<float>(_496) : _432;
        _484 = _520;
    }
    float _522 = _484;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = _458 * 2.0;
    float _538 = trunc(_466);
    int _540 = int(_538);
    int _542 = _474 ? as_type<int>(_516) : as_type<int>(_452);
    bool _544 = _454 > 0.0;
    bool _546 = _454 >= 0.0;
    bool _548 = isnan(_454);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = exp2(_472);
    float _558 = _480 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _560 = _480 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _562 = _480 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _564;
    float _568 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
    float _570 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].x, _560);
    float _572 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
    float _574 = _458 + _442;
    float _576 = _566 * _508;
    float _578 = _446 ? as_type<float>(_542) : _452;
    float _580 = _574 + (-1.0);
    bool _582 = _458 > 0.5;
    float _584 = floor(_536);
    int _586 = _540 << 4;
    int _588 = _586 + 1968;
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _592 = _554 ? 0 : 1;
    float _594 = _442 * 2.0;
    if (_450)
    {
        float _596 = _582 ? _516 : _452;
        _518 = _596;
    }
    float _598 = _518;
    uint _601 = uint(int(uint(_588) >> uint(2)));
    uint _603 = uint(int(uint(int(_601)) >> uint(2)));
    int _605 = int(_601) & 3;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[int(_603)][_605];
    int _609 = int(_601) + 1;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    int _613 = _609 & 3;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[int(_611)][_613];
    int _617 = ~_592;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = _184 + _458;
    int _625 = _621;
    if (!_544)
    {
        int _627 = ~_592;
        int _629 = _627 + 1;
        _625 = _629;
    }
    int _631 = _625;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _635 = _422 + _633;
    bool _637 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _639 = isnan(_422);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_556;
    float _651 = _649 + 1.0;
    bool _653 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_422);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    int _665 = _588 + 8;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = floor(_594);
    float _677 = fma(_576, _635, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = _623 + (-1.0);
    bool _685 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _687 = isnan(1.0);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _693 = _689 || _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _697 = 1.0 + _695;
    float _699 = _647 * _681;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = 1.0 / _697;
    float _715 = _677 * _699;
    float _717 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[5].z, _570);
    int _719 = _386 + 8;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[int(_723)][_725];
    float _729 = _711 ? _651 : 0.0;
    float _731 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[6].z, _572);
    bool _733 = _675 > 0.0;
    float _735 = _717 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _737 = _675 >= 0.0;
    bool _739 = isnan(_675);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
    float _749 = -_647;
    float _751 = _749 + 1.0;
    uint _753 = uint(int(uint(_386) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[int(_763)][_765];
    int _769 = _745 ? 0 : 1;
    float _771 = _747 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _773 = _584 > 0.0;
    float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_693)
    {
        float _777 = _729 * _713;
        _132 = _777;
    }
    float _779 = _132;
    bool _781 = !_530;
    int _783 = _781 ? 0 : 1;
    float _785 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    int _787 = ~_769;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    float _793 = _731 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _795 = abs(_783);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _735 + _797;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _803 = _791;
    if (!_733)
    {
        int _805 = ~_769;
        int _807 = _805 + 1;
        _803 = _807;
    }
    int _809 = _803;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _813 = _771 + _811;
    bool _815 = _584 >= 0.0;
    bool _817 = isnan(_584);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = _799 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _827 = _607 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _829 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _831 = _823 ? 0 : 1;
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[28].x, _825);
    float _835 = float(_795);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _839 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _673 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _845 = float(_631);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _793 + _847;
    int _851 = ~_831;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _578 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _861 = _855;
    if (!_773)
    {
        int _863 = ~_831;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = _598 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _871 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _873 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].z, _833);
    out.m_53.x = _839;
    out.m_53.y = _841;
    out.m_53.z = _857;
    out.m_53.w = _837;
    float _875 = _835 * _845;
    float _877 = _859 * _476;
    float _879 = _869 * _775;
    float _881 = _871 * _801;
    float _883 = in.m_55.x;
    float _885 = in.m_55.y;
    float _887 = in.m_55.z;
    float _889 = _799 * _799;
    bool _891 = !_534;
    int _893 = _891 ? 0 : 1;
    float _895 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[116].x, _785);
    bool _897 = _873 >= 0.0;
    float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _901 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = fma(_813, _813, _889);
    int _905 = abs(_893);
    float _907 = _522 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _909 = !_526;
    int _911 = _909 ? 0 : 1;
    float _913 = fma(_849, _849, _903);
    float _915 = float(_809);
    float _917 = _895 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _919 = abs(_911);
    float _921 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _923 = float(_905);
    float _925 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _927 = float(_919);
    float _929 = _875 * (-2.0);
    float _931 = float(_867);
    float _933 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _927 * _915;
    float _939 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = rsqrt(_913);
    float _943 = _923 * _931;
    float _945 = _923;
    if (_897)
    {
        _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _947 = _945;
    float _949 = _907 * _899;
    float _951 = _937 * (-2.0);
    float _953 = fma(_929, _885, _885);
    int _955 = as_type<int>(_947);
    float _957 = _887;
    if (_897)
    {
        float _959 = _947 * 5.0;
        _955 = as_type<int>(_959);
    }
    int _961 = _955;
    out.m_57.x = _933;
    out.m_57.y = _935;
    out.m_57.z = _939;
    out.m_57.w = _917;
    float _963 = fma(_701, _951, _701);
    float _965 = fma(_951, _883, _883);
    float _967 = _458 + (-0.5);
    out.m_59.x = _881;
    out.m_59.y = _879;
    out.m_59.z = _949;
    out.m_59.w = _877;
    float _969 = fma(_590, _929, _590);
    if (_897)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3427 = as_type<float>(_961);
        out.gl_Position.z = _3427;
    }
    float _971 = _813 * _941;
    if (_897)
    {
        out.m_45.x = 0.0;
    }
    float _973 = _799 * _941;
    float _975 = _973;
    if (_897)
    {
        return out;
    }
    float _977 = -_973;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _981 = _849 * _941;
    float _983 = -_971;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[196].y, _953);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _991 = _979 + _989;
    float _993 = -_981;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _999 = _985 + _997;
    float _1001 = fma(_969, _779, _987);
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _995 + _1005;
    float _1009 = _184 + (-0.5);
    float _1011 = -_973;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _799);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1003);
    float _1017 = _184 + _442;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[196].x, _965);
    float _1021 = _1001 * 0.15915493667125701904296875;
    float _1023 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1015);
    float _1025 = -_971;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _813);
    float _1029 = fma(_963, _779, _1019);
    float _1031 = _1017 + (-1.0);
    float _1033 = -_981;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    bool _1037 = _1023 >= 0.0;
    float _1039 = _1013 * _1013;
    float _1041 = _1021 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    float _1045 = _1029 * 0.15915493667125701904296875;
    float _1047 = fma(_1027, _1027, _1039);
    float _1049 = _943 * (-2.0);
    float _1051 = _442 + (-0.5);
    float _1053 = fma(_1035, _1035, _1047);
    float _1055 = _1021 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    float _1059 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1061 = fma(_1049, _887, _887);
    float _1063 = _999;
    float _1065 = _1007;
    if (_1037)
    {
        _957 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1067 = _957;
    int _1069 = as_type<int>(_1067);
    if (_1037)
    {
        out.m_45.x = 0.0;
    }
    float _1071 = fma(_1059, _1049, _1059);
    float _1073 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1061);
    float _1075 = _1045 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = in.m_61.x;
    float _1081 = in.m_61.y;
    float _1083 = in.m_61.z;
    if (_1037)
    {
        float _1085 = _1067 * 5.0;
        _1069 = as_type<int>(_1085);
    }
    int _1087 = _1069;
    float _1089 = fma(_1071, _779, _1073);
    float _1091 = _1045 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    if (_1037)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3643 = as_type<float>(_1087);
        out.gl_Position.z = _3643;
    }
    float _1095 = _1089 * 0.15915493667125701904296875;
    float _1097 = sqrt(_1053);
    if (_1037)
    {
        return out;
    }
    float _1099 = in.m_63.x;
    float _1101 = in.m_63.y;
    float _1103 = in.m_63.z;
    float _1105 = _1095 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    float _1109 = _382 * _1081;
    float _1111 = _380 * _1079;
    float _1113 = _941 * _1097;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1117 = _1093 * _1057;
    float _1119 = _1093 * _1043;
    float _1121 = _1095 * 6.283185482025146484375;
    float _1123 = sin(_1121);
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1127 = _388 * _1083;
    float _1129 = _1077 * _1043;
    float _1131 = _1077 * _1057;
    bool _1133 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1135 = isnan(0.5);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1141 = _1137 || _1139;
    float _1143 = _1093 * _1107;
    float _1145 = _1113 * _1115;
    float _1147 = _1077 * _1107;
    float _1149 = _1057 * _1107;
    float _1151 = _1113 * _1125;
    float _1153 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1155 = _1043 * _1107;
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1101);
    float _1159 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1099);
    float _1161 = fma(_1123, _1117, _1129);
    float _1163 = _1157 * _1145;
    float _1165 = _1113 * _1153;
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1103);
    float _1169 = _1159 * _1151;
    float _1171 = _1143 * _1163;
    float _1173 = -_1131;
    float _1175 = fma(_1123, _1119, _1173);
    float _1177 = _1167 * _1165;
    float _1179 = -_1163;
    float _1181 = _1123 * _1179;
    float _1183 = fma(_1161, _1169, _1171);
    float _1185 = -_1119;
    float _1187 = fma(_1123, _1131, _1185);
    float _1189 = _1147 * _1163;
    float _1191 = fma(_1149, _1169, _1181);
    float _1193 = fma(_1175, _1177, _1183);
    float _1195 = fma(_1123, _1129, _1117);
    float _1197 = fma(_1187, _1169, _1189);
    float _1199 = fma(_1155, _1177, _1191);
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1205 = fma(_1195, _1177, _1197);
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1209 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1201);
    float _1211 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1203);
    float _1213 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1207);
    float _1215 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1209);
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1211);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1221 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1227 = _793 + _1221;
    float _1229 = _771 + _1223;
    float _1231 = _735 + _1225;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1227 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1239 = _1229 + _1237;
    float _1241 = _1235 * _1235;
    float _1243 = fma(_1239, _1239, _1241);
    float _1245 = sqrt(_1243);
    bool _1247 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1249 = _1225;
    float _1251 = _1229;
    float _1253 = _1227;
    float _1255 = _1207;
    if (!_1247)
    {
        _1249 = _1229;
    }
    float _1257 = _1249;
    float _1259 = _1257;
    if (!_1247)
    {
        _1251 = _1227;
    }
    float _1261 = _1251;
    float _1263 = _1261;
    if (!_1247)
    {
        _1253 = _1231;
    }
    float _1265 = _1253;
    bool _1267 = !_1247;
    float _1269 = _1265;
    if (!_1267)
    {
        float _1271 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1275 = _1245 + _1273;
        float _1277 = rsqrt(_1243);
        float _1279 = _1275 * _1271;
        float _1281 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = _1279 * 0.15915493667125701904296875;
        float _1285 = _1283 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = _1283 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1287 + (-1.0);
        float _1295 = fma(_1291, _1281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1297 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = _1277 * _1295;
        float _1301 = fma(_1231, _1287, _1297);
        float _1303 = fma(_1239, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1305 = fma(_1235, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1259 = _1303;
        _1269 = _1301;
        _1263 = _1305;
    }
    float _1307 = _1259;
    float _1309 = _1269;
    float _1311 = _1263;
    float _1313 = -_971;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1317 = -_973;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1321 = -_981;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1311);
    float _1325 = _1319;
    float _1327 = _1323;
    float _1329 = _1307;
    if (_1141)
    {
        _975 = _1315;
    }
    float _1331 = _975;
    float _1333 = _1331;
    if (!_1141)
    {
        float _1335 = _991 * _991;
        float _1337 = 1.0 / _1113;
        float _1339 = -_793;
        float _1341 = _1339 + _1311;
        float _1343 = fma(_999, _999, _1335);
        float _1345 = fma(_1007, _1007, _1343);
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1349 = -_735;
        float _1351 = _1349 + _1309;
        float _1353 = sqrt(_1345);
        float _1355 = precise::min(_1353, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1347;
        float _1359 = -_771;
        float _1361 = _1359 + _1307;
        float _1363 = _1357 * _1337;
        float _1365 = fma(_1361, _1363, _985);
        float _1367 = fma(_1351, _1363, _979);
        float _1369 = fma(_1341, _1363, _995);
        _1325 = _1367;
        _1333 = _1365;
        _1327 = _1369;
        _1063 = _1353;
        _1065 = _1351;
    }
    float _1371 = _1325;
    float _1373 = _1333;
    float _1375 = _1327;
    float _1377 = _1063;
    float _1379 = _1065;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1383 = _1371 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1387 = _1373 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = _1375 + _1389;
    float _1393 = _1383 * _1383;
    float _1395 = fma(_1387, _1387, _1393);
    float _1397 = fma(_1391, _1391, _1395);
    float _1399 = rsqrt(_1397);
    float _1401 = sqrt(_1397);
    float _1403 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1405 = _1387 * _1403;
    float _1407 = _1391 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 * _1407;
    float _1413 = _1409 + _1411;
    float _1415 = sqrt(_1413);
    bool _1417 = _1415 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1421 = _1415 + _1419;
    float _1423 = _1399;
    float _1425 = _1413;
    float _1427 = _1421;
    float _1429 = _1377;
    float _1431 = _1383;
    float _1433 = _1379;
    if (_1417)
    {
        float _1435 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1423 = _1435;
    }
    float _1437 = _1423;
    if (_1417)
    {
        float _1439 = rsqrt(_1413);
        _1425 = _1439;
    }
    float _1441 = _1425;
    float _1443 = _1441;
    if (_1417)
    {
        float _1445 = _1421 * _1437;
        _1427 = _1445;
    }
    float _1447 = _1427;
    if (_1417)
    {
        float _1449 = _1447 * 0.15915493667125701904296875;
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = _1391;
    if (_1417)
    {
        float _1455 = _1451 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        _1453 = _1457;
    }
    float _1459 = _1453;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1463 = precise::max(0.0, _1461);
    float _1465 = _1437;
    float _1467 = _1463;
    if (_1417)
    {
        float _1469 = _1451 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        _1465 = _1471;
    }
    float _1473 = _1465;
    float _1475 = -_1403;
    float _1477 = -_1463;
    float _1479 = fma(_1383, _1475, _1477);
    if (_1417)
    {
        float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1431 = _1481;
    }
    float _1483 = _1431;
    float _1485 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1487 = _1483;
    float _1489 = _1459;
    if (_1417)
    {
        float _1491 = fma(_1459, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1487 = _1491;
    }
    float _1493 = _1487;
    float _1495 = _1493;
    if (!_1417)
    {
        _1489 = _1405;
    }
    float _1497 = _1489;
    float _1499 = _1497;
    float _1501 = _1473;
    if (_1417)
    {
        float _1503 = _1473 + (-1.0);
        _1467 = _1503;
    }
    float _1505 = _1467;
    float _1507 = _1505;
    if (_1417)
    {
        float _1509 = _1441 * _1493;
        _1329 = _1509;
    }
    float _1511 = _1329;
    if (!_1417)
    {
        _1495 = _1479;
    }
    float _1513 = _1495;
    float _1515 = _1513;
    if (_1417)
    {
        float _1517 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1517;
    }
    float _1519 = _1433;
    if (_1417)
    {
        float _1521 = _1405 * _1511;
        _1499 = _1521;
    }
    float _1523 = _1499;
    if (!_1417)
    {
        _1507 = _1407;
    }
    float _1525 = _1507;
    float _1527 = _1525;
    if (_1417)
    {
        float _1529 = _1407 * _1511;
        _1527 = _1529;
    }
    float _1531 = _1527;
    if (!_1417)
    {
        _1443 = _1409;
    }
    float _1533 = _1443;
    float _1535 = _1533;
    if (_1417)
    {
        float _1537 = fma(_1479, _1473, _1519);
        _1515 = _1537;
    }
    float _1539 = _1515;
    if (_1417)
    {
        float _1541 = _1523 * _1523;
        _1535 = _1541;
    }
    float _1543 = _1535;
    if (!_1417)
    {
        _1501 = _1411;
    }
    float _1545 = _1501;
    float _1547 = _1545;
    if (_1417)
    {
        float _1549 = _1531 * _1531;
        _1547 = _1549;
    }
    float _1551 = _1547;
    float _1553 = fma(_1539, _1539, _1543);
    float _1555 = _1553 + _1551;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1559 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1557);
    float _1561 = precise::clamp(_1559, 0.0, 1.0);
    float _1563 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1485);
    float _1565 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1567 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1569 = -_1561;
    float _1571 = _1569 + 1.0;
    float _1573 = rsqrt(_1555);
    float _1575 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1577 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1579 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1565);
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1585 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1577);
    float _1587 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1589 = abs(_1571);
    float _1591 = log2(_1589);
    float _1593 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1595 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1587);
    float _1599 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1601 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1603 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1605 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1607 = _1573 * _1523;
    float _1609 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1611 = _1573 * _1539;
    float _1613 = _1573 * _1531;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1617 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1609);
    float _1619 = -_1599;
    float _1621 = fma(_1619, _1567, 1.0);
    float _1623 = -_1615;
    float _1625 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1623);
    float _1627 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1629 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1631 = log2(_1621);
    float _1633 = -_1613;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1625);
    float _1637 = _1611 + 1.0;
    float _1639 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1629);
    float _1641 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1643 = fma(_1635, -0.5, 0.5);
    float _1645 = fma(_1635, 0.5, 0.5);
    float _1647 = exp2(_1627);
    float _1649 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1651 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1641);
    float _1653 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1649);
    float _1655 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1657 = 1.0 / _1639;
    float _1659 = fma(_1645, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1661 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1653);
    float _1663 = _1631 * 0.693147182464599609375;
    float _1665 = fma(_1645, _1659, -0.212114393711090087890625);
    float _1667 = sqrt(_1643);
    float _1669 = -_1611;
    float _1671 = fma(_1647, _1637, _1669);
    float _1673 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1655);
    float _1675 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1661);
    float _1677 = fma(_1645, _1665, 1.570728778839111328125);
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1681 = fma(_1671, 0.5, 0.5);
    float _1683 = _1673 * _1657;
    float _1685 = _1675 * _1657;
    float _1687 = fma(_1683, 0.5, 0.5);
    float _1689 = fma(_1685, -0.5, 0.5);
    float _1691 = _1667 * 0.636619746685028076171875;
    float3 _4618 = float3(_1687, _1689, _1679);
    float _1693 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).x;
    float _1695 = -_1677;
    float _1697 = fma(_1691, _1695, 1.0);
    float3 _4634 = float3(_1687, _1689, _1679);
    float4 _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4634, float3(0.0), isnan(_4634)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4634, float3(0.0), isnan(_4634)), level(0.0)).xyzw;
    float _1702 = _1700.x;
    float _1704 = _1700.y;
    float _1706 = _1700.z;
    float _1708 = _1700.w;
    float2 _4651 = float2(_1697, _1681);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4651, float2(0.0), isnan(_4651)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4651, float2(0.0), isnan(_4651)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1722 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1724 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1726 = _1101 != 0.0;
    bool _1728 = isnan(_1101);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1720);
    float _1738 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1722);
    float _1740 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1742 = in.m_65.x;
    float _1744 = in.m_65.y;
    float _1746 = in.m_65.z;
    bool _1748 = _1099 == 0.0;
    bool _1750 = !_1734;
    bool _1752 = _1748 && _1750;
    float _1754 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1736);
    float _1756 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1738);
    float _1758 = in.m_67.x;
    float _1760 = in.m_67.y;
    float _1762 = in.m_67.z;
    float _1764 = in.m_67.w;
    bool _1766 = _1103 == 0.0;
    bool _1768 = _1766 && _1752;
    float _1770 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1740);
    float _1772 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1774 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1776 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1778 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1780 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1782 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1784 = -_1123;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1772);
    float _1788 = -_1123;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1774);
    float _1792 = -_1123;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1776);
    float _1796 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1778);
    float _1798 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1780);
    float _1800 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1782);
    float _1802 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1786);
    float _1804 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1790);
    float _1806 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1794);
    float _1808 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1796);
    float _1810 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1812 = _1778;
    float _1814 = _1796;
    float _1816 = _1782;
    float _1818 = _1790;
    float _1820 = _1798;
    if (_1768)
    {
        _1812 = _1742;
    }
    float _1822 = _1812;
    float _1824 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1798);
    float _1826 = _1822;
    if (_1768)
    {
        _1255 = _1744;
    }
    float _1828 = _1255;
    float _1830 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1800);
    float _1832 = _1828;
    if (_1768)
    {
        _1814 = _1822;
    }
    float _1834 = _1814;
    float _1836 = _1806 * _1760;
    float _1838 = _1834;
    if (!_1768)
    {
        _1826 = _1742;
    }
    float _1840 = _1826;
    float _1842 = exp2(_1810);
    if (_1768)
    {
        _1816 = _1746;
    }
    float _1844 = _1816;
    float _1846 = fma(_1770, _1758, _1836);
    float _1848 = _1844;
    if (_1768)
    {
        _1818 = _1828;
    }
    float _1850 = _1818;
    float _1852 = _1850;
    if (!_1768)
    {
        float _1854 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1840);
        _1838 = _1854;
    }
    float _1856 = _1838;
    if (!_1768)
    {
        _1832 = _1744;
    }
    float _1858 = _1832;
    float _1860 = _1802 * _1760;
    if (_1768)
    {
        _1820 = _1844;
    }
    float _1862 = _1820;
    float _1864 = _1762 * _1840;
    float _1866 = _1862;
    if (!_1768)
    {
        _1848 = _1746;
    }
    float _1868 = _1848;
    float _1870 = _1804 * _1760;
    float _1872 = fma(_1754, _1758, _1860);
    float _1874 = _1758 * _1858;
    if (!_1768)
    {
        float _1876 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1858);
        _1852 = _1876;
    }
    float _1878 = _1852;
    float _1880 = fma(_1756, _1758, _1870);
    float _1882 = -_1864;
    float _1884 = fma(_1758, _1868, _1882);
    float _1886 = -_1874;
    float _1888 = fma(_1760, _1840, _1886);
    float _1890 = _1760 * _1868;
    float _1892 = fma(_1808, _1762, _1880);
    if (!_1768)
    {
        float _1894 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1868);
        _1866 = _1894;
    }
    float _1896 = _1866;
    float _1898 = _1884 * _1764;
    float _1900 = fma(_1830, _1762, _1846);
    float _1902 = _1888 * _1764;
    float _1904 = _1804 * _1878;
    float _1906 = _1802 * _1878;
    float _1908 = _1806 * _1878;
    float _1910 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1912 = fma(_1756, _1856, _1904);
    float _1914 = fma(_1754, _1856, _1906);
    float _1916 = fma(_1770, _1856, _1908);
    float _1918 = fma(_1824, _1762, _1872);
    float _1920 = -_1890;
    float _1922 = fma(_1762, _1858, _1920);
    float _1924 = -_1842;
    float _1926 = _1924 + 1.0;
    float _1928 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1910);
    float _1930 = fma(_1808, _1896, _1912);
    float _1932 = fma(_1824, _1896, _1914);
    float _1934 = fma(_1830, _1896, _1916);
    float _1936 = _1922 * _1764;
    float _1938 = _1898 * _1806;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1942 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1928);
    out.m_69.x = _1918;
    out.m_69.y = _1892;
    out.m_69.z = _1900;
    float _1944 = _1898 * _1804;
    out.m_71.x = _1932;
    out.m_71.y = _1930;
    out.m_71.z = _1934;
    float _1946 = fma(_1936, _1756, _1944);
    float _1948 = _1898 * _1802;
    float _1950 = fma(_1936, _1770, _1938);
    float _1952 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1942);
    float _1954 = _1639 * 0.5;
    float _1956 = fma(_1936, _1754, _1948);
    float _1958 = fma(_1902, _1830, _1950);
    float _1960 = fma(_1675, -0.5, _1954);
    float _1962 = _1952 + _1639;
    float _1964 = _1673 + _1639;
    float _1966 = -_1940;
    float _1968 = _1966 + 1.0;
    float _1970 = fma(_1902, _1824, _1956);
    float _1972 = fma(_1902, _1808, _1946);
    float _1974 = _1962 * 0.5;
    float _1976 = _1964 * 0.5;
    float _1978 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _1952;
    out.gl_Position.w = _1639;
    out.m_73.x = _1970;
    out.m_73.y = _1972;
    out.m_73.z = _1958;
    out.m_75.x = _1976;
    out.m_75.y = _1960;
    out.m_75.z = _1974;
    out.m_75.w = _1639;
    out.m_45.x = _1978;
    float _1980 = _1940 * _1693;
    float _1982 = _1708 * _1980;
    float _1984 = _1708 * _1968;
    float _1986 = _1718 * _1980;
    float _1988 = fma(_1714, _1982, _1702);
    float _1990 = fma(_1716, _1982, _1704);
    float _1992 = fma(_1708, _1986, _1706);
    out.m_77.x = _1988;
    out.m_77.y = _1990;
    out.m_77.z = _1992;
    out.m_77.w = _1984;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _414 = false;
    bool _174 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2049 = as_type<float>(_112);
        out.gl_Position.z = _2049;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _132 = _130;
    if (_126)
    {
        float _134 = float(_96);
        _106 = _134;
    }
    float _136 = _106;
    bool _138 = _130 >= _136;
    bool _140 = !_126;
    bool _142 = _138 || _140;
    float _144 = _136;
    if (_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _144;
    if (_142)
    {
        out.m_45.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _114 = as_type<int>(_148);
    }
    int _150 = _114;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2119 = as_type<float>(_150);
        out.gl_Position.z = _2119;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _154 = !_152;
    float _172;
    if (!_154)
    {
        float _156 = in.m_49.x;
        float _158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _160 = _156 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _162 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _164 = _162 * _158;
        float _166 = floor(_164);
        float _168 = -_166;
        float _170 = _164 + _168;
        _172 = _170;
        _174 = true;
    }
    else
    {
        float _176 = float(_96);
        float _178 = 1.0 / _176;
        float _180 = _130 * _178;
        _172 = _180;
    }
    _174 = false;
    float _182 = _172;
    float _184 = in.m_49.x;
    float _186 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _188 = _182 + _186;
    bool _190 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _192 = isnan(_182);
    bool _194 = _190 || _192;
    bool _196 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _182 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _182 + _218;
    float _222 = 1.0 / _204;
    bool _224 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _226 = 1.0 / _216;
    float _228 = 1.0 / _212;
    float _230 = _188 * _222;
    bool _232 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = isnan(_182);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_200;
    float _246 = _244 + 1.0;
    float _248 = _242 * _246;
    float _250 = _208 * _226;
    bool _252 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _254 = isnan(_182);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_242;
    float _266 = _264 + 1.0;
    bool _268 = _182 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _270 = isnan(_182);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _288 = -_262;
    float _290 = _288 + 1.0;
    float _292 = _262 * _266;
    float _294 = _220 * _228;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _308 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _310 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = _278 * _290;
    float _314 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _316 = fma(_282, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _318 = -_278;
    float _320 = _318 + 1.0;
    float _322 = _310 * _312;
    float _324 = _308 * _184;
    float _326 = _314 * _312;
    float _328 = _316 * _312;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _334 = fma(_286, _250, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].y, _326);
    float _340 = trunc(_324);
    int _342 = int(_340);
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[143].z, _328);
    float _346 = fma(_334, _292, _336);
    float _348 = fma(_306, _250, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _354;
    float _358 = fma(_332, _250, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _360;
    float _364 = fma(_348, _292, _338);
    float _366 = fma(_352, _230, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _368 = fma(_356, _230, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _370 = fma(_362, _230, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _372 = fma(_358, _292, _344);
    float _374 = fma(_366, _248, _346);
    float _376 = fma(_368, _248, _364);
    float _378 = fma(_370, _248, _372);
    float _380 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].x, _374);
    float _382 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].y, _376);
    int _384 = _342 << 4;
    int _386 = _384 + 1712;
    float _388 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[146].z, _378);
    bool _390 = !_224;
    bool _392 = _224;
    int _394 = as_type<int>(_250);
    float _396 = _378;
    float _412;
    if (!_390)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _400 = _184 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_96);
        float _418 = 1.0 / _416;
        float _420 = _130 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_49.w;
    float _426 = _184 * 2.0;
    float _428 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _430 = log2(_428);
    float _432 = in.m_51.x;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _440 = _438 != 0;
    float _442 = in.m_49.z;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _450 = _448 != 0;
    float _452 = in.m_51.y;
    float _454 = floor(_426);
    float _456 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _458 = in.m_49.y;
    int _460 = as_type<int>(_426);
    if (_436)
    {
        bool _462 = _184 > 0.5;
        _392 = _462;
    }
    bool _464 = _392;
    float _466 = _456 * _184;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _472 = _430 * _130;
    bool _474 = _424 > 0.5;
    float _476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _478 = in.m_42.x;
    float _480 = in.m_42.y;
    float _482 = in.m_42.z;
    float _484 = _432;
    if (_436)
    {
        float _486 = -_432;
        float _488 = _486 + 1.0;
        _460 = as_type<int>(_488);
    }
    int _490 = _460;
    if (_440)
    {
        float _492 = -_432;
        float _494 = _492 + 1.0;
        _394 = as_type<int>(_494);
    }
    int _496 = _394;
    if (!_436)
    {
        _396 = _432;
    }
    float _498 = _396;
    bool _500 = false;
    float _502 = _498;
    if (_440)
    {
        bool _504 = _442 > 0.5;
        _500 = _504;
    }
    bool _506 = _500;
    float _508 = 1.0 / _470;
    if (_436)
    {
        float _510 = _464 ? as_type<float>(_490) : _432;
        _502 = _510;
    }
    float _512 = _502;
    float _514 = -_452;
    float _516 = _514 + 1.0;
    float _518 = _452;
    if (_440)
    {
        float _520 = _506 ? as_type<float>(_496) : _432;
        _484 = _520;
    }
    float _522 = _484;
    int _524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _526 = _524 != 0;
    int _528 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _530 = _528 != 0;
    int _532 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _534 = _532 != 0;
    float _536 = _458 * 2.0;
    float _538 = trunc(_466);
    int _540 = int(_538);
    int _542 = _474 ? as_type<int>(_516) : as_type<int>(_452);
    bool _544 = _454 > 0.0;
    bool _546 = _454 >= 0.0;
    bool _548 = isnan(_454);
    bool _550 = _546 || _548;
    bool _552 = isnan(0.0);
    bool _554 = _550 || _552;
    float _556 = exp2(_472);
    float _558 = _480 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _560 = _480 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _562 = _480 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _564;
    float _568 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].x, _558);
    float _570 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].x, _560);
    float _572 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].x, _562);
    float _574 = _458 + _442;
    float _576 = _566 * _508;
    float _578 = _446 ? as_type<float>(_542) : _452;
    float _580 = _574 + (-1.0);
    bool _582 = _458 > 0.5;
    float _584 = floor(_536);
    int _586 = _540 << 4;
    int _588 = _586 + 1968;
    float _590 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _592 = _554 ? 0 : 1;
    float _594 = _442 * 2.0;
    if (_450)
    {
        float _596 = _582 ? _516 : _452;
        _518 = _596;
    }
    float _598 = _518;
    uint _601 = uint(int(uint(_588) >> uint(2)));
    uint _603 = uint(int(uint(int(_601)) >> uint(2)));
    int _605 = int(_601) & 3;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[int(_603)][_605];
    int _609 = int(_601) + 1;
    uint _611 = uint(int(uint(_609) >> uint(2)));
    int _613 = _609 & 3;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[int(_611)][_613];
    int _617 = ~_592;
    int _619 = _617 + 1;
    int _621 = _619 + 1;
    float _623 = _184 + _458;
    int _625 = _621;
    if (!_544)
    {
        int _627 = ~_592;
        int _629 = _627 + 1;
        _625 = _629;
    }
    int _631 = _625;
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _635 = _422 + _633;
    bool _637 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _639 = isnan(_422);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = -_556;
    float _651 = _649 + 1.0;
    bool _653 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_422);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    int _665 = _588 + 8;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    uint _669 = uint(int(uint(int(_667)) >> uint(2)));
    int _671 = int(_667) & 3;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[int(_669)][_671];
    float _675 = floor(_594);
    float _677 = fma(_576, _635, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = _623 + (-1.0);
    bool _685 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _687 = isnan(1.0);
    bool _689 = _685 || _687;
    bool _691 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _693 = _689 || _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _697 = 1.0 + _695;
    float _699 = _647 * _681;
    float _701 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _705 = isnan(0.0);
    bool _707 = _703 || _705;
    bool _709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _711 = _707 || _709;
    float _713 = 1.0 / _697;
    float _715 = _677 * _699;
    float _717 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[5].z, _570);
    int _719 = _386 + 8;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[int(_723)][_725];
    float _729 = _711 ? _651 : 0.0;
    float _731 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[6].z, _572);
    bool _733 = _675 > 0.0;
    float _735 = _717 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _737 = _675 >= 0.0;
    bool _739 = isnan(_675);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = fma(_482, (*spvDescriptorSet0.vp_c10)._m0[4].z, _568);
    float _749 = -_647;
    float _751 = _749 + 1.0;
    uint _753 = uint(int(uint(_386) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.vp_c9)._m0[int(_763)][_765];
    int _769 = _745 ? 0 : 1;
    float _771 = _747 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _773 = _584 > 0.0;
    float _775 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_693)
    {
        float _777 = _729 * _713;
        _132 = _777;
    }
    float _779 = _132;
    bool _781 = !_530;
    int _783 = _781 ? 0 : 1;
    float _785 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[115].x, _715);
    int _787 = ~_769;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    float _793 = _731 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _795 = abs(_783);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _735 + _797;
    float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _803 = _791;
    if (!_733)
    {
        int _805 = ~_769;
        int _807 = _805 + 1;
        _803 = _807;
    }
    int _809 = _803;
    float _811 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _813 = _771 + _811;
    bool _815 = _584 >= 0.0;
    bool _817 = isnan(_584);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = _799 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _827 = _607 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _829 = _615 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _831 = _823 ? 0 : 1;
    float _833 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[28].x, _825);
    float _835 = float(_795);
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _839 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = _673 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _845 = float(_631);
    float _847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _849 = _793 + _847;
    int _851 = ~_831;
    int _853 = _851 + 1;
    int _855 = _853 + 1;
    float _857 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _859 = _578 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _861 = _855;
    if (!_773)
    {
        int _863 = ~_831;
        int _865 = _863 + 1;
        _861 = _865;
    }
    int _867 = _861;
    float _869 = _598 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _871 = _512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _873 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[28].z, _833);
    out.m_53.x = _839;
    out.m_53.y = _841;
    out.m_53.z = _857;
    out.m_53.w = _837;
    float _875 = _835 * _845;
    float _877 = _859 * _476;
    float _879 = _869 * _775;
    float _881 = _871 * _801;
    float _883 = in.m_55.x;
    float _885 = in.m_55.y;
    float _887 = in.m_55.z;
    float _889 = _799 * _799;
    bool _891 = !_534;
    int _893 = _891 ? 0 : 1;
    float _895 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[116].x, _785);
    bool _897 = _873 >= 0.0;
    float _899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _901 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _903 = fma(_813, _813, _889);
    int _905 = abs(_893);
    float _907 = _522 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _909 = !_526;
    int _911 = _909 ? 0 : 1;
    float _913 = fma(_849, _849, _903);
    float _915 = float(_809);
    float _917 = _895 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _919 = abs(_911);
    float _921 = _759 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _923 = float(_905);
    float _925 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _927 = float(_919);
    float _929 = _875 * (-2.0);
    float _931 = float(_867);
    float _933 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _935 = _925 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _937 = _927 * _915;
    float _939 = _901 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _941 = rsqrt(_913);
    float _943 = _923 * _931;
    float _945 = _923;
    if (_897)
    {
        _945 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _947 = _945;
    float _949 = _907 * _899;
    float _951 = _937 * (-2.0);
    float _953 = fma(_929, _885, _885);
    int _955 = as_type<int>(_947);
    float _957 = _887;
    if (_897)
    {
        float _959 = _947 * 5.0;
        _955 = as_type<int>(_959);
    }
    int _961 = _955;
    out.m_57.x = _933;
    out.m_57.y = _935;
    out.m_57.z = _939;
    out.m_57.w = _917;
    float _963 = fma(_701, _951, _701);
    float _965 = fma(_951, _883, _883);
    float _967 = _458 + (-0.5);
    out.m_59.x = _881;
    out.m_59.y = _879;
    out.m_59.z = _949;
    out.m_59.w = _877;
    float _969 = fma(_590, _929, _590);
    if (_897)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3427 = as_type<float>(_961);
        out.gl_Position.z = _3427;
    }
    float _971 = _813 * _941;
    if (_897)
    {
        out.m_45.x = 0.0;
    }
    float _973 = _799 * _941;
    float _975 = _973;
    if (_897)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _977 = -_973;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _981 = _849 * _941;
    float _983 = -_971;
    float _985 = fma(_983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _987 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[196].y, _953);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _991 = _979 + _989;
    float _993 = -_981;
    float _995 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _999 = _985 + _997;
    float _1001 = fma(_969, _779, _987);
    float _1003 = _991 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _995 + _1005;
    float _1009 = _184 + (-0.5);
    float _1011 = -_973;
    float _1013 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[18].w, _799);
    float _1015 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1003);
    float _1017 = _184 + _442;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[196].x, _965);
    float _1021 = _1001 * 0.15915493667125701904296875;
    float _1023 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1015);
    float _1025 = -_971;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[18].w, _813);
    float _1029 = fma(_963, _779, _1019);
    float _1031 = _1017 + (-1.0);
    float _1033 = -_981;
    float _1035 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _849);
    bool _1037 = _1023 >= 0.0;
    float _1039 = _1013 * _1013;
    float _1041 = _1021 * 6.283185482025146484375;
    float _1043 = sin(_1041);
    float _1045 = _1029 * 0.15915493667125701904296875;
    float _1047 = fma(_1027, _1027, _1039);
    float _1049 = _943 * (-2.0);
    float _1051 = _442 + (-0.5);
    float _1053 = fma(_1035, _1035, _1047);
    float _1055 = _1021 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    float _1059 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1061 = fma(_1049, _887, _887);
    float _1063 = _999;
    float _1065 = _1007;
    if (_1037)
    {
        _957 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1067 = _957;
    int _1069 = as_type<int>(_1067);
    if (_1037)
    {
        out.m_45.x = 0.0;
    }
    float _1071 = fma(_1059, _1049, _1059);
    float _1073 = fma(_1051, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1061);
    float _1075 = _1045 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = in.m_61.x;
    float _1081 = in.m_61.y;
    float _1083 = in.m_61.z;
    if (_1037)
    {
        float _1085 = _1067 * 5.0;
        _1069 = as_type<int>(_1085);
    }
    int _1087 = _1069;
    float _1089 = fma(_1071, _779, _1073);
    float _1091 = _1045 * 6.283185482025146484375;
    float _1093 = cos(_1091);
    if (_1037)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3643 = as_type<float>(_1087);
        out.gl_Position.z = _3643;
    }
    float _1095 = _1089 * 0.15915493667125701904296875;
    float _1097 = sqrt(_1053);
    if (_1037)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1099 = in.m_63.x;
    float _1101 = in.m_63.y;
    float _1103 = in.m_63.z;
    float _1105 = _1095 * 6.283185482025146484375;
    float _1107 = cos(_1105);
    float _1109 = _382 * _1081;
    float _1111 = _380 * _1079;
    float _1113 = _941 * _1097;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1117 = _1093 * _1057;
    float _1119 = _1093 * _1043;
    float _1121 = _1095 * 6.283185482025146484375;
    float _1123 = sin(_1121);
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1127 = _388 * _1083;
    float _1129 = _1077 * _1043;
    float _1131 = _1077 * _1057;
    bool _1133 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1135 = isnan(0.5);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1141 = _1137 || _1139;
    float _1143 = _1093 * _1107;
    float _1145 = _1113 * _1115;
    float _1147 = _1077 * _1107;
    float _1149 = _1057 * _1107;
    float _1151 = _1113 * _1125;
    float _1153 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1155 = _1043 * _1107;
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1101);
    float _1159 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1099);
    float _1161 = fma(_1123, _1117, _1129);
    float _1163 = _1157 * _1145;
    float _1165 = _1113 * _1153;
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1103);
    float _1169 = _1159 * _1151;
    float _1171 = _1143 * _1163;
    float _1173 = -_1131;
    float _1175 = fma(_1123, _1119, _1173);
    float _1177 = _1167 * _1165;
    float _1179 = -_1163;
    float _1181 = _1123 * _1179;
    float _1183 = fma(_1161, _1169, _1171);
    float _1185 = -_1119;
    float _1187 = fma(_1123, _1131, _1185);
    float _1189 = _1147 * _1163;
    float _1191 = fma(_1149, _1169, _1181);
    float _1193 = fma(_1175, _1177, _1183);
    float _1195 = fma(_1123, _1129, _1117);
    float _1197 = fma(_1187, _1169, _1189);
    float _1199 = fma(_1155, _1177, _1191);
    float _1201 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1203 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1205 = fma(_1195, _1177, _1197);
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1209 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1201);
    float _1211 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1203);
    float _1213 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1207);
    float _1215 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1209);
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1211);
    float _1219 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1213);
    float _1221 = _1215 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1223 = _1217 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1225 = _1219 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1227 = _793 + _1221;
    float _1229 = _771 + _1223;
    float _1231 = _735 + _1225;
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1235 = _1227 + _1233;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1239 = _1229 + _1237;
    float _1241 = _1235 * _1235;
    float _1243 = fma(_1239, _1239, _1241);
    float _1245 = sqrt(_1243);
    bool _1247 = _1245 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1249 = _1225;
    float _1251 = _1229;
    float _1253 = _1227;
    float _1255 = _1207;
    if (!_1247)
    {
        _1249 = _1229;
    }
    float _1257 = _1249;
    float _1259 = _1257;
    if (!_1247)
    {
        _1251 = _1227;
    }
    float _1261 = _1251;
    float _1263 = _1261;
    if (!_1247)
    {
        _1253 = _1231;
    }
    float _1265 = _1253;
    bool _1267 = !_1247;
    float _1269 = _1265;
    if (!_1267)
    {
        float _1271 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1273 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1275 = _1245 + _1273;
        float _1277 = rsqrt(_1243);
        float _1279 = _1275 * _1271;
        float _1281 = _1231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = _1279 * 0.15915493667125701904296875;
        float _1285 = _1283 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = _1283 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        float _1293 = _1287 + (-1.0);
        float _1295 = fma(_1291, _1281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1297 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1299 = _1277 * _1295;
        float _1301 = fma(_1231, _1287, _1297);
        float _1303 = fma(_1239, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1305 = fma(_1235, _1299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1259 = _1303;
        _1269 = _1301;
        _1263 = _1305;
    }
    float _1307 = _1259;
    float _1309 = _1269;
    float _1311 = _1263;
    float _1313 = -_971;
    float _1315 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1307);
    float _1317 = -_973;
    float _1319 = fma(_1317, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1309);
    float _1321 = -_981;
    float _1323 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1311);
    float _1325 = _1319;
    float _1327 = _1323;
    float _1329 = _1307;
    if (_1141)
    {
        _975 = _1315;
    }
    float _1331 = _975;
    float _1333 = _1331;
    if (!_1141)
    {
        float _1335 = _991 * _991;
        float _1337 = 1.0 / _1113;
        float _1339 = -_793;
        float _1341 = _1339 + _1311;
        float _1343 = fma(_999, _999, _1335);
        float _1345 = fma(_1007, _1007, _1343);
        float _1347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1349 = -_735;
        float _1351 = _1349 + _1309;
        float _1353 = sqrt(_1345);
        float _1355 = precise::min(_1353, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1357 = _1355 * _1347;
        float _1359 = -_771;
        float _1361 = _1359 + _1307;
        float _1363 = _1357 * _1337;
        float _1365 = fma(_1361, _1363, _985);
        float _1367 = fma(_1351, _1363, _979);
        float _1369 = fma(_1341, _1363, _995);
        _1325 = _1367;
        _1333 = _1365;
        _1327 = _1369;
        _1063 = _1353;
        _1065 = _1351;
    }
    float _1371 = _1325;
    float _1373 = _1333;
    float _1375 = _1327;
    float _1377 = _1063;
    float _1379 = _1065;
    float _1381 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1383 = _1371 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1387 = _1373 + _1385;
    float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1391 = _1375 + _1389;
    float _1393 = _1383 * _1383;
    float _1395 = fma(_1387, _1387, _1393);
    float _1397 = fma(_1391, _1391, _1395);
    float _1399 = rsqrt(_1397);
    float _1401 = sqrt(_1397);
    float _1403 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1405 = _1387 * _1403;
    float _1407 = _1391 * _1403;
    float _1409 = _1405 * _1405;
    float _1411 = _1407 * _1407;
    float _1413 = _1409 + _1411;
    float _1415 = sqrt(_1413);
    bool _1417 = _1415 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1421 = _1415 + _1419;
    float _1423 = _1399;
    float _1425 = _1413;
    float _1427 = _1421;
    float _1429 = _1377;
    float _1431 = _1383;
    float _1433 = _1379;
    if (_1417)
    {
        float _1435 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1423 = _1435;
    }
    float _1437 = _1423;
    if (_1417)
    {
        float _1439 = rsqrt(_1413);
        _1425 = _1439;
    }
    float _1441 = _1425;
    float _1443 = _1441;
    if (_1417)
    {
        float _1445 = _1421 * _1437;
        _1427 = _1445;
    }
    float _1447 = _1427;
    if (_1417)
    {
        float _1449 = _1447 * 0.15915493667125701904296875;
        _1429 = _1449;
    }
    float _1451 = _1429;
    float _1453 = _1391;
    if (_1417)
    {
        float _1455 = _1451 * 6.283185482025146484375;
        float _1457 = sin(_1455);
        _1453 = _1457;
    }
    float _1459 = _1453;
    float _1461 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1463 = precise::max(0.0, _1461);
    float _1465 = _1437;
    float _1467 = _1463;
    if (_1417)
    {
        float _1469 = _1451 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        _1465 = _1471;
    }
    float _1473 = _1465;
    float _1475 = -_1403;
    float _1477 = -_1463;
    float _1479 = fma(_1383, _1475, _1477);
    if (_1417)
    {
        float _1481 = _1479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1431 = _1481;
    }
    float _1483 = _1431;
    float _1485 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1487 = _1483;
    float _1489 = _1459;
    if (_1417)
    {
        float _1491 = fma(_1459, _1483, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1487 = _1491;
    }
    float _1493 = _1487;
    float _1495 = _1493;
    if (!_1417)
    {
        _1489 = _1405;
    }
    float _1497 = _1489;
    float _1499 = _1497;
    float _1501 = _1473;
    if (_1417)
    {
        float _1503 = _1473 + (-1.0);
        _1467 = _1503;
    }
    float _1505 = _1467;
    float _1507 = _1505;
    if (_1417)
    {
        float _1509 = _1441 * _1493;
        _1329 = _1509;
    }
    float _1511 = _1329;
    if (!_1417)
    {
        _1495 = _1479;
    }
    float _1513 = _1495;
    float _1515 = _1513;
    if (_1417)
    {
        float _1517 = _1505 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1433 = _1517;
    }
    float _1519 = _1433;
    if (_1417)
    {
        float _1521 = _1405 * _1511;
        _1499 = _1521;
    }
    float _1523 = _1499;
    if (!_1417)
    {
        _1507 = _1407;
    }
    float _1525 = _1507;
    float _1527 = _1525;
    if (_1417)
    {
        float _1529 = _1407 * _1511;
        _1527 = _1529;
    }
    float _1531 = _1527;
    if (!_1417)
    {
        _1443 = _1409;
    }
    float _1533 = _1443;
    float _1535 = _1533;
    if (_1417)
    {
        float _1537 = fma(_1479, _1473, _1519);
        _1515 = _1537;
    }
    float _1539 = _1515;
    if (_1417)
    {
        float _1541 = _1523 * _1523;
        _1535 = _1541;
    }
    float _1543 = _1535;
    if (!_1417)
    {
        _1501 = _1411;
    }
    float _1545 = _1501;
    float _1547 = _1545;
    if (_1417)
    {
        float _1549 = _1531 * _1531;
        _1547 = _1549;
    }
    float _1551 = _1547;
    float _1553 = fma(_1539, _1539, _1543);
    float _1555 = _1553 + _1551;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1559 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1557);
    float _1561 = precise::clamp(_1559, 0.0, 1.0);
    float _1563 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1485);
    float _1565 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1567 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1569 = -_1561;
    float _1571 = _1569 + 1.0;
    float _1573 = rsqrt(_1555);
    float _1575 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1563);
    float _1577 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1579 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1581 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1565);
    float _1583 = _1575 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1585 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1577);
    float _1587 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1579);
    float _1589 = abs(_1571);
    float _1591 = log2(_1589);
    float _1593 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1581);
    float _1595 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1585);
    float _1597 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1587);
    float _1599 = _1583 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1601 = _1593 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1603 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1605 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1607 = _1573 * _1523;
    float _1609 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1611 = _1573 * _1539;
    float _1613 = _1573 * _1531;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1617 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1609);
    float _1619 = -_1599;
    float _1621 = fma(_1619, _1567, 1.0);
    float _1623 = -_1615;
    float _1625 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1623);
    float _1627 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1629 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1617);
    float _1631 = log2(_1621);
    float _1633 = -_1613;
    float _1635 = fma(_1633, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1625);
    float _1637 = _1611 + 1.0;
    float _1639 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1629);
    float _1641 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1643 = fma(_1635, -0.5, 0.5);
    float _1645 = fma(_1635, 0.5, 0.5);
    float _1647 = exp2(_1627);
    float _1649 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1651 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1641);
    float _1653 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1649);
    float _1655 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1651);
    float _1657 = 1.0 / _1639;
    float _1659 = fma(_1645, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1661 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1653);
    float _1663 = _1631 * 0.693147182464599609375;
    float _1665 = fma(_1645, _1659, -0.212114393711090087890625);
    float _1667 = sqrt(_1643);
    float _1669 = -_1611;
    float _1671 = fma(_1647, _1637, _1669);
    float _1673 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1655);
    float _1675 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1661);
    float _1677 = fma(_1645, _1665, 1.570728778839111328125);
    float _1679 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1681 = fma(_1671, 0.5, 0.5);
    float _1683 = _1673 * _1657;
    float _1685 = _1675 * _1657;
    float _1687 = fma(_1683, 0.5, 0.5);
    float _1689 = fma(_1685, -0.5, 0.5);
    float _1691 = _1667 * 0.636619746685028076171875;
    float3 _4618 = float3(_1687, _1689, _1679);
    float _1693 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).x;
    float _1695 = -_1677;
    float _1697 = fma(_1691, _1695, 1.0);
    float3 _4634 = float3(_1687, _1689, _1679);
    float4 _1700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4634, float3(0.0), isnan(_4634)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4634, float3(0.0), isnan(_4634)), level(0.0)).xyzw;
    float _1702 = _1700.x;
    float _1704 = _1700.y;
    float _1706 = _1700.z;
    float _1708 = _1700.w;
    float2 _4651 = float2(_1697, _1681);
    float3 _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4651, float2(0.0), isnan(_4651)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4651, float2(0.0), isnan(_4651)), level(0.0)).xyz;
    float _1714 = _1712.x;
    float _1716 = _1712.y;
    float _1718 = _1712.z;
    float _1720 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1722 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1724 = _1161 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1726 = _1101 != 0.0;
    bool _1728 = isnan(_1101);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan(0.0);
    bool _1734 = _1730 || _1732;
    float _1736 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1720);
    float _1738 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1722);
    float _1740 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1742 = in.m_65.x;
    float _1744 = in.m_65.y;
    float _1746 = in.m_65.z;
    bool _1748 = _1099 == 0.0;
    bool _1750 = !_1734;
    bool _1752 = _1748 && _1750;
    float _1754 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1736);
    float _1756 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1738);
    float _1758 = in.m_67.x;
    float _1760 = in.m_67.y;
    float _1762 = in.m_67.z;
    float _1764 = in.m_67.w;
    bool _1766 = _1103 == 0.0;
    bool _1768 = _1766 && _1752;
    float _1770 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1740);
    float _1772 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1774 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1776 = _1143 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1778 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1780 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1782 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1784 = -_1123;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1772);
    float _1788 = -_1123;
    float _1790 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1774);
    float _1792 = -_1123;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1776);
    float _1796 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1778);
    float _1798 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1780);
    float _1800 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1782);
    float _1802 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1786);
    float _1804 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1790);
    float _1806 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1794);
    float _1808 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1796);
    float _1810 = _1591 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1812 = _1778;
    float _1814 = _1796;
    float _1816 = _1782;
    float _1818 = _1790;
    float _1820 = _1798;
    if (_1768)
    {
        _1812 = _1742;
    }
    float _1822 = _1812;
    float _1824 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1798);
    float _1826 = _1822;
    if (_1768)
    {
        _1255 = _1744;
    }
    float _1828 = _1255;
    float _1830 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1800);
    float _1832 = _1828;
    if (_1768)
    {
        _1814 = _1822;
    }
    float _1834 = _1814;
    float _1836 = _1806 * _1760;
    float _1838 = _1834;
    if (!_1768)
    {
        _1826 = _1742;
    }
    float _1840 = _1826;
    float _1842 = exp2(_1810);
    if (_1768)
    {
        _1816 = _1746;
    }
    float _1844 = _1816;
    float _1846 = fma(_1770, _1758, _1836);
    float _1848 = _1844;
    if (_1768)
    {
        _1818 = _1828;
    }
    float _1850 = _1818;
    float _1852 = _1850;
    if (!_1768)
    {
        float _1854 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1840);
        _1838 = _1854;
    }
    float _1856 = _1838;
    if (!_1768)
    {
        _1832 = _1744;
    }
    float _1858 = _1832;
    float _1860 = _1802 * _1760;
    if (_1768)
    {
        _1820 = _1844;
    }
    float _1862 = _1820;
    float _1864 = _1762 * _1840;
    float _1866 = _1862;
    if (!_1768)
    {
        _1848 = _1746;
    }
    float _1868 = _1848;
    float _1870 = _1804 * _1760;
    float _1872 = fma(_1754, _1758, _1860);
    float _1874 = _1758 * _1858;
    if (!_1768)
    {
        float _1876 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1858);
        _1852 = _1876;
    }
    float _1878 = _1852;
    float _1880 = fma(_1756, _1758, _1870);
    float _1882 = -_1864;
    float _1884 = fma(_1758, _1868, _1882);
    float _1886 = -_1874;
    float _1888 = fma(_1760, _1840, _1886);
    float _1890 = _1760 * _1868;
    float _1892 = fma(_1808, _1762, _1880);
    if (!_1768)
    {
        float _1894 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1868);
        _1866 = _1894;
    }
    float _1896 = _1866;
    float _1898 = _1884 * _1764;
    float _1900 = fma(_1830, _1762, _1846);
    float _1902 = _1888 * _1764;
    float _1904 = _1804 * _1878;
    float _1906 = _1802 * _1878;
    float _1908 = _1806 * _1878;
    float _1910 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1912 = fma(_1756, _1856, _1904);
    float _1914 = fma(_1754, _1856, _1906);
    float _1916 = fma(_1770, _1856, _1908);
    float _1918 = fma(_1824, _1762, _1872);
    float _1920 = -_1890;
    float _1922 = fma(_1762, _1858, _1920);
    float _1924 = -_1842;
    float _1926 = _1924 + 1.0;
    float _1928 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1910);
    float _1930 = fma(_1808, _1896, _1912);
    float _1932 = fma(_1824, _1896, _1914);
    float _1934 = fma(_1830, _1896, _1916);
    float _1936 = _1922 * _1764;
    float _1938 = _1898 * _1806;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1942 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1928);
    out.m_69.x = _1918;
    out.m_69.y = _1892;
    out.m_69.z = _1900;
    float _1944 = _1898 * _1804;
    out.m_71.x = _1932;
    out.m_71.y = _1930;
    out.m_71.z = _1934;
    float _1946 = fma(_1936, _1756, _1944);
    float _1948 = _1898 * _1802;
    float _1950 = fma(_1936, _1770, _1938);
    float _1952 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1942);
    float _1954 = _1639 * 0.5;
    float _1956 = fma(_1936, _1754, _1948);
    float _1958 = fma(_1902, _1830, _1950);
    float _1960 = fma(_1675, -0.5, _1954);
    float _1962 = _1952 + _1639;
    float _1964 = _1673 + _1639;
    float _1966 = -_1940;
    float _1968 = _1966 + 1.0;
    float _1970 = fma(_1902, _1824, _1956);
    float _1972 = fma(_1902, _1808, _1946);
    float _1974 = _1962 * 0.5;
    float _1976 = _1964 * 0.5;
    float _1978 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1673;
    out.gl_Position.y = _1675;
    out.gl_Position.z = _1952;
    out.gl_Position.w = _1639;
    out.m_73.x = _1970;
    out.m_73.y = _1972;
    out.m_73.z = _1958;
    out.m_75.x = _1976;
    out.m_75.y = _1960;
    out.m_75.z = _1974;
    out.m_75.w = _1639;
    out.m_45.x = _1978;
    float _1980 = _1940 * _1693;
    float _1982 = _1708 * _1980;
    float _1984 = _1708 * _1968;
    float _1986 = _1718 * _1980;
    float _1988 = fma(_1714, _1982, _1702);
    float _1990 = fma(_1716, _1982, _1704);
    float _1992 = fma(_1708, _1986, _1706);
    out.m_77.x = _1988;
    out.m_77.y = _1990;
    out.m_77.z = _1992;
    out.m_77.w = _1984;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

